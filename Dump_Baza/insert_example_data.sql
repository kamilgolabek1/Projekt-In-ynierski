-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.43-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table virtualguide.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.category: ~6 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`ID`, `name`) VALUES
	(1, 'Inne'),
	(2, 'Miasto'),
	(3, 'Miejsce'),
	(4, 'Rozrywka'),
	(5, 'Religia'),
	(6, 'Wydarzenia');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Dumping structure for table virtualguide.comment
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `locationID` int(11) DEFAULT NULL,
  `comment` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `location_IDx` (`locationID`),
  KEY `FkUser_IDx` (`userID`),
  CONSTRAINT `fklocation` FOREIGN KEY (`locationID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkuser` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.comment: ~19 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`ID`, `locationID`, `comment`, `userID`, `date`) VALUES
	(1, 3, 'Jak żywy', 1, '2015-12-21 06:56:08'),
	(2, 1, 'Szaro, buro i ponuro', 1, '2015-12-21 06:57:05'),
	(3, 1, 'Największe i najbardziej różnorodne miasto w Polsce', 1, '2015-12-21 06:57:35'),
	(4, 1, 'W Warszawie nie można się nudzić', 1, '2015-12-21 06:57:54'),
	(5, 1, 'Polecam plażowanie pod mostem Poniatowskiego', 1, '2015-12-21 06:58:36'),
	(6, 1, 'Fantastyczna druga liniaa metra', 1, '2015-12-21 07:00:08'),
	(7, 2, 'Szalone imprezy do rana gwarantowane', 1, '2015-12-21 07:01:08'),
	(8, 5, 'Najlepszy widok na świecie\n', 1, '2015-12-21 07:02:08'),
	(9, 2, 'nowiutki komentarz do Gdyni', NULL, '2015-12-28 19:47:36'),
	(10, 5, 'jest z chelma', NULL, '2015-12-28 20:07:11'),
	(11, 5, 'jest z chelma2', NULL, '2015-12-28 20:10:20'),
	(12, 5, 'nowy z chelma', 1, '2015-12-28 20:12:48'),
	(13, 7, 'wlochy takie se', 1, '2015-12-28 20:22:52'),
	(14, 8, 'a w MAdrycie jeszcze nie bylo kma', 1, '2015-12-28 20:24:35'),
	(15, 8, 'hahahahah', 1, '2015-12-28 22:07:15'),
	(16, 1, 'calkowicie noiutki komcio', 1, '2015-12-29 13:14:00'),
	(17, 1, 'cos takiego', 1, '2015-12-29 15:53:01'),
	(18, 7, 'dfgdghdgf', 1, '2015-12-30 13:47:06'),
	(19, 1, 'hahahahaha', 1, '2015-12-31 11:48:50');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Dumping structure for table virtualguide.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.countries: ~246 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES
	(1, 'AF', 'Afghanistan'),
	(2, 'AL', 'Albania'),
	(3, 'DZ', 'Algeria'),
	(4, 'DS', 'American Samoa'),
	(5, 'AD', 'Andorra'),
	(6, 'AO', 'Angola'),
	(7, 'AI', 'Anguilla'),
	(8, 'AQ', 'Antarctica'),
	(9, 'AG', 'Antigua and/or Barbuda'),
	(10, 'AR', 'Argentina'),
	(11, 'AM', 'Armenia'),
	(12, 'AW', 'Aruba'),
	(13, 'AU', 'Australia'),
	(14, 'AT', 'Austria'),
	(15, 'AZ', 'Azerbaijan'),
	(16, 'BS', 'Bahamas'),
	(17, 'BH', 'Bahrain'),
	(18, 'BD', 'Bangladesh'),
	(19, 'BB', 'Barbados'),
	(20, 'BY', 'Belarus'),
	(21, 'BE', 'Belgium'),
	(22, 'BZ', 'Belize'),
	(23, 'BJ', 'Benin'),
	(24, 'BM', 'Bermuda'),
	(25, 'BT', 'Bhutan'),
	(26, 'BO', 'Bolivia'),
	(27, 'BA', 'Bosnia and Herzegovina'),
	(28, 'BW', 'Botswana'),
	(29, 'BV', 'Bouvet Island'),
	(30, 'BR', 'Brazil'),
	(31, 'IO', 'British Indian Ocean Territory'),
	(32, 'BN', 'Brunei Darussalam'),
	(33, 'BG', 'Bulgaria'),
	(34, 'BF', 'Burkina Faso'),
	(35, 'BI', 'Burundi'),
	(36, 'KH', 'Cambodia'),
	(37, 'CM', 'Cameroon'),
	(38, 'CA', 'Canada'),
	(39, 'CV', 'Cape Verde'),
	(40, 'KY', 'Cayman Islands'),
	(41, 'CF', 'Central African Republic'),
	(42, 'TD', 'Chad'),
	(43, 'CL', 'Chile'),
	(44, 'CN', 'China'),
	(45, 'CX', 'Christmas Island'),
	(46, 'CC', 'Cocos (Keeling) Islands'),
	(47, 'CO', 'Colombia'),
	(48, 'KM', 'Comoros'),
	(49, 'CG', 'Congo'),
	(50, 'CK', 'Cook Islands'),
	(51, 'CR', 'Costa Rica'),
	(52, 'HR', 'Croatia (Hrvatska)'),
	(53, 'CU', 'Cuba'),
	(54, 'CY', 'Cyprus'),
	(55, 'CZ', 'Czech Republic'),
	(56, 'DK', 'Denmark'),
	(57, 'DJ', 'Djibouti'),
	(58, 'DM', 'Dominica'),
	(59, 'DO', 'Dominican Republic'),
	(60, 'TP', 'East Timor'),
	(61, 'EC', 'Ecuador'),
	(62, 'EG', 'Egypt'),
	(63, 'SV', 'El Salvador'),
	(64, 'GQ', 'Equatorial Guinea'),
	(65, 'ER', 'Eritrea'),
	(66, 'EE', 'Estonia'),
	(67, 'ET', 'Ethiopia'),
	(68, 'FK', 'Falkland Islands (Malvinas)'),
	(69, 'FO', 'Faroe Islands'),
	(70, 'FJ', 'Fiji'),
	(71, 'FI', 'Finland'),
	(72, 'FR', 'France'),
	(73, 'FX', 'France, Metropolitan'),
	(74, 'GF', 'French Guiana'),
	(75, 'PF', 'French Polynesia'),
	(76, 'TF', 'French Southern Territories'),
	(77, 'GA', 'Gabon'),
	(78, 'GM', 'Gambia'),
	(79, 'GE', 'Georgia'),
	(80, 'DE', 'Germany'),
	(81, 'GH', 'Ghana'),
	(82, 'GI', 'Gibraltar'),
	(83, 'GK', 'Guernsey'),
	(84, 'GR', 'Greece'),
	(85, 'GL', 'Greenland'),
	(86, 'GD', 'Grenada'),
	(87, 'GP', 'Guadeloupe'),
	(88, 'GU', 'Guam'),
	(89, 'GT', 'Guatemala'),
	(90, 'GN', 'Guinea'),
	(91, 'GW', 'Guinea-Bissau'),
	(92, 'GY', 'Guyana'),
	(93, 'HT', 'Haiti'),
	(94, 'HM', 'Heard and Mc Donald Islands'),
	(95, 'HN', 'Honduras'),
	(96, 'HK', 'Hong Kong'),
	(97, 'HU', 'Hungary'),
	(98, 'IS', 'Iceland'),
	(99, 'IN', 'India'),
	(100, 'IM', 'Isle of Man'),
	(101, 'ID', 'Indonesia'),
	(102, 'IR', 'Iran (Islamic Republic of)'),
	(103, 'IQ', 'Iraq'),
	(104, 'IE', 'Ireland'),
	(105, 'IL', 'Israel'),
	(106, 'IT', 'Italy'),
	(107, 'CI', 'Ivory Coast'),
	(108, 'JE', 'Jersey'),
	(109, 'JM', 'Jamaica'),
	(110, 'JP', 'Japan'),
	(111, 'JO', 'Jordan'),
	(112, 'KZ', 'Kazakhstan'),
	(113, 'KE', 'Kenya'),
	(114, 'KI', 'Kiribati'),
	(115, 'KP', 'Korea, Democratic People\'s Republic of'),
	(116, 'KR', 'Korea, Republic of'),
	(117, 'XK', 'Kosovo'),
	(118, 'KW', 'Kuwait'),
	(119, 'KG', 'Kyrgyzstan'),
	(120, 'LA', 'Lao People\'s Democratic Republic'),
	(121, 'LV', 'Latvia'),
	(122, 'LB', 'Lebanon'),
	(123, 'LS', 'Lesotho'),
	(124, 'LR', 'Liberia'),
	(125, 'LY', 'Libyan Arab Jamahiriya'),
	(126, 'LI', 'Liechtenstein'),
	(127, 'LT', 'Lithuania'),
	(128, 'LU', 'Luxembourg'),
	(129, 'MO', 'Macau'),
	(130, 'MK', 'Macedonia'),
	(131, 'MG', 'Madagascar'),
	(132, 'MW', 'Malawi'),
	(133, 'MY', 'Malaysia'),
	(134, 'MV', 'Maldives'),
	(135, 'ML', 'Mali'),
	(136, 'MT', 'Malta'),
	(137, 'MH', 'Marshall Islands'),
	(138, 'MQ', 'Martinique'),
	(139, 'MR', 'Mauritania'),
	(140, 'MU', 'Mauritius'),
	(141, 'TY', 'Mayotte'),
	(142, 'MX', 'Mexico'),
	(143, 'FM', 'Micronesia, Federated States of'),
	(144, 'MD', 'Moldova, Republic of'),
	(145, 'MC', 'Monaco'),
	(146, 'MN', 'Mongolia'),
	(147, 'ME', 'Montenegro'),
	(148, 'MS', 'Montserrat'),
	(149, 'MA', 'Morocco'),
	(150, 'MZ', 'Mozambique'),
	(151, 'MM', 'Myanmar'),
	(152, 'NA', 'Namibia'),
	(153, 'NR', 'Nauru'),
	(154, 'NP', 'Nepal'),
	(155, 'NL', 'Netherlands'),
	(156, 'AN', 'Netherlands Antilles'),
	(157, 'NC', 'New Caledonia'),
	(158, 'NZ', 'New Zealand'),
	(159, 'NI', 'Nicaragua'),
	(160, 'NE', 'Niger'),
	(161, 'NG', 'Nigeria'),
	(162, 'NU', 'Niue'),
	(163, 'NF', 'Norfolk Island'),
	(164, 'MP', 'Northern Mariana Islands'),
	(165, 'NO', 'Norway'),
	(166, 'OM', 'Oman'),
	(167, 'PK', 'Pakistan'),
	(168, 'PW', 'Palau'),
	(169, 'PS', 'Palestine'),
	(170, 'PA', 'Panama'),
	(171, 'PG', 'Papua New Guinea'),
	(172, 'PY', 'Paraguay'),
	(173, 'PE', 'Peru'),
	(174, 'PH', 'Philippines'),
	(175, 'PN', 'Pitcairn'),
	(176, 'PL', 'Poland'),
	(177, 'PT', 'Portugal'),
	(178, 'PR', 'Puerto Rico'),
	(179, 'QA', 'Qatar'),
	(180, 'RE', 'Reunion'),
	(181, 'RO', 'Romania'),
	(182, 'RU', 'Russian Federation'),
	(183, 'RW', 'Rwanda'),
	(184, 'KN', 'Saint Kitts and Nevis'),
	(185, 'LC', 'Saint Lucia'),
	(186, 'VC', 'Saint Vincent and the Grenadines'),
	(187, 'WS', 'Samoa'),
	(188, 'SM', 'San Marino'),
	(189, 'ST', 'Sao Tome and Principe'),
	(190, 'SA', 'Saudi Arabia'),
	(191, 'SN', 'Senegal'),
	(192, 'RS', 'Serbia'),
	(193, 'SC', 'Seychelles'),
	(194, 'SL', 'Sierra Leone'),
	(195, 'SG', 'Singapore'),
	(196, 'SK', 'Slovakia'),
	(197, 'SI', 'Slovenia'),
	(198, 'SB', 'Solomon Islands'),
	(199, 'SO', 'Somalia'),
	(200, 'ZA', 'South Africa'),
	(201, 'GS', 'South Georgia South Sandwich Islands'),
	(202, 'ES', 'Spain'),
	(203, 'LK', 'Sri Lanka'),
	(204, 'SH', 'St. Helena'),
	(205, 'PM', 'St. Pierre and Miquelon'),
	(206, 'SD', 'Sudan'),
	(207, 'SR', 'Suriname'),
	(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
	(209, 'SZ', 'Swaziland'),
	(210, 'SE', 'Sweden'),
	(211, 'CH', 'Switzerland'),
	(212, 'SY', 'Syrian Arab Republic'),
	(213, 'TW', 'Taiwan'),
	(214, 'TJ', 'Tajikistan'),
	(215, 'TZ', 'Tanzania, United Republic of'),
	(216, 'TH', 'Thailand'),
	(217, 'TG', 'Togo'),
	(218, 'TK', 'Tokelau'),
	(219, 'TO', 'Tonga'),
	(220, 'TT', 'TrinIDad and Tobago'),
	(221, 'TN', 'Tunisia'),
	(222, 'TR', 'Turkey'),
	(223, 'TM', 'Turkmenistan'),
	(224, 'TC', 'Turks and Caicos Islands'),
	(225, 'TV', 'Tuvalu'),
	(226, 'UG', 'Uganda'),
	(227, 'UA', 'Ukraine'),
	(228, 'AE', 'United Arab Emirates'),
	(229, 'GB', 'United Kingdom'),
	(230, 'US', 'United States'),
	(231, 'UM', 'United States minor outlying islands'),
	(232, 'UY', 'Uruguay'),
	(233, 'UZ', 'Uzbekistan'),
	(234, 'VU', 'Vanuatu'),
	(235, 'VA', 'Vatican City State'),
	(236, 'VE', 'Venezuela'),
	(237, 'VN', 'Vietnam'),
	(238, 'VG', 'Virgin Islands (British)'),
	(239, 'VI', 'Virgin Islands (U.S.)'),
	(240, 'WF', 'Wallis and Futuna Islands'),
	(241, 'EH', 'Western Sahara'),
	(242, 'YE', 'Yemen'),
	(243, 'YU', 'Yugoslavia'),
	(244, 'ZR', 'Zaire'),
	(245, 'ZM', 'Zambia'),
	(246, 'ZW', 'Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;


-- Dumping structure for table virtualguide.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descr` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zoom` tinyint(20) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `tag` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.location: ~14 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`ID`, `name`, `descr`, `lon`, `lat`, `countryID`, `address`, `zoom`, `categoryID`, `userID`, `tag`) VALUES
	(1, 'Warszawa', 'Warszawa, miasto stołeczne Warszawa – stolica Polski i województwa mazowieckiego, największe miasto kraju, położone w jego środkowo-wschodniej części, na Nizinie Środkowomazowieckiej, na Mazowszu, nad Wisłą.', '20.47851562499941', '52.187404745600105', 176, 'ul. 3 Maja', 3, 2, 1, NULL),
	(2, 'Klub Marynarza', 'Najlepszy klub w trojmieście.', '18.543462753296', '54.51938770201077', 176, 'Skwer Kościuszki', 14, 4, 1, NULL),
	(3, 'Neptun', ' Zabytkowa fontanna w Gdańsku, która powstała z inicjatywy burmistrza Bartłomieja Schachmanna[2] i rady miejskiej. Stoi w najbardziej reprezentacyjnej części Gdańska – na Długim Targu, przed wejściem do Dworu Artusa.', '18.653240203855805', '54.34854026920933', 176, 'Długa 17', 16, 3, 1, 'Neptun'),
	(4, 'Berlin', 'Stare miasto', '13.382291793822903', '52.52569979185128', 80, 'Bundesstrasse 20', 7, 2, 1, NULL),
	(5, 'Wieża Eiffla', 'Największa nitowana konstrukcja.', '2.3506450653067175', '48.85779759188319', 72, 'Champ de Mars, 5 Avenue Anatole', 10, 3, 1, NULL),
	(6, 'Bitwa pod Grunwaldem', 'Największa bitwa średniowiecznej Europy w 1410 r.', '20.093908309936605', '53.484240766360735', 176, 'pola grunwaldzkie', 12, 6, 1, 'Krzyżacy 1410 '),
	(7, 'Rzym', 'Miasto zbudowane na ruinach.', '12.494459152222017', '41.8862724708897', 106, '', 7, 2, 1, NULL),
	(8, 'Madrid', ' morze i ostrygi', '-3.5', '40.17', NULL, 'barcelonska', 2, 2, 1, 'madryd'),
	(9, 'Kazahstan', 'sfdgsfdg', '66.26953124999972', '47.635783590864804', NULL, NULL, 2, NULL, 1, 'sfdg'),
	(21, 'Egipt', '', '31.223144531249936', '30.050076521697946', NULL, NULL, 6, NULL, 1, ''),
	(22, 'Egipt', '', '31.223144531249936', '30.050076521697946', NULL, NULL, 6, NULL, 1, ''),
	(23, 'Egipt', '', '31.223144531249936', '30.050076521697946', NULL, NULL, 6, NULL, 1, ''),
	(24, 'Egipt', '', '31.223144531249936', '30.050076521697946', NULL, NULL, 6, NULL, 1, ''),
	(25, 'Slav', '', '23.027343749999606', '1.4939713066293239', NULL, NULL, 3, NULL, 1, '');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;


-- Dumping structure for table virtualguide.photo
DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `locationID` int(11) DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FkLocation_IDx` (`locationID`),
  KEY `fkuserphoto_IDx` (`userID`),
  CONSTRAINT `fklocphoto` FOREIGN KEY (`locationID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkuserphoto` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.photo: ~13 rows (approximately)
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`ID`, `locationID`, `filename`, `comment`, `userID`) VALUES
	(1, 8, '1_2015_12_21_06_16_35.jpg', '', 1),
	(2, 1, '1_2015_12_21_06_16_36.jpg', '', 1),
	(3, 1, '1_2015_12_21_06_16_37.jpg', '', 1),
	(4, 1, '1_2015_12_21_06_16_38.jpg', '', 1),
	(5, 1, '1_2015_12_21_06_16_39.jpg', '', 1),
	(6, 1, '1_2015_12_21_06_16_40.jpg', '', 1),
	(7, 1, '1_2015_12_21_06_16_41.jpg', '', 1),
	(8, 9, '1_2015_12_28_22_27_33.jpg', '', 1),
	(20, 21, '1_2015_12_31_10_49_55.jpg', '', 1),
	(21, 22, '1_2015_12_31_10_50_32.jpg', '', 1),
	(22, 23, '1_2015_12_31_10_50_46.jpg', '', 1),
	(23, 24, '1_2015_12_31_10_56_46.jpg', '', 1),
	(24, 25, '1_2015_12_31_10_58_53.jpg', '', 1);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;


-- Dumping structure for table virtualguide.replies
DROP TABLE IF EXISTS `replies`;
CREATE TABLE IF NOT EXISTS `replies` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `data` datetime NOT NULL,
  `topicID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `topicID` (`topicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.replies: ~0 rows (approximately)
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;


-- Dumping structure for table virtualguide.topics
DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `categoryID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `tag` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.topics: ~0 rows (approximately)
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;


-- Dumping structure for table virtualguide.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.user: ~1 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Hd0JWsYIfKnQRT__OGRQ461qWrIDCmxk', '$2y$13$3S0L55C/uYEOfCk.mVP8r.fZqAKJnZhOLPqXietdTnjsilr30lGDK', NULL, 'the21@interia.pl', 10, 1450653333, 1450653333);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
