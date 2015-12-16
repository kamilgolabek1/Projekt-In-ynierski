--
-- Baza danych: `virtualguIDe`
--
CREATE DATABASE IF NOT EXISTS `virtualguide` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `virtualguide`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`ID`, `name`) VALUES(1, 'Inne');
INSERT INTO `category` (`ID`, `name`) VALUES(2, 'Miasto');
INSERT INTO `category` (`ID`, `name`) VALUES(3, 'Miejsce');
INSERT INTO `category` (`ID`, `name`) VALUES(4, 'Rozrywka');
INSERT INTO `category` (`ID`, `name`) VALUES(5, 'Religia');
INSERT INTO `category` (`ID`, `name`) VALUES(6, 'Wydarzenia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `locationID` int(11) DEFAULT NULL,
  `comment` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `location_IDx` (`locationID`),
  KEY `FkUser_IDx` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `countries`
--

INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(1, 'AF', 'Afghanistan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(2, 'AL', 'Albania');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(3, 'DZ', 'Algeria');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(4, 'DS', 'American Samoa');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(5, 'AD', 'Andorra');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(6, 'AO', 'Angola');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(7, 'AI', 'Anguilla');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(8, 'AQ', 'Antarctica');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(9, 'AG', 'Antigua and/or Barbuda');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(10, 'AR', 'Argentina');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(11, 'AM', 'Armenia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(12, 'AW', 'Aruba');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(13, 'AU', 'Australia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(14, 'AT', 'Austria');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(15, 'AZ', 'Azerbaijan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(16, 'BS', 'Bahamas');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(17, 'BH', 'Bahrain');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(18, 'BD', 'Bangladesh');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(19, 'BB', 'Barbados');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(20, 'BY', 'Belarus');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(21, 'BE', 'Belgium');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(22, 'BZ', 'Belize');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(23, 'BJ', 'Benin');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(24, 'BM', 'Bermuda');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(25, 'BT', 'Bhutan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(26, 'BO', 'Bolivia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(27, 'BA', 'Bosnia and Herzegovina');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(28, 'BW', 'Botswana');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(29, 'BV', 'Bouvet Island');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(30, 'BR', 'Brazil');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(31, 'IO', 'British Indian Ocean Territory');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(32, 'BN', 'Brunei Darussalam');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(33, 'BG', 'Bulgaria');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(34, 'BF', 'Burkina Faso');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(35, 'BI', 'Burundi');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(36, 'KH', 'Cambodia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(37, 'CM', 'Cameroon');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(38, 'CA', 'Canada');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(39, 'CV', 'Cape Verde');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(40, 'KY', 'Cayman Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(41, 'CF', 'Central African Republic');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(42, 'TD', 'Chad');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(43, 'CL', 'Chile');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(44, 'CN', 'China');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(45, 'CX', 'Christmas Island');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(46, 'CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(47, 'CO', 'Colombia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(48, 'KM', 'Comoros');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(49, 'CG', 'Congo');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(50, 'CK', 'Cook Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(51, 'CR', 'Costa Rica');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(52, 'HR', 'Croatia (Hrvatska)');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(53, 'CU', 'Cuba');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(54, 'CY', 'Cyprus');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(55, 'CZ', 'Czech Republic');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(56, 'DK', 'Denmark');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(57, 'DJ', 'Djibouti');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(58, 'DM', 'Dominica');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(59, 'DO', 'Dominican Republic');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(60, 'TP', 'East Timor');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(61, 'EC', 'Ecuador');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(62, 'EG', 'Egypt');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(63, 'SV', 'El Salvador');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(64, 'GQ', 'Equatorial Guinea');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(65, 'ER', 'Eritrea');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(66, 'EE', 'Estonia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(67, 'ET', 'Ethiopia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(68, 'FK', 'Falkland Islands (Malvinas)');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(69, 'FO', 'Faroe Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(70, 'FJ', 'Fiji');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(71, 'FI', 'Finland');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(72, 'FR', 'France');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(73, 'FX', 'France, Metropolitan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(74, 'GF', 'French Guiana');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(75, 'PF', 'French Polynesia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(76, 'TF', 'French Southern Territories');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(77, 'GA', 'Gabon');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(78, 'GM', 'Gambia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(79, 'GE', 'Georgia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(80, 'DE', 'Germany');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(81, 'GH', 'Ghana');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(82, 'GI', 'Gibraltar');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(83, 'GK', 'Guernsey');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(84, 'GR', 'Greece');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(85, 'GL', 'Greenland');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(86, 'GD', 'Grenada');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(87, 'GP', 'Guadeloupe');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(88, 'GU', 'Guam');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(89, 'GT', 'Guatemala');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(90, 'GN', 'Guinea');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(91, 'GW', 'Guinea-Bissau');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(92, 'GY', 'Guyana');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(93, 'HT', 'Haiti');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(94, 'HM', 'Heard and Mc Donald Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(95, 'HN', 'Honduras');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(96, 'HK', 'Hong Kong');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(97, 'HU', 'Hungary');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(98, 'IS', 'Iceland');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(99, 'IN', 'India');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(100, 'IM', 'Isle of Man');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(101, 'ID', 'Indonesia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(102, 'IR', 'Iran (Islamic Republic of)');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(103, 'IQ', 'Iraq');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(104, 'IE', 'Ireland');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(105, 'IL', 'Israel');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(106, 'IT', 'Italy');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(107, 'CI', 'Ivory Coast');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(108, 'JE', 'Jersey');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(109, 'JM', 'Jamaica');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(110, 'JP', 'Japan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(111, 'JO', 'Jordan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(112, 'KZ', 'Kazakhstan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(113, 'KE', 'Kenya');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(114, 'KI', 'Kiribati');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(115, 'KP', 'Korea, Democratic People''s Republic of');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(116, 'KR', 'Korea, Republic of');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(117, 'XK', 'Kosovo');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(118, 'KW', 'Kuwait');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(119, 'KG', 'Kyrgyzstan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(120, 'LA', 'Lao People''s Democratic Republic');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(121, 'LV', 'Latvia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(122, 'LB', 'Lebanon');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(123, 'LS', 'Lesotho');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(124, 'LR', 'Liberia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(125, 'LY', 'Libyan Arab Jamahiriya');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(126, 'LI', 'Liechtenstein');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(127, 'LT', 'Lithuania');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(128, 'LU', 'Luxembourg');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(129, 'MO', 'Macau');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(130, 'MK', 'Macedonia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(131, 'MG', 'Madagascar');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(132, 'MW', 'Malawi');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(133, 'MY', 'Malaysia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(134, 'MV', 'Maldives');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(135, 'ML', 'Mali');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(136, 'MT', 'Malta');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(137, 'MH', 'Marshall Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(138, 'MQ', 'Martinique');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(139, 'MR', 'Mauritania');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(140, 'MU', 'Mauritius');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(141, 'TY', 'Mayotte');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(142, 'MX', 'Mexico');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(143, 'FM', 'Micronesia, Federated States of');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(144, 'MD', 'Moldova, Republic of');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(145, 'MC', 'Monaco');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(146, 'MN', 'Mongolia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(147, 'ME', 'Montenegro');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(148, 'MS', 'Montserrat');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(149, 'MA', 'Morocco');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(150, 'MZ', 'Mozambique');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(151, 'MM', 'Myanmar');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(152, 'NA', 'Namibia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(153, 'NR', 'Nauru');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(154, 'NP', 'Nepal');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(155, 'NL', 'Netherlands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(156, 'AN', 'Netherlands Antilles');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(157, 'NC', 'New Caledonia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(158, 'NZ', 'New Zealand');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(159, 'NI', 'Nicaragua');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(160, 'NE', 'Niger');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(161, 'NG', 'Nigeria');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(162, 'NU', 'Niue');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(163, 'NF', 'Norfolk Island');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(164, 'MP', 'Northern Mariana Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(165, 'NO', 'Norway');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(166, 'OM', 'Oman');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(167, 'PK', 'Pakistan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(168, 'PW', 'Palau');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(169, 'PS', 'Palestine');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(170, 'PA', 'Panama');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(171, 'PG', 'Papua New Guinea');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(172, 'PY', 'Paraguay');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(173, 'PE', 'Peru');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(174, 'PH', 'Philippines');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(175, 'PN', 'Pitcairn');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(176, 'PL', 'Poland');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(177, 'PT', 'Portugal');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(178, 'PR', 'Puerto Rico');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(179, 'QA', 'Qatar');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(180, 'RE', 'Reunion');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(181, 'RO', 'Romania');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(182, 'RU', 'Russian Federation');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(183, 'RW', 'Rwanda');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(184, 'KN', 'Saint Kitts and Nevis');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(185, 'LC', 'Saint Lucia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(186, 'VC', 'Saint Vincent and the Grenadines');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(187, 'WS', 'Samoa');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(188, 'SM', 'San Marino');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(189, 'ST', 'Sao Tome and Principe');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(190, 'SA', 'Saudi Arabia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(191, 'SN', 'Senegal');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(192, 'RS', 'Serbia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(193, 'SC', 'Seychelles');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(194, 'SL', 'Sierra Leone');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(195, 'SG', 'Singapore');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(196, 'SK', 'Slovakia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(197, 'SI', 'Slovenia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(198, 'SB', 'Solomon Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(199, 'SO', 'Somalia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(200, 'ZA', 'South Africa');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(201, 'GS', 'South Georgia South Sandwich Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(202, 'ES', 'Spain');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(203, 'LK', 'Sri Lanka');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(204, 'SH', 'St. Helena');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(205, 'PM', 'St. Pierre and Miquelon');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(206, 'SD', 'Sudan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(207, 'SR', 'Suriname');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(208, 'SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(209, 'SZ', 'Swaziland');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(210, 'SE', 'Sweden');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(211, 'CH', 'Switzerland');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(212, 'SY', 'Syrian Arab Republic');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(213, 'TW', 'Taiwan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(214, 'TJ', 'Tajikistan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(215, 'TZ', 'Tanzania, United Republic of');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(216, 'TH', 'Thailand');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(217, 'TG', 'Togo');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(218, 'TK', 'Tokelau');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(219, 'TO', 'Tonga');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(220, 'TT', 'TrinIDad and Tobago');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(221, 'TN', 'Tunisia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(222, 'TR', 'Turkey');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(223, 'TM', 'Turkmenistan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(224, 'TC', 'Turks and Caicos Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(225, 'TV', 'Tuvalu');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(226, 'UG', 'Uganda');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(227, 'UA', 'Ukraine');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(228, 'AE', 'United Arab Emirates');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(229, 'GB', 'United Kingdom');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(230, 'US', 'United States');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(231, 'UM', 'United States minor outlying islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(232, 'UY', 'Uruguay');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(233, 'UZ', 'Uzbekistan');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(234, 'VU', 'Vanuatu');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(235, 'VA', 'Vatican City State');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(236, 'VE', 'Venezuela');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(237, 'VN', 'Vietnam');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(238, 'VG', 'Virgin Islands (British)');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(239, 'VI', 'Virgin Islands (U.S.)');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(240, 'WF', 'Wallis and Futuna Islands');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(241, 'EH', 'Western Sahara');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(242, 'YE', 'Yemen');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(243, 'YU', 'Yugoslavia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(244, 'ZR', 'Zaire');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(245, 'ZM', 'Zambia');
INSERT INTO `countries` (`ID`, `country_code`, `country_name`) VALUES(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------



--
-- Struktura tabeli dla tabeli `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `locationID` int(11) DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FkLocation_IDx` (`locationID`),
  KEY `fkuserphoto_IDx` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `replies`
--

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

-- --------------------------------------------------------



--
-- Struktura tabeli dla tabeli `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `categoryID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `tag` varchar(2000)  COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Struktura tabeli dla tabeli `location`
--

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
  `tag` varchar(2000)  COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fklocation` FOREIGN KEY (`locationID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkuser` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fklocphoto` FOREIGN KEY (`locationID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkuserphoto` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;


