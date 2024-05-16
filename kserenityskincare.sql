-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 16 mei 2024 om 18:38
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `deletedWithOwner`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2024-05-16 18:35:01', '2024-05-16 18:35:01', NULL, NULL, NULL, 'eacf9564-b3f9-4bee-a004-8763eecd8446');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, 1, '2024-05-16 18:35:01', '2024-05-16 18:35:01', '3b8ed87a-4f4c-4a76-b2f9-8cc45c2108d1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, '5.1.3', '5.0.0.20', 0, 'khqskkokrmko', '3@hplvxgeytg', '2024-05-16 18:35:01', '2024-05-16 18:38:30', '0dc5a536-feb2-45a3-acc2-3219856a27da');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(29, 'craft', 'm240302_212719_solo_preview_targets', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02', '3ea72536-bdc1-43fa-be39-055fb88a4dab');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
('dateModified', '1715884501'),
('email.fromEmail', '\"beyza.cevik@student.pxl.be\"'),
('email.fromName', '\"kserenity-skincare\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('meta.__names__.30863589-1efd-4876-8616-a9940a064ced', '\"kserenity-skincare\"'),
('meta.__names__.7efebcfe-cbe8-4d2a-a4c0-c75c069d028e', '\"kserenity-skincare\"'),
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
('users.requireEmailVerification', 'true');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
('baa525cf', '@craft/web/assets/installer/dist');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, 'username', 0, 1, ' beyzarisha ');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, NULL, 1, 0, 0, 0, 1, 'beyzarisha', NULL, NULL, NULL, 'beyza.cevik@student.pxl.be', '$2y$13$1hA1y9CYLu/.bIOdafagwezNwDz7G7M4VuiWiCimWdhsWu3epHBMK', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '2024-05-16 18:35:02', '2024-05-16 18:35:02', '2024-05-16 18:35:02');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
