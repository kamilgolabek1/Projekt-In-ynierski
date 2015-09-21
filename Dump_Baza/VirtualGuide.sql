DROP DATABASE IF EXISTS  `VirtualGuide`;
CREATE DATABASE IF NOT EXISTS  `VirtualGuide` ;
USE `VirtualGuide`;


DROP TABLE IF EXISTS `comment`;

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


DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100)  DEFAULT NULL,
  `descr` varchar(2000)   DEFAULT NULL,
  `lon` varchar(50)   DEFAULT NULL,
  `lat` varchar(50)   DEFAULT NULL,
  `address` varchar(100)   DEFAULT NULL,
  `category` tinyint(20) DEFAULT NULL,
  `zoom` tinyint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `user`;

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



DROP TABLE IF EXISTS `photo`;

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



DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100)  DEFAULT NULL,
  `locationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fklocation_idx` (`locationID`),
  CONSTRAINT `fkLocTag` FOREIGN KEY (`locationID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
);







