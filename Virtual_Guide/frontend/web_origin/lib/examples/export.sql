-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.41-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for sipdb
CREATE DATABASE IF NOT EXISTS `sipdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sipdb`;


-- Dumping structure for table sipdb.stations
CREATE TABLE IF NOT EXISTS `stations` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `lon` varchar(30) NOT NULL,
  `lat` varchar(30) NOT NULL,
  `title` varchar(80) NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Dumping data for table sipdb.stations: ~18 rows (approximately)
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` (`ID`, `lon`, `lat`, `title`, `street`, `city`) VALUES
	(1, '54.32312', '18.60212', 'Orlen', 'ul. Świętokrzyska 2', 'Gdańsk'),
	(2, '54.37715', '18.52172', 'BP', 'ul. Słowackiego 80', 'Gdańsk'),
	(3, '54.35812', '18.58332', 'BP', 'ul. Rakoczego 15', 'Gdańsk'),
	(4, '54.39468', '18.58011', 'BP', 'al. Grunwaldzka', 'Gdańsk'),
	(5, '54.39398', '18.58689', 'BP', 'al. Grunwaldzka 229/237', 'Gdańsk'),
	(6, '54.33805', '18.61407', 'BP', 'ul. Witosa', 'Gdańsk'),
	(7, '54.43233', '18.4889', 'Lotos', 'ul. Spacerowa 50', 'Gdańsk'),
	(8, '54.34934', '18.68168', 'Lotos', 'ul. Elbląska 87', 'Gdańsk'),
	(9, '54.33782', '18.6296', 'Lotos', 'ul. Cienista 14 c', 'Gdańsk'),
	(10, '54.37123', '18.62785', 'Lotos', 'al. Zwycięstwa 13', 'Gdańsk'),
	(11, '54.32889', '18.61754', 'Lotos', 'ul. Małomiejska 31', 'Gdańsk'),
	(12, '54.31448', '18.62952', 'Shell', 'ul. Trakt św. Wojciecha 223', 'Gdańsk'),
	(13, '54.40076', '18.59151', 'Shell', 'al. Rzeczypospolitej 8', 'Gdańsk'),
	(14, '54.34701', '18.60374', 'Shell', 'ul. Łostowicka 4', 'Gdańsk'),
	(15, '54.35202', '18.64663', 'Shell', 'ul. Pałubickiego 12', 'Gdańsk'),
	(16, '54.32677', '18.61032', 'Shell', 'ul. Świętokrzyska 1', 'Gdańsk'),
	(17, '54.37391', '18.52192', 'Shell', 'ul. Złota Karczma', 'Gdańsk'),
	(18, '54.37853', '18.63367', 'Statoil', 'ul. Marynarki Polskiej 93', 'Gdańsk'),
	(31, '54.34701', '18.60374', 'Abi Sp. z o.o.', 'ul. Łostowicka 4', 'Gdańsk'),
	(32, '54.31002', '18.63466', 'Aib Andrzej Buśko', 'ul. Trakt św. Wojciecha 43', 'Gdańsk'),
	(33, '54.34883', '18.66036', 'Bednar Sp. z o.o.', 'ul. Szafarnia 11 lok. F8', 'Gdańsk'),
	(34, '54.33505', '18.65121', '&quot;Moto&quot; Przedsiębiorstwo Handlowe Stacja Paliw Józef Kułaga', 'ul. Olszyńska 3', 'Gdańsk'),
	(35, '54.38296', '18.64483', '&quot;Moto&quot; Przedsiębiorstwo Handlowe Stacja Paliw Józef Kułaga', 'ul. Marynarki Polskiej 73', 'Gdańsk'),
	(36, '54.39361', '18.58075', 'Orlen', 'al. Grunwaldzka 258', 'Gdańsk'),
	(37, '54.33409', '18.63585', 'Orlen', 'ul. Trakt św. Wojciecha 43 /45', 'Gdańsk'),
	(38, '54.39665', '18.57915', 'Orlen', 'al. Grunwaldzka 341', 'Gdańsk'),
	(39, '54.35905', '18.64037', 'Orlen', 'ul. Dąbrowskiego 4', 'Gdańsk'),
	(40, '54.40268', '18.66379', 'Orlen', 'ul. Oliwska 37', 'Gdańsk'),
	(41, '54.34835', '18.68232', 'Orlen', 'ul. Miałki Szlak 14', 'Gdańsk'),
	(42, '54.38153', '18.47584', 'Orlen', 'ul. Słowackiego 198', 'Gdańsk');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
