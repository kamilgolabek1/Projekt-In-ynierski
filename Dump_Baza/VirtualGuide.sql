DROP DATABASE IF EXISTS  `VirtualGuide`;
CREATE DATABASE IF NOT EXISTS  `VirtualGuide` ;
USE `VirtualGuide`;


DROP TABLE IF EXISTS `photo`;
DROP TABLE IF EXISTS `comment`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `tag`;
DROP TABLE IF EXISTS `location`;



CREATE TABLE `location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100)  DEFAULT NULL,
  `descr` varchar(2000)   DEFAULT NULL,
  `lon` varchar(50)   DEFAULT NULL,
  `lat` varchar(50)   DEFAULT NULL,
  `countryID` int(11)   DEFAULT NULL,
  `address` varchar(100)   DEFAULT NULL,
  `zoom` tinyint(20) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32)  NOT NULL,
  `password_hash` varchar(255)  NOT NULL,
  `password_reset_token` varchar(255)  DEFAULT NULL,
  `email` varchar(255)   NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ;




CREATE TABLE `comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `locationID` int(11) DEFAULT NULL,
  `comment` varchar(2000)  DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `location_idx` (`locationID`),
  KEY `FkUser_idx` (`userID`),
  CONSTRAINT `fklocation` FOREIGN KEY (`locationID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkuser` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ;







CREATE TABLE `photo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `locationID` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `comment` varchar(500)   DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FkLocation_idx` (`LocationID`),
  KEY `fkuserphoto_idx` (`userId`),
  CONSTRAINT `fklocphoto` FOREIGN KEY (`locationID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkuserphoto` FOREIGN KEY (`userId`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
);





CREATE TABLE `tag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100)  DEFAULT NULL,
  `locationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fklocation_idx` (`locationID`),
  CONSTRAINT `fkLocTag` FOREIGN KEY (`locationID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE `countries` (
`id` int(11) NOT NULL auto_increment,
`country_code` varchar(2) NOT NULL default '',
`country_name` varchar(100) NOT NULL default '',
PRIMARY KEY (`id`)
) ;


CREATE TABLE `virtualguide`.`category` 
( `id` INT NOT NULL AUTO_INCREMENT ,
 `name` VARCHAR(100) ,
 PRIMARY KEY (`id`)
 ) ;

 ALTER TABLE `location` ADD CONSTRAINT `fkcountry` FOREIGN KEY (`countryID`)
 REFERENCES `virtualguide`.`countries`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `location` ADD CONSTRAINT `fkcategory` FOREIGN KEY (`categoryID`)
 REFERENCES `virtualguide`.`category`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER DATABASE virtualguide CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE user CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE comment CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE location CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE photo CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE tag CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;


-- insert countries
INSERT INTO `countries` VALUES (null, 'AF', 'Afghanistan');
INSERT INTO `countries` VALUES (null, 'AL', 'Albania');
INSERT INTO `countries` VALUES (null, 'DZ', 'Algeria');
INSERT INTO `countries` VALUES (null, 'DS', 'American Samoa');
INSERT INTO `countries` VALUES (null, 'AD', 'Andorra');
INSERT INTO `countries` VALUES (null, 'AO', 'Angola');
INSERT INTO `countries` VALUES (null, 'AI', 'Anguilla');
INSERT INTO `countries` VALUES (null, 'AQ', 'Antarctica');
INSERT INTO `countries` VALUES (null, 'AG', 'Antigua and/or Barbuda');
INSERT INTO `countries` VALUES (null, 'AR', 'Argentina');
INSERT INTO `countries` VALUES (null, 'AM', 'Armenia');
INSERT INTO `countries` VALUES (null, 'AW', 'Aruba');
INSERT INTO `countries` VALUES (null, 'AU', 'Australia');
INSERT INTO `countries` VALUES (null, 'AT', 'Austria');
INSERT INTO `countries` VALUES (null, 'AZ', 'Azerbaijan');
INSERT INTO `countries` VALUES (null, 'BS', 'Bahamas');
INSERT INTO `countries` VALUES (null, 'BH', 'Bahrain');
INSERT INTO `countries` VALUES (null, 'BD', 'Bangladesh');
INSERT INTO `countries` VALUES (null, 'BB', 'Barbados');
INSERT INTO `countries` VALUES (null, 'BY', 'Belarus');
INSERT INTO `countries` VALUES (null, 'BE', 'Belgium');
INSERT INTO `countries` VALUES (null, 'BZ', 'Belize');
INSERT INTO `countries` VALUES (null, 'BJ', 'Benin');
INSERT INTO `countries` VALUES (null, 'BM', 'Bermuda');
INSERT INTO `countries` VALUES (null, 'BT', 'Bhutan');
INSERT INTO `countries` VALUES (null, 'BO', 'Bolivia');
INSERT INTO `countries` VALUES (null, 'BA', 'Bosnia and Herzegovina');
INSERT INTO `countries` VALUES (null, 'BW', 'Botswana');
INSERT INTO `countries` VALUES (null, 'BV', 'Bouvet Island');
INSERT INTO `countries` VALUES (null, 'BR', 'Brazil');
INSERT INTO `countries` VALUES (null, 'IO', 'British Indian Ocean Territory');
INSERT INTO `countries` VALUES (null, 'BN', 'Brunei Darussalam');
INSERT INTO `countries` VALUES (null, 'BG', 'Bulgaria');
INSERT INTO `countries` VALUES (null, 'BF', 'Burkina Faso');
INSERT INTO `countries` VALUES (null, 'BI', 'Burundi');
INSERT INTO `countries` VALUES (null, 'KH', 'Cambodia');
INSERT INTO `countries` VALUES (null, 'CM', 'Cameroon');
INSERT INTO `countries` VALUES (null, 'CA', 'Canada');
INSERT INTO `countries` VALUES (null, 'CV', 'Cape Verde');
INSERT INTO `countries` VALUES (null, 'KY', 'Cayman Islands');
INSERT INTO `countries` VALUES (null, 'CF', 'Central African Republic');
INSERT INTO `countries` VALUES (null, 'TD', 'Chad');
INSERT INTO `countries` VALUES (null, 'CL', 'Chile');
INSERT INTO `countries` VALUES (null, 'CN', 'China');
INSERT INTO `countries` VALUES (null, 'CX', 'Christmas Island');
INSERT INTO `countries` VALUES (null, 'CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` VALUES (null, 'CO', 'Colombia');
INSERT INTO `countries` VALUES (null, 'KM', 'Comoros');
INSERT INTO `countries` VALUES (null, 'CG', 'Congo');
INSERT INTO `countries` VALUES (null, 'CK', 'Cook Islands');
INSERT INTO `countries` VALUES (null, 'CR', 'Costa Rica');
INSERT INTO `countries` VALUES (null, 'HR', 'Croatia (Hrvatska)');
INSERT INTO `countries` VALUES (null, 'CU', 'Cuba');
INSERT INTO `countries` VALUES (null, 'CY', 'Cyprus');
INSERT INTO `countries` VALUES (null, 'CZ', 'Czech Republic');
INSERT INTO `countries` VALUES (null, 'DK', 'Denmark');
INSERT INTO `countries` VALUES (null, 'DJ', 'Djibouti');
INSERT INTO `countries` VALUES (null, 'DM', 'Dominica');
INSERT INTO `countries` VALUES (null, 'DO', 'Dominican Republic');
INSERT INTO `countries` VALUES (null, 'TP', 'East Timor');
INSERT INTO `countries` VALUES (null, 'EC', 'Ecuador');
INSERT INTO `countries` VALUES (null, 'EG', 'Egypt');
INSERT INTO `countries` VALUES (null, 'SV', 'El Salvador');
INSERT INTO `countries` VALUES (null, 'GQ', 'Equatorial Guinea');
INSERT INTO `countries` VALUES (null, 'ER', 'Eritrea');
INSERT INTO `countries` VALUES (null, 'EE', 'Estonia');
INSERT INTO `countries` VALUES (null, 'ET', 'Ethiopia');
INSERT INTO `countries` VALUES (null, 'FK', 'Falkland Islands (Malvinas)');
INSERT INTO `countries` VALUES (null, 'FO', 'Faroe Islands');
INSERT INTO `countries` VALUES (null, 'FJ', 'Fiji');
INSERT INTO `countries` VALUES (null, 'FI', 'Finland');
INSERT INTO `countries` VALUES (null, 'FR', 'France');
INSERT INTO `countries` VALUES (null, 'FX', 'France, Metropolitan');
INSERT INTO `countries` VALUES (null, 'GF', 'French Guiana');
INSERT INTO `countries` VALUES (null, 'PF', 'French Polynesia');
INSERT INTO `countries` VALUES (null, 'TF', 'French Southern Territories');
INSERT INTO `countries` VALUES (null, 'GA', 'Gabon');
INSERT INTO `countries` VALUES (null, 'GM', 'Gambia');
INSERT INTO `countries` VALUES (null, 'GE', 'Georgia');
INSERT INTO `countries` VALUES (null, 'DE', 'Germany');
INSERT INTO `countries` VALUES (null, 'GH', 'Ghana');
INSERT INTO `countries` VALUES (null, 'GI', 'Gibraltar');
INSERT INTO `countries` VALUES (null, 'GK', 'Guernsey');
INSERT INTO `countries` VALUES (null, 'GR', 'Greece');
INSERT INTO `countries` VALUES (null, 'GL', 'Greenland');
INSERT INTO `countries` VALUES (null, 'GD', 'Grenada');
INSERT INTO `countries` VALUES (null, 'GP', 'Guadeloupe');
INSERT INTO `countries` VALUES (null, 'GU', 'Guam');
INSERT INTO `countries` VALUES (null, 'GT', 'Guatemala');
INSERT INTO `countries` VALUES (null, 'GN', 'Guinea');
INSERT INTO `countries` VALUES (null, 'GW', 'Guinea-Bissau');
INSERT INTO `countries` VALUES (null, 'GY', 'Guyana');
INSERT INTO `countries` VALUES (null, 'HT', 'Haiti');
INSERT INTO `countries` VALUES (null, 'HM', 'Heard and Mc Donald Islands');
INSERT INTO `countries` VALUES (null, 'HN', 'Honduras');
INSERT INTO `countries` VALUES (null, 'HK', 'Hong Kong');
INSERT INTO `countries` VALUES (null, 'HU', 'Hungary');
INSERT INTO `countries` VALUES (null, 'IS', 'Iceland');
INSERT INTO `countries` VALUES (null, 'IN', 'India');
INSERT INTO `countries` VALUES (null, 'IM', 'Isle of Man');
INSERT INTO `countries` VALUES (null, 'ID', 'Indonesia');
INSERT INTO `countries` VALUES (null, 'IR', 'Iran (Islamic Republic of)');
INSERT INTO `countries` VALUES (null, 'IQ', 'Iraq');
INSERT INTO `countries` VALUES (null, 'IE', 'Ireland');
INSERT INTO `countries` VALUES (null, 'IL', 'Israel');
INSERT INTO `countries` VALUES (null, 'IT', 'Italy');
INSERT INTO `countries` VALUES (null, 'CI', 'Ivory Coast');
INSERT INTO `countries` VALUES (null, 'JE', 'Jersey');
INSERT INTO `countries` VALUES (null, 'JM', 'Jamaica');
INSERT INTO `countries` VALUES (null, 'JP', 'Japan');
INSERT INTO `countries` VALUES (null, 'JO', 'Jordan');
INSERT INTO `countries` VALUES (null, 'KZ', 'Kazakhstan');
INSERT INTO `countries` VALUES (null, 'KE', 'Kenya');
INSERT INTO `countries` VALUES (null, 'KI', 'Kiribati');
INSERT INTO `countries` VALUES (null, 'KP', 'Korea, Democratic People''s Republic of');
INSERT INTO `countries` VALUES (null, 'KR', 'Korea, Republic of');
INSERT INTO `countries` VALUES (null, 'XK', 'Kosovo');
INSERT INTO `countries` VALUES (null, 'KW', 'Kuwait');
INSERT INTO `countries` VALUES (null, 'KG', 'Kyrgyzstan');
INSERT INTO `countries` VALUES (null, 'LA', 'Lao People''s Democratic Republic');
INSERT INTO `countries` VALUES (null, 'LV', 'Latvia');
INSERT INTO `countries` VALUES (null, 'LB', 'Lebanon');
INSERT INTO `countries` VALUES (null, 'LS', 'Lesotho');
INSERT INTO `countries` VALUES (null, 'LR', 'Liberia');
INSERT INTO `countries` VALUES (null, 'LY', 'Libyan Arab Jamahiriya');
INSERT INTO `countries` VALUES (null, 'LI', 'Liechtenstein');
INSERT INTO `countries` VALUES (null, 'LT', 'Lithuania');
INSERT INTO `countries` VALUES (null, 'LU', 'Luxembourg');
INSERT INTO `countries` VALUES (null, 'MO', 'Macau');
INSERT INTO `countries` VALUES (null, 'MK', 'Macedonia');
INSERT INTO `countries` VALUES (null, 'MG', 'Madagascar');
INSERT INTO `countries` VALUES (null, 'MW', 'Malawi');
INSERT INTO `countries` VALUES (null, 'MY', 'Malaysia');
INSERT INTO `countries` VALUES (null, 'MV', 'Maldives');
INSERT INTO `countries` VALUES (null, 'ML', 'Mali');
INSERT INTO `countries` VALUES (null, 'MT', 'Malta');
INSERT INTO `countries` VALUES (null, 'MH', 'Marshall Islands');
INSERT INTO `countries` VALUES (null, 'MQ', 'Martinique');
INSERT INTO `countries` VALUES (null, 'MR', 'Mauritania');
INSERT INTO `countries` VALUES (null, 'MU', 'Mauritius');
INSERT INTO `countries` VALUES (null, 'TY', 'Mayotte');
INSERT INTO `countries` VALUES (null, 'MX', 'Mexico');
INSERT INTO `countries` VALUES (null, 'FM', 'Micronesia, Federated States of');
INSERT INTO `countries` VALUES (null, 'MD', 'Moldova, Republic of');
INSERT INTO `countries` VALUES (null, 'MC', 'Monaco');
INSERT INTO `countries` VALUES (null, 'MN', 'Mongolia');
INSERT INTO `countries` VALUES (null, 'ME', 'Montenegro');
INSERT INTO `countries` VALUES (null, 'MS', 'Montserrat');
INSERT INTO `countries` VALUES (null, 'MA', 'Morocco');
INSERT INTO `countries` VALUES (null, 'MZ', 'Mozambique');
INSERT INTO `countries` VALUES (null, 'MM', 'Myanmar');
INSERT INTO `countries` VALUES (null, 'NA', 'Namibia');
INSERT INTO `countries` VALUES (null, 'NR', 'Nauru');
INSERT INTO `countries` VALUES (null, 'NP', 'Nepal');
INSERT INTO `countries` VALUES (null, 'NL', 'Netherlands');
INSERT INTO `countries` VALUES (null, 'AN', 'Netherlands Antilles');
INSERT INTO `countries` VALUES (null, 'NC', 'New Caledonia');
INSERT INTO `countries` VALUES (null, 'NZ', 'New Zealand');
INSERT INTO `countries` VALUES (null, 'NI', 'Nicaragua');
INSERT INTO `countries` VALUES (null, 'NE', 'Niger');
INSERT INTO `countries` VALUES (null, 'NG', 'Nigeria');
INSERT INTO `countries` VALUES (null, 'NU', 'Niue');
INSERT INTO `countries` VALUES (null, 'NF', 'Norfolk Island');
INSERT INTO `countries` VALUES (null, 'MP', 'Northern Mariana Islands');
INSERT INTO `countries` VALUES (null, 'NO', 'Norway');
INSERT INTO `countries` VALUES (null, 'OM', 'Oman');
INSERT INTO `countries` VALUES (null, 'PK', 'Pakistan');
INSERT INTO `countries` VALUES (null, 'PW', 'Palau');
INSERT INTO `countries` VALUES (null, 'PS', 'Palestine');
INSERT INTO `countries` VALUES (null, 'PA', 'Panama');
INSERT INTO `countries` VALUES (null, 'PG', 'Papua New Guinea');
INSERT INTO `countries` VALUES (null, 'PY', 'Paraguay');
INSERT INTO `countries` VALUES (null, 'PE', 'Peru');
INSERT INTO `countries` VALUES (null, 'PH', 'Philippines');
INSERT INTO `countries` VALUES (null, 'PN', 'Pitcairn');
INSERT INTO `countries` VALUES (null, 'PL', 'Poland');
INSERT INTO `countries` VALUES (null, 'PT', 'Portugal');
INSERT INTO `countries` VALUES (null, 'PR', 'Puerto Rico');
INSERT INTO `countries` VALUES (null, 'QA', 'Qatar');
INSERT INTO `countries` VALUES (null, 'RE', 'Reunion');
INSERT INTO `countries` VALUES (null, 'RO', 'Romania');
INSERT INTO `countries` VALUES (null, 'RU', 'Russian Federation');
INSERT INTO `countries` VALUES (null, 'RW', 'Rwanda');
INSERT INTO `countries` VALUES (null, 'KN', 'Saint Kitts and Nevis');
INSERT INTO `countries` VALUES (null, 'LC', 'Saint Lucia');
INSERT INTO `countries` VALUES (null, 'VC', 'Saint Vincent and the Grenadines');
INSERT INTO `countries` VALUES (null, 'WS', 'Samoa');
INSERT INTO `countries` VALUES (null, 'SM', 'San Marino');
INSERT INTO `countries` VALUES (null, 'ST', 'Sao Tome and Principe');
INSERT INTO `countries` VALUES (null, 'SA', 'Saudi Arabia');
INSERT INTO `countries` VALUES (null, 'SN', 'Senegal');
INSERT INTO `countries` VALUES (null, 'RS', 'Serbia');
INSERT INTO `countries` VALUES (null, 'SC', 'Seychelles');
INSERT INTO `countries` VALUES (null, 'SL', 'Sierra Leone');
INSERT INTO `countries` VALUES (null, 'SG', 'Singapore');
INSERT INTO `countries` VALUES (null, 'SK', 'Slovakia');
INSERT INTO `countries` VALUES (null, 'SI', 'Slovenia');
INSERT INTO `countries` VALUES (null, 'SB', 'Solomon Islands');
INSERT INTO `countries` VALUES (null, 'SO', 'Somalia');
INSERT INTO `countries` VALUES (null, 'ZA', 'South Africa');
INSERT INTO `countries` VALUES (null, 'GS', 'South Georgia South Sandwich Islands');
INSERT INTO `countries` VALUES (null, 'ES', 'Spain');
INSERT INTO `countries` VALUES (null, 'LK', 'Sri Lanka');
INSERT INTO `countries` VALUES (null, 'SH', 'St. Helena');
INSERT INTO `countries` VALUES (null, 'PM', 'St. Pierre and Miquelon');
INSERT INTO `countries` VALUES (null, 'SD', 'Sudan');
INSERT INTO `countries` VALUES (null, 'SR', 'Suriname');
INSERT INTO `countries` VALUES (null, 'SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `countries` VALUES (null, 'SZ', 'Swaziland');
INSERT INTO `countries` VALUES (null, 'SE', 'Sweden');
INSERT INTO `countries` VALUES (null, 'CH', 'Switzerland');
INSERT INTO `countries` VALUES (null, 'SY', 'Syrian Arab Republic');
INSERT INTO `countries` VALUES (null, 'TW', 'Taiwan');
INSERT INTO `countries` VALUES (null, 'TJ', 'Tajikistan');
INSERT INTO `countries` VALUES (null, 'TZ', 'Tanzania, United Republic of');
INSERT INTO `countries` VALUES (null, 'TH', 'Thailand');
INSERT INTO `countries` VALUES (null, 'TG', 'Togo');
INSERT INTO `countries` VALUES (null, 'TK', 'Tokelau');
INSERT INTO `countries` VALUES (null, 'TO', 'Tonga');
INSERT INTO `countries` VALUES (null, 'TT', 'Trinidad and Tobago');
INSERT INTO `countries` VALUES (null, 'TN', 'Tunisia');
INSERT INTO `countries` VALUES (null, 'TR', 'Turkey');
INSERT INTO `countries` VALUES (null, 'TM', 'Turkmenistan');
INSERT INTO `countries` VALUES (null, 'TC', 'Turks and Caicos Islands');
INSERT INTO `countries` VALUES (null, 'TV', 'Tuvalu');
INSERT INTO `countries` VALUES (null, 'UG', 'Uganda');
INSERT INTO `countries` VALUES (null, 'UA', 'Ukraine');
INSERT INTO `countries` VALUES (null, 'AE', 'United Arab Emirates');
INSERT INTO `countries` VALUES (null, 'GB', 'United Kingdom');
INSERT INTO `countries` VALUES (null, 'US', 'United States');
INSERT INTO `countries` VALUES (null, 'UM', 'United States minor outlying islands');
INSERT INTO `countries` VALUES (null, 'UY', 'Uruguay');
INSERT INTO `countries` VALUES (null, 'UZ', 'Uzbekistan');
INSERT INTO `countries` VALUES (null, 'VU', 'Vanuatu');
INSERT INTO `countries` VALUES (null, 'VA', 'Vatican City State');
INSERT INTO `countries` VALUES (null, 'VE', 'Venezuela');
INSERT INTO `countries` VALUES (null, 'VN', 'Vietnam');
INSERT INTO `countries` VALUES (null, 'VG', 'Virgin Islands (British)');
INSERT INTO `countries` VALUES (null, 'VI', 'Virgin Islands (U.S.)');
INSERT INTO `countries` VALUES (null, 'WF', 'Wallis and Futuna Islands');
INSERT INTO `countries` VALUES (null, 'EH', 'Western Sahara');
INSERT INTO `countries` VALUES (null, 'YE', 'Yemen');
INSERT INTO `countries` VALUES (null, 'YU', 'Yugoslavia');
INSERT INTO `countries` VALUES (null, 'ZR', 'Zaire');
INSERT INTO `countries` VALUES (null, 'ZM', 'Zambia');
INSERT INTO `countries` VALUES (null, 'ZW', 'Zimbabwe');