-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 21 mei 2024 om 07:32
-- Serverversie: 8.3.0
-- PHP-versie: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kserenityskincare`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmvoifhuububshdfjmbyrxkkbrtbixrjsysj` (`primaryOwnerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zjbkadgoorkjtikolhxxfhbxmyixoxlbksnh` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_ehfbyjclhvctlvizqtfmhrizjyyahzxeykwm` (`dateRead`),
  KEY `fk_prgfylrjpqqmnzbfaiznxtyblaigtmcoslpm` (`pluginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
CREATE TABLE IF NOT EXISTS `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sdifxpjgfkbqsgexmkqdwrqtcndkquozywtn` (`sessionId`,`volumeId`),
  KEY `idx_otbocpilpimptwdftykfrhbphbwvdemajodk` (`volumeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
CREATE TABLE IF NOT EXISTS `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `size` bigint UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ddqrafuamnvbgrtywzyywjaogxgccxjcznke` (`filename`,`folderId`),
  KEY `idx_nimptkxnahxeonmnkodxwgfjaiwdnmpdrtvl` (`folderId`),
  KEY `idx_dtgbnztknluirgjjgzarletxuycsnehwzlzs` (`volumeId`),
  KEY `fk_ynpbvehfxpiuxiejbqnorzshxlkhdywkaklw` (`uploaderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES
(22, 1, 1, 1, 'Logo-White.svg', 'image', NULL, 270, 96, 1495, NULL, NULL, NULL, '2024-05-18 19:08:06', '2024-05-18 19:08:06', '2024-05-18 19:08:06'),
(35, 1, 1, 1, 'Layer-2.png', 'image', NULL, 698, 550, 731670, NULL, 0, 0, '2024-05-18 22:15:37', '2024-05-18 22:15:37', '2024-05-18 22:15:37'),
(36, 2, 4, 1, 'Layer-2.png', 'image', NULL, 698, 550, 731670, NULL, 0, 0, '2024-05-18 22:19:21', '2024-05-18 22:19:21', '2024-05-18 22:19:21'),
(37, 2, 4, 1, 'Layer-2.png', 'image', NULL, 698, 550, 731670, NULL, NULL, NULL, '2024-05-18 22:21:07', '2024-05-18 22:21:07', '2024-05-18 22:21:07'),
(40, 3, 5, 1, 'Logo-zwart.svg', 'image', NULL, 270, 96, 1475, NULL, 1, 1, '2024-05-20 11:21:43', '2024-05-20 11:21:43', '2024-05-20 11:21:43'),
(42, 4, 6, 1, 'Logo-zwart.svg', 'image', NULL, 270, 96, 1475, NULL, NULL, NULL, '2024-05-20 11:49:20', '2024-05-20 11:49:20', '2024-05-20 11:49:29'),
(55, 5, 7, 1, 'AcnePimpleCOSRX.jpg', 'image', NULL, 800, 800, 80812, NULL, NULL, NULL, '2024-05-20 13:31:58', '2024-05-20 13:31:58', '2024-05-20 13:31:58'),
(56, 5, 7, 1, 'AcnePimpleCOSRX2.jpg', 'image', NULL, 800, 800, 139901, NULL, NULL, NULL, '2024-05-20 13:31:59', '2024-05-20 13:31:59', '2024-05-20 13:31:59'),
(57, 5, 7, 1, 'advancedsnailcosrc2.jpg', 'image', NULL, 800, 800, 280130, NULL, NULL, NULL, '2024-05-20 13:31:59', '2024-05-20 13:31:59', '2024-05-20 13:31:59'),
(58, 5, 7, 1, 'AdvancedsnailCOSRX.jpg', 'image', NULL, 800, 800, 70471, NULL, NULL, NULL, '2024-05-20 13:32:00', '2024-05-20 13:32:00', '2024-05-20 13:32:00'),
(59, 5, 7, 1, 'aiony-haust-f2ar0ltTvaI-unsplash-copy.png', 'image', NULL, 1920, 1080, 2210310, NULL, NULL, NULL, '2024-05-20 13:32:01', '2024-05-20 13:32:02', '2024-05-20 13:32:02'),
(60, 5, 7, 1, 'aiony-haust-f2ar0ltTvaI-unsplash.png', 'image', NULL, 1920, 1080, 2210310, NULL, NULL, NULL, '2024-05-20 13:32:04', '2024-05-20 13:32:04', '2024-05-20 13:32:04'),
(61, 5, 7, 1, 'anuaheartleaf.jpg', 'image', NULL, 800, 800, 68366, NULL, NULL, NULL, '2024-05-20 13:32:05', '2024-05-20 13:32:05', '2024-05-20 13:32:05'),
(62, 5, 7, 1, 'anuaheartleaf2.jpg', 'image', NULL, 800, 800, 272309, NULL, NULL, NULL, '2024-05-20 13:32:05', '2024-05-20 13:32:05', '2024-05-20 13:32:05'),
(63, 5, 7, 1, 'anuaheartleafmask2.jpg', 'image', NULL, 800, 800, 149325, NULL, NULL, NULL, '2024-05-20 13:32:06', '2024-05-20 13:32:06', '2024-05-20 13:32:06'),
(64, 5, 7, 1, 'anuaheartleafmaskmain.jpg', 'image', NULL, 800, 800, 135571, NULL, NULL, NULL, '2024-05-20 13:32:07', '2024-05-20 13:32:07', '2024-05-20 13:32:07'),
(65, 5, 7, 1, 'anuaheartleafpad.jpg', 'image', NULL, 800, 800, 116799, NULL, NULL, NULL, '2024-05-20 13:32:07', '2024-05-20 13:32:07', '2024-05-20 13:32:07'),
(66, 5, 7, 1, 'anuaheartleafpad2.jpg', 'image', NULL, 800, 800, 195063, NULL, NULL, NULL, '2024-05-20 13:32:08', '2024-05-20 13:32:08', '2024-05-20 13:32:08'),
(67, 5, 7, 1, 'axisydarkspot.jpg', 'image', NULL, 800, 800, 90567, NULL, NULL, NULL, '2024-05-20 13:32:08', '2024-05-20 13:32:09', '2024-05-20 13:32:09'),
(68, 5, 7, 1, 'axisydarkspot2.jpg', 'image', NULL, 800, 800, 210419, NULL, NULL, NULL, '2024-05-20 13:32:09', '2024-05-20 13:32:09', '2024-05-20 13:32:09'),
(69, 5, 7, 1, 'axisymugwort.jpg', 'image', NULL, 800, 800, 148181, NULL, NULL, NULL, '2024-05-20 13:32:10', '2024-05-20 13:32:10', '2024-05-20 13:32:10'),
(70, 5, 7, 1, 'axisymugwort2.jpg', 'image', NULL, 800, 800, 76242, NULL, NULL, NULL, '2024-05-20 13:32:10', '2024-05-20 13:32:11', '2024-05-20 13:32:11'),
(71, 5, 7, 1, 'axisyquinoa.jpg', 'image', NULL, 800, 800, 105903, NULL, NULL, NULL, '2024-05-20 13:32:11', '2024-05-20 13:32:11', '2024-05-20 13:32:11'),
(72, 5, 7, 1, 'axisyquinoa2.jpg', 'image', NULL, 800, 800, 87225, NULL, NULL, NULL, '2024-05-20 13:32:12', '2024-05-20 13:32:12', '2024-05-20 13:32:12'),
(73, 5, 7, 1, 'beautyjosradiance.jpg', 'image', NULL, 800, 800, 55335, NULL, NULL, NULL, '2024-05-20 13:32:12', '2024-05-20 13:32:13', '2024-05-20 13:32:13'),
(74, 5, 7, 1, 'beautyjosradiance2.jpg', 'image', NULL, 800, 800, 100079, NULL, NULL, NULL, '2024-05-20 13:32:13', '2024-05-20 13:32:13', '2024-05-20 13:32:13'),
(75, 5, 7, 1, 'beautyjosrepairserum.jpg', 'image', NULL, 800, 800, 192347, NULL, NULL, NULL, '2024-05-20 13:32:14', '2024-05-20 13:32:14', '2024-05-20 13:32:14'),
(76, 5, 7, 1, 'beaytyjosrepairserum2.jpg', 'image', NULL, 800, 800, 94299, NULL, NULL, NULL, '2024-05-20 13:32:14', '2024-05-20 13:32:14', '2024-05-20 13:32:14'),
(77, 5, 7, 1, 'CentellaMask800.jpg', 'image', NULL, 800, 800, 151236, NULL, NULL, NULL, '2024-05-20 13:32:15', '2024-05-20 13:32:15', '2024-05-20 13:32:15'),
(78, 5, 7, 1, 'cosrxlowph.jpg', 'image', NULL, 800, 800, 89460, NULL, NULL, NULL, '2024-05-20 13:32:16', '2024-05-20 13:32:16', '2024-05-20 13:32:16'),
(79, 5, 7, 1, 'cosrxlowph2.jpg', 'image', NULL, 800, 800, 89211, NULL, NULL, NULL, '2024-05-20 13:32:16', '2024-05-20 13:32:16', '2024-05-20 13:32:16'),
(80, 5, 7, 1, 'DynastyCream2.webp', 'image', NULL, 560, 500, 3706, NULL, NULL, NULL, '2024-05-20 13:32:17', '2024-05-20 13:32:17', '2024-05-20 13:32:17'),
(81, 5, 7, 1, 'DynastyCreamBIJ2.jpg', 'image', NULL, 800, 745, 40873, NULL, NULL, NULL, '2024-05-20 13:32:17', '2024-05-20 13:32:17', '2024-05-20 13:32:17'),
(82, 5, 7, 1, 'DynastyCreamBOJ.jpg', 'image', NULL, 812, 725, 22411, NULL, NULL, NULL, '2024-05-20 13:32:18', '2024-05-20 13:32:18', '2024-05-20 13:32:18'),
(83, 5, 7, 1, 'hydriumcentellacosrx.jpg', 'image', NULL, 800, 799, 67653, NULL, NULL, NULL, '2024-05-20 13:32:18', '2024-05-20 13:32:18', '2024-05-20 13:32:18'),
(84, 5, 7, 1, 'hydriumcentellacosrx2.jpg', 'image', NULL, 800, 800, 78174, NULL, NULL, NULL, '2024-05-20 13:32:19', '2024-05-20 13:32:19', '2024-05-20 13:32:19'),
(85, 5, 7, 1, 'iunikcentella2.jpg', 'image', NULL, 800, 800, 207076, NULL, NULL, NULL, '2024-05-20 13:32:19', '2024-05-20 13:32:19', '2024-05-20 13:32:19'),
(86, 5, 7, 1, 'iunikcetnella.jpg', 'image', NULL, 800, 800, 61636, NULL, NULL, NULL, '2024-05-20 13:32:20', '2024-05-20 13:32:20', '2024-05-20 13:32:20'),
(87, 5, 7, 1, 'iunikcntellamask2.jpg', 'image', NULL, 800, 800, 288975, NULL, NULL, NULL, '2024-05-20 13:32:21', '2024-05-20 13:32:21', '2024-05-20 13:32:21'),
(88, 5, 7, 1, 'iunikprop.jpg', 'image', NULL, 800, 800, 82096, NULL, NULL, NULL, '2024-05-20 13:32:21', '2024-05-20 13:32:21', '2024-05-20 13:32:21'),
(89, 5, 7, 1, 'iunikprop2.jpg', 'image', NULL, 800, 800, 177821, NULL, NULL, NULL, '2024-05-20 13:32:22', '2024-05-20 13:32:22', '2024-05-20 13:32:22'),
(90, 5, 7, 1, 'Layer-2.png', 'image', NULL, 698, 550, 731670, NULL, 0, 0, '2024-05-20 13:32:23', '2024-05-20 13:32:23', '2024-05-20 13:32:23'),
(91, 5, 7, 1, 'Logo-White.svg', 'image', NULL, 270, 96, 1495, NULL, 0, 0, '2024-05-20 13:32:24', '2024-05-20 13:32:24', '2024-05-20 13:32:24'),
(92, 5, 7, 1, 'Logo-zwart.svg', 'image', NULL, 270, 96, 1475, NULL, 0, 0, '2024-05-20 13:32:24', '2024-05-20 13:32:24', '2024-05-20 13:32:24'),
(93, 5, 7, 1, 'misshathefirst.jpg', 'image', NULL, 644, 644, 32969, NULL, NULL, NULL, '2024-05-20 13:32:25', '2024-05-20 13:32:25', '2024-05-20 13:32:25'),
(94, 5, 7, 1, 'misshathefirst2.jpg', 'image', NULL, 1000, 1000, 184469, NULL, NULL, NULL, '2024-05-20 13:32:25', '2024-05-20 13:32:25', '2024-05-20 13:32:25'),
(95, 5, 7, 1, 'misshatimerev.jpg', 'image', NULL, 800, 800, 78235, NULL, NULL, NULL, '2024-05-20 13:32:26', '2024-05-20 13:32:26', '2024-05-20 13:32:26'),
(96, 5, 7, 1, 'misshatimerev2.jpg', 'image', NULL, 800, 800, 197872, NULL, NULL, NULL, '2024-05-20 13:32:27', '2024-05-20 13:32:27', '2024-05-20 13:32:27'),
(97, 5, 7, 1, 'misshatimerevart.jpg', 'image', NULL, 512, 512, 36409, NULL, NULL, NULL, '2024-05-20 13:32:27', '2024-05-20 13:32:27', '2024-05-20 13:32:27'),
(98, 5, 7, 1, 'misshatimerevart2.jpg', 'image', NULL, 770, 770, 186800, NULL, NULL, NULL, '2024-05-20 13:32:28', '2024-05-20 13:32:28', '2024-05-20 13:32:28'),
(99, 5, 7, 1, 'rose.jpg', 'image', NULL, 800, 800, 61613, NULL, NULL, NULL, '2024-05-20 13:32:28', '2024-05-20 13:32:28', '2024-05-20 13:32:28'),
(100, 5, 7, 1, 'rose2.jpg', 'image', NULL, 800, 800, 145246, NULL, NULL, NULL, '2024-05-20 13:32:29', '2024-05-20 13:32:29', '2024-05-20 13:32:29'),
(101, 5, 7, 1, 'Screenshot_78_2000x.webp', 'image', NULL, 562, 704, 9410, NULL, NULL, NULL, '2024-05-20 13:32:29', '2024-05-20 13:32:29', '2024-05-20 13:32:29'),
(102, 5, 7, 1, 'Screenshot_89_400x-1.webp', 'image', NULL, 400, 578, 5878, NULL, NULL, NULL, '2024-05-20 13:32:30', '2024-05-20 13:32:30', '2024-05-20 13:32:30');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
CREATE TABLE IF NOT EXISTS `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_cgsacwhtqblhxltswqovqllljaftzdicucky` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `assets_sites`
--

INSERT INTO `assets_sites` (`assetId`, `siteId`, `alt`) VALUES
(22, 1, NULL),
(35, 1, NULL),
(36, 1, NULL),
(37, 1, NULL),
(40, 1, NULL),
(42, 1, NULL),
(55, 1, NULL),
(56, 1, NULL),
(57, 1, NULL),
(58, 1, NULL),
(59, 1, NULL),
(60, 1, NULL),
(61, 1, NULL),
(62, 1, NULL),
(63, 1, NULL),
(64, 1, NULL),
(65, 1, NULL),
(66, 1, NULL),
(67, 1, NULL),
(68, 1, NULL),
(69, 1, NULL),
(70, 1, NULL),
(71, 1, NULL),
(72, 1, NULL),
(73, 1, NULL),
(74, 1, NULL),
(75, 1, NULL),
(76, 1, NULL),
(77, 1, NULL),
(78, 1, NULL),
(79, 1, NULL),
(80, 1, NULL),
(81, 1, NULL),
(82, 1, NULL),
(83, 1, NULL),
(84, 1, NULL),
(85, 1, NULL),
(86, 1, NULL),
(87, 1, NULL),
(88, 1, NULL),
(89, 1, NULL),
(90, 1, NULL),
(91, 1, NULL),
(92, 1, NULL),
(93, 1, NULL),
(94, 1, NULL),
(95, 1, NULL),
(96, 1, NULL),
(97, 1, NULL),
(98, 1, NULL),
(99, 1, NULL),
(100, 1, NULL),
(101, 1, NULL),
(102, 1, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
CREATE TABLE IF NOT EXISTS `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tmrejiyfddfgkotauchubqngqnaxodbnmnrm` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `auth_oauth_tokens`
--

DROP TABLE IF EXISTS `auth_oauth_tokens`;
CREATE TABLE IF NOT EXISTS `auth_oauth_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerHandle` varchar(255) NOT NULL,
  `providerType` varchar(255) NOT NULL,
  `tokenType` varchar(255) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `accessToken` text,
  `secret` text,
  `expires` varchar(255) DEFAULT NULL,
  `refreshToken` text,
  `resourceOwnerId` varchar(255) DEFAULT NULL,
  `values` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ryudkusgvdocelouewtphcbzlumiwozubtqa` (`groupId`),
  KEY `fk_gghclfosodqzzvsjmrzplnhunvxujwxdsbsk` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
CREATE TABLE IF NOT EXISTS `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zsokyybhhxymsnlfsqgabmxkiityxhpwvptu` (`name`),
  KEY `idx_aeushnbehluozsqhgjamxygqrvkylyedxcay` (`handle`),
  KEY `idx_zaawcmwspduhvhgnboqaexapizhsjcxpfcra` (`structureId`),
  KEY `idx_iclijadpljvxjdrjaijblxjkpwqjszqlaxps` (`fieldLayoutId`),
  KEY `idx_ecnftncurhlyjrelgtgkcwvmpswhhjqyhnig` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
CREATE TABLE IF NOT EXISTS `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dfhqwobdxcmhupkgrqauyzktccrktoztojmn` (`groupId`,`siteId`),
  KEY `idx_dgppqitysnyqoujxfjdhstrdlzojrttupzpd` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
CREATE TABLE IF NOT EXISTS `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_dbxqdecgkyevijebucswmkqtqpmhrftixeki` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_wpvqiohhiowgekpmsehlteyjlskfddajouxj` (`siteId`),
  KEY `fk_koyzgxfvkxlbrnfdvfxquazlbgcvepkqsnsy` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'title', '2024-05-20 14:26:06', 0, 1),
(4, 1, 'enabled', '2024-05-20 14:27:35', 0, 1),
(4, 1, 'title', '2024-05-17 22:41:12', 0, 1),
(6, 1, 'title', '2024-05-20 14:26:22', 0, 1),
(44, 1, 'fieldLayoutId', '2024-05-20 12:05:14', 0, 1),
(44, 1, 'postDate', '2024-05-20 12:07:55', 0, 1),
(44, 1, 'slug', '2024-05-20 12:08:19', 0, 1),
(44, 1, 'title', '2024-05-20 14:29:25', 0, 1),
(44, 1, 'typeId', '2024-05-20 12:05:14', 0, 1),
(44, 1, 'uri', '2024-05-20 12:08:19', 0, 1),
(48, 1, 'title', '2024-05-20 14:26:14', 0, 1),
(104, 1, 'postDate', '2024-05-20 13:37:50', 0, 1),
(104, 1, 'title', '2024-05-20 13:39:11', 0, 1),
(108, 1, 'postDate', '2024-05-20 13:40:39', 0, 1),
(108, 1, 'slug', '2024-05-20 13:40:39', 0, 1),
(108, 1, 'title', '2024-05-20 13:39:43', 0, 1),
(108, 1, 'uri', '2024-05-20 13:40:39', 0, 1),
(110, 1, 'postDate', '2024-05-20 13:57:44', 0, 1),
(110, 1, 'slug', '2024-05-20 13:57:44', 0, 1),
(110, 1, 'title', '2024-05-20 13:49:31', 0, 1),
(110, 1, 'uri', '2024-05-20 13:57:44', 0, 1),
(112, 1, 'postDate', '2024-05-20 13:58:15', 0, 1),
(112, 1, 'slug', '2024-05-20 13:58:15', 0, 1),
(112, 1, 'title', '2024-05-20 13:57:58', 0, 1),
(112, 1, 'uri', '2024-05-20 13:58:15', 0, 1),
(114, 1, 'postDate', '2024-05-20 13:58:51', 0, 1),
(114, 1, 'slug', '2024-05-20 13:58:51', 0, 1),
(114, 1, 'title', '2024-05-20 13:58:24', 0, 1),
(114, 1, 'uri', '2024-05-20 13:58:51', 0, 1),
(116, 1, 'postDate', '2024-05-20 13:59:25', 0, 1),
(116, 1, 'slug', '2024-05-20 13:59:25', 0, 1),
(116, 1, 'title', '2024-05-20 13:59:05', 0, 1),
(116, 1, 'uri', '2024-05-20 13:59:25', 0, 1),
(118, 1, 'postDate', '2024-05-20 13:59:57', 0, 1),
(118, 1, 'slug', '2024-05-20 13:59:57', 0, 1),
(118, 1, 'title', '2024-05-20 13:59:40', 0, 1),
(118, 1, 'uri', '2024-05-20 13:59:57', 0, 1),
(120, 1, 'postDate', '2024-05-20 14:00:36', 0, 1),
(120, 1, 'slug', '2024-05-20 14:00:36', 0, 1),
(120, 1, 'title', '2024-05-20 14:00:12', 0, 1),
(120, 1, 'uri', '2024-05-20 14:00:36', 0, 1),
(123, 1, 'postDate', '2024-05-20 14:02:31', 0, 1),
(123, 1, 'slug', '2024-05-20 14:02:31', 0, 1),
(123, 1, 'title', '2024-05-20 14:02:13', 0, 1),
(123, 1, 'uri', '2024-05-20 14:02:31', 0, 1),
(125, 1, 'postDate', '2024-05-20 14:03:08', 0, 1),
(125, 1, 'slug', '2024-05-20 14:03:08', 0, 1),
(125, 1, 'title', '2024-05-20 14:02:49', 0, 1),
(125, 1, 'uri', '2024-05-20 14:03:08', 0, 1),
(127, 1, 'postDate', '2024-05-20 14:05:12', 0, 1),
(127, 1, 'slug', '2024-05-20 14:05:12', 0, 1),
(127, 1, 'title', '2024-05-20 14:04:49', 0, 1),
(127, 1, 'uri', '2024-05-20 14:05:12', 0, 1),
(129, 1, 'postDate', '2024-05-20 14:05:51', 0, 1),
(129, 1, 'slug', '2024-05-20 14:05:52', 0, 1),
(129, 1, 'title', '2024-05-20 14:05:36', 0, 1),
(129, 1, 'uri', '2024-05-20 14:05:52', 0, 1),
(131, 1, 'postDate', '2024-05-20 14:06:27', 0, 1),
(131, 1, 'slug', '2024-05-20 14:06:27', 0, 1),
(131, 1, 'title', '2024-05-20 14:06:05', 0, 1),
(131, 1, 'uri', '2024-05-20 14:06:27', 0, 1),
(133, 1, 'postDate', '2024-05-20 14:06:51', 0, 1),
(133, 1, 'slug', '2024-05-20 14:06:51', 0, 1),
(133, 1, 'title', '2024-05-20 14:06:34', 0, 1),
(133, 1, 'uri', '2024-05-20 14:06:51', 0, 1),
(135, 1, 'postDate', '2024-05-20 14:07:33', 0, 1),
(135, 1, 'slug', '2024-05-20 14:07:33', 0, 1),
(135, 1, 'title', '2024-05-20 14:07:13', 0, 1),
(135, 1, 'uri', '2024-05-20 14:07:33', 0, 1),
(137, 1, 'postDate', '2024-05-20 14:08:05', 0, 1),
(137, 1, 'slug', '2024-05-20 14:08:05', 0, 1),
(137, 1, 'title', '2024-05-20 14:07:41', 0, 1),
(137, 1, 'uri', '2024-05-20 14:08:05', 0, 1),
(139, 1, 'postDate', '2024-05-20 14:08:29', 0, 1),
(139, 1, 'slug', '2024-05-20 14:08:29', 0, 1),
(139, 1, 'title', '2024-05-20 14:08:11', 0, 1),
(139, 1, 'uri', '2024-05-20 14:08:29', 0, 1),
(141, 1, 'postDate', '2024-05-20 14:08:56', 0, 1),
(141, 1, 'slug', '2024-05-20 14:08:56', 0, 1),
(141, 1, 'title', '2024-05-20 14:08:40', 0, 1),
(141, 1, 'uri', '2024-05-20 14:08:56', 0, 1),
(143, 1, 'postDate', '2024-05-20 14:09:23', 0, 1),
(143, 1, 'slug', '2024-05-20 14:09:23', 0, 1),
(143, 1, 'title', '2024-05-20 14:09:03', 0, 1),
(143, 1, 'uri', '2024-05-20 14:09:23', 0, 1),
(145, 1, 'postDate', '2024-05-20 14:10:11', 0, 1),
(145, 1, 'slug', '2024-05-20 14:10:11', 0, 1),
(145, 1, 'title', '2024-05-20 14:09:52', 0, 1),
(145, 1, 'uri', '2024-05-20 14:10:11', 0, 1),
(150, 1, 'fieldLayoutId', '2024-05-20 14:20:24', 0, 1),
(150, 1, 'typeId', '2024-05-20 14:20:24', 0, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
CREATE TABLE IF NOT EXISTS `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_nfcwdcuwpsllrkinrhvxfbsnhlcydpgfrbcq` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_vlrqpbkjscjepkrvueggiixdahytveqjfxey` (`siteId`),
  KEY `fk_hhxduwqvclzlpqnmpilgciqvoagihlnjvtti` (`fieldId`),
  KEY `fk_dusirttzqovcfxaadpccveohfgzvoxrwfpxn` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `layoutElementUid`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 9, '599cf7b2-f569-4efc-a9a0-d192392916a4', '2024-05-18 19:08:20', 0, 1),
(2, 1, 10, '42e7edf5-8640-4c7e-a9c1-12935ac9580e', '2024-05-18 18:59:11', 0, 1),
(2, 1, 11, 'b0732feb-5bfa-4274-85ba-43f1736948c9', '2024-05-18 18:59:11', 0, 1),
(2, 1, 12, 'e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06', '2024-05-18 18:59:11', 0, 1),
(2, 1, 13, 'bae9d037-0e55-4ddb-8c3b-3d3debd13ab9', '2024-05-18 18:59:11', 0, 1),
(2, 1, 14, 'ddb0c5cd-9334-4f3e-babd-237b4ccf50d9', '2024-05-18 19:58:08', 0, 1),
(2, 1, 15, '73070154-2e5d-47ca-b899-69301fd074c9', '2024-05-18 19:58:08', 0, 1),
(2, 1, 17, '453ca11a-58bd-460d-ad06-e396d7f92542', '2024-05-18 22:10:00', 0, 1),
(2, 1, 18, 'eae8afc4-6f31-4e9d-8370-3a870fb4a2ea', '2024-05-18 22:13:52', 0, 1),
(2, 1, 19, '22696a3d-b8c1-4508-870a-8d7bb8e97d49', '2024-05-18 22:10:00', 0, 1),
(2, 1, 20, '18e627da-2d6c-426f-b38d-84c8218771fa', '2024-05-18 22:10:00', 0, 1),
(2, 1, 21, '74d7ab83-af58-49cf-be27-1645b1d0f9c8', '2024-05-18 22:10:00', 0, 1),
(2, 1, 24, 'a0963bab-adf5-4a5c-af31-fac105d33a20', '2024-05-18 22:25:12', 0, 1),
(2, 1, 25, 'af0c8043-23a6-4e95-80c4-a227821ecb0e', '2024-05-18 22:25:12', 0, 1),
(2, 1, 32, '29362312-09d9-4840-be86-b36259f3ea9e', '2024-05-20 14:24:47', 0, 1),
(4, 1, 7, 'd3d7ea17-7bc3-4fa0-909a-b11d23e3acc1', '2024-05-18 19:22:31', 0, 1),
(6, 1, 8, 'e45dd48b-de12-4c10-a80f-d4fbf0338032', '2024-05-17 22:57:08', 0, 1),
(44, 1, 28, '061d08d3-ea7c-4226-904a-32ef8244d99e', '2024-05-20 12:07:55', 0, 1),
(44, 1, 29, '51692670-1e8d-41c1-8cdd-83ed7aaf3d7a', '2024-05-20 12:07:55', 0, 1),
(48, 1, 30, '6ad40c30-c892-4bfd-8c85-342fea11c32f', '2024-05-20 13:11:30', 0, 1),
(48, 1, 31, '8e49b995-dbfd-4e53-9f92-ded9be4edbd4', '2024-05-20 13:11:30', 0, 1),
(104, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 13:37:50', 0, 1),
(104, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 13:37:50', 0, 1),
(104, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:23:34', 0, 1),
(104, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 13:37:50', 0, 1),
(104, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 13:37:50', 0, 1),
(104, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:32:58', 0, 1),
(108, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 13:40:39', 0, 1),
(108, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 13:40:39', 0, 1),
(108, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:52:27', 0, 1),
(108, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 13:40:39', 0, 1),
(108, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 13:40:39', 0, 1),
(108, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:50:15', 0, 1),
(110, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 13:57:44', 0, 1),
(110, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 13:57:44', 0, 1),
(110, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:52:45', 0, 1),
(110, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 13:57:44', 0, 1),
(110, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 13:57:44', 0, 1),
(110, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:50:52', 0, 1),
(112, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 13:58:15', 0, 1),
(112, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 13:58:15', 0, 1),
(112, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:52:57', 0, 1),
(112, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 13:58:15', 0, 1),
(112, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 13:58:15', 0, 1),
(112, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:51:13', 0, 1),
(114, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 13:58:51', 0, 1),
(114, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 13:58:51', 0, 1),
(114, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:53:48', 0, 1),
(114, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 13:58:51', 0, 1),
(114, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 13:58:51', 0, 1),
(114, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:51:35', 0, 1),
(116, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 13:59:25', 0, 1),
(116, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 13:59:25', 0, 1),
(116, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:54:27', 0, 1),
(116, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 13:59:25', 0, 1),
(116, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 13:59:25', 0, 1),
(116, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:54:27', 0, 1),
(118, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 13:59:57', 0, 1),
(118, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 13:59:57', 0, 1),
(118, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:55:20', 0, 1),
(118, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 13:59:57', 0, 1),
(118, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 13:59:57', 0, 1),
(118, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:55:20', 0, 1),
(120, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:00:36', 0, 1),
(120, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:00:36', 0, 1),
(120, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:56:00', 0, 1),
(120, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:00:36', 0, 1),
(120, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:00:36', 0, 1),
(120, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:56:00', 0, 1),
(123, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:02:31', 0, 1),
(123, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:02:31', 0, 1),
(123, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:56:23', 0, 1),
(123, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:02:31', 0, 1),
(123, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:02:31', 0, 1),
(123, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:56:23', 0, 1),
(125, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:03:08', 0, 1),
(125, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:03:08', 0, 1),
(125, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:59:24', 0, 1),
(125, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:03:08', 0, 1),
(125, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:03:08', 0, 1),
(125, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:59:24', 0, 1),
(127, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:05:12', 0, 1),
(127, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:05:12', 0, 1),
(127, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 16:54:59', 0, 1),
(127, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:05:12', 0, 1),
(127, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:05:12', 0, 1),
(127, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 16:54:59', 0, 1),
(129, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:05:51', 0, 1),
(129, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:05:51', 0, 1),
(129, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:00:20', 0, 1),
(129, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 17:00:20', 0, 1),
(129, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:05:51', 0, 1),
(129, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:00:20', 0, 1),
(131, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:06:27', 0, 1),
(131, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:06:27', 0, 1),
(131, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:00:46', 0, 1),
(131, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:06:27', 0, 1),
(131, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:06:27', 0, 1),
(131, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:00:46', 0, 1),
(133, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:06:51', 0, 1),
(133, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:06:51', 0, 1),
(133, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:01:05', 0, 1),
(133, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:06:51', 0, 1),
(133, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:06:51', 0, 1),
(133, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:01:05', 0, 1),
(135, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:07:33', 0, 1),
(135, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:07:33', 0, 1),
(135, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:01:42', 0, 1),
(135, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:07:33', 0, 1),
(135, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:07:33', 0, 1),
(135, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:01:42', 0, 1),
(137, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:08:05', 0, 1),
(137, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:08:05', 0, 1),
(137, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:02:12', 0, 1),
(137, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:08:05', 0, 1),
(137, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:08:05', 0, 1),
(137, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:02:12', 0, 1),
(139, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:08:29', 0, 1),
(139, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:08:29', 0, 1),
(139, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:02:39', 0, 1),
(139, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:08:29', 0, 1),
(139, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:08:29', 0, 1),
(139, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:02:39', 0, 1),
(141, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:08:56', 0, 1),
(141, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:08:56', 0, 1),
(141, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:03:02', 0, 1),
(141, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:10:59', 0, 1),
(141, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:10:59', 0, 1),
(141, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:03:02', 0, 1),
(143, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:09:23', 0, 1),
(143, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:09:23', 0, 1),
(143, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:03:42', 0, 1),
(143, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:09:23', 0, 1),
(143, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:09:23', 0, 1),
(143, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:03:42', 0, 1),
(145, 1, 1, '8d13ef9d-d968-4254-8eed-78bcb86b9a76', '2024-05-20 14:10:11', 0, 1),
(145, 1, 2, 'c25749aa-bc71-4e34-b1e0-867d1d9960fa', '2024-05-20 14:10:11', 0, 1),
(145, 1, 4, 'e5652917-52bb-45d1-a11f-28d211b19ffb', '2024-05-20 17:03:23', 0, 1),
(145, 1, 5, '2e467574-6736-445e-ac8e-c74e6c87c2aa', '2024-05-20 14:10:11', 0, 1),
(145, 1, 6, 'ffc4a840-9720-4e4d-8975-0f2fba4c126c', '2024-05-20 14:10:11', 0, 1),
(145, 1, 16, '5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4', '2024-05-20 17:03:24', 0, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cookie_consent_consent`
--

DROP TABLE IF EXISTS `cookie_consent_consent`;
CREATE TABLE IF NOT EXISTS `cookie_consent_consent` (
  `uid` char(36) NOT NULL DEFAULT '0',
  `site_id` int DEFAULT NULL,
  `ip` varchar(39) DEFAULT NULL,
  `data` text,
  `cookieName` varchar(255) DEFAULT 'cookie-consent',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `fk_cookie_consent_consent_belong_to_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `cookie_consent_consent`
--

INSERT INTO `cookie_consent_consent` (`uid`, `site_id`, `ip`, `data`, `cookieName`, `dateCreated`, `dateUpdated`) VALUES
('3059ab34-314f-4be8-851c-0c6cdc3922fa', 1, '::1', '{\"default-necessary\":true,\"default-statistics\":true,\"default-marketing\":true}', 'cookie-consent', '2024-05-20 18:04:30', '2024-05-20 18:04:30'),
('df935232-cc32-45eb-b62a-e1762e49efb0', 1, '::1', '{\"default-necessary\":true,\"default-statistics\":false,\"default-marketing\":true}', 'cookie-consent', '2024-05-20 18:08:53', '2024-05-20 18:08:53'),
('f430c605-a8a2-439b-8c37-59b78bb27066', 1, '::1', '{\"default-necessary\":true,\"default-statistics\":false,\"default-marketing\":true}', 'cookie-consent', '2024-05-20 18:08:51', '2024-05-20 18:08:51');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cookie_consent_group`
--

DROP TABLE IF EXISTS `cookie_consent_group`;
CREATE TABLE IF NOT EXISTS `cookie_consent_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` char(36) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `required` tinyint(1) NOT NULL,
  `store_ip` tinyint(1) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `cookies` text,
  `description` text,
  `site_id` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cookie_consent_group_belong_to_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `cookie_consent_group`
--

INSERT INTO `cookie_consent_group` (`id`, `uid`, `name`, `slug`, `required`, `store_ip`, `default`, `cookies`, `description`, `site_id`, `dateCreated`, `dateUpdated`, `order`) VALUES
(1, '1be6c363-7451-4dd9-9d7a-def443f12384', 'Necessary', 'default-necessary', 1, 0, 1, '[{\"name\":\"CraftSessionId\",\"description\":\"Craft relies on PHP sessions to maintain sessions across web requests. That is done via the PHP session cookie. Craft names that cookie “CraftSessionId” by default, but it can be renamed via the phpSessionId config setting. This cookie will expire as soon as the session expires.\",\"provider\":\"this site\",\"expiry\":\"Session\"},{\"name\":\"*_identity\",\"description\":\"When you log into the Control Panel, you will get an authentication cookie used to maintain your authenticated state. The cookie name is prefixed with a long, randomly generated string, followed by _identity. The cookie only stores information necessary to maintain a secure, authenticated session and will only exist for as long as the user is authenticated in Craft.\",\"provider\":\"this site\",\"expiry\":\"Persistent\"},{\"name\":\"*_username\",\"description\":\"If you check the \\\"Keep me logged in\\\" option during login, this cookie is used to remember the username for your next authentication.\",\"provider\":\"this site\",\"expiry\":\"Persistent\"},{\"name\":\"CRAFT_CSRF_TOKEN\",\"description\":\"Protects us and you as a user against Cross-Site Request Forgery attacks.\",\"provider\":\"this site\",\"expiry\":\"Session\"}]', 'Cookies that the site cannot function properly without. This includes cookies for access to secure areas and CSRF security. Please note that Craft’s default cookies do not collect any personal or sensitive information. Craft\'s default cookies do not collect IP addresses. The information they store is not sent to Pixel & Tonic or any 3rd parties.', 1, '2024-05-20 17:58:16', '2024-05-20 17:58:16', 0),
(2, 'd440eca3-9a2a-47b7-87a5-62f9a1c39860', 'Statistics', 'default-statistics', 0, 0, 0, '[]', 'Statistic cookies help us understand how visitors interact with websites by collecting and reporting information anonymously.', 1, '2024-05-20 17:58:16', '2024-05-20 17:58:16', 0),
(3, 'e698760f-f45f-4bb0-84a8-54956b790a21', 'Marketing', 'default-marketing', 0, 1, 0, '[]', 'Marketing cookies are used to track visitors across websites. The intention is to display ads that are relevant and engaging for the individual user and thereby more valuable for publishers and third party advertisers.', 1, '2024-05-20 17:58:16', '2024-05-20 17:58:16', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cookie_consent_site_settings`
--

DROP TABLE IF EXISTS `cookie_consent_site_settings`;
CREATE TABLE IF NOT EXISTS `cookie_consent_site_settings` (
  `site_id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `cssAssets` tinyint(1) NOT NULL DEFAULT '1',
  `jsAssets` tinyint(1) NOT NULL DEFAULT '1',
  `templateAsset` tinyint(1) NOT NULL DEFAULT '1',
  `showCheckboxes` tinyint(1) NOT NULL DEFAULT '1',
  `showAfterConsent` tinyint(1) NOT NULL DEFAULT '1',
  `cookieName` varchar(255) NOT NULL DEFAULT 'cookie-consent',
  `acceptAllButton` tinyint(1) NOT NULL DEFAULT '0',
  `headline` varchar(255) NOT NULL,
  `description` text,
  `template` varchar(255) NOT NULL,
  `refresh` tinyint(1) NOT NULL DEFAULT '0',
  `refresh_time` int NOT NULL DEFAULT '500',
  `dateInvalidated` datetime NOT NULL DEFAULT '2019-05-14 00:00:00',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `cookie_consent_site_settings`
--

INSERT INTO `cookie_consent_site_settings` (`site_id`, `dateCreated`, `dateUpdated`, `uid`, `activated`, `cssAssets`, `jsAssets`, `templateAsset`, `showCheckboxes`, `showAfterConsent`, `cookieName`, `acceptAllButton`, `headline`, `description`, `template`, `refresh`, `refresh_time`, `dateInvalidated`) VALUES
(1, '2024-05-20 17:58:16', '2024-05-20 18:07:49', '409ca74a-76c1-4b03-b9e1-60da9d65b630', 1, 1, 1, 1, 1, 1, 'cookie-consent', 1, 'This website uses cookies', 'We use cookies to personalize content and ads, and to analyze our traffic and improve our service.', 'cookie-consent/banner', 0, 500, '2024-05-20 17:58:16');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
CREATE TABLE IF NOT EXISTS `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_coxaahjzygcrvbytsqjqrdrfvxqgaqynejyt` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
CREATE TABLE IF NOT EXISTS `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_laeekkdhbxseeyancltmyzxjevtgdzsndltr` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `drafts`
--

DROP TABLE IF EXISTS `drafts`;
CREATE TABLE IF NOT EXISTS `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_wbzetbsfgauyhsvbwlruahqvutakgnpovlyg` (`creatorId`,`provisional`),
  KEY `idx_ulvyuscbzgurwduybdsawqahkseviethepff` (`saved`),
  KEY `fk_fonqldovqyrvqrjpxsbrrhyhpjkwpmfurpon` (`canonicalId`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `drafts`
--

INSERT INTO `drafts` (`id`, `canonicalId`, `creatorId`, `provisional`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`) VALUES
(9, NULL, 1, 0, 'First draft', NULL, 0, NULL, 0),
(10, NULL, 1, 0, 'First draft', NULL, 0, NULL, 0),
(14, NULL, 1, 0, 'First draft', NULL, 0, NULL, 0),
(18, NULL, 1, 0, 'First draft', NULL, 0, NULL, 0),
(19, NULL, 1, 0, 'First draft', NULL, 0, NULL, 0),
(43, NULL, 1, 0, 'First draft', '', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
CREATE TABLE IF NOT EXISTS `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_uztzzzujabtwabsohtauzgyphuzltacubolj` (`elementId`,`timestamp`,`userId`),
  KEY `fk_mpzwnxocfplplwtnurnmoknlpiiwpihcbfid` (`userId`),
  KEY `fk_azprluwjrolxmnfrgjcwzlsvazdvbfvivrxi` (`siteId`),
  KEY `fk_jaggglwcsgcjnpssfdijyzkpgsizigyhwmhm` (`draftId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elementactivity`
--

INSERT INTO `elementactivity` (`elementId`, `userId`, `siteId`, `draftId`, `type`, `timestamp`) VALUES
(2, 1, 1, NULL, 'edit', '2024-05-20 14:26:02'),
(2, 1, 1, NULL, 'save', '2024-05-20 14:26:06'),
(4, 1, 1, NULL, 'edit', '2024-05-18 19:22:30'),
(4, 1, 1, NULL, 'save', '2024-05-18 19:22:31'),
(6, 1, 1, NULL, 'edit', '2024-05-20 14:26:22'),
(6, 1, 1, NULL, 'save', '2024-05-20 14:26:22'),
(44, 1, 1, NULL, 'edit', '2024-05-20 14:29:23'),
(44, 1, 1, NULL, 'save', '2024-05-20 14:29:25'),
(48, 1, 1, NULL, 'edit', '2024-05-20 14:26:13'),
(48, 1, 1, NULL, 'save', '2024-05-20 14:26:14'),
(104, 1, 1, NULL, 'edit', '2024-05-20 16:32:45'),
(104, 1, 1, NULL, 'save', '2024-05-20 16:32:58'),
(108, 1, 1, NULL, 'edit', '2024-05-20 16:52:23'),
(108, 1, 1, NULL, 'save', '2024-05-20 16:52:27'),
(110, 1, 1, NULL, 'edit', '2024-05-20 16:52:39'),
(110, 1, 1, NULL, 'save', '2024-05-20 16:52:45'),
(112, 1, 1, NULL, 'edit', '2024-05-20 16:52:56'),
(112, 1, 1, NULL, 'save', '2024-05-20 16:52:57'),
(114, 1, 1, NULL, 'edit', '2024-05-20 16:53:47'),
(114, 1, 1, NULL, 'save', '2024-05-20 16:53:48'),
(116, 1, 1, NULL, 'edit', '2024-05-20 16:54:26'),
(116, 1, 1, NULL, 'save', '2024-05-20 16:54:27'),
(118, 1, 1, NULL, 'edit', '2024-05-20 16:55:20'),
(118, 1, 1, NULL, 'save', '2024-05-20 16:55:20'),
(120, 1, 1, NULL, 'edit', '2024-05-20 16:55:59'),
(120, 1, 1, NULL, 'save', '2024-05-20 16:56:00'),
(123, 1, 1, NULL, 'edit', '2024-05-20 16:56:22'),
(123, 1, 1, NULL, 'save', '2024-05-20 16:56:23'),
(125, 1, 1, NULL, 'edit', '2024-05-20 16:59:23'),
(125, 1, 1, NULL, 'save', '2024-05-20 16:59:24'),
(127, 1, 1, NULL, 'edit', '2024-05-20 16:54:58'),
(127, 1, 1, NULL, 'save', '2024-05-20 16:54:59'),
(129, 1, 1, NULL, 'edit', '2024-05-20 17:00:19'),
(129, 1, 1, NULL, 'save', '2024-05-20 17:00:20'),
(131, 1, 1, NULL, 'edit', '2024-05-20 17:00:45'),
(131, 1, 1, NULL, 'save', '2024-05-20 17:00:46'),
(133, 1, 1, NULL, 'edit', '2024-05-20 17:01:04'),
(133, 1, 1, NULL, 'save', '2024-05-20 17:01:05'),
(135, 1, 1, NULL, 'edit', '2024-05-20 17:01:40'),
(135, 1, 1, NULL, 'save', '2024-05-20 17:01:42'),
(137, 1, 1, NULL, 'edit', '2024-05-20 17:02:12'),
(137, 1, 1, NULL, 'save', '2024-05-20 17:02:12'),
(139, 1, 1, NULL, 'edit', '2024-05-20 17:02:39'),
(139, 1, 1, NULL, 'save', '2024-05-20 17:02:39'),
(141, 1, 1, NULL, 'edit', '2024-05-20 17:03:01'),
(141, 1, 1, NULL, 'save', '2024-05-20 17:03:02'),
(143, 1, 1, NULL, 'edit', '2024-05-20 17:03:41'),
(143, 1, 1, NULL, 'save', '2024-05-20 17:03:42'),
(145, 1, 1, NULL, 'edit', '2024-05-20 17:03:22'),
(145, 1, 1, NULL, 'save', '2024-05-20 17:03:24'),
(150, 1, 1, NULL, 'save', '2024-05-20 14:20:24');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements`
--

DROP TABLE IF EXISTS `elements`;
CREATE TABLE IF NOT EXISTS `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xtdeasojmhncbxptukzqwnfvwngppukygudm` (`dateDeleted`),
  KEY `idx_jijuaokynvvrquiqqxczljidlpklpeqobnai` (`fieldLayoutId`),
  KEY `idx_wdkaovioqccblgwltegsrvhnxuszlitqtetf` (`type`),
  KEY `idx_nsgpqpbinoaifmxmnvwvifpdojmfvgjrnmqt` (`enabled`),
  KEY `idx_omejcmaqgfqmawokuixashyxfmwjymfzdgmm` (`canonicalId`),
  KEY `idx_iinhfuwttqinowxnbdaiaolllpefpiayllce` (`archived`,`dateCreated`),
  KEY `idx_mvzpgywczxydpsbywwuizdjfwgjplslrxvey` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_fdtmqdkomofptmgsmluirhfiqdeaxehyklir` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_dkixhedlrftgnklstsozmiaxajmvrnemvonx` (`draftId`),
  KEY `fk_eatudciagipaodhpogoktuntipusfsuucrzn` (`revisionId`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `deletedWithOwner`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2024-05-16 18:35:01', '2024-05-16 18:35:01', NULL, NULL, NULL, 'eacf9564-b3f9-4bee-a004-8763eecd8446'),
(2, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-17 21:58:11', '2024-05-20 14:26:05', NULL, NULL, NULL, 'd189889a-e4a6-48b8-a815-6c8e276de0de'),
(3, 2, NULL, 1, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-17 21:58:11', '2024-05-17 21:58:11', NULL, NULL, NULL, '337c9ded-3cc3-4278-9d22-0126bca7bd89'),
(4, NULL, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:16:50', '2024-05-20 14:27:35', NULL, NULL, NULL, 'a57d3bfe-d075-4696-a445-5cb6511d59be'),
(5, 4, NULL, 2, 3, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:16:50', '2024-05-17 22:16:50', NULL, NULL, NULL, '29be2130-0c7a-4bfb-b8d9-c06e28619dee'),
(6, NULL, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:17:57', '2024-05-20 14:26:22', NULL, NULL, NULL, '273fc600-5ae7-4feb-96e9-8680375ee610'),
(7, 6, NULL, 3, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:17:57', '2024-05-17 22:17:57', NULL, NULL, NULL, 'f76ad12c-066c-4c23-8c08-503affbd0e36'),
(9, 4, NULL, 4, 3, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:21:16', '2024-05-17 22:21:16', NULL, NULL, NULL, 'fb8d4247-f60b-495c-bf50-8641ad10c168'),
(11, 4, NULL, 5, 3, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:41:12', '2024-05-17 22:41:12', NULL, NULL, NULL, 'eca2fd2c-44e3-4060-a4e2-282d44296c53'),
(12, 6, NULL, 6, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:41:35', '2024-05-17 22:41:35', NULL, NULL, NULL, 'a9b8a51c-2abe-4391-8a0e-7ee1c980f272'),
(14, 4, NULL, 7, 3, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:48:26', '2024-05-17 22:48:26', NULL, NULL, NULL, '77b0d61b-21ce-481c-896c-df29cb8f255b'),
(16, 6, NULL, 8, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-17 22:57:08', '2024-05-17 22:57:08', NULL, NULL, NULL, 'a6fe7ce9-0abd-4fa8-a283-4726c34d8235'),
(17, 2, NULL, 9, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 18:41:14', '2024-05-18 18:41:15', NULL, NULL, NULL, 'e354e538-3472-4199-9c0c-f6e71bb5248e'),
(18, 2, NULL, 10, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 18:41:15', '2024-05-18 18:41:15', NULL, NULL, NULL, 'a4740c4c-de6f-4741-a0b0-539462868ed8'),
(19, 2, NULL, 11, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 18:47:49', '2024-05-18 18:47:49', NULL, NULL, NULL, 'fbba3b81-f7a2-451c-bf22-13645465491b'),
(21, 2, NULL, 12, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 18:59:11', '2024-05-18 18:59:11', NULL, NULL, NULL, 'd6564cd5-d1bc-4c2a-add2-aac6e6c8184b'),
(22, NULL, NULL, NULL, 5, 'craft\\elements\\Asset', 1, 0, '2024-05-18 19:08:06', '2024-05-18 19:08:06', NULL, NULL, NULL, 'd769ca46-dc4d-4dd3-88d5-a50de8074cf6'),
(24, 2, NULL, 13, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 19:08:20', '2024-05-18 19:08:20', NULL, NULL, NULL, '5631d106-a891-46b7-99eb-560b8104d972'),
(26, 4, NULL, 14, 3, 'craft\\elements\\Entry', 1, 0, '2024-05-18 19:22:31', '2024-05-18 19:22:31', NULL, NULL, NULL, '1faa4651-dfac-4677-882e-32def9bf1cba'),
(28, 2, NULL, 15, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 19:58:08', '2024-05-18 19:58:08', NULL, NULL, NULL, 'bbc6c997-8148-46b9-ae67-5ae4eeac2283'),
(29, NULL, 9, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-18 20:10:15', '2024-05-18 20:10:15', NULL, NULL, NULL, '9e0f8e44-022c-4825-a45f-1bf9b93c35ca'),
(30, NULL, 10, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-18 21:59:12', '2024-05-18 21:59:12', NULL, NULL, NULL, '20557b8a-97cd-489b-8e72-caaf37751626'),
(32, 2, NULL, 16, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 22:10:00', '2024-05-18 22:10:01', NULL, NULL, NULL, 'd13b950c-f2e8-4ec1-9c9f-dfbba524cdd2'),
(34, 2, NULL, 17, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 22:13:52', '2024-05-18 22:13:52', NULL, NULL, NULL, 'bff6c22d-dee0-403b-b923-fd1372d750d6'),
(35, NULL, NULL, NULL, 5, 'craft\\elements\\Asset', 1, 0, '2024-05-18 22:15:36', '2024-05-18 22:19:15', NULL, '2024-05-18 22:19:15', NULL, '81943dd7-0a49-467a-8f42-99ef509f8d14'),
(36, NULL, NULL, NULL, 7, 'craft\\elements\\Asset', 1, 0, '2024-05-18 22:19:20', '2024-05-18 22:19:57', NULL, '2024-05-18 22:19:57', NULL, '0c3dda12-caaf-4903-a839-757d2cb0f49a'),
(37, NULL, NULL, NULL, 7, 'craft\\elements\\Asset', 1, 0, '2024-05-18 22:21:06', '2024-05-18 22:21:06', NULL, NULL, NULL, '9b964358-ed4d-453b-be94-a40c33600795'),
(39, 2, NULL, 18, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-18 22:25:12', '2024-05-18 22:25:12', NULL, NULL, NULL, '3295b3f5-c09f-440d-8939-b36fa50971f7'),
(40, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-20 11:21:43', '2024-05-20 11:26:50', NULL, '2024-05-20 11:26:50', NULL, '603aa85b-3d22-44b4-b49f-d5f467c8fb4a'),
(41, NULL, NULL, NULL, 9, 'craft\\elements\\GlobalSet', 1, 0, '2024-05-20 11:23:58', '2024-05-20 11:53:29', NULL, NULL, NULL, 'd2572f0c-cf70-42cc-b297-2f25a7076fa6'),
(42, NULL, NULL, NULL, 10, 'craft\\elements\\Asset', 1, 0, '2024-05-20 11:49:20', '2024-05-20 11:49:29', NULL, NULL, NULL, '24a78a42-ffda-48f2-8ad8-41118476e971'),
(43, NULL, 14, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 12:03:57', '2024-05-20 12:03:57', NULL, NULL, NULL, 'a932a79c-9d3c-4eef-8340-af4fd5634c8c'),
(44, NULL, NULL, NULL, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-20 12:05:02', '2024-05-20 14:29:25', NULL, NULL, NULL, '0b4507ff-6b4b-43a4-9888-275c031a22b8'),
(45, 44, NULL, 19, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-20 12:07:55', '2024-05-20 12:07:55', NULL, NULL, NULL, '9fde3863-e84f-4674-a928-e2cb365f9747'),
(47, 44, NULL, 20, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-20 12:08:18', '2024-05-20 12:08:19', NULL, NULL, NULL, '08e2fb6d-0c2d-40ed-a026-c9d970ad87f6'),
(48, NULL, NULL, NULL, 12, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:10:15', '2024-05-20 14:26:13', NULL, NULL, NULL, '7825e3e8-10c8-42c2-8ea7-f29a7983ea77'),
(49, 48, NULL, 21, 12, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:10:15', '2024-05-20 13:10:15', NULL, NULL, NULL, '1077e74c-41f1-44e4-b723-bd3a63194e1a'),
(51, 48, NULL, 22, 12, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:11:30', '2024-05-20 13:11:30', NULL, NULL, NULL, '5cc6f7ec-8693-4cdb-908b-b4fd93d2823f'),
(52, NULL, NULL, NULL, NULL, 'verbb\\formie\\elements\\Form', 1, 0, '2024-05-20 13:19:46', '2024-05-20 13:20:18', NULL, '2024-05-20 13:20:18', NULL, '571c3647-7ebb-485b-9f08-c3fec99504d2'),
(53, NULL, NULL, NULL, NULL, 'verbb\\formie\\elements\\Form', 1, 0, '2024-05-20 13:20:45', '2024-05-20 13:20:45', NULL, NULL, NULL, '554863e1-5f16-4d8e-9b47-ed4cf47d1063'),
(54, NULL, 18, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:28:45', '2024-05-20 13:28:45', NULL, NULL, NULL, '4b320d99-e43d-42be-bffd-94df0d2ab70f'),
(55, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:31:58', '2024-05-20 13:31:58', NULL, NULL, NULL, '90c5e860-a4da-4062-8c33-2e87bb223e8d'),
(56, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:31:59', '2024-05-20 13:31:59', NULL, NULL, NULL, '05191354-7570-4a97-b174-1f051ab7c13c'),
(57, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:31:59', '2024-05-20 13:31:59', NULL, NULL, NULL, 'e91160e6-b0aa-4c02-ab73-2ca2483ab03d'),
(58, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:31:59', '2024-05-20 13:31:59', NULL, NULL, NULL, 'b34e3642-cc03-4a98-a905-0fdc0535c0bc'),
(59, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:00', '2024-05-20 13:32:00', NULL, NULL, NULL, 'b8067461-a363-466d-838e-94f4c753a186'),
(60, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:02', '2024-05-20 13:32:02', NULL, NULL, NULL, 'abfe6f81-1844-41d6-affd-8fa99ca58b80'),
(61, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:04', '2024-05-20 13:32:04', NULL, NULL, NULL, 'f38160c6-7c0d-49f5-b177-341261abf32b'),
(62, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:05', '2024-05-20 13:32:05', NULL, NULL, NULL, 'e7f9e928-7186-49f3-a903-54eed1e182b2'),
(63, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:06', '2024-05-20 13:32:06', NULL, NULL, NULL, '9e6430af-0997-4951-84e6-b10d9b6efb7f'),
(64, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:06', '2024-05-20 13:32:06', NULL, NULL, NULL, '7ee08771-4e38-4f4b-99ea-338d96fefd3f'),
(65, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:07', '2024-05-20 13:32:07', NULL, NULL, NULL, '1dfaffdc-f366-445e-ad92-8d9120536b2d'),
(66, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:08', '2024-05-20 13:32:08', NULL, NULL, NULL, '3a09b3dc-f6c2-47fd-a7ea-b059e758a38c'),
(67, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:08', '2024-05-20 13:32:08', NULL, NULL, NULL, 'ddbab3ce-fe55-431d-b5ed-b0ea3433e164'),
(68, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:09', '2024-05-20 13:32:09', NULL, NULL, NULL, '7a00f174-ba90-44b1-85b7-75cd7a51971e'),
(69, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:10', '2024-05-20 13:32:10', NULL, NULL, NULL, '991cca73-b7f8-425a-9c15-e2a30d63336e'),
(70, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:10', '2024-05-20 13:32:10', NULL, NULL, NULL, 'b68d2ae8-7cb5-4d8b-a09d-67b31b0ba857'),
(71, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:11', '2024-05-20 13:32:11', NULL, NULL, NULL, 'f8fd6301-4432-4d3a-8a48-3174582438fe'),
(72, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:12', '2024-05-20 13:32:12', NULL, NULL, NULL, '2614f7af-4b78-4442-89fb-7862ad9befbb'),
(73, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:12', '2024-05-20 13:32:12', NULL, NULL, NULL, '798b4092-4912-4739-ac35-9b48c3f3cbd9'),
(74, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:13', '2024-05-20 13:32:13', NULL, NULL, NULL, '1764632c-6c1a-4fbb-b2d0-3eb35e1dcac7'),
(75, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:14', '2024-05-20 13:32:14', NULL, NULL, NULL, '854463e1-1ff3-4815-a879-32c562b39197'),
(76, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:14', '2024-05-20 13:32:14', NULL, NULL, NULL, '255be671-6f54-4902-a923-b21550f3c206'),
(77, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:15', '2024-05-20 13:32:15', NULL, NULL, NULL, 'c6e2a7dd-ff45-4869-80f6-80192d0ced82'),
(78, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:15', '2024-05-20 13:32:15', NULL, NULL, NULL, '4162a9ee-ea90-4e41-af1a-69a0ff69f02f'),
(79, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:16', '2024-05-20 13:32:16', NULL, NULL, NULL, 'dcc55bbf-73f9-4795-a42d-223f9691f9c4'),
(80, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:17', '2024-05-20 13:32:17', NULL, NULL, NULL, 'eef88705-c837-486b-a0fc-f1afa869ed48'),
(81, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:17', '2024-05-20 13:32:17', NULL, NULL, NULL, '84679c04-1133-4de7-b3ea-92961ab44251'),
(82, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:18', '2024-05-20 13:32:18', NULL, NULL, NULL, '9fb0642f-abfd-4f37-89d7-a616249724b4'),
(83, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:18', '2024-05-20 13:32:18', NULL, NULL, NULL, 'e7b29775-880c-4b0b-8d64-1288ece4b9e1'),
(84, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:19', '2024-05-20 13:32:19', NULL, NULL, NULL, '338f059a-7374-4ba4-b763-0dd07a13428e'),
(85, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:19', '2024-05-20 13:32:19', NULL, NULL, NULL, '47ab0ead-4fa2-49db-9a82-e009c14635a1'),
(86, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:20', '2024-05-20 13:32:20', NULL, NULL, NULL, '5fb990b1-9552-4968-be49-da8418b74ab6'),
(87, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:21', '2024-05-20 13:32:21', NULL, NULL, NULL, '38e4ea84-0f73-409b-a94b-bd4742068c9c'),
(88, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:21', '2024-05-20 13:32:21', NULL, NULL, NULL, '5488702a-bcf4-4e0a-a1e1-cfcd53911271'),
(89, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:22', '2024-05-20 13:32:22', NULL, NULL, NULL, 'e0bce421-ab8c-40ef-b490-cd3490d4c7f8'),
(90, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:22', '2024-05-20 13:33:13', NULL, '2024-05-20 13:33:13', NULL, '9c43a898-8ac1-4f7a-9c8d-971daa07a1c4'),
(91, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:24', '2024-05-20 13:33:13', NULL, '2024-05-20 13:33:13', NULL, '9880a3e5-9156-448d-bdb3-632403dbd70c'),
(92, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:24', '2024-05-20 13:33:13', NULL, '2024-05-20 13:33:13', NULL, '1d55b176-5173-4f11-872e-f58c216f39cf'),
(93, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:25', '2024-05-20 13:32:25', NULL, NULL, NULL, '127bb0c7-6a79-4eae-818b-f9094773d387'),
(94, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:25', '2024-05-20 13:32:25', NULL, NULL, NULL, '0469cccf-6546-4684-ae09-72fe96af1dd6'),
(95, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:26', '2024-05-20 13:32:26', NULL, NULL, NULL, '25fdbff1-80b7-42c1-b145-4765b46a54f8'),
(96, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:26', '2024-05-20 13:32:26', NULL, NULL, NULL, 'b5937c9f-86d1-40c2-adb5-d8ebf3a41382'),
(97, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:27', '2024-05-20 13:32:27', NULL, NULL, NULL, 'b532fffd-cc5f-4120-8aee-0b3c038bd9c2'),
(98, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:28', '2024-05-20 13:32:28', NULL, NULL, NULL, 'f16a16be-a60e-4669-bb8b-3c9ed3d1c4c5'),
(99, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:28', '2024-05-20 13:32:28', NULL, NULL, NULL, '73635437-aad0-4d0e-8c35-ddbd6d380c67'),
(100, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:29', '2024-05-20 13:32:29', NULL, NULL, NULL, '938e5371-1edd-4729-bbf3-1b6684a0afb8'),
(101, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:29', '2024-05-20 13:32:29', NULL, NULL, NULL, 'fa659ebe-f1d8-485a-8187-6e6548ed3d24'),
(102, NULL, NULL, NULL, 13, 'craft\\elements\\Asset', 1, 0, '2024-05-20 13:32:30', '2024-05-20 13:32:30', NULL, NULL, NULL, '8b50185d-b557-4422-ab8c-91e785dbd0e6'),
(103, NULL, 19, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:34:33', '2024-05-20 13:34:33', NULL, NULL, NULL, 'e0ff751b-26af-47a2-88f2-38cf71cf38aa'),
(104, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:34:55', '2024-05-20 16:32:58', NULL, NULL, NULL, 'b631fc74-a37a-4276-8761-1f2651f5420b'),
(105, 104, NULL, 23, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:37:50', '2024-05-20 13:37:50', NULL, NULL, NULL, 'efe0f9a0-2513-4b2b-9812-5c2bee9fdd59'),
(107, 104, NULL, 24, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:39:11', '2024-05-20 13:39:11', NULL, NULL, NULL, '95e6d9d9-d999-4a6d-bbc4-ccd7083339a4'),
(108, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:39:28', '2024-05-20 16:52:27', NULL, NULL, NULL, '2a599f17-f445-491d-9477-3fb9c44047db'),
(109, 108, NULL, 25, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:40:39', '2024-05-20 13:40:39', NULL, NULL, NULL, 'b305fb27-2b93-4fd3-ab1a-e77a5777f0f7'),
(110, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:48:35', '2024-05-20 16:52:45', NULL, NULL, NULL, 'd5b58a7f-6e20-4ca1-9534-f2d944669117'),
(111, 110, NULL, 26, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:57:44', '2024-05-20 13:57:44', NULL, NULL, NULL, 'f95db4c1-79a2-4b6b-a044-8b604f9e07db'),
(112, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:57:48', '2024-05-20 16:52:57', NULL, NULL, NULL, 'e8113806-f80f-4c3c-90a9-ffa2717d5602'),
(113, 112, NULL, 27, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:58:15', '2024-05-20 13:58:15', NULL, NULL, NULL, '1cddde9d-4734-4c03-9fc2-19a86d6eeed0'),
(114, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:58:19', '2024-05-20 16:53:47', NULL, NULL, NULL, '06d7f911-bd62-4b86-a30a-8be37732e7a0'),
(115, 114, NULL, 28, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:58:51', '2024-05-20 13:58:51', NULL, NULL, NULL, '57813575-3c14-4823-bfcb-ffb8d4524a29'),
(116, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:58:55', '2024-05-20 16:54:27', NULL, NULL, NULL, 'd588cd20-4cf8-4264-9d42-58ba7fe7086d'),
(117, 116, NULL, 29, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:59:25', '2024-05-20 13:59:25', NULL, NULL, NULL, '0189f12f-bb27-4836-bb81-802d0cf21c35'),
(118, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:59:28', '2024-05-20 16:55:20', NULL, NULL, NULL, '3fb3a0c9-b255-4296-ad5c-bb1447a11f66'),
(119, 118, NULL, 30, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 13:59:57', '2024-05-20 13:59:57', NULL, NULL, NULL, '498a45b0-95eb-4a92-b126-96a33e994389'),
(120, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:00:04', '2024-05-20 16:56:00', NULL, NULL, NULL, 'f1093a5e-3828-4603-aa9e-5fc3d2ca8dad'),
(121, 120, NULL, 31, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:00:36', '2024-05-20 14:00:36', NULL, NULL, NULL, '916fcecc-fa48-416c-a5c3-abf363fe2d0c'),
(122, 120, NULL, 32, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:01:55', '2024-05-20 14:01:55', NULL, NULL, NULL, 'fa546d75-ca17-4efb-b281-61cfbeda50da'),
(123, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:01:58', '2024-05-20 16:56:23', NULL, NULL, NULL, '49ac5689-91e9-4ea9-b4fa-8273dc7fc7cc'),
(124, 123, NULL, 33, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:02:31', '2024-05-20 14:02:31', NULL, NULL, NULL, 'c49a3310-432a-4647-b9dd-7371d506f133'),
(125, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:02:41', '2024-05-20 16:59:24', NULL, NULL, NULL, '299b1091-3025-415f-9ca3-c2ecb8224413'),
(126, 125, NULL, 34, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:03:08', '2024-05-20 14:03:08', NULL, NULL, NULL, 'cff82677-5455-47e6-8ea9-6afe8711f659'),
(127, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:04:46', '2024-05-20 16:54:59', NULL, NULL, NULL, '12030e04-dfb0-4a17-9209-7b9b85d4d38c'),
(128, 127, NULL, 35, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:05:12', '2024-05-20 14:05:12', NULL, NULL, NULL, '30a4855e-8691-4b1f-a308-8e5feb9b02f2'),
(129, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:05:29', '2024-05-20 17:00:20', NULL, NULL, NULL, '4e7805eb-d6ff-426f-928f-029337ee17ea'),
(130, 129, NULL, 36, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:05:51', '2024-05-20 14:05:52', NULL, NULL, NULL, 'da242701-fee0-4fa7-a9a1-d032eaf371d1'),
(131, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:06:02', '2024-05-20 17:00:46', NULL, NULL, NULL, 'c42f8863-dc0d-4883-b338-a7168ce63aa9'),
(132, 131, NULL, 37, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:06:27', '2024-05-20 14:06:27', NULL, NULL, NULL, '2642a1d5-b2b4-4cc0-a27e-02c274022686'),
(133, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:06:31', '2024-05-20 17:01:05', NULL, NULL, NULL, '5b459762-5533-4f6a-99ff-442d5830e972'),
(134, 133, NULL, 38, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:06:51', '2024-05-20 14:06:51', NULL, NULL, NULL, '8cd384db-10e6-47ae-88fd-381741cd2cde'),
(135, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:07:07', '2024-05-20 17:01:42', NULL, NULL, NULL, '6c466364-93c6-4c5f-bfeb-3b335ff0eaf5'),
(136, 135, NULL, 39, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:07:33', '2024-05-20 14:07:33', NULL, NULL, NULL, '2aaf133a-7be8-4f27-83e1-c581751dcfae'),
(137, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:07:38', '2024-05-20 17:02:12', NULL, NULL, NULL, '5391375c-29e1-4624-bc11-db403aed2bba'),
(138, 137, NULL, 40, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:08:05', '2024-05-20 14:08:05', NULL, NULL, NULL, '86e2b83d-a69e-4319-9f62-fb11205cb9c2'),
(139, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:08:08', '2024-05-20 17:02:39', NULL, NULL, NULL, '87595eed-c027-47c5-ab9a-8b5bdb407960'),
(140, 139, NULL, 41, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:08:29', '2024-05-20 14:08:29', NULL, NULL, NULL, 'dfe2b4b4-539c-47c6-b602-61f45db3d061'),
(141, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:08:33', '2024-05-20 17:03:02', NULL, NULL, NULL, '3d387854-46d3-4505-b69f-de5a6129ba9f'),
(142, 141, NULL, 42, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:08:56', '2024-05-20 14:08:56', NULL, NULL, NULL, '38d96d46-669c-4b5a-9450-f90698390c59'),
(143, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:08:59', '2024-05-20 17:03:42', NULL, NULL, NULL, '4171f013-27f4-40e1-a68f-d185a82dfe44'),
(144, 143, NULL, 43, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:09:23', '2024-05-20 14:09:23', NULL, NULL, NULL, '3c0f001c-52cb-4c9b-87b3-8a1cb6664657'),
(145, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:09:49', '2024-05-20 17:03:23', NULL, NULL, NULL, '973e878f-c95e-4873-b31c-af6e5223db4c'),
(146, 145, NULL, 44, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:10:11', '2024-05-20 14:10:11', NULL, NULL, NULL, '8520aace-8181-4f4f-8c7e-ac6f220c5853'),
(148, 141, NULL, 45, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:10:59', '2024-05-20 14:10:59', NULL, NULL, NULL, '393578f8-4c9e-49f3-9287-e33a88959b15'),
(150, NULL, 43, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:20:20', '2024-05-20 14:21:22', NULL, '2024-05-20 14:21:22', NULL, '992e48bd-6a1e-4d58-b47e-3b454fe78d18'),
(151, 2, NULL, 46, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:24:26', '2024-05-20 14:24:26', NULL, NULL, NULL, 'a841060b-f7fa-495e-a291-f62f2022a9a7'),
(152, 2, NULL, 47, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:24:47', '2024-05-20 14:24:47', NULL, NULL, NULL, 'd66e20d2-cc4a-4b2c-ac09-170c987961a4'),
(153, 2, NULL, 48, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:25:10', '2024-05-20 14:25:10', NULL, NULL, NULL, '20c89695-2e84-4381-bfaf-1cae07b4caec'),
(154, 48, NULL, 49, 12, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:25:44', '2024-05-20 14:25:44', NULL, NULL, NULL, '8ed45a3c-1417-4b78-8d7b-45a4a99da242'),
(156, 2, NULL, 50, 2, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:26:05', '2024-05-20 14:26:05', NULL, NULL, NULL, 'c502689e-4df0-4b34-b68e-8b7d2d254854'),
(158, 48, NULL, 51, 12, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:26:13', '2024-05-20 14:26:13', NULL, NULL, NULL, '627efd03-85ca-4995-a7ac-36087c8acd53'),
(160, 6, NULL, 52, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:26:22', '2024-05-20 14:26:22', NULL, NULL, NULL, '890c5a76-2d7f-4d0f-8e75-28e1d711ca53'),
(161, 4, NULL, 53, 3, 'craft\\elements\\Entry', 0, 0, '2024-05-20 14:26:54', '2024-05-20 14:26:54', NULL, NULL, NULL, '6d72911a-9627-4869-9a34-f63b86b4b549'),
(162, 4, NULL, 54, 3, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:27:35', '2024-05-20 14:27:35', NULL, NULL, NULL, 'bdf7ce82-f697-444d-9bc2-ab3fb9ed8da2'),
(164, 44, NULL, 55, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-20 14:29:25', '2024-05-20 14:29:25', NULL, NULL, NULL, '3e37f133-67a6-49b0-8fa7-f78de1d3777b'),
(166, 104, NULL, 56, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:23:34', '2024-05-20 16:23:34', NULL, NULL, NULL, '90098ca4-68a6-4d57-872a-25b6b6206aac'),
(168, 104, NULL, 57, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:32:58', '2024-05-20 16:32:58', NULL, NULL, NULL, '8b9e0dd1-d019-4c85-980c-05cbb63d4e1b'),
(170, 108, NULL, 58, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:50:15', '2024-05-20 16:50:15', NULL, NULL, NULL, 'dba52591-9249-4629-9ed7-8610cc1d1907'),
(172, 110, NULL, 59, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:50:51', '2024-05-20 16:50:52', NULL, NULL, NULL, 'ed15e56a-6935-450e-861f-5134446bfb8b'),
(174, 112, NULL, 60, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:51:13', '2024-05-20 16:51:13', NULL, NULL, NULL, '8f8f0827-d423-4116-9f84-6cce92383e2d'),
(176, 114, NULL, 61, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:51:35', '2024-05-20 16:51:35', NULL, NULL, NULL, '7005c76c-a158-4822-8464-8ec1ea3e8db4'),
(178, 108, NULL, 62, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:52:27', '2024-05-20 16:52:27', NULL, NULL, NULL, '5006d356-8038-4de3-a6d1-b7bbc181ece2'),
(180, 110, NULL, 63, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:52:45', '2024-05-20 16:52:45', NULL, NULL, NULL, '0c0622ef-03df-4e94-bf8f-adfa7388fa3a'),
(182, 112, NULL, 64, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:52:57', '2024-05-20 16:52:57', NULL, NULL, NULL, 'acc7f79a-d0be-4953-8ae3-fe8ddd8b590b'),
(184, 114, NULL, 65, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:53:47', '2024-05-20 16:53:48', NULL, NULL, NULL, '3104da38-fb4c-44c5-9170-6484c2cf7e4f'),
(186, 116, NULL, 66, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:54:27', '2024-05-20 16:54:27', NULL, NULL, NULL, '1d4d48d1-74f9-4c56-b6b4-4f2de1663701'),
(188, 127, NULL, 67, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:54:59', '2024-05-20 16:54:59', NULL, NULL, NULL, '87d948fd-8427-49c0-8029-8f7043e5ca5f'),
(190, 118, NULL, 68, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:55:20', '2024-05-20 16:55:20', NULL, NULL, NULL, '2ffca969-806d-4f89-bfda-b9d268d812d8'),
(192, 120, NULL, 69, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:56:00', '2024-05-20 16:56:00', NULL, NULL, NULL, '3179338b-49b0-4cbb-b680-c8be97ca8fb8'),
(194, 123, NULL, 70, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:56:23', '2024-05-20 16:56:23', NULL, NULL, NULL, '5afe9b7e-b4c2-4385-be2f-215229ccb3d6'),
(196, 125, NULL, 71, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 16:59:24', '2024-05-20 16:59:24', NULL, NULL, NULL, 'b2aa6dbe-2e39-44b4-8bcc-c04bbf0623ba'),
(198, 129, NULL, 72, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:00:20', '2024-05-20 17:00:20', NULL, NULL, NULL, 'da579b58-79a5-4ca2-8e2a-49fdce8d10c5'),
(200, 131, NULL, 73, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:00:46', '2024-05-20 17:00:46', NULL, NULL, NULL, 'a3dae6eb-e99a-492e-ada1-111fbbf76398'),
(202, 133, NULL, 74, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:01:05', '2024-05-20 17:01:05', NULL, NULL, NULL, 'de4bf4f7-e326-4196-ab62-8827ba9a5736'),
(204, 135, NULL, 75, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:01:42', '2024-05-20 17:01:42', NULL, NULL, NULL, 'a82cb849-cf2e-4bfc-aa21-cd2203d92bb3'),
(206, 137, NULL, 76, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:02:12', '2024-05-20 17:02:12', NULL, NULL, NULL, '74e5fae0-57ca-48da-be63-89e1391cfc76'),
(208, 139, NULL, 77, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:02:39', '2024-05-20 17:02:39', NULL, NULL, NULL, '9f7c5808-34a1-4e7a-a885-898c062d5b5b'),
(210, 141, NULL, 78, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:03:02', '2024-05-20 17:03:02', NULL, NULL, NULL, 'b078995e-b757-4cb8-b985-e4ce574e6ace'),
(212, 145, NULL, 79, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:03:23', '2024-05-20 17:03:24', NULL, NULL, NULL, 'e2e2c772-54f4-4ba7-8b8e-7b1556a4540f'),
(214, 143, NULL, 80, 6, 'craft\\elements\\Entry', 1, 0, '2024-05-20 17:03:42', '2024-05-20 17:03:42', NULL, NULL, NULL, '905f671f-8b97-4a7e-9b9f-ff1ffbca8b8a');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
CREATE TABLE IF NOT EXISTS `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_kesostulejlzlnjjghggxbcfedqxwmqgmfxz` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
CREATE TABLE IF NOT EXISTS `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_xobqjwpbhrmfphrgnbhbhazjqmpjvivyprep` (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
CREATE TABLE IF NOT EXISTS `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tkmmotbdeithnqewbnmzoigeoiqexafkiouf` (`elementId`,`siteId`),
  KEY `idx_owcnlhxoonugqssefjajqiavotvumnxevsbs` (`siteId`),
  KEY `idx_yidvoccuknbapaabkuoidbyqugaoellpccde` (`title`,`siteId`),
  KEY `idx_pefcthwzrrpkgpnxnvkyqbietiinorewilnn` (`slug`,`siteId`),
  KEY `idx_pbqdvteffmuckukavwfcbxaaertoetxitbnz` (`enabled`),
  KEY `idx_focfopekekqhbgumfnyzqiggjjbmrgkncwtt` (`uri`,`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, 1, '2024-05-16 18:35:01', '2024-05-16 18:35:01', '3b8ed87a-4f4c-4a76-b2f9-8cc45c2108d1'),
(2, 2, 1, 'Homepagina', 'startpagina', '__home__', '{\"18e627da-2d6c-426f-b38d-84c8218771fa\": \"+32 123 45 67 89\", \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\": \"PHONE\", \"29362312-09d9-4840-be86-b36259f3ea9e\": \"Most Popular Products\", \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"453ca11a-58bd-460d-ad06-e396d7f92542\": \"EMAIL\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\": \"SOCIALS\", \"af0c8043-23a6-4e95-80c4-a227821ecb0e\": \"CONTACT\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\", \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\": \"info@kserenityskincare.be\"}', 1, '2024-05-17 21:58:11', '2024-05-20 14:26:05', '823b42f2-78ab-4e79-b1fc-e5b646254271'),
(3, 3, 1, NULL, 'startpagina', '__home__', NULL, 1, '2024-05-17 21:58:11', '2024-05-20 14:18:19', 'd89b7934-ba3c-4ff6-b176-41d6c7e2a396'),
(4, 4, 1, NULL, 'header', 'header', '{\"d3d7ea17-7bc3-4fa0-909a-b11d23e3acc1\": \"<ul>       <li><a href=\\\"index.twig\\\">Home</a></li>       <li><a href=\\\"producten.twig\\\">Products</a></li>       <li><a href=\\\"contact.twig\\\">Contact</a></li>     </ul>\"}', 1, '2024-05-17 22:16:50', '2024-05-18 19:22:31', '7f286f53-2ac7-454c-bbea-b105b5308755'),
(5, 5, 1, 'Header', 'header', 'header', NULL, 1, '2024-05-17 22:16:50', '2024-05-17 22:16:50', '1c6a28b2-b78a-490f-8345-f5a779b9e694'),
(6, 6, 1, 'footer', 'footer', 'footer', '{\"e45dd48b-de12-4c10-a80f-d4fbf0338032\": \"<p> @K-Serenity Skincare</p>\"}', 1, '2024-05-17 22:17:57', '2024-05-20 14:26:22', '7eb12dcc-b9f1-4e2b-b46e-a0ded0e12d48'),
(7, 7, 1, 'Footer', 'footer', 'footer', NULL, 1, '2024-05-17 22:17:57', '2024-05-17 22:17:57', '3b75cfee-ce06-4e86-8c8e-5d5f5ba3b688'),
(9, 9, 1, 'Header', 'header', 'header', NULL, 1, '2024-05-17 22:21:16', '2024-05-17 22:21:16', 'b1f2f796-50f0-4950-a4b4-c31f913551ff'),
(11, 11, 1, NULL, 'header', 'header', NULL, 1, '2024-05-17 22:41:12', '2024-05-17 22:41:12', '2ad35003-612b-4b97-a686-456b402f7d83'),
(12, 12, 1, NULL, 'footer', 'footer', NULL, 1, '2024-05-17 22:41:35', '2024-05-17 22:41:35', '76275777-d0ef-473d-911a-c4e2dd87f903'),
(14, 14, 1, NULL, 'header', 'header', '{\"d3d7ea17-7bc3-4fa0-909a-b11d23e3acc1\": \"<ul>       <li><a href=\\\"index.twig\\\">Home</a></li>       <li><a href=\\\"producten.twig\\\">Producten</a></li>       <li><a href=\\\"contact.twig\\\">Contact</a></li>     </ul>\"}', 1, '2024-05-17 22:48:26', '2024-05-17 22:48:26', '019addb9-7697-4f93-8732-02fd3dcb502b'),
(16, 16, 1, NULL, 'footer', 'footer', '{\"e45dd48b-de12-4c10-a80f-d4fbf0338032\": \"<p> @K-Serenity Skincare</p>\"}', 1, '2024-05-17 22:57:08', '2024-05-17 22:57:08', 'f46ff2d8-bef2-4a4f-9740-66c563d8a2e0'),
(17, 17, 1, NULL, 'startpagina', '__home__', NULL, 1, '2024-05-18 18:41:15', '2024-05-20 14:18:19', '17acedb4-20e1-4856-8613-e7324c5f08e5'),
(18, 18, 1, NULL, 'startpagina', '__home__', NULL, 1, '2024-05-18 18:41:15', '2024-05-20 14:18:19', 'a6def5f7-eb28-442e-8ee7-39f70b7e0df5'),
(19, 19, 1, NULL, 'startpagina', '__home__', NULL, 1, '2024-05-18 18:47:49', '2024-05-18 18:47:49', 'beb25304-d9f9-43a5-b1e0-1add6ceb017e'),
(21, 21, 1, NULL, 'startpagina', '__home__', '{\"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\"}', 1, '2024-05-18 18:59:11', '2024-05-20 14:24:29', '6195e904-68d5-4403-bc83-af85163c92b9'),
(22, 22, 1, 'Logo White', NULL, NULL, NULL, 1, '2024-05-18 19:08:06', '2024-05-18 19:08:06', '17459623-7cb7-4fcd-9a02-d3b60e68906c'),
(24, 24, 1, NULL, 'startpagina', '__home__', '{\"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\"}', 1, '2024-05-18 19:08:20', '2024-05-20 14:24:29', '888db1bb-2e09-4ebb-a8f4-ff7d43e86c2b'),
(26, 26, 1, NULL, 'header', 'header', '{\"d3d7ea17-7bc3-4fa0-909a-b11d23e3acc1\": \"<ul>       <li><a href=\\\"index.twig\\\">Home</a></li>       <li><a href=\\\"producten.twig\\\">Products</a></li>       <li><a href=\\\"contact.twig\\\">Contact</a></li>     </ul>\"}', 1, '2024-05-18 19:22:31', '2024-05-18 19:22:31', '4467c271-1c15-4519-9113-b7ff99d6648b'),
(28, 28, 1, NULL, 'startpagina', '__home__', '{\"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\"}', 1, '2024-05-18 19:58:08', '2024-05-20 14:24:29', '8b641bab-59b5-4807-b190-97ba72bb7196'),
(29, 29, 1, NULL, '__temp_bytnyujwdyedgtptmeekxbsytwdeyfbnnxlc', 'products/__temp_bytnyujwdyedgtptmeekxbsytwdeyfbnnxlc', NULL, 1, '2024-05-18 20:10:15', '2024-05-18 20:10:15', '22b79dd6-581e-452e-8ddd-955c9fc35326'),
(30, 30, 1, NULL, '__temp_jczcbbqgxldygztzfminmjyfyupeapbastml', 'products/__temp_jczcbbqgxldygztzfminmjyfyupeapbastml', NULL, 1, '2024-05-18 21:59:12', '2024-05-18 21:59:12', 'b53a6dbe-ab33-4795-a039-eff552c2a191'),
(32, 32, 1, NULL, 'startpagina', '__home__', '{\"18e627da-2d6c-426f-b38d-84c8218771fa\": \"+32 123 45 67 89\", \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\": \"PHONE\", \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"453ca11a-58bd-460d-ad06-e396d7f92542\": \"EMAIL\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\": \"SOCIALS\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\", \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\": \"info@kserenityskincqre.be\"}', 1, '2024-05-18 22:10:01', '2024-05-20 14:24:29', 'f1e4b655-bb29-4f68-ab77-e24ba0539b41'),
(34, 34, 1, NULL, 'startpagina', '__home__', '{\"18e627da-2d6c-426f-b38d-84c8218771fa\": \"+32 123 45 67 89\", \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\": \"PHONE\", \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"453ca11a-58bd-460d-ad06-e396d7f92542\": \"EMAIL\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\": \"SOCIALS\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\", \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\": \"info@kserenityskincare.be\"}', 1, '2024-05-18 22:13:52', '2024-05-20 14:24:29', '13163b56-3515-4603-b09c-070221c13df0'),
(35, 35, 1, 'Layer 2', NULL, NULL, NULL, 1, '2024-05-18 22:15:36', '2024-05-18 22:15:36', 'bdfd6dd2-a67a-430d-97bf-22bc7d0120f2'),
(36, 36, 1, 'Layer 2', NULL, NULL, NULL, 1, '2024-05-18 22:19:20', '2024-05-18 22:19:20', '245d2665-0711-4a67-b4b6-2a1bef5642a9'),
(37, 37, 1, 'Layer 2', NULL, NULL, NULL, 1, '2024-05-18 22:21:06', '2024-05-18 22:21:06', 'c33984b6-3401-4754-ada5-dac134c60cb7'),
(39, 39, 1, NULL, 'startpagina', '__home__', '{\"18e627da-2d6c-426f-b38d-84c8218771fa\": \"+32 123 45 67 89\", \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\": \"PHONE\", \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"453ca11a-58bd-460d-ad06-e396d7f92542\": \"EMAIL\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\": \"SOCIALS\", \"af0c8043-23a6-4e95-80c4-a227821ecb0e\": \"CONTACT\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\", \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\": \"info@kserenityskincare.be\"}', 1, '2024-05-18 22:25:12', '2024-05-20 14:24:29', 'c26a24fc-1814-4895-a485-e22cd2e11870'),
(40, 40, 1, 'Logo zwart', NULL, NULL, NULL, 1, '2024-05-20 11:21:43', '2024-05-20 11:21:43', 'b41d896e-ec6d-4683-90d9-30f500c0422f'),
(41, 41, 1, NULL, NULL, NULL, NULL, 1, '2024-05-20 11:23:58', '2024-05-20 11:23:58', '751f86e8-f7a0-4818-b3e8-2b107d26de9b'),
(42, 42, 1, 'Logo zwart', NULL, NULL, NULL, 1, '2024-05-20 11:49:20', '2024-05-20 11:49:20', '2938ff21-f5e6-4597-9254-e82cd3a36ab0'),
(43, 43, 1, NULL, '__temp_bersodcphrfvhupthdesjdzhgnqunjzoszyt', 'products/__temp_bersodcphrfvhupthdesjdzhgnqunjzoszyt', NULL, 1, '2024-05-20 12:03:57', '2024-05-20 12:03:57', 'f4034a27-4211-4b67-a744-a40514175d60'),
(44, 44, 1, 'Producten', 'products-page', 'products/products-page', '{\"061d08d3-ea7c-4226-904a-32ef8244d99e\": \"Our Products\", \"51692670-1e8d-41c1-8cdd-83ed7aaf3d7a\": \"Discover our premium Korean Skincare products. From nourishing cleanser to revitalizing serums, eac product is meticulously crafted to deliver effective results\"}', 1, '2024-05-20 12:05:02', '2024-05-20 14:29:25', 'edac0033-33a2-45a4-b728-dd15f8df817c'),
(45, 45, 1, NULL, '__temp_bbftyjflguxqttxnoimtjtzptkfdpjoktxwu', 'products/__temp_bbftyjflguxqttxnoimtjtzptkfdpjoktxwu', '{\"061d08d3-ea7c-4226-904a-32ef8244d99e\": \"Our Products\", \"51692670-1e8d-41c1-8cdd-83ed7aaf3d7a\": \"Discover our premium Korean Skincare products. From nourishing cleanser to revitalizing serums, eac product is meticulously crafted to deliver effective results\"}', 1, '2024-05-20 12:07:55', '2024-05-20 12:07:55', '21d291f9-1b37-4523-9537-8b46052eca50'),
(47, 47, 1, NULL, 'products-page', 'products/products-page', '{\"061d08d3-ea7c-4226-904a-32ef8244d99e\": \"Our Products\", \"51692670-1e8d-41c1-8cdd-83ed7aaf3d7a\": \"Discover our premium Korean Skincare products. From nourishing cleanser to revitalizing serums, eac product is meticulously crafted to deliver effective results\"}', 1, '2024-05-20 12:08:19', '2024-05-20 12:08:19', 'afeeaa48-c93f-4f5b-bd95-c2c532a2a458'),
(48, 48, 1, 'Contact', 'contact', 'contact', '{\"6ad40c30-c892-4bfd-8c85-342fea11c32f\": \"Contact Us\", \"8e49b995-dbfd-4e53-9f92-ded9be4edbd4\": \"Have a question, comment or suggestion? We\'d love to hear from you! Please fill out the form below and we\'ll get back to you as soon as possible.\"}', 1, '2024-05-20 13:10:15', '2024-05-20 14:26:13', 'c455a29b-4729-4c21-9db5-595831ffef9d'),
(49, 49, 1, NULL, 'contact', 'contact', NULL, 1, '2024-05-20 13:10:15', '2024-05-20 13:10:15', '4547bd56-d8a4-4f76-a073-6436f1656381'),
(51, 51, 1, NULL, 'contact', 'contact', '{\"6ad40c30-c892-4bfd-8c85-342fea11c32f\": \"Contact Us\", \"8e49b995-dbfd-4e53-9f92-ded9be4edbd4\": \"Have a question, comment or suggestion? We\'d love to hear from you! Please fill out the form below and we\'ll get back to you as soon as possible.\"}', 1, '2024-05-20 13:11:30', '2024-05-20 13:11:30', '2b46b0bc-0a13-42c0-b27b-0bb8eba1f5db'),
(52, 52, 1, 'contact us', NULL, NULL, NULL, 1, '2024-05-20 13:19:46', '2024-05-20 13:19:46', 'a30d3d4b-aa8c-4190-aa6f-cd982e4889e2'),
(53, 53, 1, 'contactus', NULL, NULL, NULL, 1, '2024-05-20 13:20:45', '2024-05-20 13:20:45', 'ef361371-18be-43c2-bb23-414be7af57fb'),
(54, 54, 1, NULL, '__temp_gansdnxspzdnvwahcfrfsouajjkotlhduyxk', 'products/__temp_gansdnxspzdnvwahcfrfsouajjkotlhduyxk', NULL, 1, '2024-05-20 13:28:45', '2024-05-20 13:28:45', 'dbac0c98-33a3-4309-9319-525ea018ef90'),
(55, 55, 1, 'Acne Pimple COSRX', NULL, NULL, NULL, 1, '2024-05-20 13:31:58', '2024-05-20 13:31:58', '01013078-d013-4a3d-a30c-0da867e0b94a'),
(56, 56, 1, 'Acne Pimple COSRX2', NULL, NULL, NULL, 1, '2024-05-20 13:31:59', '2024-05-20 13:31:59', '69489f25-427d-4661-b17f-b1368eedd518'),
(57, 57, 1, 'Advancedsnailcosrc2', NULL, NULL, NULL, 1, '2024-05-20 13:31:59', '2024-05-20 13:31:59', 'b1df382b-a4ce-470b-bd90-1854d21f09b8'),
(58, 58, 1, 'Advancedsnail COSRX', NULL, NULL, NULL, 1, '2024-05-20 13:31:59', '2024-05-20 13:31:59', 'fe8d1535-a5a7-462a-9a20-59894b557814'),
(59, 59, 1, 'Aiony haust f2ar0lt Tva I unsplash copy', NULL, NULL, NULL, 1, '2024-05-20 13:32:00', '2024-05-20 13:32:00', '55957843-2473-49fd-a19e-6a603904e0cd'),
(60, 60, 1, 'Aiony haust f2ar0lt Tva I unsplash', NULL, NULL, NULL, 1, '2024-05-20 13:32:02', '2024-05-20 13:32:02', '5edbe014-5352-492d-a3ec-2d9ee59c62bd'),
(61, 61, 1, 'Anuaheartleaf', NULL, NULL, NULL, 1, '2024-05-20 13:32:04', '2024-05-20 13:32:04', '70af587c-e07d-481d-93e3-f413c56a6601'),
(62, 62, 1, 'Anuaheartleaf2', NULL, NULL, NULL, 1, '2024-05-20 13:32:05', '2024-05-20 13:32:05', '412511c4-e38e-47cb-ac2a-35283394e890'),
(63, 63, 1, 'Anuaheartleafmask2', NULL, NULL, NULL, 1, '2024-05-20 13:32:06', '2024-05-20 13:32:06', '92217884-4196-45ce-b2ed-a31d78e60411'),
(64, 64, 1, 'Anuaheartleafmaskmain', NULL, NULL, NULL, 1, '2024-05-20 13:32:06', '2024-05-20 13:32:06', '6a0d3b26-87db-4a95-9b5f-dac1407eb3f4'),
(65, 65, 1, 'Anuaheartleafpad', NULL, NULL, NULL, 1, '2024-05-20 13:32:07', '2024-05-20 13:32:07', 'd32605d4-4e96-4bb9-b12f-aea9c512140d'),
(66, 66, 1, 'Anuaheartleafpad2', NULL, NULL, NULL, 1, '2024-05-20 13:32:08', '2024-05-20 13:32:08', '799663ec-0220-4617-b14d-0f485b638893'),
(67, 67, 1, 'Axisydarkspot', NULL, NULL, NULL, 1, '2024-05-20 13:32:08', '2024-05-20 13:32:08', '0e4fbcdd-ebd8-444a-a482-af59426dba97'),
(68, 68, 1, 'Axisydarkspot2', NULL, NULL, NULL, 1, '2024-05-20 13:32:09', '2024-05-20 13:32:09', '94c847e3-30dc-470b-b3e1-77ef9bc25ff2'),
(69, 69, 1, 'Axisymugwort', NULL, NULL, NULL, 1, '2024-05-20 13:32:10', '2024-05-20 13:32:10', '9aab8077-d213-40f5-9913-e22402e53412'),
(70, 70, 1, 'Axisymugwort2', NULL, NULL, NULL, 1, '2024-05-20 13:32:10', '2024-05-20 13:32:10', 'c6d472db-b619-42c6-93d4-2d8a181be3ce'),
(71, 71, 1, 'Axisyquinoa', NULL, NULL, NULL, 1, '2024-05-20 13:32:11', '2024-05-20 13:32:11', '61b567b7-8850-4388-b4d4-30f5266c45de'),
(72, 72, 1, 'Axisyquinoa2', NULL, NULL, NULL, 1, '2024-05-20 13:32:12', '2024-05-20 13:32:12', 'e461d7a1-1f2f-41ce-89c8-132c2dba2abd'),
(73, 73, 1, 'Beautyjosradiance', NULL, NULL, NULL, 1, '2024-05-20 13:32:12', '2024-05-20 13:32:12', '4afc6198-43d5-4d11-ab9e-5d27408931b6'),
(74, 74, 1, 'Beautyjosradiance2', NULL, NULL, NULL, 1, '2024-05-20 13:32:13', '2024-05-20 13:32:13', '5055707d-cca0-4149-b36c-70c0921b4efc'),
(75, 75, 1, 'Beautyjosrepairserum', NULL, NULL, NULL, 1, '2024-05-20 13:32:14', '2024-05-20 13:32:14', 'b0fd62b4-36f9-4ed4-ace3-645b39b45cb0'),
(76, 76, 1, 'Beaytyjosrepairserum2', NULL, NULL, NULL, 1, '2024-05-20 13:32:14', '2024-05-20 13:32:14', '91dff022-f229-45e0-9988-6cfcae09696d'),
(77, 77, 1, 'Centella Mask800', NULL, NULL, NULL, 1, '2024-05-20 13:32:15', '2024-05-20 13:32:15', '50ed1d93-8a21-47a4-8568-f35ca62f5a67'),
(78, 78, 1, 'Cosrxlowph', NULL, NULL, NULL, 1, '2024-05-20 13:32:15', '2024-05-20 13:32:15', '289a1f55-4682-464a-a447-66ea43f7a5e6'),
(79, 79, 1, 'Cosrxlowph2', NULL, NULL, NULL, 1, '2024-05-20 13:32:16', '2024-05-20 13:32:16', 'e087f881-0848-451d-921b-df9610f4b3fa'),
(80, 80, 1, 'Dynasty Cream2', NULL, NULL, NULL, 1, '2024-05-20 13:32:17', '2024-05-20 13:32:17', '214bbbf2-7204-45a2-8608-be3f964847cb'),
(81, 81, 1, 'Dynasty Cream BIJ2', NULL, NULL, NULL, 1, '2024-05-20 13:32:17', '2024-05-20 13:32:17', '462d5e1b-e91f-47cf-8989-ab263c90af90'),
(82, 82, 1, 'Dynasty Cream BOJ', NULL, NULL, NULL, 1, '2024-05-20 13:32:18', '2024-05-20 13:32:18', '9586c213-82b2-4da4-a698-7c5ffac03c57'),
(83, 83, 1, 'Hydriumcentellacosrx', NULL, NULL, NULL, 1, '2024-05-20 13:32:18', '2024-05-20 13:32:18', '8ce1af65-0e43-4d5a-bd4f-6ef7f428fbb3'),
(84, 84, 1, 'Hydriumcentellacosrx2', NULL, NULL, NULL, 1, '2024-05-20 13:32:19', '2024-05-20 13:32:19', '5e02ef35-2e22-421e-80f1-33b8e096a3a8'),
(85, 85, 1, 'Iunikcentella2', NULL, NULL, NULL, 1, '2024-05-20 13:32:19', '2024-05-20 13:32:19', '6015e571-9546-4748-b790-ea01b9fda32a'),
(86, 86, 1, 'Iunikcetnella', NULL, NULL, NULL, 1, '2024-05-20 13:32:20', '2024-05-20 13:32:20', '49651ecd-16d5-429b-80c8-b2762a95816f'),
(87, 87, 1, 'Iunikcntellamask2', NULL, NULL, NULL, 1, '2024-05-20 13:32:21', '2024-05-20 13:32:21', '49525c93-201d-4238-808d-55023342e0ec'),
(88, 88, 1, 'Iunikprop', NULL, NULL, NULL, 1, '2024-05-20 13:32:21', '2024-05-20 13:32:21', '2644d020-ffef-4bcb-9be1-b9b4ace0a970'),
(89, 89, 1, 'Iunikprop2', NULL, NULL, NULL, 1, '2024-05-20 13:32:22', '2024-05-20 13:32:22', '08d62910-ce60-4073-a4cd-40c4d72b3f27'),
(90, 90, 1, 'Layer 2', NULL, NULL, NULL, 1, '2024-05-20 13:32:22', '2024-05-20 13:32:22', '33ea1a86-fd52-4cc4-97ee-ddede6f5e487'),
(91, 91, 1, 'Logo White', NULL, NULL, NULL, 1, '2024-05-20 13:32:24', '2024-05-20 13:32:24', '81a5b92a-3401-42ce-9e2d-f3cb3bb60951'),
(92, 92, 1, 'Logo zwart', NULL, NULL, NULL, 1, '2024-05-20 13:32:24', '2024-05-20 13:32:24', 'eded8d1c-4f03-41c4-9c03-1fd196ad8a2d'),
(93, 93, 1, 'Misshathefirst', NULL, NULL, NULL, 1, '2024-05-20 13:32:25', '2024-05-20 13:32:25', '2fcbb248-1aaf-4dad-858a-4f119f5fd23c'),
(94, 94, 1, 'Misshathefirst2', NULL, NULL, NULL, 1, '2024-05-20 13:32:25', '2024-05-20 13:32:25', 'b60978bb-493c-4778-b464-4f04fbb04968'),
(95, 95, 1, 'Misshatimerev', NULL, NULL, NULL, 1, '2024-05-20 13:32:26', '2024-05-20 13:32:26', 'f85255be-22f7-4ad7-b810-cda8efcd5a83'),
(96, 96, 1, 'Misshatimerev2', NULL, NULL, NULL, 1, '2024-05-20 13:32:26', '2024-05-20 13:32:26', '07cd4706-3538-44c8-a6a6-db4f84d72b7e'),
(97, 97, 1, 'Misshatimerevart', NULL, NULL, NULL, 1, '2024-05-20 13:32:27', '2024-05-20 13:32:27', 'b46c9ec8-8b25-4200-afb0-f29569c40dc6'),
(98, 98, 1, 'Misshatimerevart2', NULL, NULL, NULL, 1, '2024-05-20 13:32:28', '2024-05-20 13:32:28', 'fc75cac6-1f7f-41e0-9bb4-a53de06b850d'),
(99, 99, 1, 'Rose', NULL, NULL, NULL, 1, '2024-05-20 13:32:28', '2024-05-20 13:32:28', 'c2f0740f-2bf5-480a-a3af-1c591c8fa882'),
(100, 100, 1, 'Rose2', NULL, NULL, NULL, 1, '2024-05-20 13:32:29', '2024-05-20 13:32:29', '51ed33cc-03ad-4c91-a459-164061398655'),
(101, 101, 1, 'Screenshot 78 2000x', NULL, NULL, NULL, 1, '2024-05-20 13:32:29', '2024-05-20 13:32:29', '37805084-c9ad-4c3b-be83-897eaab56071'),
(102, 102, 1, 'Screenshot 89 400x 1', NULL, NULL, NULL, 1, '2024-05-20 13:32:30', '2024-05-20 13:32:30', '54bdefbf-aeef-4518-9abd-52377398bf98'),
(103, 103, 1, NULL, '__temp_bwyelgumijmsjkwmyvblipxevxphefnudxep', 'products/__temp_bwyelgumijmsjkwmyvblipxevxphefnudxep', NULL, 1, '2024-05-20 13:34:33', '2024-05-20 13:34:33', '0a7604bd-f62d-4cd5-b8ee-c547a64a1a64'),
(104, 104, 1, 'Dynasty Cream', 'dynasty-cream', 'products/dynasty-cream', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"The Beauty Of Joseon Dynasty Cream is a brightening and anti-aging cream made from traditional Korean herbs including orchid extract to hydrate, tighten, and smooth the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Dynasty Cream\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 90, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 13:34:55', '2024-05-20 16:32:58', '8549fecd-83b2-4a40-a61c-e24d21025396'),
(105, 105, 1, NULL, '__temp_rztptelfbhoarjfoylszepebokklshsfcuer', 'products/__temp_rztptelfbhoarjfoylszepebokklshsfcuer', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"The Beauty Of Joseon Dynasty Cream is a brightening and anti-aging cream made from traditional Korean herbs including orchid extract to hydrate, tighten, and smooth the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Dynasty Cream\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 13:37:50', '2024-05-20 13:37:50', '44729887-0d0a-43fa-9803-8be44b0a5719'),
(107, 107, 1, 'Dynasty Cream', 'dynasty-cream', 'products/dynasty-cream', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"The Beauty Of Joseon Dynasty Cream is a brightening and anti-aging cream made from traditional Korean herbs including orchid extract to hydrate, tighten, and smooth the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Dynasty Cream\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 13:39:11', '2024-05-20 13:39:11', '946c5157-ecf7-4b9f-af5d-2632f00ccb93'),
(108, 108, 1, 'Advanced Snail 96 Mucin Power Essence', 'advanced-snail-96-mucin-power-essence', 'products/advanced-snail-96-mucin-power-essence', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence enriched with snail mucin to calm and hydrate the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Advanced Snail 96 Mucin Power Essence\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 0, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1850\"}', 1, '2024-05-20 13:39:28', '2024-05-20 16:52:27', '8000f9ab-c316-4d19-93cb-8bf709346ec6'),
(109, 109, 1, 'Advanced Snail 96 Mucin Power Essence', 'advanced-snail-96-mucin-power-essence', 'products/advanced-snail-96-mucin-power-essence', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence enriched with snail mucin to calm and hydrate the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Advanced Snail 96 Mucin Power Essence\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1850\"}', 1, '2024-05-20 13:40:39', '2024-05-20 13:40:39', 'b051d689-82c2-49ea-b49d-3b886fa903ea'),
(110, 110, 1, 'Time Revolution The First Treatment Essence RX', 'time-revolution-the-first-treatment-essence-rx', 'products/time-revolution-the-first-treatment-essence-rx', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence that helps improve skin texture and brighten the complexion.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution The First Treatment Essence RX\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 35, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3875\"}', 1, '2024-05-20 13:48:35', '2024-05-20 16:52:45', '19ed59b8-0cab-462d-a90b-f80d2970ec8f'),
(111, 111, 1, 'Time Revolution The First Treatment Essence RX', 'time-revolution-the-first-treatment-essence-rx', 'products/time-revolution-the-first-treatment-essence-rx', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence that helps improve skin texture and brighten the complexion.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution The First Treatment Essence RX\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3875\"}', 1, '2024-05-20 13:57:44', '2024-05-20 13:57:44', '12eee02c-6d6f-4cd4-84e6-b03801199272'),
(112, 112, 1, 'Centella Calming Gel Cream', 'centella-calming-gel-cream', 'products/centella-calming-gel-cream', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A soothing gel cream enriched with centella extracts for sensitive skin types.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Centella Calming Gel Cream\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 60, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2100\"}', 1, '2024-05-20 13:57:48', '2024-05-20 16:52:57', '20efaeeb-3036-480f-a0c2-2643fca514fc'),
(113, 113, 1, 'Centella Calming Gel Cream', 'centella-calming-gel-cream', 'products/centella-calming-gel-cream', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A soothing gel cream enriched with centella extracts for sensitive skin types.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Centella Calming Gel Cream\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2100\"}', 1, '2024-05-20 13:58:15', '2024-05-20 13:58:15', '7a054a04-95cd-410a-9240-075a11944ed8'),
(114, 114, 1, 'Heartleaf 77% Soothing Toner', 'heartleaf-77-soothing-toner', 'products/heartleaf-77-soothing-toner', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A soothing toner with 77% heartleaf extract to calm and hydrate the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf 77% Soothing Toner\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 80, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1499\"}', 1, '2024-05-20 13:58:19', '2024-05-20 16:53:47', '90888f01-5f38-45d2-bb9e-39b1da26454d'),
(115, 115, 1, 'Heartleaf 77% Soothing Toner', 'heartleaf-77-soothing-toner', 'products/heartleaf-77-soothing-toner', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A soothing toner with 77% heartleaf extract to calm and hydrate the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf 77% Soothing Toner\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1499\"}', 1, '2024-05-20 13:58:51', '2024-05-20 13:58:51', 'b49f4aaf-bebc-4b7c-a3b0-a7db641803a2'),
(116, 116, 1, 'Mugwort Pore Clarifying Wash Off Pack', 'mugwort-pore-clarifying-wash-off-pack', 'products/mugwort-pore-clarifying-wash-off-pack', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A face mask based on mugwort to cleanse and refine pores.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Mugwort Pore Clarifying Wash Off Pack\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 45, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2150\"}', 1, '2024-05-20 13:58:55', '2024-05-20 16:54:27', '10bc2ace-0bf3-4087-8374-c46634908b77'),
(117, 117, 1, 'Mugwort Pore Clarifying Wash Off Pack', 'mugwort-pore-clarifying-wash-off-pack', 'products/mugwort-pore-clarifying-wash-off-pack', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A face mask based on mugwort to cleanse and refine pores.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Mugwort Pore Clarifying Wash Off Pack\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2150\"}', 1, '2024-05-20 13:59:25', '2024-05-20 13:59:25', '3e0604ab-e0c1-4cd7-9a6a-9a79feec90fb'),
(118, 118, 1, 'Acne Pimple Master Patch', 'acne-pimple-master-patch', 'products/acne-pimple-master-patch', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"Transparent patches that treat acne and pimples and protect against infections.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Acne Pimple Master Patch\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 85, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"599\"}', 1, '2024-05-20 13:59:28', '2024-05-20 16:55:20', 'ed7f7d6a-3251-4e85-b4b5-c65eba023308'),
(119, 119, 1, 'Acne Pimple Master Patch', 'acne-pimple-master-patch', 'products/acne-pimple-master-patch', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"Transparent patches that treat acne and pimples and protect against infections.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Acne Pimple Master Patch\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"599\"}', 1, '2024-05-20 13:59:57', '2024-05-20 13:59:57', 'c879f417-f5bd-4a45-aaad-a7dfcfd4bba3'),
(120, 120, 1, 'Time Revolution Night Repair Probio Ampoule', 'time-revolution-night-repair-probio-ampoule', 'products/time-revolution-night-repair-probio-ampoule', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A night ampoule that helps improve skin texture and elasticity.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution Night Repair Probio Ampoule\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 40, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"4200\"}', 1, '2024-05-20 14:00:04', '2024-05-20 16:56:00', '298fe1fc-6028-474d-8e33-eb9536b0ebd0'),
(121, 121, 1, 'Time Revolution Night Repair Probio Ampoule', 'time-revolution-night-repair-probio-ampoule', 'products/time-revolution-night-repair-probio-ampoule', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A night ampoule that helps improve skin texture and elasticity.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution Night Repair Probio Ampoule\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"4200\"}', 1, '2024-05-20 14:00:36', '2024-05-20 14:00:36', 'fcc8d7f8-65e6-4eb7-bf38-2833d4984851'),
(122, 122, 1, 'Time Revolution Night Repair Probio Ampoule', 'time-revolution-night-repair-probio-ampoule', 'products/time-revolution-night-repair-probio-ampoule', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A night ampoule that helps improve skin texture and elasticity.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution Night Repair Probio Ampoule\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"4200\"}', 1, '2024-05-20 14:01:55', '2024-05-20 14:01:55', 'ad284940-fe9a-44c2-b5d2-11032b75a39d'),
(123, 123, 1, 'Rose Galactomyces Essential Toner', 'rose-galactomyces-essential-toner', 'products/rose-galactomyces-essential-toner', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A toner enriched with rose extracts to hydrate and revitalize the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Rose Galactomyces Essential Toner\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 75, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1775\"}', 1, '2024-05-20 14:01:58', '2024-05-20 16:56:23', '92de8428-0a8b-4212-afc1-6924caef9753'),
(124, 124, 1, 'Rose Galactomyces Essential Toner', 'rose-galactomyces-essential-toner', 'products/rose-galactomyces-essential-toner', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A toner enriched with rose extracts to hydrate and revitalize the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Rose Galactomyces Essential Toner\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1775\"}', 1, '2024-05-20 14:02:31', '2024-05-20 14:02:31', '472306c7-f669-4e58-b932-bd2f2f2bca63'),
(125, 125, 1, 'Heartleaf 77% Clear Pad', 'heartleaf-77-clear-pad', 'products/heartleaf-77-clear-pad', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"The Anua Heartleaf 77% Clear Pad is a toner pad that combines the power of vegan and cruelty-free ingredients with the soothing benefits of Anua\'s Heartleaf 77% Soothing Toner.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf 77% Clear Pad\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 65, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"950\"}', 1, '2024-05-20 14:02:41', '2024-05-20 16:59:24', 'ca7689d5-364c-4b7c-9237-872dbee35e46'),
(126, 126, 1, 'Heartleaf 77% Clear Pad', 'heartleaf-77-clear-pad', 'products/heartleaf-77-clear-pad', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"The Anua Heartleaf 77% Clear Pad is a toner pad that combines the power of vegan and cruelty-free ingredients with the soothing benefits of Anua\'s Heartleaf 77% Soothing Toner.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf 77% Clear Pad\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"950\"}', 1, '2024-05-20 14:03:08', '2024-05-20 14:03:08', '2e397388-1660-414d-98df-f822d16d5600'),
(127, 127, 1, 'Radiance Cleansing Balm', 'radiance-cleansing-balm', 'products/radiance-cleansing-balm', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A cleansing balm that helps remove makeup and impurities.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Radiance Cleansing Balm\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 55, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2150\"}', 1, '2024-05-20 14:04:46', '2024-05-20 16:54:59', '2295ba1f-ef52-490b-b2ad-00e0a38e481d'),
(128, 128, 1, 'Radiance Cleansing Balm', 'radiance-cleansing-balm', 'products/radiance-cleansing-balm', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A cleansing balm that helps remove makeup and impurities.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Radiance Cleansing Balm\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2150\"}', 1, '2024-05-20 14:05:12', '2024-05-20 14:05:12', 'b42614dd-59bb-4249-b487-10613993243d'),
(129, 129, 1, 'Dark Spot Correcting Glow Serum', 'dark-spot-correcting-glow-serum', 'products/dark-spot-correcting-glow-serum', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A serum that helps reduce dark spots and restore the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Dark Spot Correcting Glow Serum\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 30, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3199\"}', 1, '2024-05-20 14:05:29', '2024-05-20 17:00:20', 'e4e3ecb4-0116-422f-8849-80c5ff50bdc5'),
(130, 130, 1, 'Dark Spot Correcting Glow Serum', 'dark-spot-correcting-glow-serum', 'products/dark-spot-correcting-glow-serum', '{\"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Dark Spot Correcting Glow Serum\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3199\"}', 1, '2024-05-20 14:05:52', '2024-05-20 14:05:52', 'd77e1f86-25d3-4460-b11d-20c67cf2a1d2'),
(131, 131, 1, 'Repair Serum: Ginseng+Snail Mucin', 'repair-serum-ginseng-snail-mucin', 'products/repair-serum-ginseng-snail-mucin', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A repairing serum to combat aging and pigmentation.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Repair Serum: Ginseng+Snail Mucin\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 5, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2900\"}', 1, '2024-05-20 14:06:02', '2024-05-20 17:00:46', '7c6ea0a5-0c84-4406-b115-5c12b157802d'),
(132, 132, 1, 'Repair Serum: Ginseng+Snail Mucin', 'repair-serum-ginseng-snail-mucin', 'products/repair-serum-ginseng-snail-mucin', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A repairing serum to combat aging and pigmentation.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Repair Serum: Ginseng+Snail Mucin\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2900\"}', 1, '2024-05-20 14:06:27', '2024-05-20 14:06:27', '10b48175-2f4b-485f-b112-c7505a7c4371'),
(133, 133, 1, 'Low pH Good Morning Gel Cleanser', 'low-ph-good-morning-gel-cleanser', 'products/low-ph-good-morning-gel-cleanser', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A gentle cleansing gel with a low pH value to cleanse the skin without drying it out.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Low pH Good Morning Gel Cleanser\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 85, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1100\"}', 1, '2024-05-20 14:06:31', '2024-05-20 17:01:05', '9fc01900-fddf-49a7-9e13-a237b2d8f2b7'),
(134, 134, 1, 'Low pH Good Morning Gel Cleanser', 'low-ph-good-morning-gel-cleanser', 'products/low-ph-good-morning-gel-cleanser', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A gentle cleansing gel with a low pH value to cleanse the skin without drying it out.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Low pH Good Morning Gel Cleanser\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1100\"}', 1, '2024-05-20 14:06:51', '2024-05-20 14:06:51', '6f0cbe36-19a3-4bed-8b6b-20c65efbd5af'),
(135, 135, 1, 'Time Revolution Artemisia Treatment Essence', 'time-revolution-artemisia-treatment-essence', 'products/time-revolution-artemisia-treatment-essence', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence enriched with mugwort extracts to calm and nourish the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution Artemisia Treatment Essence\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 25, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3350\"}', 1, '2024-05-20 14:07:07', '2024-05-20 17:01:42', 'a9ad9d3b-a14c-40fc-9386-6f805a368ee6'),
(136, 136, 1, 'Time Revolution Artemisia Treatment Essence', 'time-revolution-artemisia-treatment-essence', 'products/time-revolution-artemisia-treatment-essence', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence enriched with mugwort extracts to calm and nourish the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution Artemisia Treatment Essence\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3350\"}', 1, '2024-05-20 14:07:33', '2024-05-20 14:07:33', '31c6c194-2d68-4729-81f9-80b724cd6a6e'),
(137, 137, 1, 'Propolis Vitamin Synergy Serum', 'propolis-vitamin-synergy-serum', 'products/propolis-vitamin-synergy-serum', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A serum enriched with propolis and vitamin C for radiant and hydrated skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Propolis Vitamin Synergy Serum\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 55, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2225\"}', 1, '2024-05-20 14:07:38', '2024-05-20 17:02:12', 'c53c391b-557b-420b-96ca-2564a50bf84d'),
(138, 138, 1, 'Propolis Vitamin Synergy Serum', 'propolis-vitamin-synergy-serum', 'products/propolis-vitamin-synergy-serum', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A serum enriched with propolis and vitamin C for radiant and hydrated skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Propolis Vitamin Synergy Serum\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2225\"}', 1, '2024-05-20 14:08:05', '2024-05-20 14:08:05', '95447b62-1c4c-4086-9477-ce05de5246d7'),
(139, 139, 1, 'Heartleaf Cream Mask Night Solution', 'heartleaf-cream-mask-night-solution', 'products/heartleaf-cream-mask-night-solution', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"This hydrating sheet mask is a true skin savior, thanks to the powerful Heartleaf Extract that not only soothes sensitivity but also effortlessly tackles impurities...\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf Cream Mask Night Solution\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 70, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1699\"}', 1, '2024-05-20 14:08:08', '2024-05-20 17:02:39', '6ca45a56-8032-4991-9d62-988ca7b9d00e'),
(140, 140, 1, 'Heartleaf Cream Mask Night Solution', 'heartleaf-cream-mask-night-solution', 'products/heartleaf-cream-mask-night-solution', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"This hydrating sheet mask is a true skin savior, thanks to the powerful Heartleaf Extract that not only soothes sensitivity but also effortlessly tackles impurities...\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf Cream Mask Night Solution\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1699\"}', 1, '2024-05-20 14:08:29', '2024-05-20 14:08:29', 'a6a6037c-c41c-4ac5-a108-c3188465d776'),
(141, 141, 1, 'Quinoa One Step Balanced Gel Cleanser', 'quinoa-one-step-balanced-gel-cleanser', 'products/quinoa-one-step-balanced-gel-cleanser', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A balanced cleansing gel with quinoa extracts for a cleansed skin without drying it out.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Quinoa One Step Balanced Gel Cleanser\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 40, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2450\"}', 1, '2024-05-20 14:08:33', '2024-05-20 17:03:02', 'e87aacfe-607f-413e-8f5a-9e1444edfa79'),
(142, 142, 1, 'Quinoa One Step Balanced Gel Cleanser', 'quinoa-one-step-balanced-gel-cleanser', 'products/quinoa-one-step-balanced-gel-cleanser', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A repairing sleeping mask that revitalizes and nourishes the skin overnight.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Quinoa One Step Balanced Gel Cleanser\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 14:08:56', '2024-05-20 14:08:56', 'c5f8fa28-1930-41df-8208-9fa28455eaef'),
(143, 143, 1, 'Hydrium Triple Hyaluronic Moisture Ampoule', 'hydrium-triple-hyaluronic-moisture-ampoule', 'products/hydrium-triple-hyaluronic-moisture-ampoule', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An ampoule with triple hyaluronic acid to deeply hydrate and revitalize the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Hydrium Triple Hyaluronic Moisture Ampoule\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 0, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2499\"}', 1, '2024-05-20 14:08:59', '2024-05-20 17:03:42', 'c820ec1c-b2d9-48c0-9980-9ea38485d893'),
(144, 144, 1, 'Hydrium Triple Hyaluronic Moisture Ampoule', 'hydrium-triple-hyaluronic-moisture-ampoule', 'products/hydrium-triple-hyaluronic-moisture-ampoule', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An ampoule with triple hyaluronic acid to deeply hydrate and revitalize the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Hydrium Triple Hyaluronic Moisture Ampoule\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2499\"}', 1, '2024-05-20 14:09:23', '2024-05-20 14:09:23', '1651f34d-06f0-4482-b1a2-2a3ec28e2a1d'),
(145, 145, 1, 'Centella Asiatica Calming Mask', 'centella-asiatica-calming-mask', 'products/centella-asiatica-calming-mask', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A repairing sleeping mask that revitalizes and nourishes the skin overnight.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Centella Asiatica Calming Mask\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 60, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 14:09:49', '2024-05-20 17:03:23', 'e1f2fe63-a409-4d25-a7d8-28ec78da0746'),
(146, 146, 1, 'Centella Asiatica Calming Mask', 'centella-asiatica-calming-mask', 'products/centella-asiatica-calming-mask', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A repairing sleeping mask that revitalizes and nourishes the skin overnight.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Centella Asiatica Calming Mask\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 14:10:11', '2024-05-20 14:10:11', '563533aa-d34f-478a-88bc-c2340084b2ea'),
(148, 148, 1, 'Quinoa One Step Balanced Gel Cleanser', 'quinoa-one-step-balanced-gel-cleanser', 'products/quinoa-one-step-balanced-gel-cleanser', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A balanced cleansing gel with quinoa extracts for a cleansed skin without drying it out.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Quinoa One Step Balanced Gel Cleanser\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2450\"}', 1, '2024-05-20 14:10:59', '2024-05-20 14:10:59', '3fc08cf9-d50b-4f60-9914-974a7caf9ead'),
(150, 150, 1, NULL, '__temp_wxwvippfiilzmrvtnxrzmaibtljqzhrzsnnh', NULL, NULL, 1, '2024-05-20 14:20:20', '2024-05-20 14:20:20', '3a1d8ffc-f57f-4890-8478-3086b96b4ee8'),
(151, 151, 1, NULL, 'startpagina', '__home__', '{\"18e627da-2d6c-426f-b38d-84c8218771fa\": \"+32 123 45 67 89\", \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\": \"PHONE\", \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"453ca11a-58bd-460d-ad06-e396d7f92542\": \"EMAIL\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\": \"SOCIALS\", \"af0c8043-23a6-4e95-80c4-a227821ecb0e\": \"CONTACT\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\", \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\": \"info@kserenityskincare.be\"}', 1, '2024-05-20 14:24:26', '2024-05-20 14:24:30', 'cfd5541e-2d90-4e1b-a2d8-412c3fa7226e'),
(152, 152, 1, NULL, 'startpagina', '__home__', '{\"18e627da-2d6c-426f-b38d-84c8218771fa\": \"+32 123 45 67 89\", \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\": \"PHONE\", \"29362312-09d9-4840-be86-b36259f3ea9e\": \"Most Popular Products\", \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"453ca11a-58bd-460d-ad06-e396d7f92542\": \"EMAIL\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\": \"SOCIALS\", \"af0c8043-23a6-4e95-80c4-a227821ecb0e\": \"CONTACT\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\", \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\": \"info@kserenityskincare.be\"}', 1, '2024-05-20 14:24:47', '2024-05-20 14:24:47', '0702a9f5-0140-40d0-8c27-3e7794d9b8a6'),
(153, 153, 1, NULL, 'startpagina', '__home__', '{\"18e627da-2d6c-426f-b38d-84c8218771fa\": \"+32 123 45 67 89\", \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\": \"PHONE\", \"29362312-09d9-4840-be86-b36259f3ea9e\": \"Most Popular Products\", \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"453ca11a-58bd-460d-ad06-e396d7f92542\": \"EMAIL\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\": \"SOCIALS\", \"af0c8043-23a6-4e95-80c4-a227821ecb0e\": \"CONTACT\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\", \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\": \"info@kserenityskincare.be\"}', 1, '2024-05-20 14:25:10', '2024-05-20 14:25:10', '9f54f1ea-56bb-4cf6-a06a-240a1f11d3d0'),
(154, 154, 1, NULL, 'contact', 'contact', '{\"6ad40c30-c892-4bfd-8c85-342fea11c32f\": \"Contact Us\", \"8e49b995-dbfd-4e53-9f92-ded9be4edbd4\": \"Have a question, comment or suggestion? We\'d love to hear from you! Please fill out the form below and we\'ll get back to you as soon as possible.\"}', 1, '2024-05-20 14:25:44', '2024-05-20 14:25:44', '96c6970c-bf0d-4162-8629-7e3dc250c4b0');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(156, 156, 1, 'Homepagina', 'startpagina', '__home__', '{\"18e627da-2d6c-426f-b38d-84c8218771fa\": \"+32 123 45 67 89\", \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\": \"PHONE\", \"29362312-09d9-4840-be86-b36259f3ea9e\": \"Most Popular Products\", \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\": \"Korean Skincare\", \"453ca11a-58bd-460d-ad06-e396d7f92542\": \"EMAIL\", \"73070154-2e5d-47ca-b899-69301fd074c9\": \"Discover the secrets of radiant and healthy skin care with our collection of high-quality Korean skin care products. From gentle cleansing to revitalizing serums, we offer an extensive range of products to meet your unique skin needs. Let your skin glow with our carefully selected formulas, based on fundamental Korean beauty traditions. Start your journey to glowing skin today with our skin care essentials.\", \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\": \"SOCIALS\", \"af0c8043-23a6-4e95-80c4-a227821ecb0e\": \"CONTACT\", \"b0732feb-5bfa-4274-85ba-43f1736948c9\": \"Because gorgeous, glowing skin is for everyone.\", \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\": \"Shop now\", \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\": \"Our skincare philosophy\", \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\": \"producten.twig\", \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\": \"info@kserenityskincare.be\"}', 1, '2024-05-20 14:26:05', '2024-05-20 14:26:05', '738f80e8-648a-47fd-9d33-a0f777444d0d'),
(158, 158, 1, 'Contact', 'contact', 'contact', '{\"6ad40c30-c892-4bfd-8c85-342fea11c32f\": \"Contact Us\", \"8e49b995-dbfd-4e53-9f92-ded9be4edbd4\": \"Have a question, comment or suggestion? We\'d love to hear from you! Please fill out the form below and we\'ll get back to you as soon as possible.\"}', 1, '2024-05-20 14:26:13', '2024-05-20 14:26:13', 'dd20cb06-e413-4ebc-8d84-9139dc6304c8'),
(160, 160, 1, 'footer', 'footer', 'footer', '{\"e45dd48b-de12-4c10-a80f-d4fbf0338032\": \"<p> @K-Serenity Skincare</p>\"}', 1, '2024-05-20 14:26:22', '2024-05-20 14:26:22', 'da727255-4fc0-45b8-af7c-a022d0bae1ad'),
(161, 161, 1, NULL, 'header', 'header', '{\"d3d7ea17-7bc3-4fa0-909a-b11d23e3acc1\": \"<ul>       <li><a href=\\\"index.twig\\\">Home</a></li>       <li><a href=\\\"producten.twig\\\">Products</a></li>       <li><a href=\\\"contact.twig\\\">Contact</a></li>     </ul>\"}', 1, '2024-05-20 14:26:54', '2024-05-20 14:26:54', '7754eb65-8e6c-4742-9662-53c477eff902'),
(162, 162, 1, NULL, 'header', 'header', '{\"d3d7ea17-7bc3-4fa0-909a-b11d23e3acc1\": \"<ul>       <li><a href=\\\"index.twig\\\">Home</a></li>       <li><a href=\\\"producten.twig\\\">Products</a></li>       <li><a href=\\\"contact.twig\\\">Contact</a></li>     </ul>\"}', 1, '2024-05-20 14:27:35', '2024-05-20 14:27:35', 'a5e5e590-b60e-4e74-82e0-64f8c4f69207'),
(164, 164, 1, 'Producten', 'products-page', 'products/products-page', '{\"061d08d3-ea7c-4226-904a-32ef8244d99e\": \"Our Products\", \"51692670-1e8d-41c1-8cdd-83ed7aaf3d7a\": \"Discover our premium Korean Skincare products. From nourishing cleanser to revitalizing serums, eac product is meticulously crafted to deliver effective results\"}', 1, '2024-05-20 14:29:25', '2024-05-20 14:29:25', '0cf1ec2b-a30b-49dc-a77a-84b3438918cf'),
(166, 166, 1, 'Dynasty Cream', 'dynasty-cream', 'products/dynasty-cream', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"The Beauty Of Joseon Dynasty Cream is a brightening and anti-aging cream made from traditional Korean herbs including orchid extract to hydrate, tighten, and smooth the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Dynasty Cream\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 90, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 16:23:34', '2024-05-20 16:23:34', '428f3328-fddb-486b-ad8e-8980259d26ba'),
(168, 168, 1, 'Dynasty Cream', 'dynasty-cream', 'products/dynasty-cream', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"The Beauty Of Joseon Dynasty Cream is a brightening and anti-aging cream made from traditional Korean herbs including orchid extract to hydrate, tighten, and smooth the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Dynasty Cream\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 90, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 16:32:58', '2024-05-20 16:32:58', '73d68da7-f717-43ed-bed8-13e0d75fc027'),
(170, 170, 1, 'Advanced Snail 96 Mucin Power Essence', 'advanced-snail-96-mucin-power-essence', 'products/advanced-snail-96-mucin-power-essence', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence enriched with snail mucin to calm and hydrate the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Advanced Snail 96 Mucin Power Essence\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1850\"}', 1, '2024-05-20 16:50:15', '2024-05-20 16:50:15', 'a82016c4-a5ba-4d53-9f72-5227efef7b1e'),
(172, 172, 1, 'Time Revolution The First Treatment Essence RX', 'time-revolution-the-first-treatment-essence-rx', 'products/time-revolution-the-first-treatment-essence-rx', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence that helps improve skin texture and brighten the complexion.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution The First Treatment Essence RX\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3875\"}', 1, '2024-05-20 16:50:52', '2024-05-20 16:50:52', '4ee98e5f-4ecf-4821-ad14-dc95ac98d189'),
(174, 174, 1, 'Centella Calming Gel Cream', 'centella-calming-gel-cream', 'products/centella-calming-gel-cream', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A soothing gel cream enriched with centella extracts for sensitive skin types.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Centella Calming Gel Cream\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2100\"}', 1, '2024-05-20 16:51:13', '2024-05-20 16:51:13', '6b9b3564-c902-4c16-a977-c6eb5556b07c'),
(176, 176, 1, 'Heartleaf 77% Soothing Toner', 'heartleaf-77-soothing-toner', 'products/heartleaf-77-soothing-toner', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A soothing toner with 77% heartleaf extract to calm and hydrate the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf 77% Soothing Toner\", \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1499\"}', 1, '2024-05-20 16:51:35', '2024-05-20 16:51:35', 'c6f49bfd-c6c1-43e0-a2b1-e64ca0f24a30'),
(178, 178, 1, 'Advanced Snail 96 Mucin Power Essence', 'advanced-snail-96-mucin-power-essence', 'products/advanced-snail-96-mucin-power-essence', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence enriched with snail mucin to calm and hydrate the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Advanced Snail 96 Mucin Power Essence\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 0, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1850\"}', 1, '2024-05-20 16:52:27', '2024-05-20 16:52:27', 'f83ccc9e-3aeb-444b-a018-c0e21877495e'),
(180, 180, 1, 'Time Revolution The First Treatment Essence RX', 'time-revolution-the-first-treatment-essence-rx', 'products/time-revolution-the-first-treatment-essence-rx', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence that helps improve skin texture and brighten the complexion.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution The First Treatment Essence RX\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 35, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3875\"}', 1, '2024-05-20 16:52:45', '2024-05-20 16:52:45', '4cd2c677-d15c-4bb2-9343-5338f38316eb'),
(182, 182, 1, 'Centella Calming Gel Cream', 'centella-calming-gel-cream', 'products/centella-calming-gel-cream', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A soothing gel cream enriched with centella extracts for sensitive skin types.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Centella Calming Gel Cream\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 60, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2100\"}', 1, '2024-05-20 16:52:57', '2024-05-20 16:52:57', '51e76d2c-25b6-4055-a42e-d436c48f10fa'),
(184, 184, 1, 'Heartleaf 77% Soothing Toner', 'heartleaf-77-soothing-toner', 'products/heartleaf-77-soothing-toner', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A soothing toner with 77% heartleaf extract to calm and hydrate the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf 77% Soothing Toner\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 80, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1499\"}', 1, '2024-05-20 16:53:48', '2024-05-20 16:53:48', 'c3512dd0-647a-45af-8743-2a9df9c6a4f5'),
(186, 186, 1, 'Mugwort Pore Clarifying Wash Off Pack', 'mugwort-pore-clarifying-wash-off-pack', 'products/mugwort-pore-clarifying-wash-off-pack', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A face mask based on mugwort to cleanse and refine pores.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Mugwort Pore Clarifying Wash Off Pack\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 45, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2150\"}', 1, '2024-05-20 16:54:27', '2024-05-20 16:54:27', 'b0c272e8-624e-45c2-8124-aa8ec0bae49c'),
(188, 188, 1, 'Radiance Cleansing Balm', 'radiance-cleansing-balm', 'products/radiance-cleansing-balm', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A cleansing balm that helps remove makeup and impurities.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Radiance Cleansing Balm\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 55, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2150\"}', 1, '2024-05-20 16:54:59', '2024-05-20 16:54:59', '4fe056f9-7da2-43a1-aa72-34118a346a1c'),
(190, 190, 1, 'Acne Pimple Master Patch', 'acne-pimple-master-patch', 'products/acne-pimple-master-patch', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"Transparent patches that treat acne and pimples and protect against infections.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Acne Pimple Master Patch\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 85, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"599\"}', 1, '2024-05-20 16:55:20', '2024-05-20 16:55:20', 'e1f8c47c-bf4e-495e-9035-c35b159c223c'),
(192, 192, 1, 'Time Revolution Night Repair Probio Ampoule', 'time-revolution-night-repair-probio-ampoule', 'products/time-revolution-night-repair-probio-ampoule', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A night ampoule that helps improve skin texture and elasticity.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution Night Repair Probio Ampoule\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 40, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"4200\"}', 1, '2024-05-20 16:56:00', '2024-05-20 16:56:00', '6ecf5ba5-8489-4f36-839e-9a37d545beef'),
(194, 194, 1, 'Rose Galactomyces Essential Toner', 'rose-galactomyces-essential-toner', 'products/rose-galactomyces-essential-toner', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A toner enriched with rose extracts to hydrate and revitalize the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Rose Galactomyces Essential Toner\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 75, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1775\"}', 1, '2024-05-20 16:56:23', '2024-05-20 16:56:23', '5c3837a8-0f7d-48fe-b5f3-0a8e73fd62db'),
(196, 196, 1, 'Heartleaf 77% Clear Pad', 'heartleaf-77-clear-pad', 'products/heartleaf-77-clear-pad', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"The Anua Heartleaf 77% Clear Pad is a toner pad that combines the power of vegan and cruelty-free ingredients with the soothing benefits of Anua\'s Heartleaf 77% Soothing Toner.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf 77% Clear Pad\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 65, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"950\"}', 1, '2024-05-20 16:59:24', '2024-05-20 16:59:24', '38d14d58-e3dd-403f-a8b0-209a48a69af9'),
(198, 198, 1, 'Dark Spot Correcting Glow Serum', 'dark-spot-correcting-glow-serum', 'products/dark-spot-correcting-glow-serum', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A serum that helps reduce dark spots and restore the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Dark Spot Correcting Glow Serum\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 30, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3199\"}', 1, '2024-05-20 17:00:20', '2024-05-20 17:00:20', '49845d33-f549-4e24-957d-07e62adf83ae'),
(200, 200, 1, 'Repair Serum: Ginseng+Snail Mucin', 'repair-serum-ginseng-snail-mucin', 'products/repair-serum-ginseng-snail-mucin', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A repairing serum to combat aging and pigmentation.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Repair Serum: Ginseng+Snail Mucin\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 5, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2900\"}', 1, '2024-05-20 17:00:46', '2024-05-20 17:00:46', '2460654d-9362-4acf-b64f-3cf430c5ab25'),
(202, 202, 1, 'Low pH Good Morning Gel Cleanser', 'low-ph-good-morning-gel-cleanser', 'products/low-ph-good-morning-gel-cleanser', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A gentle cleansing gel with a low pH value to cleanse the skin without drying it out.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Low pH Good Morning Gel Cleanser\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 85, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1100\"}', 1, '2024-05-20 17:01:05', '2024-05-20 17:01:05', '25bc7599-abef-49a4-8d6a-60929329527b'),
(204, 204, 1, 'Time Revolution Artemisia Treatment Essence', 'time-revolution-artemisia-treatment-essence', 'products/time-revolution-artemisia-treatment-essence', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An essence enriched with mugwort extracts to calm and nourish the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Missha\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Time Revolution Artemisia Treatment Essence\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 25, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"3350\"}', 1, '2024-05-20 17:01:42', '2024-05-20 17:01:42', 'cccacd6d-2e90-4a4a-b71a-af63e37c5cde'),
(206, 206, 1, 'Propolis Vitamin Synergy Serum', 'propolis-vitamin-synergy-serum', 'products/propolis-vitamin-synergy-serum', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A serum enriched with propolis and vitamin C for radiant and hydrated skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"IUNIK\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Propolis Vitamin Synergy Serum\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 55, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2225\"}', 1, '2024-05-20 17:02:12', '2024-05-20 17:02:12', '7b957a5d-0a8c-4e80-a4fe-8f33cc74e0fa'),
(208, 208, 1, 'Heartleaf Cream Mask Night Solution', 'heartleaf-cream-mask-night-solution', 'products/heartleaf-cream-mask-night-solution', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"This hydrating sheet mask is a true skin savior, thanks to the powerful Heartleaf Extract that not only soothes sensitivity but also effortlessly tackles impurities...\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Anua\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Heartleaf Cream Mask Night Solution\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 70, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"1699\"}', 1, '2024-05-20 17:02:39', '2024-05-20 17:02:39', '7a43b5ff-1eb0-4696-86e6-770c99a589c8'),
(210, 210, 1, 'Quinoa One Step Balanced Gel Cleanser', 'quinoa-one-step-balanced-gel-cleanser', 'products/quinoa-one-step-balanced-gel-cleanser', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A balanced cleansing gel with quinoa extracts for a cleansed skin without drying it out.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Axis-y\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Quinoa One Step Balanced Gel Cleanser\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 40, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2450\"}', 1, '2024-05-20 17:03:02', '2024-05-20 17:03:02', '2cf788a9-b93f-496d-8a76-169fec6a4857'),
(212, 212, 1, 'Centella Asiatica Calming Mask', 'centella-asiatica-calming-mask', 'products/centella-asiatica-calming-mask', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"A repairing sleeping mask that revitalizes and nourishes the skin overnight.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"Beauty Of Joseon\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Centella Asiatica Calming Mask\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 60, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2599\"}', 1, '2024-05-20 17:03:24', '2024-05-20 17:03:24', 'feea9587-675c-4524-8273-f4eb83470cd6'),
(214, 214, 1, 'Hydrium Triple Hyaluronic Moisture Ampoule', 'hydrium-triple-hyaluronic-moisture-ampoule', 'products/hydrium-triple-hyaluronic-moisture-ampoule', '{\"2e467574-6736-445e-ac8e-c74e6c87c2aa\": \"An ampoule with triple hyaluronic acid to deeply hydrate and revitalize the skin.\", \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\": \"COSRX\", \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\": \"Hydrium Triple Hyaluronic Moisture Ampoule\", \"e5652917-52bb-45d1-a11f-28d211b19ffb\": 0, \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\": \"2499\"}', 1, '2024-05-20 17:03:42', '2024-05-20 17:03:42', '8e60477c-94ad-48c2-ac74-833597ab7f74');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entries`
--

DROP TABLE IF EXISTS `entries`;
CREATE TABLE IF NOT EXISTS `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dyrebfgxzoobjjoywlzojfdtmgaqlsjzgndd` (`postDate`),
  KEY `idx_updsqavnpytnxmyjivzvaagopcfjbboaeulw` (`expiryDate`),
  KEY `idx_pbtjguorruwwybmioejikfvdgcabrljqlzju` (`sectionId`),
  KEY `idx_eqpjxanupdfjosxmqgcbhwyvvxqoxycvuhle` (`typeId`),
  KEY `idx_cfgkvqdjgjrywuivxstzzgibzqjyzsnmfons` (`primaryOwnerId`),
  KEY `idx_tzqhuugzjfayrbbfkhikuhhbbjecbqrlmmsb` (`fieldId`),
  KEY `fk_htmibjmvxtgcesaufdzqlkujtmofisavpwsr` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `primaryOwnerId`, `fieldId`, `typeId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES
(2, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-17 21:58:11', '2024-05-17 21:58:11'),
(3, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-17 21:58:11', '2024-05-17 21:58:11'),
(4, 2, NULL, NULL, NULL, 3, '2024-05-17 22:16:00', NULL, NULL, '2024-05-17 22:16:50', '2024-05-17 22:16:50'),
(5, 2, NULL, NULL, NULL, 3, '2024-05-17 22:16:00', NULL, NULL, '2024-05-17 22:16:50', '2024-05-17 22:16:50'),
(6, 3, NULL, NULL, NULL, 4, '2024-05-17 22:17:00', NULL, NULL, '2024-05-17 22:17:57', '2024-05-17 22:17:57'),
(7, 3, NULL, NULL, NULL, 4, '2024-05-17 22:17:00', NULL, NULL, '2024-05-17 22:17:57', '2024-05-17 22:17:57'),
(9, 2, NULL, NULL, NULL, 3, '2024-05-17 22:16:00', NULL, NULL, '2024-05-17 22:21:16', '2024-05-17 22:21:16'),
(11, 2, NULL, NULL, NULL, 3, '2024-05-17 22:16:00', NULL, NULL, '2024-05-17 22:41:12', '2024-05-17 22:41:12'),
(12, 3, NULL, NULL, NULL, 4, '2024-05-17 22:17:00', NULL, NULL, '2024-05-17 22:41:35', '2024-05-17 22:41:35'),
(14, 2, NULL, NULL, NULL, 3, '2024-05-17 22:16:00', NULL, NULL, '2024-05-17 22:48:26', '2024-05-17 22:48:26'),
(16, 3, NULL, NULL, NULL, 4, '2024-05-17 22:17:00', NULL, NULL, '2024-05-17 22:57:08', '2024-05-17 22:57:08'),
(17, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 18:41:15', '2024-05-18 18:41:15'),
(18, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 18:41:15', '2024-05-18 18:41:15'),
(19, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 18:47:49', '2024-05-18 18:47:49'),
(21, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 18:59:11', '2024-05-18 18:59:11'),
(24, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 19:08:20', '2024-05-18 19:08:20'),
(26, 2, NULL, NULL, NULL, 3, '2024-05-17 22:16:00', NULL, NULL, '2024-05-18 19:22:31', '2024-05-18 19:22:31'),
(28, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 19:58:08', '2024-05-18 19:58:08'),
(29, 4, NULL, NULL, NULL, 5, '2024-05-18 20:10:15', NULL, NULL, '2024-05-18 20:10:15', '2024-05-18 20:10:15'),
(30, 4, NULL, NULL, NULL, 5, '2024-05-18 21:59:12', NULL, NULL, '2024-05-18 21:59:12', '2024-05-18 21:59:12'),
(32, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 22:10:01', '2024-05-18 22:10:01'),
(34, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 22:13:52', '2024-05-18 22:13:52'),
(39, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-18 22:25:12', '2024-05-18 22:25:12'),
(43, 4, NULL, NULL, NULL, 5, '2024-05-20 12:03:57', NULL, NULL, '2024-05-20 12:03:57', '2024-05-20 12:03:57'),
(44, 4, NULL, NULL, NULL, 6, '2024-05-20 12:07:00', NULL, NULL, '2024-05-20 12:05:02', '2024-05-20 12:07:55'),
(45, 4, NULL, NULL, NULL, 6, '2024-05-20 12:07:00', NULL, NULL, '2024-05-20 12:07:55', '2024-05-20 12:07:55'),
(47, 4, NULL, NULL, NULL, 6, '2024-05-20 12:07:00', NULL, NULL, '2024-05-20 12:08:19', '2024-05-20 12:08:19'),
(48, 5, NULL, NULL, NULL, 7, '2024-05-20 13:10:00', NULL, NULL, '2024-05-20 13:10:15', '2024-05-20 13:10:15'),
(49, 5, NULL, NULL, NULL, 7, '2024-05-20 13:10:00', NULL, NULL, '2024-05-20 13:10:15', '2024-05-20 13:10:15'),
(51, 5, NULL, NULL, NULL, 7, '2024-05-20 13:10:00', NULL, NULL, '2024-05-20 13:11:30', '2024-05-20 13:11:30'),
(54, 4, NULL, NULL, NULL, 5, '2024-05-20 13:28:45', NULL, NULL, '2024-05-20 13:28:45', '2024-05-20 13:28:45'),
(103, 4, NULL, NULL, NULL, 5, '2024-05-20 13:34:33', NULL, NULL, '2024-05-20 13:34:33', '2024-05-20 13:34:33'),
(104, 4, NULL, NULL, NULL, 5, '2024-05-20 13:37:00', NULL, NULL, '2024-05-20 13:34:55', '2024-05-20 13:37:49'),
(105, 4, NULL, NULL, NULL, 5, '2024-05-20 13:37:00', NULL, NULL, '2024-05-20 13:37:50', '2024-05-20 13:37:50'),
(107, 4, NULL, NULL, NULL, 5, '2024-05-20 13:37:00', NULL, NULL, '2024-05-20 13:39:11', '2024-05-20 13:39:11'),
(108, 4, NULL, NULL, NULL, 5, '2024-05-20 13:40:00', NULL, NULL, '2024-05-20 13:39:28', '2024-05-20 13:40:39'),
(109, 4, NULL, NULL, NULL, 5, '2024-05-20 13:40:00', NULL, NULL, '2024-05-20 13:40:39', '2024-05-20 13:40:39'),
(110, 4, NULL, NULL, NULL, 5, '2024-05-20 13:57:00', NULL, NULL, '2024-05-20 13:48:35', '2024-05-20 13:57:44'),
(111, 4, NULL, NULL, NULL, 5, '2024-05-20 13:57:00', NULL, NULL, '2024-05-20 13:57:44', '2024-05-20 13:57:44'),
(112, 4, NULL, NULL, NULL, 5, '2024-05-20 13:58:00', NULL, NULL, '2024-05-20 13:57:48', '2024-05-20 13:58:15'),
(113, 4, NULL, NULL, NULL, 5, '2024-05-20 13:58:00', NULL, NULL, '2024-05-20 13:58:15', '2024-05-20 13:58:15'),
(114, 4, NULL, NULL, NULL, 5, '2024-05-20 13:58:00', NULL, NULL, '2024-05-20 13:58:19', '2024-05-20 13:58:51'),
(115, 4, NULL, NULL, NULL, 5, '2024-05-20 13:58:00', NULL, NULL, '2024-05-20 13:58:51', '2024-05-20 13:58:51'),
(116, 4, NULL, NULL, NULL, 5, '2024-05-20 13:59:00', NULL, NULL, '2024-05-20 13:58:55', '2024-05-20 13:59:25'),
(117, 4, NULL, NULL, NULL, 5, '2024-05-20 13:59:00', NULL, NULL, '2024-05-20 13:59:25', '2024-05-20 13:59:25'),
(118, 4, NULL, NULL, NULL, 5, '2024-05-20 13:59:00', NULL, NULL, '2024-05-20 13:59:28', '2024-05-20 13:59:57'),
(119, 4, NULL, NULL, NULL, 5, '2024-05-20 13:59:00', NULL, NULL, '2024-05-20 13:59:57', '2024-05-20 13:59:57'),
(120, 4, NULL, NULL, NULL, 5, '2024-05-20 14:00:00', NULL, NULL, '2024-05-20 14:00:04', '2024-05-20 14:00:36'),
(121, 4, NULL, NULL, NULL, 5, '2024-05-20 14:00:00', NULL, NULL, '2024-05-20 14:00:36', '2024-05-20 14:00:36'),
(122, 4, NULL, NULL, NULL, 5, '2024-05-20 14:00:00', NULL, NULL, '2024-05-20 14:01:55', '2024-05-20 14:01:55'),
(123, 4, NULL, NULL, NULL, 5, '2024-05-20 14:02:00', NULL, NULL, '2024-05-20 14:01:58', '2024-05-20 14:02:31'),
(124, 4, NULL, NULL, NULL, 5, '2024-05-20 14:02:00', NULL, NULL, '2024-05-20 14:02:31', '2024-05-20 14:02:31'),
(125, 4, NULL, NULL, NULL, 5, '2024-05-20 14:03:00', NULL, NULL, '2024-05-20 14:02:41', '2024-05-20 14:03:08'),
(126, 4, NULL, NULL, NULL, 5, '2024-05-20 14:03:00', NULL, NULL, '2024-05-20 14:03:08', '2024-05-20 14:03:08'),
(127, 4, NULL, NULL, NULL, 5, '2024-05-20 14:05:00', NULL, NULL, '2024-05-20 14:04:46', '2024-05-20 14:05:12'),
(128, 4, NULL, NULL, NULL, 5, '2024-05-20 14:05:00', NULL, NULL, '2024-05-20 14:05:12', '2024-05-20 14:05:12'),
(129, 4, NULL, NULL, NULL, 5, '2024-05-20 14:05:00', NULL, NULL, '2024-05-20 14:05:29', '2024-05-20 14:05:51'),
(130, 4, NULL, NULL, NULL, 5, '2024-05-20 14:05:00', NULL, NULL, '2024-05-20 14:05:52', '2024-05-20 14:05:52'),
(131, 4, NULL, NULL, NULL, 5, '2024-05-20 14:06:00', NULL, NULL, '2024-05-20 14:06:02', '2024-05-20 14:06:27'),
(132, 4, NULL, NULL, NULL, 5, '2024-05-20 14:06:00', NULL, NULL, '2024-05-20 14:06:27', '2024-05-20 14:06:27'),
(133, 4, NULL, NULL, NULL, 5, '2024-05-20 14:06:00', NULL, NULL, '2024-05-20 14:06:31', '2024-05-20 14:06:51'),
(134, 4, NULL, NULL, NULL, 5, '2024-05-20 14:06:00', NULL, NULL, '2024-05-20 14:06:51', '2024-05-20 14:06:51'),
(135, 4, NULL, NULL, NULL, 5, '2024-05-20 14:07:00', NULL, NULL, '2024-05-20 14:07:07', '2024-05-20 14:07:33'),
(136, 4, NULL, NULL, NULL, 5, '2024-05-20 14:07:00', NULL, NULL, '2024-05-20 14:07:33', '2024-05-20 14:07:33'),
(137, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 14:07:38', '2024-05-20 14:08:05'),
(138, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 14:08:05', '2024-05-20 14:08:05'),
(139, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 14:08:08', '2024-05-20 14:08:29'),
(140, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 14:08:29', '2024-05-20 14:08:29'),
(141, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 14:08:33', '2024-05-20 14:08:55'),
(142, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 14:08:56', '2024-05-20 14:08:56'),
(143, 4, NULL, NULL, NULL, 5, '2024-05-20 14:09:00', NULL, NULL, '2024-05-20 14:08:59', '2024-05-20 14:09:22'),
(144, 4, NULL, NULL, NULL, 5, '2024-05-20 14:09:00', NULL, NULL, '2024-05-20 14:09:23', '2024-05-20 14:09:23'),
(145, 4, NULL, NULL, NULL, 5, '2024-05-20 14:10:00', NULL, NULL, '2024-05-20 14:09:49', '2024-05-20 14:10:11'),
(146, 4, NULL, NULL, NULL, 5, '2024-05-20 14:10:00', NULL, NULL, '2024-05-20 14:10:11', '2024-05-20 14:10:11'),
(148, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 14:10:59', '2024-05-20 14:10:59'),
(150, 1, NULL, NULL, NULL, 5, '2024-05-20 14:20:20', NULL, 0, '2024-05-20 14:20:20', '2024-05-20 14:20:24'),
(151, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-20 14:24:26', '2024-05-20 14:24:26'),
(152, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-20 14:24:47', '2024-05-20 14:24:47'),
(153, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-20 14:25:10', '2024-05-20 14:25:10'),
(154, 5, NULL, NULL, NULL, 7, '2024-05-20 13:10:00', NULL, NULL, '2024-05-20 14:25:44', '2024-05-20 14:25:44'),
(156, 1, NULL, NULL, NULL, 2, '2024-05-17 21:58:00', NULL, NULL, '2024-05-20 14:26:05', '2024-05-20 14:26:05'),
(158, 5, NULL, NULL, NULL, 7, '2024-05-20 13:10:00', NULL, NULL, '2024-05-20 14:26:13', '2024-05-20 14:26:13'),
(160, 3, NULL, NULL, NULL, 4, '2024-05-17 22:17:00', NULL, NULL, '2024-05-20 14:26:22', '2024-05-20 14:26:22'),
(161, 2, NULL, NULL, NULL, 3, '2024-05-17 22:16:00', NULL, NULL, '2024-05-20 14:26:54', '2024-05-20 14:26:54'),
(162, 2, NULL, NULL, NULL, 3, '2024-05-17 22:16:00', NULL, NULL, '2024-05-20 14:27:35', '2024-05-20 14:27:35'),
(164, 4, NULL, NULL, NULL, 6, '2024-05-20 12:07:00', NULL, NULL, '2024-05-20 14:29:25', '2024-05-20 14:29:25'),
(166, 4, NULL, NULL, NULL, 5, '2024-05-20 13:37:00', NULL, NULL, '2024-05-20 16:23:34', '2024-05-20 16:23:34'),
(168, 4, NULL, NULL, NULL, 5, '2024-05-20 13:37:00', NULL, NULL, '2024-05-20 16:32:58', '2024-05-20 16:32:58'),
(170, 4, NULL, NULL, NULL, 5, '2024-05-20 13:40:00', NULL, NULL, '2024-05-20 16:50:15', '2024-05-20 16:50:15'),
(172, 4, NULL, NULL, NULL, 5, '2024-05-20 13:57:00', NULL, NULL, '2024-05-20 16:50:52', '2024-05-20 16:50:52'),
(174, 4, NULL, NULL, NULL, 5, '2024-05-20 13:58:00', NULL, NULL, '2024-05-20 16:51:13', '2024-05-20 16:51:13'),
(176, 4, NULL, NULL, NULL, 5, '2024-05-20 13:58:00', NULL, NULL, '2024-05-20 16:51:35', '2024-05-20 16:51:35'),
(178, 4, NULL, NULL, NULL, 5, '2024-05-20 13:40:00', NULL, NULL, '2024-05-20 16:52:27', '2024-05-20 16:52:27'),
(180, 4, NULL, NULL, NULL, 5, '2024-05-20 13:57:00', NULL, NULL, '2024-05-20 16:52:45', '2024-05-20 16:52:45'),
(182, 4, NULL, NULL, NULL, 5, '2024-05-20 13:58:00', NULL, NULL, '2024-05-20 16:52:57', '2024-05-20 16:52:57'),
(184, 4, NULL, NULL, NULL, 5, '2024-05-20 13:58:00', NULL, NULL, '2024-05-20 16:53:48', '2024-05-20 16:53:48'),
(186, 4, NULL, NULL, NULL, 5, '2024-05-20 13:59:00', NULL, NULL, '2024-05-20 16:54:27', '2024-05-20 16:54:27'),
(188, 4, NULL, NULL, NULL, 5, '2024-05-20 14:05:00', NULL, NULL, '2024-05-20 16:54:59', '2024-05-20 16:54:59'),
(190, 4, NULL, NULL, NULL, 5, '2024-05-20 13:59:00', NULL, NULL, '2024-05-20 16:55:20', '2024-05-20 16:55:20'),
(192, 4, NULL, NULL, NULL, 5, '2024-05-20 14:00:00', NULL, NULL, '2024-05-20 16:56:00', '2024-05-20 16:56:00'),
(194, 4, NULL, NULL, NULL, 5, '2024-05-20 14:02:00', NULL, NULL, '2024-05-20 16:56:23', '2024-05-20 16:56:23'),
(196, 4, NULL, NULL, NULL, 5, '2024-05-20 14:03:00', NULL, NULL, '2024-05-20 16:59:24', '2024-05-20 16:59:24'),
(198, 4, NULL, NULL, NULL, 5, '2024-05-20 14:05:00', NULL, NULL, '2024-05-20 17:00:20', '2024-05-20 17:00:20'),
(200, 4, NULL, NULL, NULL, 5, '2024-05-20 14:06:00', NULL, NULL, '2024-05-20 17:00:46', '2024-05-20 17:00:46'),
(202, 4, NULL, NULL, NULL, 5, '2024-05-20 14:06:00', NULL, NULL, '2024-05-20 17:01:05', '2024-05-20 17:01:05'),
(204, 4, NULL, NULL, NULL, 5, '2024-05-20 14:07:00', NULL, NULL, '2024-05-20 17:01:42', '2024-05-20 17:01:42'),
(206, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 17:02:12', '2024-05-20 17:02:12'),
(208, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 17:02:39', '2024-05-20 17:02:39'),
(210, 4, NULL, NULL, NULL, 5, '2024-05-20 14:08:00', NULL, NULL, '2024-05-20 17:03:02', '2024-05-20 17:03:02'),
(212, 4, NULL, NULL, NULL, 5, '2024-05-20 14:10:00', NULL, NULL, '2024-05-20 17:03:24', '2024-05-20 17:03:24'),
(214, 4, NULL, NULL, NULL, 5, '2024-05-20 14:09:00', NULL, NULL, '2024-05-20 17:03:42', '2024-05-20 17:03:42');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
CREATE TABLE IF NOT EXISTS `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_oafmmvdhbplgmgwmdnaexusxsswvpknnkffu` (`authorId`),
  KEY `idx_pqvlpqryewihllurvuztfvbzrtaeuzfxvwgs` (`entryId`,`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entries_authors`
--

INSERT INTO `entries_authors` (`entryId`, `authorId`, `sortOrder`) VALUES
(29, 1, 1),
(30, 1, 1),
(43, 1, 1),
(44, 1, 1),
(45, 1, 1),
(47, 1, 1),
(54, 1, 1),
(103, 1, 1),
(104, 1, 1),
(105, 1, 1),
(107, 1, 1),
(108, 1, 1),
(109, 1, 1),
(110, 1, 1),
(111, 1, 1),
(112, 1, 1),
(113, 1, 1),
(114, 1, 1),
(115, 1, 1),
(116, 1, 1),
(117, 1, 1),
(118, 1, 1),
(119, 1, 1),
(120, 1, 1),
(121, 1, 1),
(122, 1, 1),
(123, 1, 1),
(124, 1, 1),
(125, 1, 1),
(126, 1, 1),
(127, 1, 1),
(128, 1, 1),
(129, 1, 1),
(130, 1, 1),
(131, 1, 1),
(132, 1, 1),
(133, 1, 1),
(134, 1, 1),
(135, 1, 1),
(136, 1, 1),
(137, 1, 1),
(138, 1, 1),
(139, 1, 1),
(140, 1, 1),
(141, 1, 1),
(142, 1, 1),
(143, 1, 1),
(144, 1, 1),
(145, 1, 1),
(146, 1, 1),
(148, 1, 1),
(150, 1, 1),
(164, 1, 1),
(166, 1, 1),
(168, 1, 1),
(170, 1, 1),
(172, 1, 1),
(174, 1, 1),
(176, 1, 1),
(178, 1, 1),
(180, 1, 1),
(182, 1, 1),
(184, 1, 1),
(186, 1, 1),
(188, 1, 1),
(190, 1, 1),
(192, 1, 1),
(194, 1, 1),
(196, 1, 1),
(198, 1, 1),
(200, 1, 1),
(202, 1, 1),
(204, 1, 1),
(206, 1, 1),
(208, 1, 1),
(210, 1, 1),
(212, 1, 1),
(214, 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
CREATE TABLE IF NOT EXISTS `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uifmkeifgbltnaxzvvwznoeeqaujonfsrudq` (`fieldLayoutId`),
  KEY `idx_lagjrjetecjfeaalkqbikuysyjwaeknbvwih` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `fieldLayoutId`, `name`, `handle`, `icon`, `color`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `showSlugField`, `slugTranslationMethod`, `slugTranslationKeyFormat`, `showStatusField`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 'ProductCard', 'productcard', '', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-05-17 13:44:17', '2024-05-17 13:44:17', '2024-05-18 21:34:21', 'bd7679e2-c961-4bd5-96d2-af9151648497'),
(2, 2, 'Homepage Entry', 'homepageentry', 'house', 'fuchsia', 1, 'site', NULL, '', 0, 'site', NULL, 1, '2024-05-17 21:58:07', '2024-05-20 14:25:08', NULL, '87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5'),
(3, 3, 'Header', 'header', '', NULL, 0, 'site', NULL, '', 0, 'site', NULL, 1, '2024-05-17 22:16:47', '2024-05-17 22:39:56', NULL, '32ec3ad3-e3ec-488b-9670-185dcae1a236'),
(4, 4, 'Footer', 'footer', '', NULL, 1, 'site', NULL, '', 0, 'site', NULL, 1, '2024-05-17 22:17:53', '2024-05-20 14:25:51', NULL, '9971f49b-6318-4be1-af82-ffccc357c3e5'),
(5, 6, 'ProductEntry', 'productentry', 'basket-shopping', NULL, 1, 'site', NULL, '', 0, 'site', NULL, 1, '2024-05-18 20:05:21', '2024-05-20 13:38:44', NULL, '65305b29-a1b4-4736-8ef8-a757decd3de9'),
(6, 11, 'ProductenPage', 'productenpage', '', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-05-20 12:03:29', '2024-05-20 14:29:01', NULL, '259b293c-e5d6-482f-98e8-158a8a0f6b88'),
(7, 12, 'contact', 'contact', 'envelope', 'cyan', 1, 'site', NULL, '', 0, 'site', NULL, 1, '2024-05-20 13:09:56', '2024-05-20 14:25:41', NULL, '4949eae4-4151-4200-969e-16fb4e858353');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `feedme_feeds`
--

DROP TABLE IF EXISTS `feedme_feeds`;
CREATE TABLE IF NOT EXISTS `feedme_feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `feedUrl` text NOT NULL,
  `feedType` varchar(255) DEFAULT NULL,
  `primaryElement` varchar(255) DEFAULT NULL,
  `elementType` varchar(255) NOT NULL,
  `elementGroup` text,
  `siteId` varchar(255) DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `singleton` tinyint(1) NOT NULL DEFAULT '0',
  `duplicateHandle` text,
  `updateSearchIndexes` tinyint(1) NOT NULL DEFAULT '1',
  `paginationNode` text,
  `fieldMapping` text,
  `fieldUnique` text,
  `passkey` varchar(255) NOT NULL,
  `backup` tinyint(1) NOT NULL DEFAULT '0',
  `setEmptyValues` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `feedme_feeds`
--

INSERT INTO `feedme_feeds` (`id`, `name`, `feedUrl`, `feedType`, `primaryElement`, `elementType`, `elementGroup`, `siteId`, `sortOrder`, `singleton`, `duplicateHandle`, `updateSearchIndexes`, `paginationNode`, `fieldMapping`, `fieldUnique`, `passkey`, `backup`, `setEmptyValues`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Products', 'http://kserenity-skincare/csv/products.csv', 'csv', NULL, 'craft\\elements\\Entry', '{\"craft\\\\elements\\\\Asset\":\"\",\"craft\\\\elements\\\\Category\":\"\",\"craft\\\\elements\\\\Entry\":{\"section\":\"4\",\"entryType\":\"5\"},\"craft\\\\elements\\\\Tag\":\"\",\"craft\\\\elements\\\\GlobalSet\":{\"globalSet\":\"\"}}', NULL, 1, 0, '[\"add\"]', 1, NULL, '{\"title\":{\"attribute\":\"true\",\"node\":\"noimport\",\"default\":\"\"},\"slug\":{\"attribute\":\"true\",\"node\":\"noimport\",\"default\":\"\"},\"postDate\":{\"attribute\":\"true\",\"node\":\"noimport\",\"options\":{\"match\":\"auto\"},\"default\":{\"date\":\"\",\"locale\":\"en-US\",\"timezone\":\"America\\/Los_Angeles\",\"time\":\"\"}},\"expiryDate\":{\"attribute\":\"true\",\"node\":\"noimport\",\"options\":{\"match\":\"auto\"},\"default\":{\"date\":\"\",\"locale\":\"en-US\",\"timezone\":\"America\\/Los_Angeles\",\"time\":\"\"}},\"enabled\":{\"attribute\":\"true\",\"node\":\"noimport\",\"default\":\"\"},\"authorIds\":{\"attribute\":\"true\",\"node\":\"noimport\",\"options\":{\"match\":\"email\"},\"default\":\"\"},\"id\":{\"attribute\":\"true\",\"node\":\"noimport\",\"default\":\"\"},\"image\":{\"field\":\"craft\\\\fields\\\\Assets\",\"node\":\"image_path\",\"options\":{\"conflict\":\"index\",\"filenameNode\":\"noimport\"},\"default\":\"\"},\"merk\":{\"field\":\"craft\\\\fields\\\\PlainText\",\"node\":\"merk\",\"default\":\"\"},\"soort\":{\"field\":\"craft\\\\fields\\\\PlainText\",\"node\":\"soort\",\"default\":\"\"},\"description\":{\"field\":\"craft\\\\fields\\\\PlainText\",\"node\":\"description\",\"default\":\"\"},\"price\":{\"field\":\"craft\\\\fields\\\\Money\",\"node\":\"price\",\"options\":{\"localized\":\"\"},\"default\":\"\"}}', '{\"title\":\"\",\"slug\":\"\",\"enabled\":\"\",\"id\":\"\",\"merk\":\"\",\"soort\":\"1\",\"description\":\"\"}', 'vtmvaxwzhf', 1, 0, '2024-05-18 21:39:47', '2024-05-18 21:50:28', '77cc88dc-6296-40cb-8f0d-00ffb92db586');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
CREATE TABLE IF NOT EXISTS `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dawfulfuwvwnpkmojetbmqhbtebnnmwahbfh` (`dateDeleted`),
  KEY `idx_kxjzmtlcivzrnnvftssgexkhziqoynpsjvjz` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `config`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"fe619ec6-44c3-42c0-87e0-e95ccb0dc974\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"43b26182-c34e-4623-b177-7e32d0e6dee9\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"0ec5ae98-cd2e-4aa9-8d05-a71889120c48\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b3d2304b-f423-490c-a5c9-719f9bfcc2e8\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-17 13:44:17', '2024-05-17 13:44:17', '2024-05-18 21:34:21', 'abe8d044-e587-4757-88b9-ea7979a6d522'),
(2, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"06c67e2e-d236-4a42-a3eb-053b87b2ab82\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"7f180ef0-2920-41fb-a1ca-d81bbfe8253c\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"599cf7b2-f569-4efc-a9a0-d192392916a4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"42e7edf5-8640-4c7e-a9c1-12935ac9580e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b1cb8570-0af8-49f4-a072-b31cfe735988\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b0732feb-5bfa-4274-85ba-43f1736948c9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"d2930100-335c-47ed-9934-ca2c76e54f16\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"685d1f25-9518-4ae0-af58-7792cf56ee2b\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e55d4be9-a010-4072-b605-170ec7dcc2f0\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"73070154-2e5d-47ca-b899-69301fd074c9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"cc336e9f-0b95-477b-8228-f511d15140f2\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"af0c8043-23a6-4e95-80c4-a227821ecb0e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"723be697-4f69-4566-9a16-46be763d8156\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a0963bab-adf5-4a5c-af31-fac105d33a20\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c1301a7d-dc92-494c-ba91-175a1a8e411f\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"453ca11a-58bd-460d-ad06-e396d7f92542\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7dcb02f2-e42e-4938-b65a-c23f9090601b\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"49dd7690-de8b-4c4c-acf6-ea0bed781c88\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"22696a3d-b8c1-4508-870a-8d7bb8e97d49\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7f274b1f-e75a-4482-b11b-fb766655c7f8\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"74d7ab83-af58-49cf-be27-1645b1d0f9c8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0e72854b-8c3b-4835-8c77-2bad29d28ea8\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"18e627da-2d6c-426f-b38d-84c8218771fa\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0e4ebf1a-a242-45fb-9206-cad3057ccbc4\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"29362312-09d9-4840-be86-b36259f3ea9e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b604aca1-59d4-4e78-883d-b5ac1d8bee64\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-17 21:58:07', '2024-05-20 14:25:08', NULL, 'd9b547ab-d7a7-486a-8b7d-1adf23a24e0d'),
(3, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"8547747b-6532-4350-bbb6-602a3430723b\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0ba2c59b-a6b5-42ac-98a0-5e609047e800\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"d3d7ea17-7bc3-4fa0-909a-b11d23e3acc1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"af083550-14b3-4f68-b5f9-cf8385bc1def\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-17 22:16:47', '2024-05-17 22:39:56', NULL, '49766366-ba51-4c3e-898d-add330e40917'),
(4, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"68de04d9-d5ec-42b1-948e-adeb24cddd49\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"ce65af05-cf64-40ce-b836-11c6a5b8cce2\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"e45dd48b-de12-4c10-a80f-d4fbf0338032\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a2a38407-09ac-4efb-8029-5a2effc4b312\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-17 22:17:53', '2024-05-20 14:25:51', NULL, '9165d3ce-67b2-4896-811e-1035ec2ba383'),
(5, 'craft\\elements\\Asset', '{\"tabs\": [{\"uid\": \"5bd75ba6-47cf-4a04-b5fa-bb443f895fb8\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"bf37df30-470d-4a54-90b4-a6419c48632e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"411c72d7-1099-4200-a8cc-a4fa75c1ff5b\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-18 19:04:43', '2024-05-18 19:19:34', NULL, '738e8638-c534-42c9-b572-5a89c0ebec7b'),
(6, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"558c8426-0c72-4ae9-b8d0-b0b70909d1e6\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"43e8436d-bce1-41c4-8644-2e31b731b121\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7028ecad-3014-43e2-b223-a872366b97d6\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8d13ef9d-d968-4254-8eed-78bcb86b9a76\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b3d2304b-f423-490c-a5c9-719f9bfcc2e8\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c25749aa-bc71-4e34-b1e0-867d1d9960fa\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"503551c3-729b-4630-a072-c1121d331485\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"2e467574-6736-445e-ac8e-c74e6c87c2aa\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a6fcea98-619b-48a3-a423-6091162e0b38\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"ffc4a840-9720-4e4d-8975-0f2fba4c126c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ee419d88-11a8-4bdd-ad75-63badd6cf7c0\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"3f52278d-b2e7-4b45-9def-f511e46454b4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"24af3fe7-3a72-4ddf-95cf-4481152bbca4\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e5652917-52bb-45d1-a11f-28d211b19ffb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"d175920a-2bd8-4fe4-8ddd-19635c38a533\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-18 20:05:21', '2024-05-20 16:22:11', NULL, '100a4e9a-843a-4c72-b389-07f3808748bc'),
(7, 'craft\\elements\\Asset', '{\"tabs\": [{\"uid\": \"8a1b3aa1-7ab9-48e2-9ad1-c361056f5546\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"2ac5581a-2c64-4310-aff5-39882d301b38\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c1301a7d-dc92-494c-ba91-175a1a8e411f\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0a3e10b7-a7e5-40f9-8525-db79048afe9f\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-18 22:15:22', '2024-05-18 22:18:32', NULL, 'cb4522ff-825f-4952-b9c6-ca4988984bec'),
(8, 'craft\\elements\\Asset', '{\"tabs\": [{\"uid\": \"63f677d5-3d1e-41e3-a4fc-f4d69cb2d892\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"390402df-11b4-48ac-ad5e-11b8e093b65a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"856348ac-7d7e-4096-8537-f1004f6ff586\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"fa159b42-518a-48d4-b702-71e06640b98d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-20 11:21:29', '2024-05-20 11:21:29', '2024-05-20 11:26:50', '86565170-9503-4366-a829-0b1534c8bd85'),
(9, 'craft\\elements\\GlobalSet', '{\"tabs\": [{\"uid\": \"42caa8c6-307e-4dac-9877-1277509cb8cc\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"9a8dbeab-0dda-4cd8-8526-b7621e37d7a1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ec962417-3322-4da5-a5ad-df1967228a86\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-20 11:23:58', '2024-05-20 11:30:00', NULL, '8beb801c-1841-41d8-8a63-0f7ec9a2d686'),
(10, 'craft\\elements\\Asset', '{\"tabs\": [{\"uid\": \"b0de577d-c5f4-4efc-a4bd-ab25379a0258\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"e4e78bdc-26be-4455-865c-72d3d8fee37d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"d8c41e6b-23b4-4c8b-a84d-5d8b7e2c524f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ec962417-3322-4da5-a5ad-df1967228a86\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-20 11:48:43', '2024-05-20 11:55:57', NULL, 'c27ffe14-97d1-4023-818d-30f5a0839f20'),
(11, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"801d680b-b0a4-4316-9578-05a35c136ff2\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"061d08d3-ea7c-4226-904a-32ef8244d99e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"6beb16d9-e71f-4fb5-826a-c52b6a7a8857\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"51692670-1e8d-41c1-8cdd-83ed7aaf3d7a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"09198301-3e1d-45c3-9125-88769e8fff27\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"2237e7f9-e913-4911-9ff1-049aac15bc74\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-20 12:03:29', '2024-05-20 14:29:01', NULL, '8c7c2c85-2a81-48be-9c1c-305c428b6ee6'),
(12, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"0e4cc274-2f01-4acc-a1d7-3cb45a6b5b55\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"93cc74b7-0817-43d4-9f92-151bcfb44906\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"6ad40c30-c892-4bfd-8c85-342fea11c32f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"be983836-6554-4519-b171-a0260905f6a6\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8e49b995-dbfd-4e53-9f92-ded9be4edbd4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"f2746321-ef1e-4494-a19b-998823890d27\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-20 13:09:56', '2024-05-20 14:25:41', NULL, '9e8538cf-1023-4717-a8d6-5f0508a94791'),
(13, 'craft\\elements\\Asset', '{\"tabs\": [{\"uid\": \"034a0410-c6d5-4b9b-99d2-a288d4fe1ca7\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"c41cc2f3-7ea0-4364-bef4-97545f566191\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"f30875c5-c21b-48e8-87c8-26f41fa97835\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7028ecad-3014-43e2-b223-a872366b97d6\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-20 13:31:28', '2024-05-20 13:31:28', NULL, 'ad41d11e-5517-4edc-8d60-eef257134401');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fields`
--

DROP TABLE IF EXISTS `fields`;
CREATE TABLE IF NOT EXISTS `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_phfecvezqesozyyzewzktgmnicjluwhlbppx` (`handle`,`context`),
  KEY `idx_ozgguzhsnegggmggyhgehdzxcanbvnuacsml` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fields`
--

INSERT INTO `fields` (`id`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Merk', 'merk', 'global', NULL, 'Geef hier het merk van het product in', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":\"Product Name\",\"uiMode\":\"normal\"}', '2024-05-17 13:42:27', '2024-05-17 13:43:33', 'b3d2304b-f423-490c-a5c9-719f9bfcc2e8'),
(2, 'Soort', 'soort', 'global', NULL, 'Hierin geef je de naam van het product', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":\"Product naam\",\"uiMode\":\"normal\"}', '2024-05-17 22:05:47', '2024-05-18 20:06:40', '503551c3-729b-4630-a072-c1121d331485'),
(4, 'Voorraad', 'voorraad', 'global', NULL, 'Hierin geef je of het product op voorraad is of niet', 0, 'none', NULL, 'craft\\fields\\Number', '{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}', '2024-05-17 22:07:08', '2024-05-20 16:22:30', 'd175920a-2bd8-4fe4-8ddd-19635c38a533'),
(5, 'Description', 'description', 'global', NULL, 'Geef hierin de beschrijving van het product', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":250,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-17 22:08:12', '2024-05-18 20:06:56', 'a6fcea98-619b-48a3-a423-6091162e0b38'),
(6, 'Price', 'price', 'global', NULL, 'Geef hierin de prijs van het product', 0, 'none', NULL, 'craft\\fields\\Money', '{\"currency\":\"EUR\",\"defaultValue\":null,\"max\":null,\"min\":0,\"showCurrency\":true,\"size\":null}', '2024-05-17 22:08:50', '2024-05-18 20:07:49', 'ee419d88-11a8-4bdd-ad75-63badd6cf7c0'),
(7, 'Header Content', 'headerContent', 'global', NULL, 'Hierin steek je de contents van je navigatiebalk', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-17 22:37:56', '2024-05-17 22:37:56', 'af083550-14b3-4f68-b5f9-cf8385bc1def'),
(8, 'Footer Content', 'footerContent', 'global', NULL, 'Hierin steek je de content van je footer', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-17 22:39:12', '2024-05-17 22:39:12', 'a2a38407-09ac-4efb-8029-5a2effc4b312'),
(9, 'siteLogo', 'sitelogo', 'global', NULL, 'Dit is de logo van uw site', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2024-05-18 18:42:13', '2024-05-18 22:17:19', '7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d'),
(10, 'homepageTitle', 'homepagetitle', 'global', NULL, 'Dit is een titel ', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 18:43:02', '2024-05-18 18:43:02', 'b1cb8570-0af8-49f4-a072-b31cfe735988'),
(11, 'homepageDescription', 'homepagedescription', 'global', NULL, 'beschrijving onder je titel', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 18:43:33', '2024-05-18 18:43:33', '9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95'),
(12, 'homepageButtonLink', 'homepagebuttonlink', 'global', NULL, 'dit is de link van je button, verwijzing naar /producten', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 18:44:25', '2024-05-18 18:44:25', 'd2930100-335c-47ed-9934-ca2c76e54f16'),
(13, 'homepageButtonText', 'homepagebuttontext', 'global', NULL, 'Dit is je button en het tekst in je button', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 18:44:58', '2024-05-18 18:44:58', '685d1f25-9518-4ae0-af58-7792cf56ee2b'),
(14, 'infoTitle', 'infotitle', 'global', NULL, 'Dit is de titel voor het stukje info', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 19:46:02', '2024-05-18 19:46:02', 'e55d4be9-a010-4072-b605-170ec7dcc2f0'),
(15, 'infoDescription', 'infodescription', 'global', NULL, 'dit is eenbeschrijving van het stukje info', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 19:46:33', '2024-05-18 19:46:33', 'cc336e9f-0b95-477b-8228-f511d15140f2'),
(16, 'Image', 'image', 'global', NULL, 'Hierin steek je de foto van het product', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:aa18b816-e7a6-4e90-94ca-6cae62db99e9\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:aa18b816-e7a6-4e90-94ca-6cae62db99e9\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2024-05-18 20:07:31', '2024-05-20 13:34:49', '7028ecad-3014-43e2-b223-a872366b97d6'),
(17, 'contactTitleMail', 'contacttitlemail', 'global', NULL, 'De titel boven je email', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 22:04:52', '2024-05-18 22:04:52', '7dcb02f2-e42e-4938-b65a-c23f9090601b'),
(18, 'contactMail', 'contactmail', 'global', NULL, 'Je eigen mailadres ', 0, 'none', NULL, 'craft\\fields\\Email', '{\"placeholder\":null}', '2024-05-18 22:05:13', '2024-05-18 22:05:13', '49dd7690-de8b-4c4c-acf6-ea0bed781c88'),
(19, 'contactTitleTel', 'contacttitletel', 'global', NULL, 'Titel boven je telefoonnummer', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 22:05:41', '2024-05-18 22:05:41', '7f274b1f-e75a-4482-b11b-fb766655c7f8'),
(20, 'contactTel', 'contacttel', 'global', NULL, 'Je telefoonnummer', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 22:06:10', '2024-05-18 22:06:10', '0e4ebf1a-a242-45fb-9206-cad3057ccbc4'),
(21, 'contactTitleSocials', 'contacttitlesocials', 'global', NULL, 'Titel boven je socials', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 22:06:32', '2024-05-18 22:06:32', '0e72854b-8c3b-4835-8c77-2bad29d28ea8'),
(24, 'ContactImg', 'contactimg', 'global', NULL, 'Dit is de image van je contact sectie', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:7cb8b0db-c230-471d-bd63-642a532fc6de\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:7cb8b0db-c230-471d-bd63-642a532fc6de\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2024-05-18 22:17:49', '2024-05-18 22:17:49', 'c1301a7d-dc92-494c-ba91-175a1a8e411f'),
(25, 'ContactTitle', 'contacttitle', 'global', NULL, 'Je titel contact', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-18 22:24:23', '2024-05-18 22:24:23', '723be697-4f69-4566-9a16-46be763d8156'),
(27, 'BlackLogo', 'blacklogo', 'global', NULL, 'Dit is je zwarte logo voor lichtere achtergronden', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"restrictLocation\":false,\"restrictedLocationSource\":\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\",\"restrictedLocationSubpath\":null,\"allowSubfolders\":false,\"restrictedDefaultUploadSubpath\":null,\"defaultUploadLocationSource\":\"volume:9a77c145-c53b-44a4-bdb2-2dc307052d32\",\"defaultUploadLocationSubpath\":null,\"allowUploads\":true,\"restrictFiles\":false,\"allowedKinds\":null,\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"previewMode\":\"full\",\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"sources\":[\"volume:9a77c145-c53b-44a4-bdb2-2dc307052d32\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\",\"showCardsInGrid\":false,\"maintainHierarchy\":false,\"branchLimit\":null}', '2024-05-20 11:29:39', '2024-05-20 11:56:35', 'ec962417-3322-4da5-a5ad-df1967228a86'),
(28, 'ProductenTitle', 'productentitle', 'global', NULL, 'Dit is je titel van je pagina Producten', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-20 12:01:41', '2024-05-20 12:01:41', '6beb16d9-e71f-4fb5-826a-c52b6a7a8857'),
(29, 'ProductenDescription', 'productendescription', 'global', NULL, 'Dit is de beschrijving onder je producten titel', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-20 12:02:21', '2024-05-20 12:02:21', '09198301-3e1d-45c3-9125-88769e8fff27'),
(30, 'FormTitle', 'formtitle', 'global', NULL, 'Dit is de titel van je contact pagina', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-20 13:09:21', '2024-05-20 13:09:21', 'be983836-6554-4519-b171-a0260905f6a6'),
(31, 'FormDescription', 'formdescription', 'global', NULL, 'Dit is de beschrijving onder je contact title', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-20 13:09:44', '2024-05-20 13:09:44', 'f2746321-ef1e-4494-a19b-998823890d27'),
(32, 'topTitle', 'toptitle', 'global', NULL, 'Dit is een titel voor je top 3 producten', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-05-20 14:17:55', '2024-05-20 14:17:55', 'b604aca1-59d4-4e78-883d-b5ac1d8bee64');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_emailtemplates`
--

DROP TABLE IF EXISTS `formie_emailtemplates`;
CREATE TABLE IF NOT EXISTS `formie_emailtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_fieldlayouts`
--

DROP TABLE IF EXISTS `formie_fieldlayouts`;
CREATE TABLE IF NOT EXISTS `formie_fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `formie_fieldlayouts`
--

INSERT INTO `formie_fieldlayouts` (`id`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '2024-05-20 13:19:46', '2024-05-20 13:19:46', 'f0d963b3-c813-49c7-b040-6c5054fa8ed4'),
(2, '2024-05-20 13:20:24', '2024-05-20 13:20:24', 'c64e62b0-ce00-4b0a-ab42-8b234392e34c'),
(3, '2024-05-20 13:20:30', '2024-05-20 13:20:30', '40364657-c97c-4903-b0cb-aa222d3e6c92'),
(4, '2024-05-20 13:20:45', '2024-05-20 13:20:45', 'bc43d912-36e6-4c85-96b7-fe6675854072');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_fieldlayout_pages`
--

DROP TABLE IF EXISTS `formie_fieldlayout_pages`;
CREATE TABLE IF NOT EXISTS `formie_fieldlayout_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `label` text NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wgfgkvgahhenacsadjgfqpgfjgzawstxjgih` (`layoutId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `formie_fieldlayout_pages`
--

INSERT INTO `formie_fieldlayout_pages` (`id`, `layoutId`, `label`, `sortOrder`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Page 1', 0, '{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}', '2024-05-20 13:19:46', '2024-05-20 13:19:46', 'd30136d3-9c3c-4895-bba6-860bf1247b2c'),
(2, 2, 'Page 1', 0, '{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}', '2024-05-20 13:20:24', '2024-05-20 13:20:24', '679661e8-7128-43b8-b5c9-1f22f4b65821'),
(3, 3, 'Page 1', 0, '{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}', '2024-05-20 13:20:30', '2024-05-20 13:20:30', '42044fcf-8ffd-47ef-a585-3d66f9d68b92'),
(4, 4, 'Page 1', 0, '{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}', '2024-05-20 13:20:45', '2024-05-20 13:20:45', '8098e457-97f8-4346-aa39-c54ba1779241');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_fieldlayout_rows`
--

DROP TABLE IF EXISTS `formie_fieldlayout_rows`;
CREATE TABLE IF NOT EXISTS `formie_fieldlayout_rows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `pageId` int NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pzpvvtqvoshkovreqqtavigiezcyrvoqcrdg` (`layoutId`),
  KEY `idx_kddhcrtmfhjmqrwovulzmctrbpbemkboikad` (`pageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_fields`
--

DROP TABLE IF EXISTS `formie_fields`;
CREATE TABLE IF NOT EXISTS `formie_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `pageId` int NOT NULL,
  `rowId` int NOT NULL,
  `syncId` int DEFAULT NULL,
  `label` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acrgxekaejshcxhkibwdrmthuaezicepivqq` (`layoutId`),
  KEY `idx_unhlgggcdpazbpcgkghzeljvozxbxsyrauyw` (`pageId`),
  KEY `idx_tadudhiahepluftjgzifpfemrrvhixjhkdbi` (`rowId`),
  KEY `idx_mdvkkqrqiqmxkufbhnzlfgngdfbyvvrllilq` (`syncId`),
  KEY `idx_yemveyvafkctxpjgiwybvgjbqnivimcosopz` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_forms`
--

DROP TABLE IF EXISTS `formie_forms`;
CREATE TABLE IF NOT EXISTS `formie_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(64) NOT NULL,
  `settings` mediumtext,
  `layoutId` int DEFAULT NULL,
  `templateId` int DEFAULT NULL,
  `submitActionEntryId` int DEFAULT NULL,
  `submitActionEntrySiteId` int DEFAULT NULL,
  `defaultStatusId` int DEFAULT NULL,
  `dataRetention` enum('forever','minutes','hours','days','weeks','months','years') NOT NULL DEFAULT 'forever',
  `dataRetentionValue` int DEFAULT NULL,
  `userDeletedAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `fileUploadsAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wgoudiqdkwslbexipmwrlhajzinfwpoagxaa` (`layoutId`),
  KEY `idx_jvnmsfccrulqkxjtdqmnpzpriibpbvhlpiyt` (`templateId`),
  KEY `idx_gyqqoodmamehnebesszibjypbftupipnfyvy` (`defaultStatusId`),
  KEY `idx_neeqymdozodwlokukxwhvavmvthgdztjyhqt` (`submitActionEntryId`),
  KEY `idx_kgpfmfjpaeybacchxteyqoxibcsogbdgnliy` (`submitActionEntrySiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `formie_forms`
--

INSERT INTO `formie_forms` (`id`, `handle`, `settings`, `layoutId`, `templateId`, `submitActionEntryId`, `submitActionEntrySiteId`, `defaultStatusId`, `dataRetention`, `dataRetentionValue`, `userDeletedAction`, `fileUploadsAction`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(52, 'contactus', '{\"displayFormTitle\":false,\"displayCurrentPageTitle\":false,\"displayPageTabs\":false,\"displayPageProgress\":false,\"scrollToTop\":true,\"progressPosition\":\"end\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"requiredIndicator\":\"asterisk\",\"submitMethod\":null,\"submitAction\":null,\"submitActionTab\":null,\"submitActionUrl\":null,\"submitActionFormHide\":false,\"submitActionMessage\":[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"Submission saved.\"}]}],\"submitActionMessageTimeout\":null,\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":null,\"loadingIndicatorText\":null,\"validationOnSubmit\":true,\"validationOnFocus\":false,\"errorMessage\":[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"Couldn’t save submission due to errors.\"}]}],\"errorMessagePosition\":\"top-form\",\"requireUser\":false,\"requireUserMessage\":null,\"scheduleForm\":false,\"scheduleFormStart\":null,\"scheduleFormEnd\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormExpiredMessage\":null,\"limitSubmissions\":false,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"limitSubmissionsMessage\":null,\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"pageRedirectUrl\":null,\"defaultEmailTemplateId\":null,\"disableCaptchas\":false}', 1, NULL, NULL, NULL, NULL, 'forever', NULL, 'retain', 'retain', '2024-05-20 13:19:46', '2024-05-20 13:19:46', 'f9cc3917-dafa-4395-83d0-3673b563811c'),
(53, 'contactus', '{\"displayFormTitle\":false,\"displayCurrentPageTitle\":false,\"displayPageTabs\":false,\"displayPageProgress\":false,\"scrollToTop\":true,\"progressPosition\":\"end\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"requiredIndicator\":\"asterisk\",\"submitMethod\":null,\"submitAction\":null,\"submitActionTab\":null,\"submitActionUrl\":null,\"submitActionFormHide\":false,\"submitActionMessage\":[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"Submission saved.\"}]}],\"submitActionMessageTimeout\":null,\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":null,\"loadingIndicatorText\":null,\"validationOnSubmit\":true,\"validationOnFocus\":false,\"errorMessage\":[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"Couldn’t save submission due to errors.\"}]}],\"errorMessagePosition\":\"top-form\",\"requireUser\":false,\"requireUserMessage\":null,\"scheduleForm\":false,\"scheduleFormStart\":null,\"scheduleFormEnd\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormExpiredMessage\":null,\"limitSubmissions\":false,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"limitSubmissionsMessage\":null,\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"pageRedirectUrl\":null,\"defaultEmailTemplateId\":null,\"disableCaptchas\":false}', 4, NULL, NULL, NULL, NULL, 'forever', NULL, 'retain', 'retain', '2024-05-20 13:20:45', '2024-05-20 13:20:45', '4b1f601d-bacb-496f-89be-14f954913051');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_formtemplates`
--

DROP TABLE IF EXISTS `formie_formtemplates`;
CREATE TABLE IF NOT EXISTS `formie_formtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `useCustomTemplates` tinyint(1) DEFAULT '1',
  `outputCssLayout` tinyint(1) DEFAULT '1',
  `outputCssTheme` tinyint(1) DEFAULT '1',
  `outputJsBase` tinyint(1) DEFAULT '1',
  `outputJsTheme` tinyint(1) DEFAULT '1',
  `outputCssLocation` varchar(255) DEFAULT NULL,
  `outputJsLocation` varchar(255) DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_trzfntcwoiwgdpyjgtttyozuptzmsqbrvqpt` (`fieldLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_integrations`
--

DROP TABLE IF EXISTS `formie_integrations`;
CREATE TABLE IF NOT EXISTS `formie_integrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `settings` text,
  `cache` longtext,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_notifications`
--

DROP TABLE IF EXISTS `formie_notifications`;
CREATE TABLE IF NOT EXISTS `formie_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `templateId` int DEFAULT NULL,
  `pdfTemplateId` int DEFAULT NULL,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `subject` text,
  `recipients` enum('email','conditions') NOT NULL DEFAULT 'email',
  `to` text,
  `toConditions` text,
  `cc` text,
  `bcc` text,
  `replyTo` text,
  `replyToName` text,
  `from` text,
  `fromName` text,
  `sender` text,
  `content` text,
  `attachFiles` tinyint(1) DEFAULT '1',
  `attachPdf` tinyint(1) DEFAULT '0',
  `attachAssets` text,
  `enableConditions` tinyint(1) DEFAULT '0',
  `conditions` text,
  `customSettings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fbqifledgebkwoffezmigbafsbimwlcfndsd` (`formId`),
  KEY `idx_pkqtdiudhhnxezfcsrhukbopyazsrtorbrdb` (`templateId`),
  KEY `fk_tdbxlbpzytziyqmkwodradrrdumlslkoznnv` (`pdfTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_payments`
--

DROP TABLE IF EXISTS `formie_payments`;
CREATE TABLE IF NOT EXISTS `formie_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `submissionId` int NOT NULL,
  `fieldId` int NOT NULL,
  `subscriptionId` int DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text,
  `note` mediumtext,
  `response` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ffxecdwapcgropbkbysrbhnerhdcosdapdra` (`integrationId`),
  KEY `idx_tnkkhlpnenpiapjlghnatjkizlxidfkkquzn` (`fieldId`),
  KEY `idx_eofazwhygutqfkiusvfuhnrhwamyjktjslcn` (`reference`),
  KEY `fk_mkisfeqqmuxqqrmmvnxojtjygyobvobbfvxk` (`submissionId`),
  KEY `fk_izkbwfxzzamlishhplmjmfkkumppueanquri` (`subscriptionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_payments_plans`
--

DROP TABLE IF EXISTS `formie_payments_plans`;
CREATE TABLE IF NOT EXISTS `formie_payments_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mhrkfyrnoxdnstxihhkqjrkukfnxzfamnwat` (`handle`),
  KEY `idx_jqamfnslsmfcyeeuovfnyrkewzbjcguuugfk` (`integrationId`),
  KEY `idx_bcgozbxjpdixwoktuiazavaqetpcajdlaxpe` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_payments_subscriptions`
--

DROP TABLE IF EXISTS `formie_payments_subscriptions`;
CREATE TABLE IF NOT EXISTS `formie_payments_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int DEFAULT NULL,
  `submissionId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `planId` int DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text,
  `trialDays` int NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT '1',
  `isSuspended` tinyint(1) NOT NULL DEFAULT '0',
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sbosrlfqevxfmnoeblrowykfcgkkvouqctcg` (`integrationId`),
  KEY `idx_uxgpfddvbzxxxysyociwivqhdqvolidwzjiz` (`submissionId`),
  KEY `idx_hnwdrzewaltbsxzigzzsgavvxaeckszbvheg` (`fieldId`),
  KEY `idx_xoaajqeeoblrelbawarajaqgvvnkgfhejvci` (`planId`),
  KEY `idx_icdgtavzjdgqtkvdfqnlmggekbwtkoojxbtr` (`reference`),
  KEY `idx_fhqxpyaycdukryzbvguyiljmkzdgxdenmwry` (`nextPaymentDate`),
  KEY `idx_hexclzmkidgctnywvfmdqnawsyzbyiinlyvp` (`dateExpired`),
  KEY `idx_xbtrvxhqtbrhoeymotkjgwpnjicdmnlyjeme` (`dateExpired`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_pdftemplates`
--

DROP TABLE IF EXISTS `formie_pdftemplates`;
CREATE TABLE IF NOT EXISTS `formie_pdftemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `filenameFormat` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_relations`
--

DROP TABLE IF EXISTS `formie_relations`;
CREATE TABLE IF NOT EXISTS `formie_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vkejjkupdcatmvagyhtmoobzunohjgovcdrz` (`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_paeyzknpqpqnklatxrtzjikqcvzvzuocnkma` (`sourceId`),
  KEY `idx_ytegqnganelodrimwbjcscagytxdojovtbet` (`targetId`),
  KEY `idx_atehwxnddsoncnjazltpmfqmsuzxuttiszdv` (`sourceSiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_sentnotifications`
--

DROP TABLE IF EXISTS `formie_sentnotifications`;
CREATE TABLE IF NOT EXISTS `formie_sentnotifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `formId` int DEFAULT NULL,
  `submissionId` int DEFAULT NULL,
  `notificationId` int DEFAULT NULL,
  `subject` text,
  `to` text,
  `cc` text,
  `bcc` text,
  `replyTo` text,
  `replyToName` text,
  `from` text,
  `fromName` text,
  `sender` text,
  `body` mediumtext,
  `htmlBody` mediumtext,
  `info` text,
  `success` tinyint(1) DEFAULT NULL,
  `message` text,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cnbsbkevpirecfqckyyinhubxgrdpjjlyxui` (`formId`),
  KEY `fk_zpedcmbbpneteysvooqmbxwzkjtxgyegbigt` (`submissionId`),
  KEY `fk_apbpyezuuvybrosvajmfddyqsxjbsrckjdsj` (`notificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_statuses`
--

DROP TABLE IF EXISTS `formie_statuses`;
CREATE TABLE IF NOT EXISTS `formie_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `formie_statuses`
--

INSERT INTO `formie_statuses` (`id`, `name`, `handle`, `color`, `description`, `sortOrder`, `isDefault`, `dateDeleted`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'New', 'new', 'green', NULL, 1, 1, NULL, '2024-05-20 13:18:38', '2024-05-20 13:18:38', 'f35a1087-1bdc-4c52-beb4-47b65b821e6c');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_stencils`
--

DROP TABLE IF EXISTS `formie_stencils`;
CREATE TABLE IF NOT EXISTS `formie_stencils` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `data` mediumtext,
  `templateId` int DEFAULT NULL,
  `submitActionEntryId` int DEFAULT NULL,
  `submitActionEntrySiteId` int DEFAULT NULL,
  `defaultStatusId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mhxiemysgcjrjofjxzfigpquyjnhqrnptgjo` (`templateId`),
  KEY `idx_nesgrmxkayhvfufhcjrrrfggsuxfizqlnice` (`defaultStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `formie_stencils`
--

INSERT INTO `formie_stencils` (`id`, `name`, `handle`, `data`, `templateId`, `submitActionEntryId`, `submitActionEntrySiteId`, `defaultStatusId`, `dateDeleted`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Contact Form', 'contactForm', '{\"notifications\":[{\"attachFiles\":true,\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enabled\":true,\"name\":\"Admin Notification\",\"replyTo\":\"{field:emailAddress}\",\"subject\":\"A new submission was made on \\\"{formName}\\\"\",\"to\":\"{systemEmail}\"},{\"attachFiles\":true,\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enabled\":true,\"name\":\"User Notification\",\"replyTo\":null,\"subject\":\"Thanks for contacting us!\",\"to\":\"{field:emailAddress}\"}],\"pages\":[{\"label\":\"Page 1\",\"settings\":{\"submitButtonLabel\":\"Contact us\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\"},\"rows\":[{\"fields\":[{\"type\":\"verbb\\\\formie\\\\fields\\\\Name\",\"settings\":{\"useMultipleFields\":true,\"instructions\":\"Please enter your full name.\",\"enabled\":true,\"required\":false,\"placeholder\":\"Your name\",\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"label\":\"Your Name\",\"handle\":\"yourName\",\"rows\":[{\"fields\":[{\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NamePrefix\",\"settings\":{\"enabled\":false,\"required\":false,\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"honorific-prefix\"}],\"options\":[{\"label\":\"Select an option\",\"value\":\"\",\"isDefault\":true,\"isOptgroup\":false}],\"label\":\"Prefix\",\"handle\":\"prefix\"}},{\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameFirst\",\"settings\":{\"enabled\":true,\"required\":true,\"placeholder\":\"e.g. Peter\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"given-name\"}],\"label\":\"First Name\",\"handle\":\"firstName\"}},{\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameMiddle\",\"settings\":{\"enabled\":false,\"required\":false,\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"additional-name\"}],\"label\":\"Middle Name\",\"handle\":\"middleName\"}},{\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameLast\",\"settings\":{\"enabled\":true,\"required\":true,\"placeholder\":\"e.g. Sherman\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"family-name\"}],\"label\":\"Last Name\",\"handle\":\"lastName\"}}]}]}}]},{\"fields\":[{\"type\":\"verbb\\\\formie\\\\fields\\\\Email\",\"settings\":{\"instructions\":\"Please enter your email so we can get in touch.\",\"enabled\":true,\"required\":true,\"placeholder\":\"e.g. psherman@wallaby.com\",\"label\":\"Email Address\",\"handle\":\"emailAddress\"}}]},{\"fields\":[{\"type\":\"verbb\\\\formie\\\\fields\\\\MultiLineText\",\"settings\":{\"instructions\":\"Please enter your comments.\",\"enabled\":true,\"required\":true,\"placeholder\":\"e.g. The reason for my enquiry is...\",\"label\":\"Message\",\"handle\":\"message\"}}]}]}],\"settings\":{\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"loadingIndicator\":\"spinner\",\"progressPosition\":\"end\",\"submissionTitleFormat\":\"{timestamp}\",\"submitAction\":\"message\",\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\",\"submitActionMessagePosition\":\"top-form\",\"submitMethod\":\"ajax\",\"validationOnFocus\":\"1\",\"validationOnSubmit\":\"1\"}}', NULL, NULL, NULL, 1, NULL, '2024-05-20 13:18:39', '2024-05-20 13:18:39', 'cdaa359a-7a01-46a9-a621-786da92af95a');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `formie_submissions`
--

DROP TABLE IF EXISTS `formie_submissions`;
CREATE TABLE IF NOT EXISTS `formie_submissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` json DEFAULT NULL,
  `formId` int NOT NULL,
  `statusId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `isIncomplete` tinyint(1) DEFAULT '0',
  `isSpam` tinyint(1) DEFAULT '0',
  `spamReason` text,
  `spamClass` varchar(255) DEFAULT NULL,
  `snapshot` text,
  `ipAddress` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nltqrjqfsigcabqdvwzrqdvtpjfxvqffkgja` (`formId`),
  KEY `idx_ghjceidsflxtzxzdedhzdyvsyrbnhrnjvioc` (`statusId`),
  KEY `idx_tggczjsesddqgvujpmuwrztrvsrpmtgzfyyj` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
CREATE TABLE IF NOT EXISTS `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fqmfzvfobhpollqjrfixqadltugqwzhpuwly` (`name`),
  KEY `idx_mgcqzffrddpluwetvzetjmwtilkpexbacxnp` (`handle`),
  KEY `idx_xfmqvhvjfcxyaaouwkvwlbgrinibilcbdwir` (`fieldLayoutId`),
  KEY `idx_kalwabsvbmejvzejoycnfwybczladtchzreu` (`sortOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `globalsets`
--

INSERT INTO `globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(41, 'blackLogo', 'blacklogo', 9, 1, '2024-05-20 11:23:58', '2024-05-20 11:23:58', 'd2572f0c-cf70-42cc-b297-2f25a7076fa6');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
CREATE TABLE IF NOT EXISTS `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gqlschemas`
--

INSERT INTO `gqlschemas` (`id`, `name`, `scope`, `isPublic`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Schema', '[]', 1, '2024-05-20 16:13:05', '2024-05-20 16:13:05', '7e83d19b-9f19-4664-a036-9ed99d691b97');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
CREATE TABLE IF NOT EXISTS `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ogbibupwwygmtqxtvqwozxaidgtbuxcicjnj` (`accessToken`),
  UNIQUE KEY `idx_ddovboujtkjnyjvtsrukgylcjhfzsyyvwyes` (`name`),
  KEY `fk_gfjnjjbzvfcwywcikzygkdbtorcivssjgduc` (`schemaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
CREATE TABLE IF NOT EXISTS `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zxhbbnxftahbumkezkhyzruqcabzephlzepg` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `imagetransformindex`
--

INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 77, 'craft\\imagetransforms\\ImageTransformer', 'CentellaMask800.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:02:13', '2024-05-21 07:02:13', '2024-05-21 07:02:13', 'd7a1b05b-014f-4c2b-bb4a-f69767fe5208'),
(2, 77, 'craft\\imagetransforms\\ImageTransformer', 'CentellaMask800.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:02:13', '2024-05-21 07:02:13', '2024-05-21 07:02:13', 'ba29a417-6cbc-4a74-9643-cd5b8d8f1a37'),
(3, 87, 'craft\\imagetransforms\\ImageTransformer', 'iunikcntellamask2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:02:13', '2024-05-21 07:02:13', '2024-05-21 07:02:13', '7592b999-7af3-4182-bb03-020fe692a82a'),
(4, 87, 'craft\\imagetransforms\\ImageTransformer', 'iunikcntellamask2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:02:13', '2024-05-21 07:02:13', '2024-05-21 07:02:13', '6a037c16-420b-46fe-8308-329c18a0e222'),
(5, 102, 'craft\\imagetransforms\\ImageTransformer', 'Screenshot_89_400x-1.webp', NULL, '_20x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '8efb3d18-8a4d-4510-af88-041e636eb6d1'),
(6, 102, 'craft\\imagetransforms\\ImageTransformer', 'Screenshot_89_400x-1.webp', NULL, '_41x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '45b13883-3287-4de6-936e-dfb6ab84ae82'),
(7, 101, 'craft\\imagetransforms\\ImageTransformer', 'Screenshot_78_2000x.webp', NULL, '_23x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', 'fa9ffcc2-8bf4-40ae-b8c2-a80c83c8f84d'),
(8, 101, 'craft\\imagetransforms\\ImageTransformer', 'Screenshot_78_2000x.webp', NULL, '_47x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '470b94a3-622a-4ac8-b740-c9483465ca7e'),
(9, 100, 'craft\\imagetransforms\\ImageTransformer', 'rose2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '17fd0e07-eeb7-4c1e-ab5a-bbc578c6dfa3'),
(10, 100, 'craft\\imagetransforms\\ImageTransformer', 'rose2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', 'd8d1b3ea-9595-47ed-af42-f15a2874031c'),
(11, 99, 'craft\\imagetransforms\\ImageTransformer', 'rose.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '78bfc54b-2405-439c-8a09-ff6825d914ee'),
(12, 99, 'craft\\imagetransforms\\ImageTransformer', 'rose.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', 'd4a4bd9f-89c3-4426-aaea-8f0455732934'),
(13, 98, 'craft\\imagetransforms\\ImageTransformer', 'misshatimerevart2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '6e79b808-a3a2-4be5-8153-29078bc18a6f'),
(14, 98, 'craft\\imagetransforms\\ImageTransformer', 'misshatimerevart2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '5c8d9f6f-363b-4c57-9fa3-c0fefb974691'),
(15, 97, 'craft\\imagetransforms\\ImageTransformer', 'misshatimerevart.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', 'f247ff6a-1d8b-4267-8054-3ac15c0f6d45'),
(16, 97, 'craft\\imagetransforms\\ImageTransformer', 'misshatimerevart.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', 'e5172e4e-810b-4b91-8f99-1c6127578d7e'),
(17, 96, 'craft\\imagetransforms\\ImageTransformer', 'misshatimerev2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '9fe78f6a-f003-411f-ae11-a5eed828029d'),
(18, 96, 'craft\\imagetransforms\\ImageTransformer', 'misshatimerev2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', 'c01ddb0c-8b29-4d19-926c-9a0a90719d5d'),
(19, 95, 'craft\\imagetransforms\\ImageTransformer', 'misshatimerev.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', 'bedbb1f0-e1af-4a55-86f1-c0f046591710'),
(20, 95, 'craft\\imagetransforms\\ImageTransformer', 'misshatimerev.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '50fed8e7-23eb-4042-85f3-9d6a049c3c7c'),
(21, 94, 'craft\\imagetransforms\\ImageTransformer', 'misshathefirst2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '21d95513-f707-47a4-ab4c-0370e7654e8e'),
(22, 94, 'craft\\imagetransforms\\ImageTransformer', 'misshathefirst2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '43897e2d-219c-4dbf-8866-bde0af4d7a4d'),
(23, 93, 'craft\\imagetransforms\\ImageTransformer', 'misshathefirst.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '5b7e0f14-e763-4935-84a9-79844e14841b'),
(24, 93, 'craft\\imagetransforms\\ImageTransformer', 'misshathefirst.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '22de289e-512b-4ca9-9156-6fcab437623f'),
(25, 89, 'craft\\imagetransforms\\ImageTransformer', 'iunikprop2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '9e9182e2-63a3-4819-889f-b0a2bb566e7b'),
(26, 89, 'craft\\imagetransforms\\ImageTransformer', 'iunikprop2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '4fd13f2b-683a-4c02-8ce8-ec985bee151c'),
(27, 88, 'craft\\imagetransforms\\ImageTransformer', 'iunikprop.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '7b9d2e8f-d098-40c5-ac24-3788f4a2feeb'),
(28, 88, 'craft\\imagetransforms\\ImageTransformer', 'iunikprop.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '48419688-a860-447b-bae7-d94b7de07c7f'),
(29, 86, 'craft\\imagetransforms\\ImageTransformer', 'iunikcetnella.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2e780263-3048-4e5d-9384-6e2ae1b27ea8'),
(30, 86, 'craft\\imagetransforms\\ImageTransformer', 'iunikcetnella.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', 'b2f12784-0dfa-4905-bf5b-50c546eecf8a'),
(31, 85, 'craft\\imagetransforms\\ImageTransformer', 'iunikcentella2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '333d829c-9b75-4a2f-9398-a8a065f4dbc5'),
(32, 85, 'craft\\imagetransforms\\ImageTransformer', 'iunikcentella2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '099fd781-620c-4dbf-8a4a-df07aae4fb63'),
(33, 84, 'craft\\imagetransforms\\ImageTransformer', 'hydriumcentellacosrx2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '795ec5d2-ed34-46a7-b258-685ee61f1916'),
(34, 84, 'craft\\imagetransforms\\ImageTransformer', 'hydriumcentellacosrx2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '5abd37bc-1f63-44e5-94ce-80014e1064cb'),
(35, 82, 'craft\\imagetransforms\\ImageTransformer', 'DynastyCreamBOJ.jpg', NULL, '_30x26_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '53083e15-87d5-4db1-ba75-f1c79ef1f816'),
(36, 82, 'craft\\imagetransforms\\ImageTransformer', 'DynastyCreamBOJ.jpg', NULL, '_60x53_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:28:59', '76a95058-3c29-4ea8-a2eb-a11d1b4db48b'),
(37, 83, 'craft\\imagetransforms\\ImageTransformer', 'hydriumcentellacosrx.jpg', NULL, '_30x29_crop_center-center_none', 1, 0, 0, '2024-05-21 07:28:59', '2024-05-21 07:28:59', '2024-05-21 07:29:00', '57cb9dfe-5057-4393-89e6-044f0ab14906'),
(38, 83, 'craft\\imagetransforms\\ImageTransformer', 'hydriumcentellacosrx.jpg', NULL, '_60x59_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '34f1f72f-f00b-4836-8090-65cdba472ec4'),
(39, 81, 'craft\\imagetransforms\\ImageTransformer', 'DynastyCreamBIJ2.jpg', NULL, '_30x27_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'eedaca67-884c-49c2-82b2-fd037876f3a7'),
(40, 81, 'craft\\imagetransforms\\ImageTransformer', 'DynastyCreamBIJ2.jpg', NULL, '_60x55_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '118f5b00-f967-4dc8-97c7-baae4b57dc96'),
(41, 80, 'craft\\imagetransforms\\ImageTransformer', 'DynastyCream2.webp', NULL, '_30x26_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2af766b0-296e-4a94-b726-46a534e69fd3'),
(42, 80, 'craft\\imagetransforms\\ImageTransformer', 'DynastyCream2.webp', NULL, '_60x53_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'aa5101e1-0f04-49f1-a550-50b81ce3534f'),
(43, 79, 'craft\\imagetransforms\\ImageTransformer', 'cosrxlowph2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'fce25173-9e39-409a-9bb6-55d3bd46a708'),
(44, 79, 'craft\\imagetransforms\\ImageTransformer', 'cosrxlowph2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'cd9ee92b-2456-485c-8c8e-a36a1f9724ac'),
(45, 78, 'craft\\imagetransforms\\ImageTransformer', 'cosrxlowph.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '89af6508-1473-4ec5-8d44-c29c400764eb'),
(46, 78, 'craft\\imagetransforms\\ImageTransformer', 'cosrxlowph.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'bf42627a-cd64-415f-a719-83cf8b4aee16'),
(47, 76, 'craft\\imagetransforms\\ImageTransformer', 'beaytyjosrepairserum2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'c4c86f4e-a594-4b23-9b27-ec9e322b2670'),
(48, 76, 'craft\\imagetransforms\\ImageTransformer', 'beaytyjosrepairserum2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '9b92b84f-7e71-43f1-aa63-5ff2ee68080b'),
(49, 75, 'craft\\imagetransforms\\ImageTransformer', 'beautyjosrepairserum.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '21ad4569-9579-4090-bf8f-f573dfe9531d'),
(50, 75, 'craft\\imagetransforms\\ImageTransformer', 'beautyjosrepairserum.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '5aeabf75-51e1-4e1e-885c-75171a9f5210'),
(51, 74, 'craft\\imagetransforms\\ImageTransformer', 'beautyjosradiance2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '3a56e4f1-53d7-4058-816f-81ffd7a5322f'),
(52, 74, 'craft\\imagetransforms\\ImageTransformer', 'beautyjosradiance2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '6f1b95ae-72b0-4bba-9c20-f8ae2dc5fe7d'),
(53, 72, 'craft\\imagetransforms\\ImageTransformer', 'axisyquinoa2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2b7c5380-4e02-421b-b269-51dbf2fe5fdd'),
(54, 72, 'craft\\imagetransforms\\ImageTransformer', 'axisyquinoa2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'd0d4105a-1532-4478-9650-b25791010ba8'),
(55, 73, 'craft\\imagetransforms\\ImageTransformer', 'beautyjosradiance.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '01522ac2-6159-4470-b58a-215d447534f7'),
(56, 73, 'craft\\imagetransforms\\ImageTransformer', 'beautyjosradiance.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'c0dabfe9-7999-4c08-ac4c-09533ec89dbb'),
(57, 71, 'craft\\imagetransforms\\ImageTransformer', 'axisyquinoa.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '1065004a-c116-48f9-93ec-61af802df636'),
(58, 71, 'craft\\imagetransforms\\ImageTransformer', 'axisyquinoa.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'a9a3438f-7a53-4c74-8d5a-8d66138fc48b'),
(59, 70, 'craft\\imagetransforms\\ImageTransformer', 'axisymugwort2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2f1806eb-21b9-47d5-a220-cf245706739b'),
(60, 70, 'craft\\imagetransforms\\ImageTransformer', 'axisymugwort2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2823140f-4c18-4332-97ed-a0cf4927a1cf'),
(61, 69, 'craft\\imagetransforms\\ImageTransformer', 'axisymugwort.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '5b1e6643-961d-4177-a918-8584637b5cc6'),
(62, 69, 'craft\\imagetransforms\\ImageTransformer', 'axisymugwort.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '71696c0f-8c18-4b02-88c3-c7fd6899ff8f'),
(63, 68, 'craft\\imagetransforms\\ImageTransformer', 'axisydarkspot2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '38963699-188f-4f53-8be5-d626ab581e07'),
(64, 68, 'craft\\imagetransforms\\ImageTransformer', 'axisydarkspot2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '917e6283-5677-48fc-8f63-855d3508211c'),
(65, 67, 'craft\\imagetransforms\\ImageTransformer', 'axisydarkspot.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'ec6a59ce-8653-478d-9654-a65a5b568adf'),
(66, 67, 'craft\\imagetransforms\\ImageTransformer', 'axisydarkspot.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '216d7b04-c168-436b-b032-16f3528ca445'),
(67, 66, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleafpad2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'f799fac0-6870-4a97-b8e5-6731b93f4e9a'),
(68, 66, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleafpad2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'c83345ad-3598-43da-aa9d-873ef5ee1b93'),
(69, 65, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleafpad.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '886543ee-b228-4014-b5e7-090369775ed7'),
(70, 65, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleafpad.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '42195817-35c0-4ae9-84f5-c7b6ada52538'),
(71, 64, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleafmaskmain.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '05ebf481-d93d-4978-8328-8e0ed46216a5'),
(72, 64, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleafmaskmain.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'fba59e3e-3c77-47a8-b0da-043f94072ee0'),
(73, 63, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleafmask2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '5eb9b046-169e-435c-bcc2-bba12972f198'),
(74, 63, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleafmask2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2cfb6984-2638-485c-9ab1-72829c0139bc'),
(75, 62, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleaf2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'df06952e-4ab3-479d-8233-15217f62efee'),
(76, 62, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleaf2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'd92e27b9-9afd-4fe1-9465-44a919735194'),
(77, 61, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleaf.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '13d29e7a-611f-489d-93fa-78ded6c20cad'),
(78, 61, 'craft\\imagetransforms\\ImageTransformer', 'anuaheartleaf.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '18396c2d-1d6d-4f06-b4c6-8c7d32667ceb'),
(79, 60, 'craft\\imagetransforms\\ImageTransformer', 'aiony-haust-f2ar0ltTvaI-unsplash.png', NULL, '_30x16_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '272b4247-f0de-43a0-968d-991b8e4e342e'),
(80, 60, 'craft\\imagetransforms\\ImageTransformer', 'aiony-haust-f2ar0ltTvaI-unsplash.png', NULL, '_60x33_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '1cb8ea07-82b4-4fd7-b3f3-6cb8d80ff91b'),
(81, 59, 'craft\\imagetransforms\\ImageTransformer', 'aiony-haust-f2ar0ltTvaI-unsplash-copy.png', NULL, '_30x16_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'bcbaff55-4c0b-43d4-8907-19dc574ab66b'),
(82, 59, 'craft\\imagetransforms\\ImageTransformer', 'aiony-haust-f2ar0ltTvaI-unsplash-copy.png', NULL, '_60x33_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '10a61d5e-5b2e-4013-934b-eeb522d7f872'),
(83, 58, 'craft\\imagetransforms\\ImageTransformer', 'AdvancedsnailCOSRX.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'f2bf501c-6862-4e0d-aa73-eb329d3e2354'),
(84, 58, 'craft\\imagetransforms\\ImageTransformer', 'AdvancedsnailCOSRX.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'a9635430-2b02-414b-87f9-12ebf4b81a35'),
(85, 57, 'craft\\imagetransforms\\ImageTransformer', 'advancedsnailcosrc2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'ec1cd5b1-7d95-4659-afe9-02ddc52c4b32'),
(86, 57, 'craft\\imagetransforms\\ImageTransformer', 'advancedsnailcosrc2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '8f6c9004-3334-4872-a177-1e206c7e183c'),
(87, 56, 'craft\\imagetransforms\\ImageTransformer', 'AcnePimpleCOSRX2.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', 'e1d6795d-7c7f-4e12-a08c-9c8a09c29ede'),
(88, 56, 'craft\\imagetransforms\\ImageTransformer', 'AcnePimpleCOSRX2.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '297be7c6-63db-4c8a-a50e-10af34ed5514'),
(89, 55, 'craft\\imagetransforms\\ImageTransformer', 'AcnePimpleCOSRX.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '49507477-65e5-481a-bfeb-78b10b768f9c'),
(90, 55, 'craft\\imagetransforms\\ImageTransformer', 'AcnePimpleCOSRX.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-21 07:29:00', '2024-05-21 07:29:00', '2024-05-21 07:29:00', '99da1649-c358-440a-9ed3-42ff4df27ab5');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
CREATE TABLE IF NOT EXISTS `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aguktvzdewblnexqwsorjwnuntrrzvameadu` (`name`),
  KEY `idx_uuwebfraghziofuczestbdvfemduegiggfuo` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `info`
--

DROP TABLE IF EXISTS `info`;
CREATE TABLE IF NOT EXISTS `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '5.1.4', '5.0.0.20', 0, 'rchihsvrwker', '3@xrjqwsbjob', '2024-05-16 18:35:01', '2024-05-20 17:58:06', '0dc5a536-feb2-45a3-acc2-3219856a27da');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pwqwxjttldkkcohsfgmeuiptebvldnzrfbiu` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '6cd563ec-7585-42d0-9c1e-e9ee587f3de2'),
(2, 'craft', 'm221101_115859_create_entries_authors_table', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '08cb3571-8231-4e3b-a4d4-98c0eb3b5343'),
(3, 'craft', 'm221107_112121_add_max_authors_to_sections', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '5978b4b4-1aaf-488b-92b3-ba1db4263cdf'),
(4, 'craft', 'm221205_082005_translatable_asset_alt_text', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'ef548055-9777-4240-ad62-e361617a1c07'),
(5, 'craft', 'm230314_110309_add_authenticator_table', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '68b3fbd9-115f-4de3-990a-24990e7f201e'),
(6, 'craft', 'm230314_111234_add_webauthn_table', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'b4df24bf-ef56-411f-a34f-739fcedca5d3'),
(7, 'craft', 'm230503_120303_add_recoverycodes_table', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2b105f32-b91b-4275-80ec-1eef3f1c6aef'),
(8, 'craft', 'm230511_000000_field_layout_configs', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '239ba177-0b0e-45c9-8909-9b1fd9eacd71'),
(9, 'craft', 'm230511_215903_content_refactor', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '7114aef6-dede-499d-a678-e3063bfbf283'),
(10, 'craft', 'm230524_000000_add_entry_type_show_slug_field', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'eb54a1d6-fb3f-41b3-91ea-d282e1fc8e09'),
(11, 'craft', 'm230524_000001_entry_type_icons', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'aae1b6c4-2fa0-4f23-8833-fce53a5012ab'),
(12, 'craft', 'm230524_000002_entry_type_colors', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '6c518e64-56bc-4c86-bf38-9575d2a033e2'),
(13, 'craft', 'm230524_220029_global_entry_types', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'e568b7e6-a919-44ea-9d5b-62aef9e13978'),
(14, 'craft', 'm230531_123004_add_entry_type_show_status_field', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'aaff2a71-4167-4c91-88b5-bbd642c12f10'),
(15, 'craft', 'm230607_102049_add_entrytype_slug_translation_columns', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'f1e12f8c-3f40-449e-b50e-2a3eead61b7a'),
(16, 'craft', 'm230616_173810_kill_field_groups', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'ec21b029-7434-4a3d-9f3e-63b3c90aa454'),
(17, 'craft', 'm230616_183820_remove_field_name_limit', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'fd040301-9468-4c8d-ad60-8b65a7fd3f33'),
(18, 'craft', 'm230617_070415_entrify_matrix_blocks', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '0fc9a80d-b5cf-49bf-86ea-48cdc8a09643'),
(19, 'craft', 'm230710_162700_element_activity', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'eb33ec14-df50-42bd-94ee-fd7903fdc36c'),
(20, 'craft', 'm230820_162023_fix_cache_id_type', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '4f2c0a65-e30a-42f9-8048-32e0cf5897b1'),
(21, 'craft', 'm230826_094050_fix_session_id_type', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '967a8fde-5572-4f07-8a65-3f868f050379'),
(22, 'craft', 'm230904_190356_address_fields', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '3d209679-5984-4ceb-b546-ea59b7e6c945'),
(23, 'craft', 'm230928_144045_add_subpath_to_volumes', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '521ce9cd-e06e-43fe-8e7f-027f3dc6dc6c'),
(24, 'craft', 'm231013_185640_changedfields_amend_primary_key', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '6058bdf4-ffd3-4b40-872b-969faedec091'),
(25, 'craft', 'm231213_030600_element_bulk_ops', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '7a0ea8ab-53c0-472c-98f3-9593ad7a5271'),
(26, 'craft', 'm240129_150719_sites_language_amend_length', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '3e4d5a62-8a51-4ad2-91af-f73d70ce1486'),
(27, 'craft', 'm240206_035135_convert_json_columns', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', 'b78eff8e-ae27-486c-a0fe-9bcaafab9727'),
(28, 'craft', 'm240207_182452_address_line_3', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '61499a82-474f-4018-982f-c79bff60d7a6'),
(29, 'craft', 'm240302_212719_solo_preview_targets', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '3ea72536-bdc1-43fa-be39-055fb88a4dab'),
(30, 'plugin:feed-me', 'Install', '2024-05-18 21:26:35', '2024-05-18 21:26:35', '2024-05-18 21:26:35', '6d6a2750-7347-48db-9425-81cbcca9d1da'),
(31, 'plugin:feed-me', 'm230123_152413_set_empty_values', '2024-05-18 21:26:35', '2024-05-18 21:26:35', '2024-05-18 21:26:35', '97326102-160a-4c6d-804b-1045b6e60919'),
(32, 'plugin:navigate', 'Install', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '9476f38d-a1a6-4bcb-b1a7-4066bb5ff49b'),
(33, 'plugin:navigate', 'm180705_164128_relateNodes', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '4cc6db5c-3c85-4220-86a9-c81ac1a514f0'),
(34, 'plugin:navigate', 'm180720_174411_removeDefaultTypeField', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '2024-05-20 12:22:15', 'd0607b62-af70-4d9b-a192-0699ed19929e'),
(35, 'plugin:navigate', 'm180813_182019_addIndexes', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '2024-05-20 12:22:15', 'e407497b-58b0-49cc-a73f-cf86901d693d'),
(36, 'plugin:navigate', 'm190829_193907_addEnabledSiteGroupsOption', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '4dc10559-438b-4b84-b43d-511e85622f72'),
(37, 'module:verbb-auth', 'm221127_000000_install', '2024-05-20 13:18:30', '2024-05-20 13:18:30', '2024-05-20 13:18:30', 'bd9fbffd-9742-42c9-a643-c666247f99e8'),
(38, 'plugin:formie', 'Install', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', 'd89af14d-a192-4b58-8374-89390181f012'),
(39, 'plugin:formie', 'm231125_000000_craft5', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '3c0edc86-4d36-4698-b196-084b3bbeee68'),
(40, 'plugin:formie', 'm231129_000000_integrations_mapping', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', 'bc9434f5-f6d9-43f5-b49e-84b45e0e466a'),
(41, 'plugin:formie', 'm231130_000000_conditions_mapping', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '8ec8a697-3a27-44be-abc7-ed9130703f85'),
(42, 'plugin:formie', 'm231202_000000_auth_module', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '39f01f76-9f56-4aac-b9e7-2309b3305b05'),
(43, 'plugin:formie', 'm240130_000000_permissions', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '4d7d4de3-fdf2-4e9a-b8e8-0620dde13844'),
(44, 'plugin:formie', 'm240313_000000_subfields', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', 'ea703595-63a5-4328-a411-5667e904e367'),
(45, 'plugin:formie', 'm240318_000000_fix_content_table', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', 'f00145bc-cf54-4b7d-bedf-e12bd5475559'),
(46, 'plugin:formie', 'm240318_000000_migrate_stencils', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '0cf94cb0-d0f5-4340-b578-f739d7bd3387'),
(47, 'plugin:formie', 'm240318_000000_notification_fields', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', 'c5e79c45-6280-43e7-b43a-53d3668aa68a'),
(48, 'plugin:formie', 'm240325_000000_notifications_custom_settings', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '69b0e360-0898-4558-8b1b-4152796339fc'),
(49, 'plugin:formie', 'm240407_000000_payment_fk', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '92da7c76-3348-4cca-b1a5-24825d08a5d1'),
(50, 'plugin:formie', 'm240507_000000_entry_integration_ids', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '2024-05-20 13:18:39', '4d8746e3-1146-4378-8ab9-ab284e063833'),
(51, 'plugin:cookie-consent', 'Install', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '39b008fc-e6d0-4832-835b-a71754819c78'),
(52, 'plugin:cookie-consent', 'm190401_220828_more_settings', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '2024-05-20 17:58:01', 'f2b457b5-7c51-49a8-ae3d-f41eb7afd933'),
(53, 'plugin:cookie-consent', 'm200522_104346_v1_3', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '2024-05-20 17:58:01', 'a32c1f73-6d1a-4485-8b9b-144a090ea54d'),
(54, 'plugin:cookie-consent', 'm200608_131912_v1_4', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '99dcdcd3-42ab-479a-8079-23ed0f9f068e'),
(55, 'plugin:cookie-consent', 'm200619_074354_v1_4_2', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '997b4622-5856-419e-ac3e-b4d72605611d'),
(56, 'plugin:cookie-consent', 'm201126_101032_v1_5_0', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '2024-05-20 17:58:01', '7f99e2b9-0247-48a0-a1b7-1c0fc8c41447');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `navigate_navigations`
--

DROP TABLE IF EXISTS `navigate_navigations`;
CREATE TABLE IF NOT EXISTS `navigate_navigations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `allowedSources` text,
  `enabledSiteGroups` text,
  `levels` int DEFAULT '1',
  `adminOnly` tinyint(1) DEFAULT '0',
  `handle` varchar(255) NOT NULL DEFAULT '',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `navigate_navigations`
--

INSERT INTO `navigate_navigations` (`id`, `title`, `allowedSources`, `enabledSiteGroups`, `levels`, `adminOnly`, `handle`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(2, 'Main Navigation', '*', '*', 1, 1, 'mainNav', '2024-05-20 12:28:47', '2024-05-20 12:42:10', NULL, 'bd31ba5f-879c-4e55-b920-acab85a67300');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `navigate_nodes`
--

DROP TABLE IF EXISTS `navigate_nodes`;
CREATE TABLE IF NOT EXISTS `navigate_nodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `navId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `elementId` int DEFAULT NULL,
  `elementType` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `blank` tinyint(1) DEFAULT '0',
  `classes` varchar(255) DEFAULT NULL,
  `parent` int DEFAULT '0',
  `order` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ppyqfxmlzzwpeyswdbzgoikzyabpgjjxstfp` (`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `navigate_nodes`
--

INSERT INTO `navigate_nodes` (`id`, `siteId`, `navId`, `name`, `url`, `elementId`, `elementType`, `type`, `enabled`, `blank`, `classes`, `parent`, `order`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 2, 'Contact', '/contact', NULL, NULL, 'Url', 1, 0, '', NULL, 3, '2024-05-20 12:35:11', '2024-05-20 12:54:58', '0bc4a4dc-a2d8-4024-a742-0e0ea65a81ea'),
(4, 1, 2, 'Home', '/', NULL, NULL, 'Url', 1, 0, '', NULL, 1, '2024-05-20 12:54:37', '2024-05-20 12:54:58', '7cb8d6f0-b9a2-46e9-b7e5-fcc2d168a66c'),
(5, 1, 2, 'Products', '/products', NULL, NULL, 'Url', 1, 0, '', NULL, 2, '2024-05-20 12:54:47', '2024-05-20 12:54:58', '332692ba-cae9-4add-8cf3-d33ba19382aa');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bndnglrgpbixeapwrwocjjnhkvviobgrhptd` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'feed-me', '6.0.1', '5.1.0.0', '2024-05-18 21:26:35', '2024-05-18 21:26:35', '2024-05-18 21:26:35', '8be0ba88-76c5-4bd1-96c7-80287feec491'),
(2, 'dumper', '5.0.1', '1.0.0', '2024-05-20 12:20:41', '2024-05-20 12:20:41', '2024-05-20 12:20:41', 'b7d0d371-cf5f-4871-a63f-481d0d2179ea'),
(3, 'navigate', '5.1.2', '2.4.0', '2024-05-20 12:22:15', '2024-05-20 12:22:15', '2024-05-20 12:22:15', 'd39fe928-efd4-4196-9875-49a11756bfb4'),
(4, 'formie', '3.0.0-beta.11', '3.4.4', '2024-05-20 13:18:30', '2024-05-20 13:18:30', '2024-05-20 13:18:30', '4f8a8dbe-abb3-44ea-9e3d-c8b66ed2068f'),
(5, 'cookie-consent', '5.0.1', '1.5.0', '2024-05-20 17:58:00', '2024-05-20 17:58:00', '2024-05-20 17:58:00', 'bf8a666c-47af-43c8-8534-687b473803fb');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
CREATE TABLE IF NOT EXISTS `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1716227886'),
('email.fromEmail', '\"beyza.cevik@student.pxl.be\"'),
('email.fromName', '\"kserenity-skincare\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.color', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elementCondition', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.fieldUid', '\"6beb16d9-e71f-4fb5-826a-c52b6a7a8857\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.handle', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.instructions', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.label', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.required', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.tip', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.uid', '\"061d08d3-ea7c-4226-904a-32ef8244d99e\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.warning', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.0.width', '100'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.fieldUid', '\"09198301-3e1d-45c3-9125-88769e8fff27\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.handle', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.instructions', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.label', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.required', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.tip', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.uid', '\"51692670-1e8d-41c1-8cdd-83ed7aaf3d7a\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.warning', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.1.width', '100'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.autocapitalize', 'true'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.autocomplete', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.autocorrect', 'true'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.class', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.disabled', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.id', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.inputType', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.instructions', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.label', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.max', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.min', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.name', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.orientation', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.placeholder', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.readonly', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.requirable', 'false'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.size', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.step', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.tip', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.title', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.uid', '\"2237e7f9-e913-4911-9ff1-049aac15bc74\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.warning', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.elements.2.width', '100'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.name', '\"Content\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.uid', '\"801d680b-b0a4-4316-9578-05a35c136ff2\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.fieldLayouts.8c7c2c85-2a81-48be-9c1c-305c428b6ee6.tabs.0.userCondition', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.handle', '\"productenpage\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.hasTitleField', 'true'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.icon', '\"\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.name', '\"ProductenPage\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.showSlugField', 'true'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.showStatusField', 'true'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.slugTranslationKeyFormat', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.slugTranslationMethod', '\"site\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.titleFormat', '\"\"'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.titleTranslationKeyFormat', 'null'),
('entryTypes.259b293c-e5d6-482f-98e8-158a8a0f6b88.titleTranslationMethod', '\"site\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.color', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elementCondition', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.class', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.disabled', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.id', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.inputType', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.instructions', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.label', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.max', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.min', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.name', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.orientation', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.readonly', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.requirable', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.size', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.step', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.tip', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.title', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.uid', '\"0ba2c59b-a6b5-42ac-98a0-5e609047e800\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.warning', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.0.width', '100'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.fieldUid', '\"af083550-14b3-4f68-b5f9-cf8385bc1def\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.handle', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.instructions', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.label', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.required', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.tip', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.uid', '\"d3d7ea17-7bc3-4fa0-909a-b11d23e3acc1\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.warning', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.elements.1.width', '100'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.name', '\"Content\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.uid', '\"8547747b-6532-4350-bbb6-602a3430723b\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.fieldLayouts.49766366-ba51-4c3e-898d-add330e40917.tabs.0.userCondition', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.handle', '\"header\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.hasTitleField', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.icon', '\"\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.name', '\"Header\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.showSlugField', 'false'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.showStatusField', 'true'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.slugTranslationKeyFormat', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.slugTranslationMethod', '\"site\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.titleFormat', '\"\"'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.titleTranslationKeyFormat', 'null'),
('entryTypes.32ec3ad3-e3ec-488b-9670-185dcae1a236.titleTranslationMethod', '\"site\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.color', '\"cyan\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elementCondition', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.class', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.disabled', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.id', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.inputType', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.instructions', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.label', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.max', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.min', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.name', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.orientation', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.readonly', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.requirable', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.size', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.step', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.tip', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.title', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.uid', '\"93cc74b7-0817-43d4-9f92-151bcfb44906\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.warning', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.0.width', '100'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.fieldUid', '\"be983836-6554-4519-b171-a0260905f6a6\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.handle', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.instructions', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.label', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.required', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.tip', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.uid', '\"6ad40c30-c892-4bfd-8c85-342fea11c32f\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.warning', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.1.width', '100'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.fieldUid', '\"f2746321-ef1e-4494-a19b-998823890d27\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.handle', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.instructions', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.label', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.required', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.tip', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.uid', '\"8e49b995-dbfd-4e53-9f92-ded9be4edbd4\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.warning', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.elements.2.width', '100'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.name', '\"Content\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.uid', '\"0e4cc274-2f01-4acc-a1d7-3cb45a6b5b55\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.fieldLayouts.9e8538cf-1023-4717-a8d6-5f0508a94791.tabs.0.userCondition', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.handle', '\"contact\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.hasTitleField', 'true'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.icon', '\"envelope\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.name', '\"contact\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.showSlugField', 'false'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.showStatusField', 'true'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.slugTranslationKeyFormat', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.slugTranslationMethod', '\"site\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.titleFormat', '\"\"'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.titleTranslationKeyFormat', 'null'),
('entryTypes.4949eae4-4151-4200-969e-16fb4e858353.titleTranslationMethod', '\"site\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.color', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.class', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.disabled', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.id', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.inputType', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.instructions', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.label', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.max', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.min', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.name', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.orientation', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.readonly', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.requirable', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.size', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.step', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.tip', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.title', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.uid', '\"43e8436d-bce1-41c4-8644-2e31b731b121\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.warning', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.0.width', '100'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.fieldUid', '\"7028ecad-3014-43e2-b223-a872366b97d6\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.handle', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.instructions', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.label', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.required', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.tip', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.uid', '\"5ce1e5c1-4ded-4055-a3a7-016f9ce06fa4\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.warning', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.1.width', '100'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.fieldUid', '\"b3d2304b-f423-490c-a5c9-719f9bfcc2e8\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.handle', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.instructions', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.label', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.required', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.tip', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.uid', '\"8d13ef9d-d968-4254-8eed-78bcb86b9a76\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.warning', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.2.width', '100'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.fieldUid', '\"503551c3-729b-4630-a072-c1121d331485\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.handle', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.includeInCards', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.instructions', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.label', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.providesThumbs', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.required', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.tip', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.uid', '\"c25749aa-bc71-4e34-b1e0-867d1d9960fa\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.warning', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.3.width', '100'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.fieldUid', '\"a6fcea98-619b-48a3-a423-6091162e0b38\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.handle', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.includeInCards', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.instructions', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.label', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.providesThumbs', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.required', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.tip', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.uid', '\"2e467574-6736-445e-ac8e-c74e6c87c2aa\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.warning', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.4.width', '100'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.fieldUid', '\"ee419d88-11a8-4bdd-ad75-63badd6cf7c0\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.handle', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.includeInCards', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.instructions', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.label', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.providesThumbs', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.required', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.tip', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.uid', '\"ffc4a840-9720-4e4d-8975-0f2fba4c126c\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.warning', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.5.width', '100'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.fieldUid', '\"24af3fe7-3a72-4ddf-95cf-4481152bbca4\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.handle', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.includeInCards', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.instructions', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.label', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.providesThumbs', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.required', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.tip', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.uid', '\"3f52278d-b2e7-4b45-9def-f511e46454b4\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.warning', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.6.width', '100'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.elementCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.fieldUid', '\"d175920a-2bd8-4fe4-8ddd-19635c38a533\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.handle', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.includeInCards', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.instructions', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.label', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.providesThumbs', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.required', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.tip', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.uid', '\"e5652917-52bb-45d1-a11f-28d211b19ffb\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.warning', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.elements.7.width', '100'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.name', '\"Content\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.uid', '\"558c8426-0c72-4ae9-b8d0-b0b70909d1e6\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.fieldLayouts.100a4e9a-843a-4c72-b389-07f3808748bc.tabs.0.userCondition', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.handle', '\"productentry\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.hasTitleField', 'true'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.icon', '\"basket-shopping\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.name', '\"ProductEntry\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.showSlugField', 'false'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.showStatusField', 'true'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.slugTranslationKeyFormat', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.slugTranslationMethod', '\"site\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.titleFormat', '\"\"'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.titleTranslationKeyFormat', 'null'),
('entryTypes.65305b29-a1b4-4736-8ef8-a757decd3de9.titleTranslationMethod', '\"site\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.color', '\"fuchsia\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.class', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.disabled', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.id', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.inputType', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.max', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.min', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.name', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.orientation', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.readonly', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.requirable', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.size', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.step', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.title', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.uid', '\"7f180ef0-2920-41fb-a1ca-d81bbfe8253c\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.0.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.fieldUid', '\"7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.uid', '\"599cf7b2-f569-4efc-a9a0-d192392916a4\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.1.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.fieldUid', '\"7dcb02f2-e42e-4938-b65a-c23f9090601b\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.uid', '\"453ca11a-58bd-460d-ad06-e396d7f92542\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.10.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.fieldUid', '\"49dd7690-de8b-4c4c-acf6-ea0bed781c88\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.uid', '\"eae8afc4-6f31-4e9d-8370-3a870fb4a2ea\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.11.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.fieldUid', '\"7f274b1f-e75a-4482-b11b-fb766655c7f8\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.uid', '\"22696a3d-b8c1-4508-870a-8d7bb8e97d49\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.12.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.fieldUid', '\"0e72854b-8c3b-4835-8c77-2bad29d28ea8\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.uid', '\"74d7ab83-af58-49cf-be27-1645b1d0f9c8\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.13.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.fieldUid', '\"0e4ebf1a-a242-45fb-9206-cad3057ccbc4\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.uid', '\"18e627da-2d6c-426f-b38d-84c8218771fa\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.14.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.fieldUid', '\"b604aca1-59d4-4e78-883d-b5ac1d8bee64\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.uid', '\"29362312-09d9-4840-be86-b36259f3ea9e\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.15.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.fieldUid', '\"b1cb8570-0af8-49f4-a072-b31cfe735988\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.uid', '\"42e7edf5-8640-4c7e-a9c1-12935ac9580e\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.2.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.fieldUid', '\"9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.uid', '\"b0732feb-5bfa-4274-85ba-43f1736948c9\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.3.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.fieldUid', '\"d2930100-335c-47ed-9934-ca2c76e54f16\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.uid', '\"e80cd2f9-925d-4d0b-9e2f-5e31cb9c7c06\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.4.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.fieldUid', '\"685d1f25-9518-4ae0-af58-7792cf56ee2b\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.uid', '\"bae9d037-0e55-4ddb-8c3b-3d3debd13ab9\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.5.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.fieldUid', '\"e55d4be9-a010-4072-b605-170ec7dcc2f0\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.uid', '\"ddb0c5cd-9334-4f3e-babd-237b4ccf50d9\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.6.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.fieldUid', '\"cc336e9f-0b95-477b-8228-f511d15140f2\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.uid', '\"73070154-2e5d-47ca-b899-69301fd074c9\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.7.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.fieldUid', '\"723be697-4f69-4566-9a16-46be763d8156\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.uid', '\"af0c8043-23a6-4e95-80c4-a227821ecb0e\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.8.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.elementCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.fieldUid', '\"c1301a7d-dc92-494c-ba91-175a1a8e411f\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.handle', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.includeInCards', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.instructions', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.label', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.providesThumbs', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.required', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.tip', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.uid', '\"a0963bab-adf5-4a5c-af31-fac105d33a20\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.warning', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.elements.9.width', '100'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.name', '\"Content\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.uid', '\"06c67e2e-d236-4a42-a3eb-053b87b2ab82\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.fieldLayouts.d9b547ab-d7a7-486a-8b7d-1adf23a24e0d.tabs.0.userCondition', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.handle', '\"homepageentry\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.hasTitleField', 'true'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.icon', '\"house\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.name', '\"Homepage Entry\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.showSlugField', 'false'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.showStatusField', 'true'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.slugTranslationKeyFormat', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.slugTranslationMethod', '\"site\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.titleFormat', '\"\"'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.titleTranslationKeyFormat', 'null'),
('entryTypes.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5.titleTranslationMethod', '\"site\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.color', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elementCondition', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.class', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.disabled', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.id', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.inputType', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.instructions', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.label', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.max', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.min', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.name', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.orientation', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.readonly', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.requirable', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.size', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.step', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.tip', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.title', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.uid', '\"ce65af05-cf64-40ce-b836-11c6a5b8cce2\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.warning', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.0.width', '100'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.fieldUid', '\"a2a38407-09ac-4efb-8029-5a2effc4b312\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.handle', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.instructions', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.label', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.required', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.tip', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.uid', '\"e45dd48b-de12-4c10-a80f-d4fbf0338032\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.warning', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.elements.1.width', '100'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.name', '\"Content\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.uid', '\"68de04d9-d5ec-42b1-948e-adeb24cddd49\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.fieldLayouts.9165d3ce-67b2-4896-811e-1035ec2ba383.tabs.0.userCondition', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.handle', '\"footer\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.hasTitleField', 'true'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.icon', '\"\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.name', '\"Footer\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.showSlugField', 'false'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.showStatusField', 'true'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.slugTranslationKeyFormat', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.slugTranslationMethod', '\"site\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.titleFormat', '\"\"'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.titleTranslationKeyFormat', 'null'),
('entryTypes.9971f49b-6318-4be1-af82-ffccc357c3e5.titleTranslationMethod', '\"site\"'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.columnSuffix', 'null'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.handle', '\"productendescription\"'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.instructions', '\"Dit is de beschrijving onder je producten titel\"'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.name', '\"ProductenDescription\"'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.searchable', 'false'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.settings.byteLimit', 'null'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.settings.charLimit', 'null'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.settings.code', 'false'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.settings.initialRows', '4'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.settings.multiline', 'false'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.settings.placeholder', 'null'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.settings.uiMode', '\"normal\"'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.translationKeyFormat', 'null'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.translationMethod', '\"none\"'),
('fields.09198301-3e1d-45c3-9125-88769e8fff27.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.columnSuffix', 'null'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.handle', '\"contacttel\"'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.instructions', '\"Je telefoonnummer\"'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.name', '\"contactTel\"'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.searchable', 'false'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.settings.byteLimit', 'null'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.settings.charLimit', 'null'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.settings.code', 'false'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.settings.initialRows', '4'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.settings.multiline', 'false'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.settings.placeholder', 'null'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.settings.uiMode', '\"normal\"'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.translationKeyFormat', 'null'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.translationMethod', '\"none\"'),
('fields.0e4ebf1a-a242-45fb-9206-cad3057ccbc4.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.columnSuffix', 'null'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.handle', '\"contacttitlesocials\"'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.instructions', '\"Titel boven je socials\"'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.name', '\"contactTitleSocials\"'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.searchable', 'false'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.settings.byteLimit', 'null'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.settings.charLimit', 'null'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.settings.code', 'false'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.settings.initialRows', '4'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.settings.multiline', 'false'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.settings.placeholder', 'null'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.settings.uiMode', '\"normal\"'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.translationKeyFormat', 'null'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.translationMethod', '\"none\"'),
('fields.0e72854b-8c3b-4835-8c77-2bad29d28ea8.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.columnSuffix', 'null'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.handle', '\"contactmail\"'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.instructions', '\"Je eigen mailadres \"'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.name', '\"contactMail\"'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.searchable', 'false'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.settings.placeholder', 'null'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.translationKeyFormat', 'null'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.translationMethod', '\"none\"'),
('fields.49dd7690-de8b-4c4c-acf6-ea0bed781c88.type', '\"craft\\\\fields\\\\Email\"'),
('fields.503551c3-729b-4630-a072-c1121d331485.columnSuffix', 'null'),
('fields.503551c3-729b-4630-a072-c1121d331485.handle', '\"soort\"'),
('fields.503551c3-729b-4630-a072-c1121d331485.instructions', '\"Hierin geef je de naam van het product\"'),
('fields.503551c3-729b-4630-a072-c1121d331485.name', '\"Soort\"'),
('fields.503551c3-729b-4630-a072-c1121d331485.searchable', 'false'),
('fields.503551c3-729b-4630-a072-c1121d331485.settings.byteLimit', 'null'),
('fields.503551c3-729b-4630-a072-c1121d331485.settings.charLimit', 'null'),
('fields.503551c3-729b-4630-a072-c1121d331485.settings.code', 'false'),
('fields.503551c3-729b-4630-a072-c1121d331485.settings.initialRows', '4'),
('fields.503551c3-729b-4630-a072-c1121d331485.settings.multiline', 'true'),
('fields.503551c3-729b-4630-a072-c1121d331485.settings.placeholder', '\"Product naam\"'),
('fields.503551c3-729b-4630-a072-c1121d331485.settings.uiMode', '\"normal\"'),
('fields.503551c3-729b-4630-a072-c1121d331485.translationKeyFormat', 'null'),
('fields.503551c3-729b-4630-a072-c1121d331485.translationMethod', '\"none\"'),
('fields.503551c3-729b-4630-a072-c1121d331485.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.columnSuffix', 'null'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.handle', '\"homepagebuttontext\"'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.instructions', '\"Dit is je button en het tekst in je button\"'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.name', '\"homepageButtonText\"'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.searchable', 'false'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.settings.byteLimit', 'null'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.settings.charLimit', 'null'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.settings.code', 'false'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.settings.initialRows', '4'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.settings.multiline', 'false'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.settings.placeholder', 'null'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.settings.uiMode', '\"normal\"'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.translationKeyFormat', 'null'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.translationMethod', '\"none\"'),
('fields.685d1f25-9518-4ae0-af58-7792cf56ee2b.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.columnSuffix', 'null'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.handle', '\"productentitle\"'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.instructions', '\"Dit is je titel van je pagina Producten\"'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.name', '\"ProductenTitle\"'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.searchable', 'false'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.settings.byteLimit', 'null'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.settings.charLimit', 'null'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.settings.code', 'false'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.settings.initialRows', '4'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.settings.multiline', 'false'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.settings.placeholder', 'null'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.settings.uiMode', '\"normal\"'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.translationKeyFormat', 'null'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.translationMethod', '\"none\"'),
('fields.6beb16d9-e71f-4fb5-826a-c52b6a7a8857.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.columnSuffix', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.handle', '\"image\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.instructions', '\"Hierin steek je de foto van het product\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.name', '\"Image\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.searchable', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.allowedKinds', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.allowSelfRelations', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.allowSubfolders', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.allowUploads', 'true'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.branchLimit', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.defaultUploadLocationSource', '\"volume:aa18b816-e7a6-4e90-94ca-6cae62db99e9\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.defaultUploadLocationSubpath', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.localizeRelations', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.maintainHierarchy', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.maxRelations', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.minRelations', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.previewMode', '\"full\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.restrictedLocationSource', '\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.restrictedLocationSubpath', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.restrictFiles', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.restrictLocation', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.selectionLabel', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.showCardsInGrid', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.showSiteMenu', 'true'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.showUnpermittedFiles', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.showUnpermittedVolumes', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.sources.0', '\"volume:aa18b816-e7a6-4e90-94ca-6cae62db99e9\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.targetSiteId', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.validateRelatedElements', 'false'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.settings.viewMode', '\"list\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.translationKeyFormat', 'null'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.translationMethod', '\"site\"'),
('fields.7028ecad-3014-43e2-b223-a872366b97d6.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.723be697-4f69-4566-9a16-46be763d8156.columnSuffix', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('fields.723be697-4f69-4566-9a16-46be763d8156.handle', '\"contacttitle\"'),
('fields.723be697-4f69-4566-9a16-46be763d8156.instructions', '\"Je titel contact\"'),
('fields.723be697-4f69-4566-9a16-46be763d8156.name', '\"ContactTitle\"'),
('fields.723be697-4f69-4566-9a16-46be763d8156.searchable', 'false'),
('fields.723be697-4f69-4566-9a16-46be763d8156.settings.byteLimit', 'null'),
('fields.723be697-4f69-4566-9a16-46be763d8156.settings.charLimit', 'null'),
('fields.723be697-4f69-4566-9a16-46be763d8156.settings.code', 'false'),
('fields.723be697-4f69-4566-9a16-46be763d8156.settings.initialRows', '4'),
('fields.723be697-4f69-4566-9a16-46be763d8156.settings.multiline', 'false'),
('fields.723be697-4f69-4566-9a16-46be763d8156.settings.placeholder', 'null'),
('fields.723be697-4f69-4566-9a16-46be763d8156.settings.uiMode', '\"normal\"'),
('fields.723be697-4f69-4566-9a16-46be763d8156.translationKeyFormat', 'null'),
('fields.723be697-4f69-4566-9a16-46be763d8156.translationMethod', '\"none\"'),
('fields.723be697-4f69-4566-9a16-46be763d8156.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.columnSuffix', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.handle', '\"sitelogo\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.instructions', '\"Dit is de logo van uw site\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.name', '\"siteLogo\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.searchable', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.allowedKinds', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.allowSelfRelations', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.allowSubfolders', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.allowUploads', 'true'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.branchLimit', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.defaultUploadLocationSource', '\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.defaultUploadLocationSubpath', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.localizeRelations', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.maintainHierarchy', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.maxRelations', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.minRelations', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.previewMode', '\"full\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.restrictedLocationSource', '\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.restrictedLocationSubpath', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.restrictFiles', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.restrictLocation', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.selectionLabel', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.showCardsInGrid', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.showSiteMenu', 'true'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.showUnpermittedFiles', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.showUnpermittedVolumes', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.sources.0', '\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.targetSiteId', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.validateRelatedElements', 'false'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.settings.viewMode', '\"list\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.translationKeyFormat', 'null'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.translationMethod', '\"site\"'),
('fields.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.columnSuffix', 'null'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.handle', '\"contacttitlemail\"'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.instructions', '\"De titel boven je email\"'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.name', '\"contactTitleMail\"'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.searchable', 'false'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.settings.byteLimit', 'null'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.settings.charLimit', 'null'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.settings.code', 'false'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.settings.initialRows', '4'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.settings.multiline', 'false'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.settings.placeholder', 'null'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.settings.uiMode', '\"normal\"'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.translationKeyFormat', 'null'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.translationMethod', '\"none\"'),
('fields.7dcb02f2-e42e-4938-b65a-c23f9090601b.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.columnSuffix', 'null'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.handle', '\"contacttitletel\"'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.instructions', '\"Titel boven je telefoonnummer\"'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.name', '\"contactTitleTel\"'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.searchable', 'false'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.settings.byteLimit', 'null'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.settings.charLimit', 'null'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.settings.code', 'false'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.settings.initialRows', '4'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.settings.multiline', 'false'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.settings.placeholder', 'null'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.settings.uiMode', '\"normal\"'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.translationKeyFormat', 'null'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.translationMethod', '\"none\"'),
('fields.7f274b1f-e75a-4482-b11b-fb766655c7f8.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.columnSuffix', 'null'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.handle', '\"homepagedescription\"'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.instructions', '\"beschrijving onder je titel\"'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.name', '\"homepageDescription\"'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.searchable', 'false'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.settings.byteLimit', 'null'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.settings.charLimit', 'null'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.settings.code', 'false'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.settings.initialRows', '4'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.settings.multiline', 'false'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.settings.placeholder', 'null'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.settings.uiMode', '\"normal\"'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.translationKeyFormat', 'null'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.translationMethod', '\"none\"'),
('fields.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.columnSuffix', 'null'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.handle', '\"footerContent\"'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.instructions', '\"Hierin steek je de content van je footer\"'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.name', '\"Footer Content\"'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.searchable', 'false'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.settings.byteLimit', 'null'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.settings.charLimit', 'null'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.settings.code', 'false'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.settings.initialRows', '4'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.settings.multiline', 'false'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.settings.placeholder', 'null'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.settings.uiMode', '\"normal\"'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.translationKeyFormat', 'null'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.translationMethod', '\"none\"'),
('fields.a2a38407-09ac-4efb-8029-5a2effc4b312.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.columnSuffix', 'null'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.handle', '\"description\"'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.instructions', '\"Geef hierin de beschrijving van het product\"'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.name', '\"Description\"'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.searchable', 'false'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.settings.byteLimit', 'null'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.settings.charLimit', '250'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.settings.code', 'false'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.settings.initialRows', '4'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.settings.multiline', 'true'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.settings.placeholder', 'null'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.settings.uiMode', '\"normal\"'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.translationKeyFormat', 'null'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.translationMethod', '\"none\"'),
('fields.a6fcea98-619b-48a3-a423-6091162e0b38.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.columnSuffix', 'null'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.handle', '\"headerContent\"'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.instructions', '\"Hierin steek je de contents van je navigatiebalk\"'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.name', '\"Header Content\"'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.searchable', 'false'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.settings.byteLimit', 'null'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.settings.charLimit', 'null'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.settings.code', 'false'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.settings.initialRows', '4'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.settings.multiline', 'false'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.settings.placeholder', 'null'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.settings.uiMode', '\"normal\"'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.translationKeyFormat', 'null'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.translationMethod', '\"none\"'),
('fields.af083550-14b3-4f68-b5f9-cf8385bc1def.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.columnSuffix', 'null'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.handle', '\"homepagetitle\"'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.instructions', '\"Dit is een titel \"'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.name', '\"homepageTitle\"'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.searchable', 'false'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.settings.byteLimit', 'null'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.settings.charLimit', 'null'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.settings.code', 'false'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.settings.initialRows', '4'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.settings.multiline', 'false'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.settings.placeholder', 'null'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.settings.uiMode', '\"normal\"'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.translationKeyFormat', 'null'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.translationMethod', '\"none\"'),
('fields.b1cb8570-0af8-49f4-a072-b31cfe735988.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.columnSuffix', 'null'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.handle', '\"merk\"'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.instructions', '\"Geef hier het merk van het product in\"'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.name', '\"Merk\"'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.searchable', 'true'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.settings.byteLimit', 'null'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.settings.charLimit', 'null'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.settings.code', 'false'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.settings.initialRows', '4'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.settings.multiline', 'false'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.settings.placeholder', '\"Product Name\"'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.settings.uiMode', '\"normal\"'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.translationKeyFormat', 'null'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.translationMethod', '\"none\"'),
('fields.b3d2304b-f423-490c-a5c9-719f9bfcc2e8.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.columnSuffix', 'null'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.handle', '\"toptitle\"'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.instructions', '\"Dit is een titel voor je top 3 producten\"'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.name', '\"topTitle\"'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.searchable', 'false'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.settings.byteLimit', 'null'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.settings.charLimit', 'null'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.settings.code', 'false'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.settings.initialRows', '4'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.settings.multiline', 'false'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.settings.placeholder', 'null'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.settings.uiMode', '\"normal\"'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.translationKeyFormat', 'null'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.translationMethod', '\"none\"'),
('fields.b604aca1-59d4-4e78-883d-b5ac1d8bee64.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.be983836-6554-4519-b171-a0260905f6a6.columnSuffix', 'null'),
('fields.be983836-6554-4519-b171-a0260905f6a6.handle', '\"formtitle\"'),
('fields.be983836-6554-4519-b171-a0260905f6a6.instructions', '\"Dit is de titel van je contact pagina\"'),
('fields.be983836-6554-4519-b171-a0260905f6a6.name', '\"FormTitle\"'),
('fields.be983836-6554-4519-b171-a0260905f6a6.searchable', 'false'),
('fields.be983836-6554-4519-b171-a0260905f6a6.settings.byteLimit', 'null'),
('fields.be983836-6554-4519-b171-a0260905f6a6.settings.charLimit', 'null'),
('fields.be983836-6554-4519-b171-a0260905f6a6.settings.code', 'false'),
('fields.be983836-6554-4519-b171-a0260905f6a6.settings.initialRows', '4'),
('fields.be983836-6554-4519-b171-a0260905f6a6.settings.multiline', 'false'),
('fields.be983836-6554-4519-b171-a0260905f6a6.settings.placeholder', 'null'),
('fields.be983836-6554-4519-b171-a0260905f6a6.settings.uiMode', '\"normal\"'),
('fields.be983836-6554-4519-b171-a0260905f6a6.translationKeyFormat', 'null'),
('fields.be983836-6554-4519-b171-a0260905f6a6.translationMethod', '\"none\"'),
('fields.be983836-6554-4519-b171-a0260905f6a6.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.columnSuffix', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.handle', '\"contactimg\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.instructions', '\"Dit is de image van je contact sectie\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.name', '\"ContactImg\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.searchable', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.allowedKinds', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.allowSelfRelations', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.allowSubfolders', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.allowUploads', 'true'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.branchLimit', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.defaultUploadLocationSource', '\"volume:7cb8b0db-c230-471d-bd63-642a532fc6de\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.defaultUploadLocationSubpath', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.localizeRelations', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.maintainHierarchy', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.maxRelations', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.minRelations', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.previewMode', '\"full\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.restrictedLocationSource', '\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.restrictedLocationSubpath', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.restrictFiles', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.restrictLocation', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.selectionLabel', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.showCardsInGrid', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.showSiteMenu', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.showUnpermittedFiles', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.showUnpermittedVolumes', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.sources.0', '\"volume:7cb8b0db-c230-471d-bd63-642a532fc6de\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.targetSiteId', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.validateRelatedElements', 'false'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.settings.viewMode', '\"list\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.translationKeyFormat', 'null'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.translationMethod', '\"site\"'),
('fields.c1301a7d-dc92-494c-ba91-175a1a8e411f.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.columnSuffix', 'null'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.handle', '\"infodescription\"'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.instructions', '\"dit is eenbeschrijving van het stukje info\"'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.name', '\"infoDescription\"'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.searchable', 'false'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.settings.byteLimit', 'null'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.settings.charLimit', 'null'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.settings.code', 'false'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.settings.initialRows', '4'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.settings.multiline', 'false'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.settings.placeholder', 'null'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.settings.uiMode', '\"normal\"'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.translationKeyFormat', 'null'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.translationMethod', '\"none\"'),
('fields.cc336e9f-0b95-477b-8228-f511d15140f2.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.columnSuffix', 'null'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.handle', '\"voorraad\"'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.instructions', '\"Hierin geef je of het product op voorraad is of niet\"'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.name', '\"Voorraad\"'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.searchable', 'false'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.decimals', '0'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.defaultValue', 'null'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.max', 'null'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.min', '0'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.prefix', 'null'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.previewCurrency', 'null'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.previewFormat', '\"decimal\"'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.size', 'null'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.settings.suffix', 'null'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.translationKeyFormat', 'null'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.translationMethod', '\"none\"'),
('fields.d175920a-2bd8-4fe4-8ddd-19635c38a533.type', '\"craft\\\\fields\\\\Number\"'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.columnSuffix', 'null'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.handle', '\"homepagebuttonlink\"'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.instructions', '\"dit is de link van je button, verwijzing naar /producten\"'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.name', '\"homepageButtonLink\"'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.searchable', 'false'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.settings.byteLimit', 'null'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.settings.charLimit', 'null'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.settings.code', 'false'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.settings.initialRows', '4'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.settings.multiline', 'false'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.settings.placeholder', 'null'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.settings.uiMode', '\"normal\"'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.translationKeyFormat', 'null'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.translationMethod', '\"none\"'),
('fields.d2930100-335c-47ed-9934-ca2c76e54f16.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.columnSuffix', 'null'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.handle', '\"infotitle\"'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.instructions', '\"Dit is de titel voor het stukje info\"'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.name', '\"infoTitle\"'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.searchable', 'false'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.settings.byteLimit', 'null'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.settings.charLimit', 'null'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.settings.code', 'false'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.settings.initialRows', '4'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.settings.multiline', 'false'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.settings.placeholder', 'null'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.settings.uiMode', '\"normal\"'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.translationKeyFormat', 'null'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.translationMethod', '\"none\"'),
('fields.e55d4be9-a010-4072-b605-170ec7dcc2f0.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.columnSuffix', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.handle', '\"blacklogo\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.instructions', '\"Dit is je zwarte logo voor lichtere achtergronden\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.name', '\"BlackLogo\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.searchable', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.allowedKinds', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.allowSelfRelations', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.allowSubfolders', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.allowUploads', 'true'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.branchLimit', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.defaultUploadLocationSource', '\"volume:9a77c145-c53b-44a4-bdb2-2dc307052d32\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.defaultUploadLocationSubpath', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.localizeRelations', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.maintainHierarchy', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.maxRelations', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.minRelations', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.previewMode', '\"full\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.restrictedLocationSource', '\"volume:29685f3e-1f14-43ff-90f4-cd1b385b8501\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.restrictedLocationSubpath', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.restrictFiles', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.restrictLocation', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.selectionLabel', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.showCardsInGrid', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.showSiteMenu', 'true'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.showUnpermittedFiles', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.showUnpermittedVolumes', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.sources.0', '\"volume:9a77c145-c53b-44a4-bdb2-2dc307052d32\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.targetSiteId', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.validateRelatedElements', 'false'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.settings.viewMode', '\"list\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.translationKeyFormat', 'null'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.translationMethod', '\"site\"'),
('fields.ec962417-3322-4da5-a5ad-df1967228a86.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.columnSuffix', 'null'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.handle', '\"price\"'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.instructions', '\"Geef hierin de prijs van het product\"'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.name', '\"Price\"'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.searchable', 'false'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.settings.currency', '\"EUR\"'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.settings.defaultValue', 'null'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.settings.max', 'null'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.settings.min', '0'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.settings.showCurrency', 'true'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.settings.size', 'null'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.translationKeyFormat', 'null'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.translationMethod', '\"none\"'),
('fields.ee419d88-11a8-4bdd-ad75-63badd6cf7c0.type', '\"craft\\\\fields\\\\Money\"'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.columnSuffix', 'null'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.handle', '\"formdescription\"'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.instructions', '\"Dit is de beschrijving onder je contact title\"'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.name', '\"FormDescription\"'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.searchable', 'false'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.settings.byteLimit', 'null'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.settings.charLimit', 'null'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.settings.code', 'false'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.settings.initialRows', '4'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.settings.multiline', 'false'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.settings.placeholder', 'null'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.settings.uiMode', '\"normal\"'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.translationKeyFormat', 'null'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.translationMethod', '\"none\"'),
('fields.f2746321-ef1e-4494-a19b-998823890d27.type', '\"craft\\\\fields\\\\PlainText\"'),
('formie.statuses.f35a1087-1bdc-4c52-beb4-47b65b821e6c.color', '\"green\"'),
('formie.statuses.f35a1087-1bdc-4c52-beb4-47b65b821e6c.description', 'null'),
('formie.statuses.f35a1087-1bdc-4c52-beb4-47b65b821e6c.handle', '\"new\"'),
('formie.statuses.f35a1087-1bdc-4c52-beb4-47b65b821e6c.isDefault', 'true'),
('formie.statuses.f35a1087-1bdc-4c52-beb4-47b65b821e6c.name', '\"New\"'),
('formie.statuses.f35a1087-1bdc-4c52-beb4-47b65b821e6c.sortOrder', '1'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.dataRetention', '\"forever\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.dataRetentionValue', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.fileUploadsAction', '\"retain\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.collectIp', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.collectUser', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.dataRetention', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.dataRetentionValue', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.defaultEmailTemplateId', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.defaultInstructionsPosition', '\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.defaultLabelPosition', '\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.disableCaptchas', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.displayCurrentPageTitle', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.displayFormTitle', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.displayPageProgress', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.displayPageTabs', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.errorMessage.0.content.0.text', '\"Couldn’t save submission due to errors.\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.errorMessage.0.content.0.type', '\"text\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.errorMessage.0.type', '\"paragraph\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.errorMessagePosition', '\"top-form\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.fileUploadsAction', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.limitSubmissions', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.limitSubmissionsMessage', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.limitSubmissionsNumber', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.limitSubmissionsType', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.loadingIndicator', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.loadingIndicatorText', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.pageRedirectUrl', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.progressPosition', '\"end\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.redirectUrl', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.requiredIndicator', '\"asterisk\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.requireUser', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.requireUserMessage', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.scheduleForm', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.scheduleFormEnd', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.scheduleFormExpiredMessage', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.scheduleFormPendingMessage', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.scheduleFormStart', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.scrollToTop', 'true'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submissionTitleFormat', '\"{timestamp}\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitAction', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitActionFormHide', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitActionMessage.0.content.0.text', '\"Submission saved.\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitActionMessage.0.content.0.type', '\"text\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitActionMessage.0.type', '\"paragraph\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitActionMessagePosition', '\"top-form\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitActionMessageTimeout', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitActionTab', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitActionUrl', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.submitMethod', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.validationOnFocus', 'false'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.settings.validationOnSubmit', 'true'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.data.userDeletedAction', '\"retain\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.defaultStatus', '\"f35a1087-1bdc-4c52-beb4-47b65b821e6c\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.handle', '\"contactForm\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.name', '\"Contact Form\"'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.submitActionEntry', 'null'),
('formie.stencils.cdaa359a-7a01-46a9-a621-786da92af95a.template', 'null'),
('fs.blacklogo.hasUrls', 'true'),
('fs.blacklogo.name', '\"blackLogo\"'),
('fs.blacklogo.settings.path', '\"/assets/SVG/SVG\"'),
('fs.blacklogo.type', '\"craft\\\\fs\\\\Local\"'),
('fs.blacklogo.url', '\"@web/assets/SVG/SVG/\"'),
('fs.contactimg.hasUrls', 'true'),
('fs.contactimg.name', '\"ContactImg\"'),
('fs.contactimg.settings.path', '\"/assets/svg/svg\"'),
('fs.contactimg.type', '\"craft\\\\fs\\\\Local\"'),
('fs.contactimg.url', '\"@web/assets/svg/svg\"'),
('fs.productimg.hasUrls', 'true'),
('fs.productimg.name', '\"productImg\"'),
('fs.productimg.settings.path', '\"/assets\"'),
('fs.productimg.type', '\"craft\\\\fs\\\\Local\"'),
('fs.productimg.url', '\"@web/assets/\"'),
('fs.sitelogo.hasUrls', 'true'),
('fs.sitelogo.name', '\"SiteLogo\"'),
('fs.sitelogo.settings.path', '\"/assets/SVG\"'),
('fs.sitelogo.type', '\"craft\\\\fs\\\\Local\"'),
('fs.sitelogo.url', '\"@web/assets/SVG/\"'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elementCondition', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.elementCondition', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.fieldUid', '\"ec962417-3322-4da5-a5ad-df1967228a86\"'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.handle', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.includeInCards', 'false'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.instructions', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.label', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.providesThumbs', 'false'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.required', 'false'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.tip', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.uid', '\"9a8dbeab-0dda-4cd8-8526-b7621e37d7a1\"'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.userCondition', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.warning', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.elements.0.width', '100'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.name', '\"Content\"'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.uid', '\"42caa8c6-307e-4dac-9877-1277509cb8cc\"'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.fieldLayouts.8beb801c-1841-41d8-8a63-0f7ec9a2d686.tabs.0.userCondition', 'null'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.handle', '\"blacklogo\"'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.name', '\"blackLogo\"'),
('globalSets.d2572f0c-cf70-42cc-b297-2f25a7076fa6.sortOrder', '1'),
('graphql.schemas.7e83d19b-9f19-4664-a036-9ed99d691b97.isPublic', 'true'),
('graphql.schemas.7e83d19b-9f19-4664-a036-9ed99d691b97.name', '\"Public Schema\"'),
('meta.__names__.09198301-3e1d-45c3-9125-88769e8fff27', '\"ProductenDescription\"'),
('meta.__names__.0e4ebf1a-a242-45fb-9206-cad3057ccbc4', '\"contactTel\"'),
('meta.__names__.0e72854b-8c3b-4835-8c77-2bad29d28ea8', '\"contactTitleSocials\"'),
('meta.__names__.259b293c-e5d6-482f-98e8-158a8a0f6b88', '\"ProductenPage\"'),
('meta.__names__.29685f3e-1f14-43ff-90f4-cd1b385b8501', '\"SiteLogo\"'),
('meta.__names__.30863589-1efd-4876-8616-a9940a064ced', '\"kserenity-skincare\"'),
('meta.__names__.32ec3ad3-e3ec-488b-9670-185dcae1a236', '\"Header\"'),
('meta.__names__.48f60c35-6b15-498e-85e5-ea8d92527c3c', '\"Homepage\"'),
('meta.__names__.4949eae4-4151-4200-969e-16fb4e858353', '\"contact\"'),
('meta.__names__.49dd7690-de8b-4c4c-acf6-ea0bed781c88', '\"contactMail\"'),
('meta.__names__.503551c3-729b-4630-a072-c1121d331485', '\"Soort\"'),
('meta.__names__.5548eee2-fe00-4fee-bd86-6296f8f13aa5', '\"Header\"'),
('meta.__names__.65305b29-a1b4-4736-8ef8-a757decd3de9', '\"ProductEntry\"'),
('meta.__names__.685d1f25-9518-4ae0-af58-7792cf56ee2b', '\"homepageButtonText\"'),
('meta.__names__.6beb16d9-e71f-4fb5-826a-c52b6a7a8857', '\"ProductenTitle\"'),
('meta.__names__.7028ecad-3014-43e2-b223-a872366b97d6', '\"Image\"'),
('meta.__names__.723be697-4f69-4566-9a16-46be763d8156', '\"ContactTitle\"'),
('meta.__names__.7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d', '\"siteLogo\"'),
('meta.__names__.7cb8b0db-c230-471d-bd63-642a532fc6de', '\"ContactImg\"'),
('meta.__names__.7dcb02f2-e42e-4938-b65a-c23f9090601b', '\"contactTitleMail\"'),
('meta.__names__.7e83d19b-9f19-4664-a036-9ed99d691b97', '\"Public Schema\"'),
('meta.__names__.7efebcfe-cbe8-4d2a-a4c0-c75c069d028e', '\"kserenity-skincare\"'),
('meta.__names__.7f274b1f-e75a-4482-b11b-fb766655c7f8', '\"contactTitleTel\"'),
('meta.__names__.87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5', '\"Homepage Entry\"'),
('meta.__names__.9971f49b-6318-4be1-af82-ffccc357c3e5', '\"Footer\"'),
('meta.__names__.9a77c145-c53b-44a4-bdb2-2dc307052d32', '\"blackLogo\"'),
('meta.__names__.9ac71a7d-eac6-4b5a-bb77-2f40d6e5ae95', '\"homepageDescription\"'),
('meta.__names__.a2a38407-09ac-4efb-8029-5a2effc4b312', '\"Footer Content\"'),
('meta.__names__.a6fcea98-619b-48a3-a423-6091162e0b38', '\"Description\"'),
('meta.__names__.aa18b816-e7a6-4e90-94ca-6cae62db99e9', '\"productImg\"'),
('meta.__names__.af083550-14b3-4f68-b5f9-cf8385bc1def', '\"Header Content\"'),
('meta.__names__.b1cb8570-0af8-49f4-a072-b31cfe735988', '\"homepageTitle\"'),
('meta.__names__.b3d2304b-f423-490c-a5c9-719f9bfcc2e8', '\"Merk\"'),
('meta.__names__.b57b1002-f8d0-4634-b367-e7014e73cc8b', '\"Products\"'),
('meta.__names__.b604aca1-59d4-4e78-883d-b5ac1d8bee64', '\"topTitle\"'),
('meta.__names__.be983836-6554-4519-b171-a0260905f6a6', '\"FormTitle\"'),
('meta.__names__.c1301a7d-dc92-494c-ba91-175a1a8e411f', '\"ContactImg\"'),
('meta.__names__.cc336e9f-0b95-477b-8228-f511d15140f2', '\"infoDescription\"'),
('meta.__names__.cdaa359a-7a01-46a9-a621-786da92af95a', '\"Contact Form\"'),
('meta.__names__.d175920a-2bd8-4fe4-8ddd-19635c38a533', '\"Voorraad\"'),
('meta.__names__.d2572f0c-cf70-42cc-b297-2f25a7076fa6', '\"blackLogo\"'),
('meta.__names__.d2930100-335c-47ed-9934-ca2c76e54f16', '\"homepageButtonLink\"'),
('meta.__names__.dacfeb3b-6ffa-416d-94ee-2587a3223cef', '\"Contact\"'),
('meta.__names__.e55d4be9-a010-4072-b605-170ec7dcc2f0', '\"infoTitle\"'),
('meta.__names__.ec962417-3322-4da5-a5ad-df1967228a86', '\"BlackLogo\"'),
('meta.__names__.ee419d88-11a8-4bdd-ad75-63badd6cf7c0', '\"Price\"'),
('meta.__names__.f2746321-ef1e-4494-a19b-998823890d27', '\"FormDescription\"'),
('meta.__names__.f35a1087-1bdc-4c52-beb4-47b65b821e6c', '\"New\"'),
('meta.__names__.f8145be8-29f8-43ae-b178-99d5f61d0b6c', '\"Footer\"'),
('navigate.nav.bd31ba5f-879c-4e55-b920-acab85a67300.adminOnly', '1'),
('navigate.nav.bd31ba5f-879c-4e55-b920-acab85a67300.allowSources', '\"*\"'),
('navigate.nav.bd31ba5f-879c-4e55-b920-acab85a67300.enabledSiteGroups', '\"*\"'),
('navigate.nav.bd31ba5f-879c-4e55-b920-acab85a67300.handle', '\"mainNav\"'),
('navigate.nav.bd31ba5f-879c-4e55-b920-acab85a67300.levels', '\"1\"'),
('navigate.nav.bd31ba5f-879c-4e55-b920-acab85a67300.title', '\"Main Navigation\"'),
('plugins.cookie-consent.edition', '\"standard\"'),
('plugins.cookie-consent.enabled', 'true'),
('plugins.cookie-consent.licenseKey', '\"OONYD9QY0DN5M85BSTUXPO2U\"'),
('plugins.cookie-consent.schemaVersion', '\"1.5.0\"'),
('plugins.dumper.edition', '\"standard\"'),
('plugins.dumper.enabled', 'true'),
('plugins.dumper.schemaVersion', '\"1.0.0\"'),
('plugins.feed-me.edition', '\"standard\"'),
('plugins.feed-me.enabled', 'true'),
('plugins.feed-me.schemaVersion', '\"5.1.0.0\"'),
('plugins.formie.edition', '\"standard\"'),
('plugins.formie.enabled', 'true'),
('plugins.formie.licenseKey', '\"D7QBSLHITXUVBKFQVYMRAURW\"'),
('plugins.formie.schemaVersion', '\"3.4.4\"'),
('plugins.navigate.edition', '\"standard\"'),
('plugins.navigate.enabled', 'true'),
('plugins.navigate.licenseKey', '\"EEL1ZIP396LGY5THG0678PJO\"'),
('plugins.navigate.schemaVersion', '\"2.4.0\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.defaultPlacement', '\"end\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.enableVersioning', 'true'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.entryTypes.0', '\"87afe98a-c5a0-4ac8-a3b6-6bd2c48da0c5\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.handle', '\"homepage\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.maxAuthors', '1'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.name', '\"Homepage\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.propagationMethod', '\"all\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.siteSettings.30863589-1efd-4876-8616-a9940a064ced.enabledByDefault', 'true'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.siteSettings.30863589-1efd-4876-8616-a9940a064ced.hasUrls', 'true'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.siteSettings.30863589-1efd-4876-8616-a9940a064ced.template', '\"index.twig\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.siteSettings.30863589-1efd-4876-8616-a9940a064ced.uriFormat', '\"__home__\"'),
('sections.48f60c35-6b15-498e-85e5-ea8d92527c3c.type', '\"single\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.defaultPlacement', '\"end\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.enableVersioning', 'true'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.entryTypes.0', '\"32ec3ad3-e3ec-488b-9670-185dcae1a236\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.handle', '\"header\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.maxAuthors', '1'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.name', '\"Header\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.propagationMethod', '\"all\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.siteSettings.30863589-1efd-4876-8616-a9940a064ced.enabledByDefault', 'true'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.siteSettings.30863589-1efd-4876-8616-a9940a064ced.hasUrls', 'true'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.siteSettings.30863589-1efd-4876-8616-a9940a064ced.template', '\"header/_entry\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.siteSettings.30863589-1efd-4876-8616-a9940a064ced.uriFormat', '\"header\"'),
('sections.5548eee2-fe00-4fee-bd86-6296f8f13aa5.type', '\"single\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.defaultPlacement', '\"end\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.enableVersioning', 'true'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.entryTypes.0', '\"65305b29-a1b4-4736-8ef8-a757decd3de9\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.entryTypes.1', '\"259b293c-e5d6-482f-98e8-158a8a0f6b88\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.handle', '\"products\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.maxAuthors', '1'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.name', '\"Products\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.propagationMethod', '\"all\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.siteSettings.30863589-1efd-4876-8616-a9940a064ced.enabledByDefault', 'true'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.siteSettings.30863589-1efd-4876-8616-a9940a064ced.hasUrls', 'true'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.siteSettings.30863589-1efd-4876-8616-a9940a064ced.template', '\"product.twig\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.siteSettings.30863589-1efd-4876-8616-a9940a064ced.uriFormat', '\"products/{slug}\"'),
('sections.b57b1002-f8d0-4634-b367-e7014e73cc8b.type', '\"channel\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.defaultPlacement', '\"end\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.enableVersioning', 'true'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.entryTypes.0', '\"4949eae4-4151-4200-969e-16fb4e858353\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.handle', '\"contact\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.maxAuthors', '1'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.name', '\"Contact\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.propagationMethod', '\"all\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.siteSettings.30863589-1efd-4876-8616-a9940a064ced.enabledByDefault', 'true'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.siteSettings.30863589-1efd-4876-8616-a9940a064ced.hasUrls', 'true'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.siteSettings.30863589-1efd-4876-8616-a9940a064ced.template', '\"contact.twig\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.siteSettings.30863589-1efd-4876-8616-a9940a064ced.uriFormat', '\"contact\"'),
('sections.dacfeb3b-6ffa-416d-94ee-2587a3223cef.type', '\"single\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.defaultPlacement', '\"end\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.enableVersioning', 'true'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.entryTypes.0', '\"9971f49b-6318-4be1-af82-ffccc357c3e5\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.handle', '\"footer\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.maxAuthors', '1'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.name', '\"Footer\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.propagationMethod', '\"all\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.siteSettings.30863589-1efd-4876-8616-a9940a064ced.enabledByDefault', 'true'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.siteSettings.30863589-1efd-4876-8616-a9940a064ced.hasUrls', 'true'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.siteSettings.30863589-1efd-4876-8616-a9940a064ced.template', '\"footer/_entry\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.siteSettings.30863589-1efd-4876-8616-a9940a064ced.uriFormat', '\"footer\"'),
('sections.f8145be8-29f8-43ae-b178-99d5f61d0b6c.type', '\"single\"'),
('siteGroups.7efebcfe-cbe8-4d2a-a4c0-c75c069d028e.name', '\"kserenity-skincare\"'),
('sites.30863589-1efd-4876-8616-a9940a064ced.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.30863589-1efd-4876-8616-a9940a064ced.handle', '\"default\"'),
('sites.30863589-1efd-4876-8616-a9940a064ced.hasUrls', 'true'),
('sites.30863589-1efd-4876-8616-a9940a064ced.language', '\"en-US\"'),
('sites.30863589-1efd-4876-8616-a9940a064ced.name', '\"kserenity-skincare\"'),
('sites.30863589-1efd-4876-8616-a9940a064ced.primary', 'true'),
('sites.30863589-1efd-4876-8616-a9940a064ced.siteGroup', '\"7efebcfe-cbe8-4d2a-a4c0-c75c069d028e\"'),
('sites.30863589-1efd-4876-8616-a9940a064ced.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"kserenity-skincare\"'),
('system.schemaVersion', '\"5.0.0.20\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.require2fa', 'false'),
('users.requireEmailVerification', 'true'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.altTranslationKeyFormat', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.altTranslationMethod', '\"none\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elementCondition', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.elementCondition', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.fieldUid', '\"7331cb0c-7b5e-488f-9bc0-5b9eab8fb72d\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.handle', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.includeInCards', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.instructions', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.label', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.providesThumbs', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.required', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.tip', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.uid', '\"bf37df30-470d-4a54-90b4-a6419c48632e\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.userCondition', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.warning', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.0.width', '100'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.autocapitalize', 'true'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.autocomplete', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.autocorrect', 'true'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.class', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.disabled', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.elementCondition', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.id', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.includeInCards', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.inputType', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.instructions', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.label', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.max', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.min', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.name', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.orientation', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.placeholder', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.providesThumbs', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.readonly', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.requirable', 'false'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.size', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.step', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.tip', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.title', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.uid', '\"411c72d7-1099-4200-a8cc-a4fa75c1ff5b\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.userCondition', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.warning', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.elements.1.width', '100'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.name', '\"Content\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.uid', '\"5bd75ba6-47cf-4a04-b5fa-bb443f895fb8\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fieldLayouts.738e8638-c534-42c9-b572-5a89c0ebec7b.tabs.0.userCondition', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.fs', '\"sitelogo\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.handle', '\"sitelogo\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.name', '\"SiteLogo\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.sortOrder', '1'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.subpath', '\"\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.titleTranslationKeyFormat', 'null'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.titleTranslationMethod', '\"site\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.transformFs', '\"sitelogo\"'),
('volumes.29685f3e-1f14-43ff-90f4-cd1b385b8501.transformSubpath', '\"\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.altTranslationKeyFormat', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.altTranslationMethod', '\"none\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elementCondition', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.elementCondition', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.fieldUid', '\"c1301a7d-dc92-494c-ba91-175a1a8e411f\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.handle', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.includeInCards', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.instructions', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.label', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.providesThumbs', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.required', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.tip', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.uid', '\"2ac5581a-2c64-4310-aff5-39882d301b38\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.userCondition', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.warning', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.0.width', '100'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.autocapitalize', 'true'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.autocomplete', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.autocorrect', 'true'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.class', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.disabled', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.elementCondition', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.id', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.includeInCards', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.inputType', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.instructions', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.label', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.max', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.min', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.name', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.orientation', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.placeholder', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.providesThumbs', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.readonly', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.requirable', 'false'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.size', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.step', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.tip', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.title', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.uid', '\"0a3e10b7-a7e5-40f9-8525-db79048afe9f\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.userCondition', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.warning', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.elements.1.width', '100'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.name', '\"Content\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.uid', '\"8a1b3aa1-7ab9-48e2-9ad1-c361056f5546\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fieldLayouts.cb4522ff-825f-4952-b9c6-ca4988984bec.tabs.0.userCondition', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.fs', '\"contactimg\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.handle', '\"contactimg\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.name', '\"ContactImg\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.sortOrder', '2'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.subpath', '\"\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.titleTranslationKeyFormat', 'null'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.titleTranslationMethod', '\"site\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.transformFs', '\"contactimg\"'),
('volumes.7cb8b0db-c230-471d-bd63-642a532fc6de.transformSubpath', '\"\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.altTranslationKeyFormat', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.altTranslationMethod', '\"none\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elementCondition', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.autocomplete', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.autocorrect', 'true'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.class', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.disabled', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.elementCondition', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.id', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.includeInCards', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.inputType', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.instructions', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.label', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.max', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.min', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.name', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.orientation', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.placeholder', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.providesThumbs', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.readonly', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.requirable', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.size', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.step', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.tip', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.title', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.uid', '\"e4e78bdc-26be-4455-865c-72d3d8fee37d\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.userCondition', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.warning', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.0.width', '100'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.elementCondition', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.fieldUid', '\"ec962417-3322-4da5-a5ad-df1967228a86\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.handle', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.includeInCards', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.instructions', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.label', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.providesThumbs', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.required', 'false'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.tip', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.uid', '\"d8c41e6b-23b4-4c8b-a84d-5d8b7e2c524f\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.userCondition', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.warning', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.elements.1.width', '100'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.name', '\"Content\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.uid', '\"b0de577d-c5f4-4efc-a4bd-ab25379a0258\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fieldLayouts.c27ffe14-97d1-4023-818d-30f5a0839f20.tabs.0.userCondition', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.fs', '\"blacklogo\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.handle', '\"blacklogo\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.name', '\"blackLogo\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.sortOrder', '4'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.subpath', '\"\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.titleTranslationKeyFormat', 'null'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.titleTranslationMethod', '\"site\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.transformFs', '\"blacklogo\"'),
('volumes.9a77c145-c53b-44a4-bdb2-2dc307052d32.transformSubpath', '\"\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.altTranslationKeyFormat', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.altTranslationMethod', '\"none\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elementCondition', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.autocomplete', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.autocorrect', 'true'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.class', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.disabled', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.elementCondition', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.id', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.includeInCards', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.inputType', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.instructions', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.label', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.max', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.min', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.name', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.orientation', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.placeholder', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.providesThumbs', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.readonly', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.requirable', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.size', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.step', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.tip', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.title', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.uid', '\"c41cc2f3-7ea0-4364-bef4-97545f566191\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.userCondition', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.warning', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.0.width', '100'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.elementCondition', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.fieldUid', '\"7028ecad-3014-43e2-b223-a872366b97d6\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.handle', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.includeInCards', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.instructions', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.label', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.providesThumbs', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.required', 'false'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.tip', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.uid', '\"f30875c5-c21b-48e8-87c8-26f41fa97835\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.userCondition', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.warning', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.elements.1.width', '100'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.name', '\"Content\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.uid', '\"034a0410-c6d5-4b9b-99d2-a288d4fe1ca7\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fieldLayouts.ad41d11e-5517-4edc-8d60-eef257134401.tabs.0.userCondition', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.fs', '\"productimg\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.handle', '\"productimg\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.name', '\"productImg\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.sortOrder', '5'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.subpath', '\"\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.titleTranslationKeyFormat', 'null'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.titleTranslationMethod', '\"site\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.transformFs', '\"\"'),
('volumes.aa18b816-e7a6-4e90-94ca-6cae62db99e9.transformSubpath', '\"\"');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_pkjysiamafnzoqckngfzrzvlcgzuwqeajalx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_unlcfkwoiivjopmdhifnebpsfnizfeovhkwo` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
CREATE TABLE IF NOT EXISTS `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `relations`
--

DROP TABLE IF EXISTS `relations`;
CREATE TABLE IF NOT EXISTS `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wvofyawfujznhpsaxnudyiioimlfhfwovopc` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_izofyimtiphlnqlmvbiqmhbkenjzheifxrde` (`sourceId`),
  KEY `idx_qptrzhoaupmzbczerritgouyqshgpjlfpilu` (`targetId`),
  KEY `idx_bwhkvinmzoaqskzfqmytddqbpxpjhfjpaukh` (`sourceSiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 9, 2, NULL, 22, 1, '2024-05-18 19:08:20', '2024-05-18 19:08:20', '3923b93a-f257-44a9-8ff2-7aa3dbe9deb2'),
(3, 9, 24, NULL, 22, 1, '2024-05-18 19:08:20', '2024-05-18 19:08:20', 'c5500ea7-75f5-4a81-a159-8048ea3b0a79'),
(5, 9, 28, NULL, 22, 1, '2024-05-18 19:58:08', '2024-05-18 19:58:08', '453685a0-4c6c-4763-9249-15de64e043d5'),
(7, 9, 32, NULL, 22, 1, '2024-05-18 22:10:01', '2024-05-18 22:10:01', '4e265610-930d-41bf-8376-c03e156e2639'),
(9, 9, 34, NULL, 22, 1, '2024-05-18 22:13:52', '2024-05-18 22:13:52', '9c581acd-7441-4627-89f9-21ae2fd6aaf3'),
(12, 24, 2, NULL, 37, 1, '2024-05-18 22:25:12', '2024-05-18 22:25:12', 'd94a2a6c-3e94-4ede-b4ac-5163be534c51'),
(13, 9, 39, NULL, 22, 1, '2024-05-18 22:25:12', '2024-05-18 22:25:12', '22c34ad5-5d28-4e38-9a9b-441cc5c3535d'),
(14, 24, 39, NULL, 37, 1, '2024-05-18 22:25:12', '2024-05-18 22:25:12', '8af2fb9a-0104-4133-a429-eccc30c3995b'),
(16, 27, 41, NULL, 42, 1, '2024-05-20 11:53:29', '2024-05-20 11:53:29', '9139189b-28a8-41f7-aa80-ca920d8ef30d'),
(18, 16, 104, NULL, 82, 1, '2024-05-20 13:36:14', '2024-05-20 13:36:14', '2b0616fc-9d89-4548-bfeb-04e7d532c70b'),
(19, 16, 105, NULL, 82, 1, '2024-05-20 13:37:50', '2024-05-20 13:37:50', 'd2999943-94ee-4fe4-b990-bcdc69a77fcc'),
(21, 16, 107, NULL, 82, 1, '2024-05-20 13:39:11', '2024-05-20 13:39:11', '12032e6f-661b-4913-ae81-b6cd36975681'),
(22, 16, 108, NULL, 58, 1, '2024-05-20 13:40:19', '2024-05-20 13:40:19', '053d18bd-c131-4c58-8d84-d471575faae2'),
(23, 16, 109, NULL, 58, 1, '2024-05-20 13:40:39', '2024-05-20 13:40:39', 'f72e303e-3226-410b-bd25-8a32085f873c'),
(24, 16, 110, NULL, 93, 1, '2024-05-20 13:50:11', '2024-05-20 13:50:11', 'b4c2bc72-f975-404a-bd29-81b2d4ab6d14'),
(25, 16, 111, NULL, 93, 1, '2024-05-20 13:57:44', '2024-05-20 13:57:44', 'ed87979a-de96-4ed5-b8d0-edd2c7b866f5'),
(26, 16, 112, NULL, 86, 1, '2024-05-20 13:58:10', '2024-05-20 13:58:10', '7d18e085-d9ac-4f61-b3fb-400d59093b72'),
(27, 16, 113, NULL, 86, 1, '2024-05-20 13:58:15', '2024-05-20 13:58:15', 'bf9d4968-e83c-48b8-88c6-3873365743cb'),
(28, 16, 114, NULL, 61, 1, '2024-05-20 13:58:47', '2024-05-20 13:58:47', '19021bfb-fe44-42ac-96bb-7253c659be05'),
(29, 16, 115, NULL, 61, 1, '2024-05-20 13:58:51', '2024-05-20 13:58:51', '079cf85e-365a-45f6-8f3e-b58c3f0ea3d4'),
(30, 16, 116, NULL, 69, 1, '2024-05-20 13:59:20', '2024-05-20 13:59:20', '6724027b-bde8-4157-8c89-9785c96995d5'),
(31, 16, 117, NULL, 69, 1, '2024-05-20 13:59:25', '2024-05-20 13:59:25', '76a3310a-6dfe-4c2e-8454-f453103dc902'),
(32, 16, 118, NULL, 55, 1, '2024-05-20 13:59:53', '2024-05-20 13:59:53', '97d58231-78de-4ccf-bcd3-70b99a49ce72'),
(33, 16, 119, NULL, 55, 1, '2024-05-20 13:59:57', '2024-05-20 13:59:57', 'bf2840a6-063d-45b2-810a-9adcf57927c0'),
(34, 16, 120, NULL, 95, 1, '2024-05-20 14:00:30', '2024-05-20 14:00:30', '4e5cd866-122a-4a80-9567-6c2e4f3eeb1b'),
(35, 16, 121, NULL, 95, 1, '2024-05-20 14:00:36', '2024-05-20 14:00:36', 'fc71f55f-5cf4-41f8-9301-ee1f7bf03d9f'),
(36, 16, 122, NULL, 95, 1, '2024-05-20 14:01:55', '2024-05-20 14:01:55', '5db58cc7-9ddb-44df-b3ab-df8e8edbcb6e'),
(37, 16, 123, NULL, 99, 1, '2024-05-20 14:02:27', '2024-05-20 14:02:27', 'bd3e1b4e-1afe-4fa5-a5c9-8438ca600a3b'),
(38, 16, 124, NULL, 99, 1, '2024-05-20 14:02:31', '2024-05-20 14:02:31', '1b34123f-8db1-4719-a0d2-7520391e1b43'),
(39, 16, 125, NULL, 65, 1, '2024-05-20 14:03:03', '2024-05-20 14:03:03', '0ee5a218-9510-4a00-8aa5-e405735fbdd8'),
(40, 16, 126, NULL, 65, 1, '2024-05-20 14:03:08', '2024-05-20 14:03:08', '9ff68604-5ce8-4b27-bf46-eb6dcd7e4b49'),
(41, 16, 127, NULL, 73, 1, '2024-05-20 14:05:06', '2024-05-20 14:05:06', 'bc8839da-8516-465d-a00a-f31759bb85da'),
(42, 16, 128, NULL, 73, 1, '2024-05-20 14:05:12', '2024-05-20 14:05:12', '08b69eaa-eae1-48fc-9208-53dc6dac7f52'),
(43, 16, 129, NULL, 67, 1, '2024-05-20 14:05:47', '2024-05-20 14:05:47', '68dc8f6e-92b5-45b5-8775-fe657060aa55'),
(44, 16, 130, NULL, 67, 1, '2024-05-20 14:05:52', '2024-05-20 14:05:52', '27599a42-b5ac-46f5-96bc-db471eb7e5b5'),
(45, 16, 131, NULL, 76, 1, '2024-05-20 14:06:22', '2024-05-20 14:06:22', '3b6b78b0-8b7c-44e2-a836-ab9a2b6eccb1'),
(46, 16, 132, NULL, 76, 1, '2024-05-20 14:06:27', '2024-05-20 14:06:27', '5eb66cfe-745d-423b-83c9-aef56f646e22'),
(47, 16, 133, NULL, 78, 1, '2024-05-20 14:06:49', '2024-05-20 14:06:49', 'bc53b07c-73e5-4084-99f4-188d6bef75c0'),
(48, 16, 134, NULL, 78, 1, '2024-05-20 14:06:51', '2024-05-20 14:06:51', 'd1d90693-1cd0-46c3-a229-e349cbbba028'),
(49, 16, 135, NULL, 97, 1, '2024-05-20 14:07:24', '2024-05-20 14:07:24', '8fb6a8d2-496f-47cf-b2b9-b56a35ddc72b'),
(50, 16, 136, NULL, 97, 1, '2024-05-20 14:07:33', '2024-05-20 14:07:33', '3ee7647b-4b76-4786-aed0-24e2bb3125c7'),
(51, 16, 137, NULL, 88, 1, '2024-05-20 14:08:00', '2024-05-20 14:08:00', 'adf8f6db-a042-4d48-bd55-139dbdfd6ffa'),
(52, 16, 138, NULL, 88, 1, '2024-05-20 14:08:05', '2024-05-20 14:08:05', 'a45236c2-24ee-4962-8a61-6a9e1c45a076'),
(53, 16, 139, NULL, 64, 1, '2024-05-20 14:08:26', '2024-05-20 14:08:26', '9e23ef12-b1b1-4876-912b-f3e0a32f1c1b'),
(54, 16, 140, NULL, 64, 1, '2024-05-20 14:08:29', '2024-05-20 14:08:29', 'c4272739-e9f3-4951-86da-dbdf022e0603'),
(56, 16, 142, NULL, 77, 1, '2024-05-20 14:08:56', '2024-05-20 14:08:56', '8c04ddde-764a-4d45-a639-13f0da8bb422'),
(57, 16, 143, NULL, 84, 1, '2024-05-20 14:09:19', '2024-05-20 14:09:19', 'ac4d0aaa-f72a-491e-979b-3802bb1e58d9'),
(58, 16, 144, NULL, 84, 1, '2024-05-20 14:09:23', '2024-05-20 14:09:23', '9cbb83bf-bf7b-4515-88d2-f519e1c0eda0'),
(59, 16, 145, NULL, 77, 1, '2024-05-20 14:10:07', '2024-05-20 14:10:07', '3edac0f4-a33a-4345-8d18-497d894e470c'),
(60, 16, 146, NULL, 77, 1, '2024-05-20 14:10:11', '2024-05-20 14:10:11', '99ba97fd-95ae-4e1c-b8ef-e0d30439c056'),
(63, 16, 141, NULL, 71, 1, '2024-05-20 14:10:59', '2024-05-20 14:10:59', 'fb634fff-beab-474b-927e-7df7ee535cbc'),
(64, 16, 148, NULL, 71, 1, '2024-05-20 14:10:59', '2024-05-20 14:10:59', '0af80ebd-a33a-4151-ad3d-8f1c5caf0fdd'),
(67, 9, 151, NULL, 22, 1, '2024-05-20 14:24:26', '2024-05-20 14:24:26', 'aad83e71-528f-4d3e-8f34-85ae5a616835'),
(68, 24, 151, NULL, 37, 1, '2024-05-20 14:24:26', '2024-05-20 14:24:26', '1e2f07ae-3db7-4bb2-8d35-ba0b559c55c8'),
(69, 9, 152, NULL, 22, 1, '2024-05-20 14:24:47', '2024-05-20 14:24:47', '8db61c92-225d-4f82-96b0-16bfaaaa8080'),
(70, 24, 152, NULL, 37, 1, '2024-05-20 14:24:47', '2024-05-20 14:24:47', '95ba2124-dd79-4f48-92a6-617bba9dda75'),
(71, 9, 153, NULL, 22, 1, '2024-05-20 14:25:10', '2024-05-20 14:25:10', '35b37e12-5aab-4285-8ef1-3c2f2fd118b1'),
(72, 24, 153, NULL, 37, 1, '2024-05-20 14:25:10', '2024-05-20 14:25:10', '1ca084e6-79b1-4688-bd7e-dde4790d5026'),
(75, 9, 156, NULL, 22, 1, '2024-05-20 14:26:05', '2024-05-20 14:26:05', 'bbf2dd80-1b9c-4403-a602-3fce6178fce6'),
(76, 24, 156, NULL, 37, 1, '2024-05-20 14:26:05', '2024-05-20 14:26:05', '22513850-41d8-49b7-9429-dbd6e1dd4c0a'),
(78, 16, 166, NULL, 82, 1, '2024-05-20 16:23:34', '2024-05-20 16:23:34', 'e8ea7d02-fd3b-41a3-bc54-01dc7c949586'),
(81, 16, 104, NULL, 81, 2, '2024-05-20 16:32:58', '2024-05-20 16:32:58', 'd0a8628d-2f61-48ba-ae55-add8f1a8ba40'),
(82, 16, 168, NULL, 82, 1, '2024-05-20 16:32:58', '2024-05-20 16:32:58', 'cce8faab-0e69-46b3-87db-89e7578418d4'),
(83, 16, 168, NULL, 81, 2, '2024-05-20 16:32:58', '2024-05-20 16:32:58', 'f02a21e9-4fc7-469a-aa78-4c5ec68abd27'),
(86, 16, 108, NULL, 57, 2, '2024-05-20 16:50:15', '2024-05-20 16:50:15', '03259aa3-e038-422d-81bd-caa7699805d8'),
(87, 16, 170, NULL, 58, 1, '2024-05-20 16:50:15', '2024-05-20 16:50:15', '2442b089-33be-4a72-89ce-56e44b8ed575'),
(88, 16, 170, NULL, 57, 2, '2024-05-20 16:50:15', '2024-05-20 16:50:15', 'fdb3ba76-964c-44ec-b69c-70ccd6e55ec9'),
(91, 16, 110, NULL, 94, 2, '2024-05-20 16:50:51', '2024-05-20 16:50:51', 'c6d37b8d-c48f-4b8b-8d56-ee757e7f31c9'),
(92, 16, 172, NULL, 93, 1, '2024-05-20 16:50:52', '2024-05-20 16:50:52', 'ef0725f6-b5ec-4bdb-984f-4e6aa697bb7a'),
(93, 16, 172, NULL, 94, 2, '2024-05-20 16:50:52', '2024-05-20 16:50:52', 'cfadda19-b098-4056-94c4-13658b1d3085'),
(96, 16, 112, NULL, 85, 2, '2024-05-20 16:51:13', '2024-05-20 16:51:13', 'ec7cd4c0-972e-4d94-8951-897fbb9f182e'),
(97, 16, 174, NULL, 86, 1, '2024-05-20 16:51:13', '2024-05-20 16:51:13', 'b8cd645b-25e9-452f-9bf7-6a7185b3ff98'),
(98, 16, 174, NULL, 85, 2, '2024-05-20 16:51:13', '2024-05-20 16:51:13', '2cdd7495-e101-44af-8f41-b2345ee3d0ee'),
(101, 16, 114, NULL, 62, 2, '2024-05-20 16:51:35', '2024-05-20 16:51:35', '26640692-e2f0-4534-8fc7-4e79567cec52'),
(102, 16, 176, NULL, 61, 1, '2024-05-20 16:51:35', '2024-05-20 16:51:35', '11077827-0c86-4a95-b4a4-d39f867f2ef2'),
(103, 16, 176, NULL, 62, 2, '2024-05-20 16:51:35', '2024-05-20 16:51:35', '7f69791a-397f-408c-b705-f62a2cef9c77'),
(106, 16, 178, NULL, 58, 1, '2024-05-20 16:52:27', '2024-05-20 16:52:27', 'fb3e5c24-4448-43ab-a727-61b524180e61'),
(107, 16, 178, NULL, 57, 2, '2024-05-20 16:52:27', '2024-05-20 16:52:27', '29f15865-5c19-4d2f-b4ef-c2612acb06fd'),
(110, 16, 180, NULL, 93, 1, '2024-05-20 16:52:45', '2024-05-20 16:52:45', 'f5f1a86e-5068-4cef-ad9b-2acac42a7719'),
(111, 16, 180, NULL, 94, 2, '2024-05-20 16:52:45', '2024-05-20 16:52:45', '51f8832a-d10d-4eb3-9267-d657ef896709'),
(114, 16, 182, NULL, 86, 1, '2024-05-20 16:52:57', '2024-05-20 16:52:57', '7a0b0d1f-048c-40c2-9575-2866835968a8'),
(115, 16, 182, NULL, 85, 2, '2024-05-20 16:52:57', '2024-05-20 16:52:57', '0e31a4b9-6f09-44a8-9905-b96cec985767'),
(118, 16, 184, NULL, 61, 1, '2024-05-20 16:53:48', '2024-05-20 16:53:48', '376f9f26-d3f5-499d-a4df-f1cf39cb83cc'),
(119, 16, 184, NULL, 62, 2, '2024-05-20 16:53:48', '2024-05-20 16:53:48', 'f7e14203-f54c-47cd-8c34-cb99db772ce5'),
(122, 16, 116, NULL, 70, 2, '2024-05-20 16:54:27', '2024-05-20 16:54:27', '6ea839e8-87d2-4ede-bc79-c9758afaf4a3'),
(123, 16, 186, NULL, 69, 1, '2024-05-20 16:54:27', '2024-05-20 16:54:27', '59cd3e4b-bc77-4fc5-a4d0-3791be05b1d8'),
(124, 16, 186, NULL, 70, 2, '2024-05-20 16:54:27', '2024-05-20 16:54:27', '42a05e9f-0213-424d-945f-8945e311bcf6'),
(127, 16, 127, NULL, 74, 2, '2024-05-20 16:54:59', '2024-05-20 16:54:59', '6fba54a6-d5e5-49f1-83a1-65bb118057d5'),
(128, 16, 188, NULL, 73, 1, '2024-05-20 16:54:59', '2024-05-20 16:54:59', '271606ce-4279-4bcd-85d2-c1da6522874a'),
(129, 16, 188, NULL, 74, 2, '2024-05-20 16:54:59', '2024-05-20 16:54:59', '57c4d74b-9c73-422c-8946-262147c11c7a'),
(132, 16, 118, NULL, 56, 2, '2024-05-20 16:55:20', '2024-05-20 16:55:20', '805fc7a0-912f-4dea-be61-3e6888d0f6c5'),
(133, 16, 190, NULL, 55, 1, '2024-05-20 16:55:20', '2024-05-20 16:55:20', '42531b9a-e8dd-4e49-aefc-79230dfeac36'),
(134, 16, 190, NULL, 56, 2, '2024-05-20 16:55:20', '2024-05-20 16:55:20', '871ba14f-ae19-413a-9aa8-66e6f4622bb4'),
(137, 16, 120, NULL, 96, 2, '2024-05-20 16:56:00', '2024-05-20 16:56:00', '20cb85c9-4584-46ed-985d-4dbc2b52cde0'),
(138, 16, 192, NULL, 95, 1, '2024-05-20 16:56:00', '2024-05-20 16:56:00', '7db826b7-a06a-45b2-8471-738a077525ef'),
(139, 16, 192, NULL, 96, 2, '2024-05-20 16:56:00', '2024-05-20 16:56:00', '6dc12cfc-2329-4113-abd2-3dad9614931e'),
(142, 16, 123, NULL, 100, 2, '2024-05-20 16:56:23', '2024-05-20 16:56:23', '3ebee431-cbe2-4b61-a76d-d5662a7d8d7b'),
(143, 16, 194, NULL, 99, 1, '2024-05-20 16:56:23', '2024-05-20 16:56:23', '2b8164d6-8fa1-4df3-a122-e3480dd85646'),
(144, 16, 194, NULL, 100, 2, '2024-05-20 16:56:23', '2024-05-20 16:56:23', 'a073751e-4601-4044-9e22-bdc4b4eac1bb'),
(147, 16, 125, NULL, 66, 2, '2024-05-20 16:59:24', '2024-05-20 16:59:24', 'f0b2c28e-b824-4138-8a7b-3ed7f09015f7'),
(148, 16, 196, NULL, 65, 1, '2024-05-20 16:59:24', '2024-05-20 16:59:24', '4735455e-931d-4031-8549-5c678e221359'),
(149, 16, 196, NULL, 66, 2, '2024-05-20 16:59:24', '2024-05-20 16:59:24', '4d177593-340d-4aa4-bd6c-8686482c3726'),
(152, 16, 129, NULL, 68, 2, '2024-05-20 17:00:20', '2024-05-20 17:00:20', '2781b22b-6c00-4014-8617-a48d90eb7815'),
(153, 16, 198, NULL, 67, 1, '2024-05-20 17:00:20', '2024-05-20 17:00:20', '12220fbd-302f-4230-8fa0-09f7109dac4a'),
(154, 16, 198, NULL, 68, 2, '2024-05-20 17:00:20', '2024-05-20 17:00:20', '2ca988ba-bd74-4b3e-8879-10951da5a04f'),
(157, 16, 131, NULL, 75, 2, '2024-05-20 17:00:46', '2024-05-20 17:00:46', 'f193b1a7-abe5-4b88-a8ef-628eeeddc717'),
(158, 16, 200, NULL, 76, 1, '2024-05-20 17:00:46', '2024-05-20 17:00:46', '172bcda9-2699-49bc-93d7-deaf3fe28b0b'),
(159, 16, 200, NULL, 75, 2, '2024-05-20 17:00:46', '2024-05-20 17:00:46', 'ac85c460-7749-421e-ac87-b6d7292baaec'),
(162, 16, 133, NULL, 79, 2, '2024-05-20 17:01:05', '2024-05-20 17:01:05', 'b3de6d47-d412-421a-a1c9-4439ad0b4e84'),
(163, 16, 202, NULL, 78, 1, '2024-05-20 17:01:05', '2024-05-20 17:01:05', 'cfbc0959-a859-471b-a78b-63d184628ba5'),
(164, 16, 202, NULL, 79, 2, '2024-05-20 17:01:05', '2024-05-20 17:01:05', 'cc72e012-c5aa-48f9-83a1-125c0a7f2d97'),
(167, 16, 135, NULL, 98, 2, '2024-05-20 17:01:42', '2024-05-20 17:01:42', '272f451e-75e8-4f63-a888-80353adfba9f'),
(168, 16, 204, NULL, 97, 1, '2024-05-20 17:01:42', '2024-05-20 17:01:42', '295696dc-6425-44af-993d-6f5c9793e9d5'),
(169, 16, 204, NULL, 98, 2, '2024-05-20 17:01:42', '2024-05-20 17:01:42', 'b4537a69-55a4-4ad0-9148-8017835ef794'),
(172, 16, 137, NULL, 89, 2, '2024-05-20 17:02:12', '2024-05-20 17:02:12', '65fc08e2-6976-4b33-84c1-f4e0af4de014'),
(173, 16, 206, NULL, 88, 1, '2024-05-20 17:02:12', '2024-05-20 17:02:12', '2e3b9aee-cf58-466f-adea-959ed52289e8'),
(174, 16, 206, NULL, 89, 2, '2024-05-20 17:02:12', '2024-05-20 17:02:12', '5ddabd40-fd88-4452-b8dd-8251191c64d6'),
(177, 16, 139, NULL, 63, 2, '2024-05-20 17:02:39', '2024-05-20 17:02:39', 'ebea52cc-f3cc-4447-ae78-0a32b2c025c1'),
(178, 16, 208, NULL, 64, 1, '2024-05-20 17:02:39', '2024-05-20 17:02:39', '00e4f2c9-ff92-4c3d-8aac-28b71d00a131'),
(179, 16, 208, NULL, 63, 2, '2024-05-20 17:02:39', '2024-05-20 17:02:39', 'fc512cfe-1035-4cc8-b1e9-730f981cd19b'),
(182, 16, 141, NULL, 72, 2, '2024-05-20 17:03:02', '2024-05-20 17:03:02', '28bf55d2-3aa1-488b-9672-859629f8b4d2'),
(183, 16, 210, NULL, 71, 1, '2024-05-20 17:03:02', '2024-05-20 17:03:02', '1f2fdf68-8009-4f76-8176-005686cc9ebb'),
(184, 16, 210, NULL, 72, 2, '2024-05-20 17:03:02', '2024-05-20 17:03:02', '8b87f1e7-37aa-4ecb-8c5e-e892ce1e5aec'),
(187, 16, 145, NULL, 87, 2, '2024-05-20 17:03:23', '2024-05-20 17:03:23', 'b570d594-7205-47c2-bc38-32634166afa8'),
(188, 16, 212, NULL, 77, 1, '2024-05-20 17:03:24', '2024-05-20 17:03:24', 'cb09bc02-d540-4045-82f6-f9e51f47b1f8'),
(189, 16, 212, NULL, 87, 2, '2024-05-20 17:03:24', '2024-05-20 17:03:24', 'fd33baef-a20c-447b-897c-0139781c7934'),
(192, 16, 143, NULL, 83, 2, '2024-05-20 17:03:42', '2024-05-20 17:03:42', '16e66d99-d091-4250-afe7-65a150f5c741'),
(193, 16, 214, NULL, 84, 1, '2024-05-20 17:03:42', '2024-05-20 17:03:42', 'bee7f512-7fd8-4fce-b7b6-512a45a72216'),
(194, 16, 214, NULL, 83, 2, '2024-05-20 17:03:42', '2024-05-20 17:03:42', '9b1bd4f2-4c25-4e50-9853-8eefb406cd0f');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
CREATE TABLE IF NOT EXISTS `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('1198b588', '@craft/web/assets/recententries/dist'),
('121fdddc', '@craft/web/assets/conditionbuilder/dist'),
('185bf3d7', '@craft/web/assets/updater/dist'),
('2261d4bf', '@craft/web/assets/fieldsettings/dist'),
('24080189', '@craft/web/assets/iframeresizer/dist'),
('2e3b3b77', '@craft/web/assets/vue/dist'),
('2e63cb28', '@craft/web/assets/editsection/dist'),
('2f22f7e6', '@craft/web/assets/updateswidget/dist'),
('2f69083e', '@craft/web/assets/d3/dist'),
('30d95756', '@verbb/formie/web/assets/forms/dist'),
('3187685c', '@craft/web/assets/datepickeri18n/dist'),
('3383ab2d', '@bower/inputmask/dist'),
('351e6cc5', '@craft/web/assets/feed/dist'),
('355c2e77', '@craft/web/assets/cp/dist'),
('359c1dda', '@elleracompany/cookieconsent/resources'),
('39148c3f', '@craft/web/assets/selectize/dist'),
('3a1be32c', '@craft/web/assets/velocity/dist'),
('3c271e0a', '@craft/web/assets/pluginstore/dist'),
('3d73b45', '@craft/web/assets/picturefill/dist'),
('3e01361d', '@craft/web/assets/tailwindreset/dist'),
('3f8ce19b', '@craft/web/assets/jquerypayment/dist'),
('3fdf3ef9', '@craft/web/assets/jquerytouchevents/dist'),
('4058790d', '@craft/web/assets/money/dist'),
('43018a2f', '@craft/web/assets/focalpoint/dist'),
('46b8f46b', '@craft/web/assets/admintable/dist'),
('4c5d4a0e', '@craft/web/assets/dashboard/dist'),
('5736b794', '@craft/web/assets/garnish/dist'),
('588bc881', '@craft/web/assets/htmx/dist'),
('5fd7ceac', '@craft/web/assets/routes/dist'),
('63c5da45', '@craft/web/assets/jqueryui/dist'),
('684dec9d', '@craft/web/assets/queuemanager/dist'),
('69224a53', '@bower/jquery/dist'),
('6cc255bb', '@craft/web/assets/elementresizedetector/dist'),
('6fae16bd', '@craft/web/assets/utilities/dist'),
('7176849e', '@craft/web/assets/sites/dist'),
('72b129b0', '@verbb/formie/web/assets/cp/dist'),
('76362f87', '@craft/web/assets/prismjs/dist'),
('7dbe0cee', '@craft/web/assets/fileupload/dist'),
('7f848083', '@craft/web/assets/fabric/dist'),
('81526b2b', '@craft/web/assets/picturefill/dist'),
('86f8645', '@craft/web/assets/xregexp/dist'),
('888e01ef', '@craft/web/assets/craftsupport/dist'),
('8aead62b', '@craft/web/assets/xregexp/dist'),
('8be870bf', '@craft/web/assets/axios/dist'),
('8e209b97', '@craft/web/assets/timepicker/dist'),
('909a8db2', '@craft/web/assets/conditionbuilder/dist'),
('931de5e6', '@craft/web/assets/recententries/dist'),
('96d20d1', '@craft/web/assets/axios/dist'),
('9adea3b9', '@craft/web/assets/updater/dist'),
('9eb84cbd', '@elleracompany/cookieconsent/resources'),
('9ef03b53', '@elleracompany/cookieconsent/resources'),
('a0b5181', '@craft/web/assets/craftsupport/dist'),
('a0e484d1', '@craft/web/assets/fieldsettings/dist'),
('a488f3d3', '@craft/web/assets/generalsettings/dist'),
('a68d51e7', '@craft/web/assets/iframeresizer/dist'),
('acbe6b19', '@craft/web/assets/vue/dist'),
('ace69b46', '@craft/web/assets/editsection/dist'),
('ada7a788', '@craft/web/assets/updateswidget/dist'),
('adec5850', '@craft/web/assets/d3/dist'),
('b106fb43', '@bower/inputmask/dist'),
('b3023832', '@craft/web/assets/datepickeri18n/dist'),
('b3b51d38', '@verbb/base/resources/dist'),
('b782fcd3', '@craft/web/assets/clearcaches/dist'),
('b79b3cab', '@craft/web/assets/feed/dist'),
('b7d97e19', '@craft/web/assets/cp/dist'),
('b82dbe1e', '@studioespresso/navigate/assetbundles/Navigate/dist'),
('b89eb342', '@craft/web/assets/velocity/dist'),
('baa525cf', '@craft/web/assets/installer/dist'),
('bb91dc51', '@craft/web/assets/selectize/dist'),
('bc846673', '@craft/web/assets/tailwindreset/dist'),
('bd09b1f5', '@craft/web/assets/jquerypayment/dist'),
('bd5a6e97', '@craft/web/assets/jquerytouchevents/dist'),
('bea24e64', '@craft/web/assets/pluginstore/dist'),
('c2dd2963', '@craft/web/assets/money/dist'),
('c43da405', '@craft/web/assets/admintable/dist'),
('c569a378', '@craft/feedme/web/assets/feedme/dist'),
('ca5cbf9', '@craft/web/assets/timepicker/dist'),
('ced81a60', '@craft/web/assets/dashboard/dist'),
('d073c7a3', '@elleracompany/cookieconsent/resources'),
('d5b3e7fa', '@craft/web/assets/garnish/dist'),
('da0e98ef', '@craft/web/assets/htmx/dist'),
('dd529ec2', '@craft/web/assets/routes/dist'),
('de428ed0', '@elleracompany/cookieconsent/resources'),
('e1408a2b', '@craft/web/assets/jqueryui/dist'),
('eba71a3d', '@bower/jquery/dist'),
('ed2b46d3', '@craft/web/assets/utilities/dist'),
('ee4705d5', '@craft/web/assets/elementresizedetector/dist'),
('f3f3d4f0', '@craft/web/assets/sites/dist'),
('f4b37fe9', '@craft/web/assets/prismjs/dist'),
('fc573cbc', '@elleracompany/cookieconsent/resources'),
('fd01d0ed', '@craft/web/assets/fabric/dist'),
('ff3b5c80', '@craft/web/assets/fileupload/dist');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `revisions`
--

DROP TABLE IF EXISTS `revisions`;
CREATE TABLE IF NOT EXISTS `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yfgyexrxcicmwazchqnimsfbpjedvjmvnfpa` (`canonicalId`,`num`),
  KEY `fk_igktzpymlfnyxidcxlnnckfjqofsgagzebvy` (`creatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `revisions`
--

INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 4, 1, 1, NULL),
(3, 6, 1, 1, NULL),
(4, 4, 1, 2, 'Applied “Draft 1”'),
(5, 4, 1, 3, NULL),
(6, 6, 1, 2, NULL),
(7, 4, 1, 4, 'Applied “Draft 1”'),
(8, 6, 1, 3, 'Applied “Draft 1”'),
(9, 2, 1, 2, NULL),
(10, 2, 1, 3, NULL),
(11, 2, 1, 4, NULL),
(12, 2, 1, 5, 'Applied “Draft 1”'),
(13, 2, 1, 6, 'Applied “Draft 1”'),
(14, 4, 1, 5, ''),
(15, 2, 1, 7, 'Applied “Draft 1”'),
(16, 2, 1, 8, 'Applied “Draft 1”'),
(17, 2, 1, 9, 'Applied “Draft 1”'),
(18, 2, 1, 10, 'Applied “Draft 1”'),
(19, 44, 1, 1, ''),
(20, 44, 1, 2, ''),
(21, 48, 1, 1, NULL),
(22, 48, 1, 2, 'Applied “Draft 1”'),
(23, 104, 1, 1, ''),
(24, 104, 1, 2, 'Applied “Draft 1”'),
(25, 108, 1, 1, ''),
(26, 110, 1, 1, ''),
(27, 112, 1, 1, ''),
(28, 114, 1, 1, ''),
(29, 116, 1, 1, ''),
(30, 118, 1, 1, ''),
(31, 120, 1, 1, ''),
(32, 120, 1, 2, ''),
(33, 123, 1, 1, ''),
(34, 125, 1, 1, ''),
(35, 127, 1, 1, ''),
(36, 129, 1, 1, ''),
(37, 131, 1, 1, ''),
(38, 133, 1, 1, ''),
(39, 135, 1, 1, ''),
(40, 137, 1, 1, ''),
(41, 139, 1, 1, ''),
(42, 141, 1, 1, ''),
(43, 143, 1, 1, ''),
(44, 145, 1, 1, ''),
(45, 141, 1, 2, 'Applied “Draft 1”'),
(46, 2, 1, 11, NULL),
(47, 2, 1, 12, 'Applied “Draft 1”'),
(48, 2, 1, 13, NULL),
(49, 48, 1, 3, NULL),
(50, 2, 1, 14, 'Applied “Draft 1”'),
(51, 48, 1, 4, ''),
(52, 6, 1, 4, ''),
(53, 4, 1, 6, NULL),
(54, 4, 1, 7, NULL),
(55, 44, 1, 3, 'Applied “Draft 1”'),
(56, 104, 1, 3, 'Applied “Draft 1”'),
(57, 104, 1, 4, 'Applied “Draft 1”'),
(58, 108, 1, 2, 'Applied “Draft 1”'),
(59, 110, 1, 2, 'Applied “Draft 1”'),
(60, 112, 1, 2, 'Applied “Draft 1”'),
(61, 114, 1, 2, 'Applied “Draft 1”'),
(62, 108, 1, 3, 'Applied “Draft 1”'),
(63, 110, 1, 3, 'Applied “Draft 1”'),
(64, 112, 1, 3, 'Applied “Draft 1”'),
(65, 114, 1, 3, ''),
(66, 116, 1, 2, 'Applied “Draft 1”'),
(67, 127, 1, 2, 'Applied “Draft 1”'),
(68, 118, 1, 2, 'Applied “Draft 1”'),
(69, 120, 1, 3, 'Applied “Draft 1”'),
(70, 123, 1, 2, 'Applied “Draft 1”'),
(71, 125, 1, 2, 'Applied “Draft 1”'),
(72, 129, 1, 2, 'Applied “Draft 1”'),
(73, 131, 1, 2, 'Applied “Draft 1”'),
(74, 133, 1, 2, 'Applied “Draft 1”'),
(75, 135, 1, 2, 'Applied “Draft 1”'),
(76, 137, 1, 2, 'Applied “Draft 1”'),
(77, 139, 1, 2, 'Applied “Draft 1”'),
(78, 141, 1, 3, 'Applied “Draft 1”'),
(79, 145, 1, 2, 'Applied “Draft 1”'),
(80, 143, 1, 2, 'Applied “Draft 1”');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
CREATE TABLE IF NOT EXISTS `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'email', 0, 1, ' beyza cevik student pxl be '),
(1, 'firstname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'slug', 0, 1, ''),
(1, 'username', 0, 1, ' beyzarisha '),
(2, 'slug', 0, 1, ' startpagina '),
(2, 'title', 0, 1, ' homepagina '),
(4, 'slug', 0, 1, ' header '),
(4, 'title', 0, 1, ''),
(6, 'slug', 0, 1, ' footer '),
(6, 'title', 0, 1, ' footer '),
(22, 'alt', 0, 1, ''),
(22, 'extension', 0, 1, ' svg '),
(22, 'filename', 0, 1, ' logo white svg '),
(22, 'kind', 0, 1, ' image '),
(22, 'slug', 0, 1, ''),
(22, 'title', 0, 1, ' logo white '),
(29, 'slug', 0, 1, ' temp bytnyujwdyedgtptmeekxbsytwdeyfbnnxlc '),
(29, 'title', 0, 1, ''),
(30, 'slug', 0, 1, ' temp jczcbbqgxldygztzfminmjyfyupeapbastml '),
(30, 'title', 0, 1, ''),
(35, 'alt', 0, 1, ''),
(35, 'extension', 0, 1, ' png '),
(35, 'filename', 0, 1, ' layer 2 png '),
(35, 'kind', 0, 1, ' image '),
(35, 'slug', 0, 1, ''),
(35, 'title', 0, 1, ' layer 2 '),
(36, 'alt', 0, 1, ''),
(36, 'extension', 0, 1, ' png '),
(36, 'filename', 0, 1, ' layer 2 png '),
(36, 'kind', 0, 1, ' image '),
(36, 'slug', 0, 1, ''),
(36, 'title', 0, 1, ' layer 2 '),
(37, 'alt', 0, 1, ''),
(37, 'extension', 0, 1, ' png '),
(37, 'filename', 0, 1, ' layer 2 png '),
(37, 'kind', 0, 1, ' image '),
(37, 'slug', 0, 1, ''),
(37, 'title', 0, 1, ' layer 2 '),
(40, 'alt', 0, 1, ''),
(40, 'extension', 0, 1, ' svg '),
(40, 'filename', 0, 1, ' logo zwart svg '),
(40, 'kind', 0, 1, ' image '),
(40, 'slug', 0, 1, ''),
(40, 'title', 0, 1, ' logo zwart '),
(41, 'slug', 0, 1, ''),
(42, 'alt', 0, 1, ''),
(42, 'extension', 0, 1, ' svg '),
(42, 'filename', 0, 1, ' logo zwart svg '),
(42, 'kind', 0, 1, ' image '),
(42, 'slug', 0, 1, ''),
(42, 'title', 0, 1, ' logo zwart '),
(43, 'slug', 0, 1, ' temp bersodcphrfvhupthdesjdzhgnqunjzoszyt '),
(43, 'title', 0, 1, ''),
(44, 'slug', 0, 1, ' products page '),
(44, 'title', 0, 1, ' producten '),
(48, 'slug', 0, 1, ' contact '),
(48, 'title', 0, 1, ' contact '),
(52, 'handle', 0, 1, ' contactus '),
(52, 'slug', 0, 1, ''),
(52, 'title', 0, 1, ' contact us '),
(53, 'handle', 0, 1, ' contactus '),
(53, 'slug', 0, 1, ''),
(53, 'title', 0, 1, ' contactus '),
(54, 'slug', 0, 1, ' temp gansdnxspzdnvwahcfrfsouajjkotlhduyxk '),
(54, 'title', 0, 1, ''),
(55, 'alt', 0, 1, ''),
(55, 'extension', 0, 1, ' jpg '),
(55, 'filename', 0, 1, ' acnepimplecosrx jpg '),
(55, 'kind', 0, 1, ' image '),
(55, 'slug', 0, 1, ''),
(55, 'title', 0, 1, ' acne pimple cosrx '),
(56, 'alt', 0, 1, ''),
(56, 'extension', 0, 1, ' jpg '),
(56, 'filename', 0, 1, ' acnepimplecosrx2 jpg '),
(56, 'kind', 0, 1, ' image '),
(56, 'slug', 0, 1, ''),
(56, 'title', 0, 1, ' acne pimple cosrx2 '),
(57, 'alt', 0, 1, ''),
(57, 'extension', 0, 1, ' jpg '),
(57, 'filename', 0, 1, ' advancedsnailcosrc2 jpg '),
(57, 'kind', 0, 1, ' image '),
(57, 'slug', 0, 1, ''),
(57, 'title', 0, 1, ' advancedsnailcosrc2 '),
(58, 'alt', 0, 1, ''),
(58, 'extension', 0, 1, ' jpg '),
(58, 'filename', 0, 1, ' advancedsnailcosrx jpg '),
(58, 'kind', 0, 1, ' image '),
(58, 'slug', 0, 1, ''),
(58, 'title', 0, 1, ' advancedsnail cosrx '),
(59, 'alt', 0, 1, ''),
(59, 'extension', 0, 1, ' png '),
(59, 'filename', 0, 1, ' aiony haust f2ar0lttvai unsplash copy png '),
(59, 'kind', 0, 1, ' image '),
(59, 'slug', 0, 1, ''),
(59, 'title', 0, 1, ' aiony haust f2ar0lt tva i unsplash copy '),
(60, 'alt', 0, 1, ''),
(60, 'extension', 0, 1, ' png '),
(60, 'filename', 0, 1, ' aiony haust f2ar0lttvai unsplash png '),
(60, 'kind', 0, 1, ' image '),
(60, 'slug', 0, 1, ''),
(60, 'title', 0, 1, ' aiony haust f2ar0lt tva i unsplash '),
(61, 'alt', 0, 1, ''),
(61, 'extension', 0, 1, ' jpg '),
(61, 'filename', 0, 1, ' anuaheartleaf jpg '),
(61, 'kind', 0, 1, ' image '),
(61, 'slug', 0, 1, ''),
(61, 'title', 0, 1, ' anuaheartleaf '),
(62, 'alt', 0, 1, ''),
(62, 'extension', 0, 1, ' jpg '),
(62, 'filename', 0, 1, ' anuaheartleaf2 jpg '),
(62, 'kind', 0, 1, ' image '),
(62, 'slug', 0, 1, ''),
(62, 'title', 0, 1, ' anuaheartleaf2 '),
(63, 'alt', 0, 1, ''),
(63, 'extension', 0, 1, ' jpg '),
(63, 'filename', 0, 1, ' anuaheartleafmask2 jpg '),
(63, 'kind', 0, 1, ' image '),
(63, 'slug', 0, 1, ''),
(63, 'title', 0, 1, ' anuaheartleafmask2 '),
(64, 'alt', 0, 1, ''),
(64, 'extension', 0, 1, ' jpg '),
(64, 'filename', 0, 1, ' anuaheartleafmaskmain jpg '),
(64, 'kind', 0, 1, ' image '),
(64, 'slug', 0, 1, ''),
(64, 'title', 0, 1, ' anuaheartleafmaskmain '),
(65, 'alt', 0, 1, ''),
(65, 'extension', 0, 1, ' jpg '),
(65, 'filename', 0, 1, ' anuaheartleafpad jpg '),
(65, 'kind', 0, 1, ' image '),
(65, 'slug', 0, 1, ''),
(65, 'title', 0, 1, ' anuaheartleafpad '),
(66, 'alt', 0, 1, ''),
(66, 'extension', 0, 1, ' jpg '),
(66, 'filename', 0, 1, ' anuaheartleafpad2 jpg '),
(66, 'kind', 0, 1, ' image '),
(66, 'slug', 0, 1, ''),
(66, 'title', 0, 1, ' anuaheartleafpad2 '),
(67, 'alt', 0, 1, ''),
(67, 'extension', 0, 1, ' jpg '),
(67, 'filename', 0, 1, ' axisydarkspot jpg '),
(67, 'kind', 0, 1, ' image '),
(67, 'slug', 0, 1, ''),
(67, 'title', 0, 1, ' axisydarkspot '),
(68, 'alt', 0, 1, ''),
(68, 'extension', 0, 1, ' jpg '),
(68, 'filename', 0, 1, ' axisydarkspot2 jpg '),
(68, 'kind', 0, 1, ' image '),
(68, 'slug', 0, 1, ''),
(68, 'title', 0, 1, ' axisydarkspot2 '),
(69, 'alt', 0, 1, ''),
(69, 'extension', 0, 1, ' jpg '),
(69, 'filename', 0, 1, ' axisymugwort jpg '),
(69, 'kind', 0, 1, ' image '),
(69, 'slug', 0, 1, ''),
(69, 'title', 0, 1, ' axisymugwort '),
(70, 'alt', 0, 1, ''),
(70, 'extension', 0, 1, ' jpg '),
(70, 'filename', 0, 1, ' axisymugwort2 jpg '),
(70, 'kind', 0, 1, ' image '),
(70, 'slug', 0, 1, ''),
(70, 'title', 0, 1, ' axisymugwort2 '),
(71, 'alt', 0, 1, ''),
(71, 'extension', 0, 1, ' jpg '),
(71, 'filename', 0, 1, ' axisyquinoa jpg '),
(71, 'kind', 0, 1, ' image '),
(71, 'slug', 0, 1, ''),
(71, 'title', 0, 1, ' axisyquinoa '),
(72, 'alt', 0, 1, ''),
(72, 'extension', 0, 1, ' jpg '),
(72, 'filename', 0, 1, ' axisyquinoa2 jpg '),
(72, 'kind', 0, 1, ' image '),
(72, 'slug', 0, 1, ''),
(72, 'title', 0, 1, ' axisyquinoa2 '),
(73, 'alt', 0, 1, ''),
(73, 'extension', 0, 1, ' jpg '),
(73, 'filename', 0, 1, ' beautyjosradiance jpg '),
(73, 'kind', 0, 1, ' image '),
(73, 'slug', 0, 1, ''),
(73, 'title', 0, 1, ' beautyjosradiance '),
(74, 'alt', 0, 1, ''),
(74, 'extension', 0, 1, ' jpg '),
(74, 'filename', 0, 1, ' beautyjosradiance2 jpg '),
(74, 'kind', 0, 1, ' image '),
(74, 'slug', 0, 1, ''),
(74, 'title', 0, 1, ' beautyjosradiance2 '),
(75, 'alt', 0, 1, ''),
(75, 'extension', 0, 1, ' jpg '),
(75, 'filename', 0, 1, ' beautyjosrepairserum jpg '),
(75, 'kind', 0, 1, ' image '),
(75, 'slug', 0, 1, ''),
(75, 'title', 0, 1, ' beautyjosrepairserum '),
(76, 'alt', 0, 1, ''),
(76, 'extension', 0, 1, ' jpg '),
(76, 'filename', 0, 1, ' beaytyjosrepairserum2 jpg '),
(76, 'kind', 0, 1, ' image '),
(76, 'slug', 0, 1, ''),
(76, 'title', 0, 1, ' beaytyjosrepairserum2 '),
(77, 'alt', 0, 1, ''),
(77, 'extension', 0, 1, ' jpg '),
(77, 'filename', 0, 1, ' centellamask800 jpg '),
(77, 'kind', 0, 1, ' image '),
(77, 'slug', 0, 1, ''),
(77, 'title', 0, 1, ' centella mask800 '),
(78, 'alt', 0, 1, ''),
(78, 'extension', 0, 1, ' jpg '),
(78, 'filename', 0, 1, ' cosrxlowph jpg '),
(78, 'kind', 0, 1, ' image '),
(78, 'slug', 0, 1, ''),
(78, 'title', 0, 1, ' cosrxlowph '),
(79, 'alt', 0, 1, ''),
(79, 'extension', 0, 1, ' jpg '),
(79, 'filename', 0, 1, ' cosrxlowph2 jpg '),
(79, 'kind', 0, 1, ' image '),
(79, 'slug', 0, 1, ''),
(79, 'title', 0, 1, ' cosrxlowph2 '),
(80, 'alt', 0, 1, ''),
(80, 'extension', 0, 1, ' webp '),
(80, 'filename', 0, 1, ' dynastycream2 webp '),
(80, 'kind', 0, 1, ' image '),
(80, 'slug', 0, 1, ''),
(80, 'title', 0, 1, ' dynasty cream2 '),
(81, 'alt', 0, 1, ''),
(81, 'extension', 0, 1, ' jpg '),
(81, 'filename', 0, 1, ' dynastycreambij2 jpg '),
(81, 'kind', 0, 1, ' image '),
(81, 'slug', 0, 1, ''),
(81, 'title', 0, 1, ' dynasty cream bij2 '),
(82, 'alt', 0, 1, ''),
(82, 'extension', 0, 1, ' jpg '),
(82, 'filename', 0, 1, ' dynastycreamboj jpg '),
(82, 'kind', 0, 1, ' image '),
(82, 'slug', 0, 1, ''),
(82, 'title', 0, 1, ' dynasty cream boj '),
(83, 'alt', 0, 1, ''),
(83, 'extension', 0, 1, ' jpg '),
(83, 'filename', 0, 1, ' hydriumcentellacosrx jpg '),
(83, 'kind', 0, 1, ' image '),
(83, 'slug', 0, 1, ''),
(83, 'title', 0, 1, ' hydriumcentellacosrx '),
(84, 'alt', 0, 1, ''),
(84, 'extension', 0, 1, ' jpg '),
(84, 'filename', 0, 1, ' hydriumcentellacosrx2 jpg '),
(84, 'kind', 0, 1, ' image '),
(84, 'slug', 0, 1, ''),
(84, 'title', 0, 1, ' hydriumcentellacosrx2 '),
(85, 'alt', 0, 1, ''),
(85, 'extension', 0, 1, ' jpg '),
(85, 'filename', 0, 1, ' iunikcentella2 jpg '),
(85, 'kind', 0, 1, ' image '),
(85, 'slug', 0, 1, ''),
(85, 'title', 0, 1, ' iunikcentella2 '),
(86, 'alt', 0, 1, ''),
(86, 'extension', 0, 1, ' jpg '),
(86, 'filename', 0, 1, ' iunikcetnella jpg '),
(86, 'kind', 0, 1, ' image '),
(86, 'slug', 0, 1, ''),
(86, 'title', 0, 1, ' iunikcetnella '),
(87, 'alt', 0, 1, ''),
(87, 'extension', 0, 1, ' jpg '),
(87, 'filename', 0, 1, ' iunikcntellamask2 jpg '),
(87, 'kind', 0, 1, ' image '),
(87, 'slug', 0, 1, ''),
(87, 'title', 0, 1, ' iunikcntellamask2 '),
(88, 'alt', 0, 1, ''),
(88, 'extension', 0, 1, ' jpg '),
(88, 'filename', 0, 1, ' iunikprop jpg '),
(88, 'kind', 0, 1, ' image '),
(88, 'slug', 0, 1, ''),
(88, 'title', 0, 1, ' iunikprop '),
(89, 'alt', 0, 1, ''),
(89, 'extension', 0, 1, ' jpg '),
(89, 'filename', 0, 1, ' iunikprop2 jpg '),
(89, 'kind', 0, 1, ' image '),
(89, 'slug', 0, 1, ''),
(89, 'title', 0, 1, ' iunikprop2 '),
(90, 'alt', 0, 1, ''),
(90, 'extension', 0, 1, ' png '),
(90, 'filename', 0, 1, ' layer 2 png '),
(90, 'kind', 0, 1, ' image '),
(90, 'slug', 0, 1, ''),
(90, 'title', 0, 1, ' layer 2 '),
(91, 'alt', 0, 1, ''),
(91, 'extension', 0, 1, ' svg '),
(91, 'filename', 0, 1, ' logo white svg '),
(91, 'kind', 0, 1, ' image '),
(91, 'slug', 0, 1, ''),
(91, 'title', 0, 1, ' logo white '),
(92, 'alt', 0, 1, ''),
(92, 'extension', 0, 1, ' svg '),
(92, 'filename', 0, 1, ' logo zwart svg '),
(92, 'kind', 0, 1, ' image '),
(92, 'slug', 0, 1, ''),
(92, 'title', 0, 1, ' logo zwart '),
(93, 'alt', 0, 1, ''),
(93, 'extension', 0, 1, ' jpg '),
(93, 'filename', 0, 1, ' misshathefirst jpg '),
(93, 'kind', 0, 1, ' image '),
(93, 'slug', 0, 1, ''),
(93, 'title', 0, 1, ' misshathefirst '),
(94, 'alt', 0, 1, ''),
(94, 'extension', 0, 1, ' jpg '),
(94, 'filename', 0, 1, ' misshathefirst2 jpg '),
(94, 'kind', 0, 1, ' image '),
(94, 'slug', 0, 1, ''),
(94, 'title', 0, 1, ' misshathefirst2 '),
(95, 'alt', 0, 1, ''),
(95, 'extension', 0, 1, ' jpg '),
(95, 'filename', 0, 1, ' misshatimerev jpg '),
(95, 'kind', 0, 1, ' image '),
(95, 'slug', 0, 1, ''),
(95, 'title', 0, 1, ' misshatimerev '),
(96, 'alt', 0, 1, ''),
(96, 'extension', 0, 1, ' jpg '),
(96, 'filename', 0, 1, ' misshatimerev2 jpg '),
(96, 'kind', 0, 1, ' image '),
(96, 'slug', 0, 1, ''),
(96, 'title', 0, 1, ' misshatimerev2 '),
(97, 'alt', 0, 1, ''),
(97, 'extension', 0, 1, ' jpg '),
(97, 'filename', 0, 1, ' misshatimerevart jpg '),
(97, 'kind', 0, 1, ' image '),
(97, 'slug', 0, 1, ''),
(97, 'title', 0, 1, ' misshatimerevart '),
(98, 'alt', 0, 1, ''),
(98, 'extension', 0, 1, ' jpg '),
(98, 'filename', 0, 1, ' misshatimerevart2 jpg '),
(98, 'kind', 0, 1, ' image '),
(98, 'slug', 0, 1, ''),
(98, 'title', 0, 1, ' misshatimerevart2 '),
(99, 'alt', 0, 1, ''),
(99, 'extension', 0, 1, ' jpg '),
(99, 'filename', 0, 1, ' rose jpg '),
(99, 'kind', 0, 1, ' image '),
(99, 'slug', 0, 1, ''),
(99, 'title', 0, 1, ' rose '),
(100, 'alt', 0, 1, ''),
(100, 'extension', 0, 1, ' jpg '),
(100, 'filename', 0, 1, ' rose2 jpg '),
(100, 'kind', 0, 1, ' image '),
(100, 'slug', 0, 1, ''),
(100, 'title', 0, 1, ' rose2 '),
(101, 'alt', 0, 1, ''),
(101, 'extension', 0, 1, ' webp '),
(101, 'filename', 0, 1, ' screenshot 78 2000x webp '),
(101, 'kind', 0, 1, ' image '),
(101, 'slug', 0, 1, ''),
(101, 'title', 0, 1, ' screenshot 78 2000x '),
(102, 'alt', 0, 1, ''),
(102, 'extension', 0, 1, ' webp '),
(102, 'filename', 0, 1, ' screenshot 89 400x 1 webp '),
(102, 'kind', 0, 1, ' image '),
(102, 'slug', 0, 1, ''),
(102, 'title', 0, 1, ' screenshot 89 400x 1 '),
(103, 'slug', 0, 1, ' temp bwyelgumijmsjkwmyvblipxevxphefnudxep '),
(103, 'title', 0, 1, ''),
(104, 'field', 1, 1, ' beauty of joseon '),
(104, 'slug', 0, 1, ' dynasty cream '),
(104, 'title', 0, 1, ' dynasty cream '),
(108, 'field', 1, 1, ' cosrx '),
(108, 'slug', 0, 1, ' advanced snail 96 mucin power essence '),
(108, 'title', 0, 1, ' advanced snail 96 mucin power essence '),
(110, 'field', 1, 1, ' missha '),
(110, 'slug', 0, 1, ' time revolution the first treatment essence rx '),
(110, 'title', 0, 1, ' time revolution the first treatment essence rx '),
(112, 'field', 1, 1, ' iunik '),
(112, 'slug', 0, 1, ' centella calming gel cream '),
(112, 'title', 0, 1, ' centella calming gel cream '),
(114, 'field', 1, 1, ' anua '),
(114, 'slug', 0, 1, ' heartleaf 77 soothing toner '),
(114, 'title', 0, 1, ' heartleaf 77% soothing toner '),
(116, 'field', 1, 1, ' axis y '),
(116, 'slug', 0, 1, ' mugwort pore clarifying wash off pack '),
(116, 'title', 0, 1, ' mugwort pore clarifying wash off pack '),
(118, 'field', 1, 1, ' cosrx '),
(118, 'slug', 0, 1, ' acne pimple master patch '),
(118, 'title', 0, 1, ' acne pimple master patch '),
(120, 'field', 1, 1, ' missha '),
(120, 'slug', 0, 1, ' time revolution night repair probio ampoule '),
(120, 'title', 0, 1, ' time revolution night repair probio ampoule '),
(123, 'field', 1, 1, ' iunik '),
(123, 'slug', 0, 1, ' rose galactomyces essential toner '),
(123, 'title', 0, 1, ' rose galactomyces essential toner '),
(125, 'field', 1, 1, ' anua '),
(125, 'slug', 0, 1, ' heartleaf 77 clear pad '),
(125, 'title', 0, 1, ' heartleaf 77% clear pad '),
(127, 'field', 1, 1, ' beauty of joseon '),
(127, 'slug', 0, 1, ' radiance cleansing balm '),
(127, 'title', 0, 1, ' radiance cleansing balm '),
(129, 'field', 1, 1, ' axis y '),
(129, 'slug', 0, 1, ' dark spot correcting glow serum '),
(129, 'title', 0, 1, ' dark spot correcting glow serum '),
(131, 'field', 1, 1, ' beauty of joseon '),
(131, 'slug', 0, 1, ' repair serum ginseng snail mucin '),
(131, 'title', 0, 1, ' repair serum ginseng snail mucin '),
(133, 'field', 1, 1, ' cosrx '),
(133, 'slug', 0, 1, ' low ph good morning gel cleanser '),
(133, 'title', 0, 1, ' low ph good morning gel cleanser '),
(135, 'field', 1, 1, ' missha '),
(135, 'slug', 0, 1, ' time revolution artemisia treatment essence '),
(135, 'title', 0, 1, ' time revolution artemisia treatment essence '),
(137, 'field', 1, 1, ' iunik '),
(137, 'slug', 0, 1, ' propolis vitamin synergy serum '),
(137, 'title', 0, 1, ' propolis vitamin synergy serum '),
(139, 'field', 1, 1, ' anua '),
(139, 'slug', 0, 1, ' heartleaf cream mask night solution '),
(139, 'title', 0, 1, ' heartleaf cream mask night solution '),
(141, 'field', 1, 1, ' axis y '),
(141, 'slug', 0, 1, ' quinoa one step balanced gel cleanser '),
(141, 'title', 0, 1, ' quinoa one step balanced gel cleanser '),
(143, 'field', 1, 1, ' cosrx '),
(143, 'slug', 0, 1, ' hydrium triple hyaluronic moisture ampoule '),
(143, 'title', 0, 1, ' hydrium triple hyaluronic moisture ampoule '),
(145, 'field', 1, 1, ' beauty of joseon '),
(145, 'slug', 0, 1, ' centella asiatica calming mask '),
(145, 'title', 0, 1, ' centella asiatica calming mask '),
(150, 'slug', 0, 1, ' temp wxwvippfiilzmrvtnxrzmaibtljqzhrzsnnh '),
(150, 'title', 0, 1, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint UNSIGNED NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xpmmdxqkupqrvvdefyeoqypyvulbsdiqappy` (`handle`),
  KEY `idx_eehfvtvctmtxxjabhrokfqmtwfpaqyrhlvro` (`name`),
  KEY `idx_khuexikvqiqixawppmqhswctxfmxfddasawk` (`structureId`),
  KEY `idx_awuxrpdxwaaxylbazzzmzobfiirrgorxbmtw` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `maxAuthors`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Homepage', 'homepage', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-17 21:58:10', '2024-05-20 14:24:26', NULL, '48f60c35-6b15-498e-85e5-ea8d92527c3c'),
(2, NULL, 'Header', 'header', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-17 22:16:50', '2024-05-17 22:16:50', NULL, '5548eee2-fe00-4fee-bd86-6296f8f13aa5'),
(3, NULL, 'Footer', 'footer', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-17 22:17:57', '2024-05-17 22:17:57', NULL, 'f8145be8-29f8-43ae-b178-99d5f61d0b6c'),
(4, NULL, 'Products', 'products', 'channel', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-18 20:06:07', '2024-05-18 20:06:07', NULL, 'b57b1002-f8d0-4634-b367-e7014e73cc8b'),
(5, NULL, 'Contact', 'contact', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-20 13:10:15', '2024-05-20 13:10:15', NULL, 'dacfeb3b-6ffa-416d-94ee-2587a3223cef');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
CREATE TABLE IF NOT EXISTS `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_jjcnsuusclfzpobvazdhggxqpeznfmomcwbb` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections_entrytypes`
--

INSERT INTO `sections_entrytypes` (`sectionId`, `typeId`, `sortOrder`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(4, 6, 2),
(5, 7, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
CREATE TABLE IF NOT EXISTS `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yajluqqotxjykgzjxcwhapkzrnuazqsskrie` (`sectionId`,`siteId`),
  KEY `idx_essxfuljlpaueuzmfuhzjcnpbayzaspiwujr` (`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'index.twig', 1, '2024-05-17 21:58:10', '2024-05-17 21:58:10', '8bf9b1f0-d17c-46d6-8dc9-6b6603fa057d'),
(2, 2, 1, 1, 'header', 'header/_entry', 1, '2024-05-17 22:16:50', '2024-05-17 22:16:50', 'ff8b359e-3475-46f1-b3eb-8df7ff4aa83b'),
(3, 3, 1, 1, 'footer', 'footer/_entry', 1, '2024-05-17 22:17:57', '2024-05-17 22:17:57', '3ddab44e-6315-4e93-b5b9-a17d15bf5e56'),
(4, 4, 1, 1, 'products/{slug}', 'product.twig', 1, '2024-05-18 20:06:07', '2024-05-20 16:27:01', '920cb40f-dcbf-455e-a8ce-ef37225d1ef1'),
(5, 5, 1, 1, 'contact', 'contact.twig', 1, '2024-05-20 13:10:15', '2024-05-20 13:10:15', '19648055-9bc9-4b7c-ad36-7ca75fef47d4');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sequences`
--

DROP TABLE IF EXISTS `sequences`;
CREATE TABLE IF NOT EXISTS `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zkicscxqdrgeseniwtfbefahsvjgxxkexfiy` (`uid`),
  KEY `idx_pzbfihtuwucnhyhokovptubvboswkamqzutd` (`token`),
  KEY `idx_xbpmfmjxfsmyhksvcxoeodvnjsrbbchkcvlm` (`dateUpdated`),
  KEY `idx_dfnraqtgjkfvoeoozdzijvknhavhnrukwejx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '7Rx3Gef37eLgbOI0bPgHOeiaRrvJpnr88I8lefZIzBejTwk_Uj_UtcdqIzb513d_9vHYQOneqQIcFQn3s11qoHi8dsZCtCKWj94i', '2024-05-16 19:05:06', '2024-05-16 20:15:44', '5906a060-7585-46ff-803a-b0c2ce639d1b'),
(2, 1, 'cEfgHA1476yV3xbo_M-cTELtmYGbH5kzhdJ6EP4hruDS920JagwwrR7yHJaacnfZnRd-Brv3yFywkf1wJFVsqGwMO-1kZvkl06M0', '2024-05-17 13:31:38', '2024-05-17 13:47:24', '3cd19bb2-3512-4a36-80af-3541dfee991d'),
(3, 1, 'JNc9mHudX_IvQQ7WHkbmkc9-MxFpI94E1qnVNFBdpzG533e_L-toiStrHjDGZi4Mf7DfjiZDGmp_WENrKr0uvf0kkPMW85uHELxP', '2024-05-17 21:48:18', '2024-05-17 23:07:18', '9e69c9d4-f85c-4853-9f18-44c174c0e0c9'),
(4, 1, 'mZOZnhWTdT5dpXjPNB782tXoFFRu6YSuhJChZ2tt0r2mTWosL5F8VluhKUnlxiZgvnSNDG2RtEfabVLANNFe10Fv4ncHNszOPgZb', '2024-05-18 18:40:01', '2024-05-18 22:25:13', '12c4c045-3d32-45ec-8d96-b2c6a6740051'),
(5, 1, 'BGOEHNhTJ93knCe1O3NGQBcdCNYOSSujVX20QRMbTZdjQG4ZlCqncV4KFZfW9sdHhsod0fFo5mf80qCg9xdFkktgdKKRBa6Io8CV', '2024-05-20 11:01:24', '2024-05-20 14:39:18', 'b7bb2660-bd6b-4028-ae56-089755e9702c'),
(6, 1, 'uVJWIZ42EfjrX7uyo3V2ZzS_M3ZQs4XCQHmcoTvsNEoF1Wee4kJObr74cd35zIExIrJMkT1nk8DF_7qH7JzguOKinAZzDFAmidDB', '2024-05-20 16:12:56', '2024-05-21 06:35:31', '05599d40-b410-4e36-bbb3-f99701997fd0'),
(7, 1, 'NcszVS-tiMWiVWukz-Zk58HXqI3VUGO-afp6ZvQZcCpyt7HsE0U-75slIb1Ts8nHfjyAaANLHhun0AWf35wiuwvLpMjrxfZdmTzh', '2024-05-21 06:35:31', '2024-05-21 07:32:02', '6ec3709f-7e30-42ff-afd3-0b6140dd8517');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
CREATE TABLE IF NOT EXISTS `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rzamlalbgolqwbhwrkdatzdowpexbgxasskv` (`userId`,`message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
CREATE TABLE IF NOT EXISTS `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bpfdirtvnaaihxuazyuyftepwoygzyzeaqmi` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'kserenity-skincare', '2024-05-16 18:35:01', '2024-05-16 18:35:01', NULL, '7efebcfe-cbe8-4d2a-a4c0-c75c069d028e');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gcmncymewbykyrumdgmaaqvunuukmlidoeyo` (`dateDeleted`),
  KEY `idx_axaurmxytmbmrqvzoomrqjrdbffalgdmlpaz` (`handle`),
  KEY `idx_lilzequxtkdzgamuoukfgntlpgwnqzfdoysa` (`sortOrder`),
  KEY `fk_idbtfrporgobzeowucxsjqiejmutlbwkunlo` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'true', 'kserenity-skincare', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2024-05-16 18:35:01', '2024-05-16 18:35:01', NULL, '30863589-1efd-4876-8616-a9940a064ced');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
CREATE TABLE IF NOT EXISTS `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED NOT NULL,
  `rgt` int UNSIGNED NOT NULL,
  `level` smallint UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ipetpkljvvfnxbcukucpnoddgleaofozvhvq` (`structureId`,`elementId`),
  KEY `idx_ufiflgrvdzeavpmulentdqraicgipuuubpgp` (`root`),
  KEY `idx_oqengsiudsyvpgemigpanqqoynquydiaapve` (`lft`),
  KEY `idx_wofenvekfetuinzhbkdwyegaqhnmoctxzhcf` (`rgt`),
  KEY `idx_ggcmopowsxdluelifqimpikysaynymttclbh` (`level`),
  KEY `idx_vwjeutkprwziugsymnvpmoxhosijwqwxbimo` (`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `structures`
--

DROP TABLE IF EXISTS `structures`;
CREATE TABLE IF NOT EXISTS `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ztinwfwqeidijxcdiogfengkjnqfqrqqzsnx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
CREATE TABLE IF NOT EXISTS `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qpgnryogjrbbzwjsfhhlwepvdikjlehwdvzh` (`key`,`language`),
  KEY `idx_rnqmbftdeneesaqgpyoxdzaaakpnjnkiryte` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
CREATE TABLE IF NOT EXISTS `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gczpcuymfflztypdebynybousxaluvpqutyb` (`name`),
  KEY `idx_tekowgazjkczrgledkzxcrsbzinijxfhwzgr` (`handle`),
  KEY `idx_kgotiapsjpduftpuyrwuixkqlvadbresbels` (`dateDeleted`),
  KEY `fk_ydckklqjwxoymjuruxxtxmxbloddivsnzvad` (`fieldLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eagvyoauzrcnbbwqqeadenizhofumljjlrin` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint UNSIGNED DEFAULT NULL,
  `usageCount` tinyint UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ctmgvfzbfwotqwqwcatlpvirtywjolbhpipc` (`token`),
  KEY `idx_tiqomuwsbjucwfyfxrlgqdqypcnvjfbqgkae` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE IF NOT EXISTS `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rhhjdiedivganszzzngtrdjrikpzjhentxim` (`handle`),
  KEY `idx_hfsxwwvqtcyvqlifqrxlottxxesgehewvtbw` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
CREATE TABLE IF NOT EXISTS `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cowgmazovsgjhsnndvwjrettvrplgxpbcrjj` (`groupId`,`userId`),
  KEY `idx_edtptgbyhniwmnrysefymstrnisowpfhmziu` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE IF NOT EXISTS `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xnxnlgacvacdpvxcpfmuckzbetyhavmftyzd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
CREATE TABLE IF NOT EXISTS `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ctgjchthjaszxxvlstklaefvgjfzkqcawlve` (`permissionId`,`groupId`),
  KEY `idx_qegszkllgyxjtlqtcrvzafvyxefiqlncnlbw` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
CREATE TABLE IF NOT EXISTS `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yakewdbwbjtvjbgsmmozdzsgzuuocjmwxndw` (`permissionId`,`userId`),
  KEY `idx_ypkdzwbvswqndrnexauasccgmmlrgmdzbhsa` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
CREATE TABLE IF NOT EXISTS `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\": \"en-US\"}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oqtfmudbdtzioesvnubzylrrwrpnbkavefqn` (`active`),
  KEY `idx_fpuuldyhysdlrskzmxzztevntjsfifukxudf` (`locked`),
  KEY `idx_gxffnagftjudopbxfnmitopbutjsymtcjtdy` (`pending`),
  KEY `idx_mjxrrtjkarimwlrktrhvxmazaokwwzslakdc` (`suspended`),
  KEY `idx_nrxpxioghpqgbromjdrigidocdqugushaoib` (`verificationCode`),
  KEY `idx_wvxpyponbozpdmknugminknbvvyztkcjndya` (`email`),
  KEY `idx_mltnfexdipvhzaiiznikhsrvhqlxntcpzjdw` (`username`),
  KEY `fk_zzhdqjwiqguunagdjqzxkkgothbyuyzstppb` (`photoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
(1, NULL, 1, 0, 0, 0, 1, 'beyzarisha', NULL, NULL, NULL, 'beyza.cevik@student.pxl.be', '$2y$13$1hA1y9CYLu/.bIOdafagwezNwDz7G7M4VuiWiCimWdhsWu3epHBMK', '2024-05-21 06:35:31', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-21 06:35:32');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
CREATE TABLE IF NOT EXISTS `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wtzodnabmxepxowvdqubzzfjseciqnnwapmn` (`name`,`parentId`,`volumeId`),
  KEY `idx_yqviknqstdcnkkzldhaxcrekltjbnhhnduqb` (`parentId`),
  KEY `idx_jywlbogsggafnofohvzsbdtiqscsxqsgqfbz` (`volumeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'SiteLogo', NULL, '2024-05-18 19:04:43', '2024-05-18 19:18:50', '294f90bb-3a9c-4e1f-871b-728ab7893229'),
(2, NULL, NULL, 'Temporary Uploads', NULL, '2024-05-18 19:06:10', '2024-05-18 19:06:10', '688f776f-b49a-4f03-be45-e35aaa52bab8'),
(3, 2, NULL, 'user_1', 'user_1/', '2024-05-18 19:06:10', '2024-05-18 19:06:10', 'cc60c9b6-2ddb-4c83-acee-77b964739b6e'),
(4, NULL, 2, 'ContactImg', NULL, '2024-05-18 22:15:22', '2024-05-18 22:18:32', 'ec51739c-b5e1-4c12-b8e9-acbf951cd3d1'),
(5, NULL, 3, 'BlackLogo', '', '2024-05-20 11:21:29', '2024-05-20 11:21:29', '87ba5db5-c362-4c32-852b-a43b5d69e6ad'),
(6, NULL, 4, 'blackLogo', NULL, '2024-05-20 11:48:43', '2024-05-20 11:55:57', '4ae9ed3f-3b82-4be3-87f4-ec4b523a8445'),
(7, NULL, 5, 'productImg', '', '2024-05-20 13:31:28', '2024-05-20 13:31:28', '0d882fe2-0bd9-4474-bb6b-b14e90663b61');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `volumes`
--

DROP TABLE IF EXISTS `volumes`;
CREATE TABLE IF NOT EXISTS `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pfushaawehnwqucxoslrfjadkpuhmyminzki` (`name`),
  KEY `idx_zemcouvzdoasfojrnhkpigmxesuvzjpnzqza` (`handle`),
  KEY `idx_tirbfxuogleiedjytjhfgtpqjhzqqoxioqjs` (`fieldLayoutId`),
  KEY `idx_gzupxedisgjggyzxoyxglfvtsjuvshnvsyko` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `fs`, `subpath`, `transformFs`, `transformSubpath`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `altTranslationMethod`, `altTranslationKeyFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 5, 'SiteLogo', 'sitelogo', 'sitelogo', '', 'sitelogo', '', 'site', NULL, 'none', NULL, 1, '2024-05-18 19:04:43', '2024-05-18 19:18:50', NULL, '29685f3e-1f14-43ff-90f4-cd1b385b8501'),
(2, 7, 'ContactImg', 'contactimg', 'contactimg', '', 'contactimg', '', 'site', NULL, 'none', NULL, 2, '2024-05-18 22:15:22', '2024-05-18 22:15:22', NULL, '7cb8b0db-c230-471d-bd63-642a532fc6de'),
(3, 8, 'BlackLogo', 'blacklogo', 'blacklogo', '', 'blacklogo', '', 'site', NULL, 'none', NULL, 3, '2024-05-20 11:21:29', '2024-05-20 11:21:29', '2024-05-20 11:26:50', '87ebfdc1-a5ae-4971-a6e3-8dde41513e8d'),
(4, 10, 'blackLogo', 'blacklogo', 'blacklogo', '', 'blacklogo', '', 'site', NULL, 'none', NULL, 4, '2024-05-20 11:48:43', '2024-05-20 11:55:57', NULL, '9a77c145-c53b-44a4-bdb2-2dc307052d32'),
(5, 13, 'productImg', 'productimg', 'productimg', '', '', '', 'site', NULL, 'none', NULL, 5, '2024-05-20 13:31:28', '2024-05-20 13:31:28', NULL, 'aa18b816-e7a6-4e90-94ca-6cae62db99e9');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
CREATE TABLE IF NOT EXISTS `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_hhewvxqfeopqsbvidqlpqbfbfnkyrmsfkrlg` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kvhrrvuabapiblyeyuwrwkraucueftgtusgu` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}', 1, '2024-05-16 19:05:11', '2024-05-16 19:05:11', '042b0bfe-1a24-4b3e-9892-827fdd5121d1'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2024-05-16 19:05:11', '2024-05-16 19:05:11', '749b3b60-f420-401d-ae32-ee6e4d6524ab'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2024-05-16 19:05:11', '2024-05-16 19:05:11', 'd958b6d7-f439-49e4-b9ab-4a8df79d0690'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}', 1, '2024-05-16 19:05:11', '2024-05-16 19:05:11', '28cdea85-b3a3-49b7-adc4-b30f95e5717d');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `searchindex`
--
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_nukzpekkgzjlksljbppzgbolqymoeqndaupj` (`keywords`);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_cmvoifhuububshdfjmbyrxkkbrtbixrjsysj` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dhdayehyzxvpqoksatiytjnkcgjjlumfrwaz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_iexffipdvljeccpslqaccptufybwjpzxhgky` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_prgfylrjpqqmnzbfaiznxtyblaigtmcoslpm` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_kjyqjbivvcodefloayvipsunevmnoeawjcqa` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zcwjmydklfshwzmbhokgjecqcrpmvybygqmr` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_dqbrdrsmbycmfwohayhxrjprhcxuyjqxxtyc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fensfnyaeyerjqozsmkjeospnwmvfukygwgl` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qmmktbuvgwwqulfbbsnrkgldoukbjkgxpvfn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ynpbvehfxpiuxiejbqnorzshxlkhdywkaklw` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `assets_sites`
--
ALTER TABLE `assets_sites`
  ADD CONSTRAINT `fk_cgsacwhtqblhxltswqovqllljaftzdicucky` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_uzpoojyfcjqmlcpzbujcxjhbxqjwknmqmpph` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `authenticator`
--
ALTER TABLE `authenticator`
  ADD CONSTRAINT `fk_tmrejiyfddfgkotauchubqngqnaxodbnmnrm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_ahqzowdeqfpddrapfhoahzhowhfnnggrspxh` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gghclfosodqzzvsjmrzplnhunvxujwxdsbsk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_zbytqahebnvtllocomoiiuegnmmfxrvkycrk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_ucxpkterdfljewdgzlftrqwtsuohxvybstgk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yibvmzdjohugwrxzonknjbbaoguoqhqjoebh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_gjnschxowrbswmrbxzlpcnxptvjzyiswmptm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vrqkeorxgsljgkdgqlzretbzqjfgpkhfsqxc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_koyzgxfvkxlbrnfdvfxquazlbgcvepkqsnsy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wdddkcmzfjgmemhtdtfdlssremoaczufchwy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wpvqiohhiowgekpmsehlteyjlskfddajouxj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_dusirttzqovcfxaadpccveohfgzvoxrwfpxn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hhxduwqvclzlpqnmpilgciqvoagihlnjvtti` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vlrqpbkjscjepkrvueggiixdahytveqjfxey` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zuqcueddepwmyurqxalqqxwwieoftbxjbwws` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `cookie_consent_consent`
--
ALTER TABLE `cookie_consent_consent`
  ADD CONSTRAINT `fk_cookie_consent_consent_belong_to_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `cookie_consent_group`
--
ALTER TABLE `cookie_consent_group`
  ADD CONSTRAINT `fk_cookie_consent_group_belong_to_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `cookie_consent_site_settings`
--
ALTER TABLE `cookie_consent_site_settings`
  ADD CONSTRAINT `fk_cookie_consent_setting_belong_to_site` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_coxaahjzygcrvbytsqjqrdrfvxqgaqynejyt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_fonqldovqyrvqrjpxsbrrhyhpjkwpmfurpon` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rfosegymiljruhvfiraeekdlsulvkzmvwrbf` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `elementactivity`
--
ALTER TABLE `elementactivity`
  ADD CONSTRAINT `fk_azprluwjrolxmnfrgjcwzlsvazdvbfvivrxi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jaggglwcsgcjnpssfdijyzkpgsizigyhwmhm` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mpzwnxocfplplwtnurnmoknlpiiwpihcbfid` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sztngsmqcaamfrwitmlbxfmhiuxsgszsstco` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_dkixhedlrftgnklstsozmiaxajmvrnemvonx` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_eatudciagipaodhpogoktuntipusfsuucrzn` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ejornpnirajaxytzpytscrkgiqqdejzkxczf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_msfqkqgjwaxakcvdzynzkghnwzoxkebwnhon` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `elements_bulkops`
--
ALTER TABLE `elements_bulkops`
  ADD CONSTRAINT `fk_gsrmobeagvfetbqvawwoppuexjejhuvianzc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements_owners`
--
ALTER TABLE `elements_owners`
  ADD CONSTRAINT `fk_oeelmusqaohklyhozmlywqodlihqwioypnjk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xobqjwpbhrmfphrgnbhbhazjqmpjvivyprep` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_zyitrjjyswrriaprsqfuidyyvqxnlapmucio` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zzublrfobkmgxxefkfgnkhjnhcfuqikrwlta` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_htmibjmvxtgcesaufdzqlkujtmofisavpwsr` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_htmklbvxvnimseeqtojipkddgbfldkxwvwqg` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lchfxafdbrfakotmcmzftnbkeretvlftyfjt` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pewazwmkpftncwlycntheivxxqvbhyxitabc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pqnmzjivmhycratfqtndrspgvahbgadvznwh` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vbqscuylygupwzjohanpifzynhneisjqaxxq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entries_authors`
--
ALTER TABLE `entries_authors`
  ADD CONSTRAINT `fk_qdiyionezwvpwstnyfppajsqtzzceahqmlyv` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tjhjexgyjqmbsjwisfivbtzygfxtwnhvbaov` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_zlourgdvtcqgvtiidirvdqbppypfcuqfhfmh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `formie_fieldlayout_pages`
--
ALTER TABLE `formie_fieldlayout_pages`
  ADD CONSTRAINT `fk_kmqpvxqukozvwnpleseetkqxiqghkerpogyk` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `formie_fieldlayout_rows`
--
ALTER TABLE `formie_fieldlayout_rows`
  ADD CONSTRAINT `fk_drgapfytysscjkxhbnhkqlljjmftvzmewrkn` FOREIGN KEY (`pageId`) REFERENCES `formie_fieldlayout_pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_kkkyvidiqgmunabgnigeijzurgtpztqezbne` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `formie_fields`
--
ALTER TABLE `formie_fields`
  ADD CONSTRAINT `fk_iqnuvwsrwcgfitqqjminlctuoqbegtdqpxsf` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_itxipzqfawxoukmwxxrqsxuplrmriddsmuxx` FOREIGN KEY (`syncId`) REFERENCES `formie_fields` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ljxjnrempaflafxmiixtqmjsvgzrmbxiqjbc` FOREIGN KEY (`rowId`) REFERENCES `formie_fieldlayout_rows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tsncbjfyewwyftbdhhbwvhwybtgrnqeqghkk` FOREIGN KEY (`pageId`) REFERENCES `formie_fieldlayout_pages` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `formie_forms`
--
ALTER TABLE `formie_forms`
  ADD CONSTRAINT `fk_hwrphamtlulhsjlwqigwlnffvtwnguizaqpt` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_nhhlvqesyiqqqfikyfpzldjodgwxnkzmhsok` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nmzzltibnvmetqufbgviesacnrbjwwntufvg` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sdqqnxkkrfvnesjmwdpgiqvordowaesalksm` FOREIGN KEY (`submitActionEntryId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_urmoowlsofswjggxcxyyfyttgoldpehcuhth` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `formie_formtemplates`
--
ALTER TABLE `formie_formtemplates`
  ADD CONSTRAINT `fk_tchkxbqzalgmqehkfydulkjlolflzjzlnuxc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `formie_notifications`
--
ALTER TABLE `formie_notifications`
  ADD CONSTRAINT `fk_ejseqolmhumdbhznkkejxpbwhjwrobkcjdgk` FOREIGN KEY (`templateId`) REFERENCES `formie_emailtemplates` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_folblqfazsnqlndnzvyrgsodyztmqhfstnds` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tdbxlbpzytziyqmkwodradrrdumlslkoznnv` FOREIGN KEY (`pdfTemplateId`) REFERENCES `formie_pdftemplates` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `formie_payments`
--
ALTER TABLE `formie_payments`
  ADD CONSTRAINT `fk_dbnkcsfdgprpgjcyjqnsbohaytffzjgavdzq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_izkbwfxzzamlishhplmjmfkkumppueanquri` FOREIGN KEY (`subscriptionId`) REFERENCES `formie_payments_subscriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mkisfeqqmuxqqrmmvnxojtjygyobvobbfvxk` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_oxcnbcquwgaxkeecpmsghcntcsoaxlctspuz` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `formie_payments_plans`
--
ALTER TABLE `formie_payments_plans`
  ADD CONSTRAINT `fk_qarydarxzsbumiudikliiekdaddvwiwtkqzr` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `formie_payments_subscriptions`
--
ALTER TABLE `formie_payments_subscriptions`
  ADD CONSTRAINT `fk_ejhojbwcjzizqxxqbilqtrcbcygtadbbzmau` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_fbvztfstshoezefqtpzhwzujnmekphgmtzom` FOREIGN KEY (`planId`) REFERENCES `formie_payments_plans` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_fhsljotysmpzkvonozgdeavrpeuzarnqsfzs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_liuxtzehmcczykoscwxcvdkxtzqvrqhsorjn` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE RESTRICT;

--
-- Beperkingen voor tabel `formie_relations`
--
ALTER TABLE `formie_relations`
  ADD CONSTRAINT `fk_alcyvavjvvfjebsablwexnlrrqvddfowdkix` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pjfyadjyfjpxiutxflcrfmoksmmfionvfgtf` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zgbkuoxwhgiatigfiiuuygxfjdurdzynffqh` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `formie_sentnotifications`
--
ALTER TABLE `formie_sentnotifications`
  ADD CONSTRAINT `fk_apbpyezuuvybrosvajmfddyqsxjbsrckjdsj` FOREIGN KEY (`notificationId`) REFERENCES `formie_notifications` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_cnbsbkevpirecfqckyyinhubxgrdpjjlyxui` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tkatmmwkgwtipqwheggbtcmobvlszfxoimwb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zpedcmbbpneteysvooqmbxwzkjtxgyegbigt` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `formie_stencils`
--
ALTER TABLE `formie_stencils`
  ADD CONSTRAINT `fk_plfcykyzdpkwjeqtluqdmpmymncmnyamdnec` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yvmdaykxjsosvsavubgxripkvxpoovyrfyph` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `formie_submissions`
--
ALTER TABLE `formie_submissions`
  ADD CONSTRAINT `fk_dftbygfpganhjjlzgiutaufotfewlwdetfli` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dtqyfsrxvmkvwoycnvqrsswuosjjhuekqwlh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_xhgppebywhastpsygcmpezuotbccfiiizoit` FOREIGN KEY (`statusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ymtdjpyfsthmkjpcrbevqtmpzbtzijpyplcv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_etiocwcwyylekovjkwtitpuzwutjjfbfwikw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_nunpgjmvnecizbnconhcerbwbfcndfhciear` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_gfjnjjbzvfcwywcikzygkdbtorcivssjgduc` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `navigate_nodes`
--
ALTER TABLE `navigate_nodes`
  ADD CONSTRAINT `fk_ppyqfxmlzzwpeyswdbzgoikzyabpgjjxstfp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_nszluccwqqfppyakfcbbqqsdlufiecqdjljx` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sdbdmbazkbtfrxubllswgueuwlkibabcslqo` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xpqzxppswhowdniejkoftdrkdaazrdsrimhn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_igktzpymlfnyxidcxlnnckfjqofsgagzebvy` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_mwfoonpvvyazwhsfidhayldksmkxlcjdijrx` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_gdqovcwedvnnbiuwsoxawoadctrguuniziog` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `sections_entrytypes`
--
ALTER TABLE `sections_entrytypes`
  ADD CONSTRAINT `fk_jjcnsuusclfzpobvazdhggxqpeznfmomcwbb` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xqzkbeutsinvghtthvtudvtrkaysnjxsyqjp` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_ibywwbjmaijicpisrdwcxxbskusahaqfjkbq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ocvdugqumxafzizscrwtnhwuhqvtbhxmnmvg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_xwvjmneaygddbafchktwugjnqgyppazxwdel` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_oglkerqzanduvbzsmmbkfaasalrployduicx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_idbtfrporgobzeowucxsjqiejmutlbwkunlo` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_ipicrigsniikpejfvyajrjkejkvtpnvgvnfn` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_ydckklqjwxoymjuruxxtxmxbloddivsnzvad` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_fggbkfbzotleonqknfgeyopvjwklvrnjwrxn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qzncldpboaancbfcvkyuwetwhupdyzzvklqa` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_clqkvmachnvpvcxnwvhetbzhysjfgigfipwk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_khdvkubfrptcqgbavdhebbpzuszsedxiigxy` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_lwzhjbhbglvrfqxcsuctkxggtlkvfbeymjzy` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zdqptpujscvflevkoingmatlzfgfzgekmmnm` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_hebehwsndmylnltdayycydzdecnzhgwcsmua` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vcrpbwhtqyudjozcndcxcdnbvheaihenplmv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_svrjpdgviefootvhtidhygncktniqegzxbvc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_zqlsrihyibtqkvlmrwqzxdympcxfhxokqpzo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zzhdqjwiqguunagdjqzxkkgothbyuyzstppb` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_elzstnrqwujcgisxqemiwpvzustblyybokgd` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mnrxqrlyvspknpcurwjwujkftvadqkwuwxhi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_omxpiojufhpgjfegfqygdojojcvhxqzqmdke` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `webauthn`
--
ALTER TABLE `webauthn`
  ADD CONSTRAINT `fk_hhewvxqfeopqsbvidqlpqbfbfnkyrmsfkrlg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_uxpcvavwykwjoblddxuorwjgwuzgjxmgbgcp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
