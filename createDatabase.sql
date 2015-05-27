CREATE DATABASE `projekt_inzynierski` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;

CREATE TABLE `comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) DEFAULT NULL,
  `Comment` varchar(2000) COLLATE utf8_polish_ci DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Data` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `photos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) DEFAULT NULL,
  `Comment` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


CREATE TABLE `tags` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `Haslo` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;



CREATE TABLE `location` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `Opis` varchar(2000) COLLATE utf8_polish_ci DEFAULT NULL,
  `Lon` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `Lat` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `ForumID` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `Adres` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `Category` tinyint(20) DEFAULT NULL,
  `Zoom` tinyint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
