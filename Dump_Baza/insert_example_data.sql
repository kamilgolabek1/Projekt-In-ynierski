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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.comment: ~9 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`ID`, `locationID`, `comment`, `userID`, `date`) VALUES
	(1, 1, 'Warszawa posiada dużo nowocześnie wyposażonych kin, teatrów. Znajduje się w niej dużo banków, różnego typu kawiarni i restauracji. Jest też bardzo dużo eleganckich sklepów  między innymi Złote Tarasy, Promenada itp.W centrum Warszawy jest tez dużo wieżowców.  Posiada też ścieżki rowerowe oraz piękne zadbane parki.', 1, '2016-01-23 21:14:01'),
	(2, 1, 'Na pewno każdy kto pozna Warszawę powie o niej, że jest to nowoczesne miasto.', 1, '2016-01-23 21:14:37'),
	(3, 2, 'Park jest piękny, przechadzające się z gracja Pawie, koncert na który trafiliśmy i urocze Wiewiórki', 1, '2016-01-23 21:15:33'),
	(4, 2, 'Miejsce ma coś w sobie, za każdym razem jak jestem w Warszawie to spacer po Parku obowiązkowy :) Uwielbiam, latem jak i zimą :)', 1, '2016-01-23 21:16:15'),
	(5, 2, 'Łazienki Królewskie-wracasz do nich od lat, w każdej porze roku i za każdym razem są inne- jakby piękniejsze. Zimowy klimat, piękne oświetlenie nadają magii, z kolei bujna zieleń latem czy ogniste czerwienie jesienią sprawiają, że czujesz się cząstką ogromnego żyjącego ogrodu- chyba najpiękniejszego w Warszawie.', 1, '2016-01-23 21:16:36'),
	(6, 2, 'Zimą organizowane są spacery z przewodnikiem wzdłuż oświetlonych atrakcji. Nie powala, ale warto się i tak wybrać, jeśli nie jest za zimno ;) W parku brakuje mi fajnej kawiarni, miejsca z dobrą kawą czy lodami.', 1, '2016-01-23 21:17:06'),
	(7, 2, 'Wspaniałe miejsce na spokojny spacer z rodziną . Urocze wiewiorki oczarują każdego turystę pragacego odpoczynku w stolicy.', 1, '2016-01-23 21:17:30'),
	(8, 4, 'Czekamy na odrodzenie się polskich skoczków. Niedawno zapowiadał to Stoch, że w Polsce na pewno ono nastąpi, a między słowami można było zrozumiec, że jeśli nie w kraju to gdzie ?', 1, '2016-01-23 21:19:18'),
	(9, 4, 'Halny w Zakopanem wieje, Stoch na skoczni nie poszaleje ; p', 1, '2016-01-23 21:20:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.location: ~7 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`ID`, `name`, `descr`, `lon`, `lat`, `countryID`, `address`, `zoom`, `categoryID`, `userID`, `tag`) VALUES
	(1, 'Warszawa', 'Warszawa, miasto stołeczne Warszawa – stolica Polski i województwa mazowieckiego, największe miasto kraju, położone w jego środkowo-wschodniej części, na Nizinie Środkowomazowieckiej, na Mazowszu, nad Wisłą.', '20.865783691405316', '52.219386890374295', 176, 'Plac Zamkowy 1', 6, 2, 1, ''),
	(2, 'Łazienki Królewskie', 'zespół pałacowo-ogrodowy w Warszawie założony w XVIII wieku przez Stanisława Augusta Poniatowskiego.  Nazwa pochodzi od barokowego pawilonu Łaźni, wzniesionego w latach 80. XVII wieku przez Stanisława Herakliusza Lubomirskiego i przebudowanego przez Stanisława Augusta Poniatowskiego na pałac Na Wyspie[1]. Oprócz budynków pałacowych, pawilonów oraz wolnostojących rzeźb znajdują się tutaj cztery ogrody: Ogród Królewski, Ogród Romantyczny, Ogród Modernistyczny i Ogród Chiński.', '21.03379726409796', '52.21449637576063', 176, 'Śródmieście', 14, 3, 1, ''),
	(3, 'Europejskie Centrum Solidarności', 'instytucja z siedzibą w Gdańsku, powołana na podstawie umowy z dnia 8 listopada 2007 w sprawie utworzenia i prowadzenia wspólnej instytucji kultury pod nazwą Europejskie Centrum Solidarności, zawartej między Ministrem Kultury i Dziedzictwa Narodowego, Województwem Pomorskim, Miastem Gdańsk, Niezależnym Samorządnym Związkiem Zawodowym „Solidarność” i Fundacją Centrum Solidarności.', '18.649249076842057', '54.36132009727348', 176, 'Plac Solidarności 1', 16, 3, 1, ''),
	(4, 'Puchar Świata w skokach narciarskich', 'Spośród 67 zawodników w kwalifikacjach aż 12 to Polacy. Dziś skakać będą kolejno: Krzysztof Biegun, Krzysztof Miętus, Bartłomiej Kłusek, Jan Ziobro, Jakub Wolny, Andrzej Stękała, Dawid Kubacki, Klemens Murańka, Piotr Żyła, Maciej Kot, Stefan Hula oraz Kamil Stoch.', '19.955034255980852', '49.294918297960386', 176, 'Bronisława Czecha 1, 34-500 Zakopane', 13, 6, 1, ''),
	(5, 'Москва́', ' столица Российской Федерации, город федерального значения, административный центр Центрального федерального округа и центр Московской области[6], в состав которой не входит. Крупнейший по численности населения город России и её субъект — 12 325 387[3] чел. (2016), самый населённый из городов, полностью расположенных в Европе, входит в первую десятку городов мира по численности населения[7]. Центр Московской городской агломерации.', '37.54028320312375', '55.74566603524778', 182, 'Россия', 7, 2, 1, ''),
	(6, 'Sugarbar Barcelona Close', 'Po obfitej, długiej i późnej kolacji, jak to na hiszpańskie klimaty przystało, zbieramy się w barze mocno po 22giej.  Jako meeting point był, jest i będzie wyjątkowy i jedyny w swoim rodzaju SugarBar. Dobrze jest pojawić się w nim przed 23pm i wtedy załapiemy się na Happy Hours. Jak na Barcelonę, to ceny są wtedy wyjątkowe. Od 5 EUR za przyzwoite mojito.', '2.1762585639937306', '41.38140132212359', 202, 'Calle Rauric 21, Barcelona, Spain', 18, 4, 1, ''),
	(7, 'Port lotniczy Ren-Men', 'największy port lotniczy w Niemczech, usytuowany we Frankfurcie nad Menem, w dzielnicy Flughafen. Właścicielem i operatorem zarządzającym portem jest spółka Fraport.  W Europie port lotniczy zajmuje trzecie miejsce pod względem liczby pasażerów (2008), drugie pod względem liczby operacji lotniczych (2005) i drugie pod względem liczby przeładowanych towarów (2005). Port zajmuje pierwsze miejsce na świecie pod względem obsługiwanych połączeń międzynarodowych.', '8.681259155274422', '50.115294694991306', 80, '60547 Frankfurt, Niemcy', 11, 3, 1, '');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table virtualguide.photo: ~15 rows (approximately)
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`ID`, `locationID`, `filename`, `comment`, `userID`) VALUES
	(1, 5, '5_2016_01_23_15_41_03.jpg', '', 1),
	(2, 5, '5_2016_01_23_15_41_20.jpg', '', 1),
	(3, 6, '6_2016_01_23_16_06_48.jpg', '', 1),
	(4, 7, '7_2016_01_23_16_25_21.jpg', '', 1),
	(5, 3, '3_2016_01_23_16_26_15.jpg', '', 1),
	(6, 3, '3_2016_01_23_16_26_38.jpg', '', 1),
	(7, 4, '4_2016_01_23_16_28_00.jpg', '', 1),
	(8, 4, '4_2016_01_23_16_28_16.jpg', '', 1),
	(9, 1, '1_2016_01_23_16_29_48.jpg', '', 1),
	(10, 2, '2_2016_01_23_16_30_56.jpg', '', 1),
	(11, 2, '2_2016_01_23_16_31_12.jpg', '', 1),
	(12, 2, '2_2016_01_23_16_31_32.jpg', '', 1),
	(13, 2, '2_2016_01_23_16_33_43.jpg', '', 1),
	(14, 2, '2_2016_01_23_16_34_59.jpg', '', 1),
	(15, 2, '2_2016_01_23_16_35_26.jpg', '', 1);
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
	(1, 'Sław', 'P9YtZEk1MWpTIiuM2IyFOqIvKXLYTK6w', '$2y$13$.YhcRpPDzm.JV2sF3S.Dce/KpbfMfAGiDEbQtZG0BqE4gzVOkADgS', NULL, 'the21@interia.pl', 10, 1453559964, 1453559964);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
