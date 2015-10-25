-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.44-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- Dumping data for table virtualguide.comment: ~0 rows (approximately)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`ID`, `locationID`, `comment`, `userID`, `date`) VALUES
	(1, 8, 'Sed porttitor, nulla non eros. Aliquam interdum mimauris, interdum dapibus non, leo. Quisque at libero. Pellentesque dapibus in, odio.', 1, '2015-06-04 12:26:20'),
	(2, 8, 'Алексей Федорович Карамазов был важный, так всегда найдет в наших путников. Старец Зосима живет в нем, то, что брат покойной Аделаиды Ивановны.', 1, '2015-06-14 14:43:21'),
	(3, 10, 'Алексей Федорович Карамазов был важный, так всегда найдет в наших путников. Старец Зосима живет в нем, то, что брат покойной Аделаиды Ивановны.', 1, '2015-06-14 12:32:19'),
	(4, 10, 'Sed porttitor, nulla non eros. Aliquam interdum mimauris, interdum dapibus non, leo. Quisque at libero. Pellentesque dapibus in, odio.', 1, '2015-06-04 12:26:20');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping data for table virtualguide.location: ~0 rows (approximately)
DELETE FROM `location`;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`ID`, `name`, `descr`, `lon`, `lat`, `address`, `category`, `zoom`) VALUES
	(5, 'Biskupia górka', 'jakis tam opis', '18.2', '54.5', 'ul.Zaroślak 10, Gdańsk', 3, 2),
	(6, 'Port Lotniczy', 'międzynarodowy port lotniczy położony w gdańskiej dzielnicy Matarnia, pierwotnie nazywany Gdańsk Rębiechowo, położony w dogodnej lokalizacji od centrów miejskich Gdańska (10 km), Sopotu (10 km) i Gdyni (23 km). Port położony jest niedaleko trójmiejskiej obwodnicy oraz przy skrzyżowaniu ważnych dróg krajowych. W promieniu 100 km od niego mieszka ok. 2,5 mln osób. Gdańskie lotnisko stanowi także lotnisko zapasowe dla warszawskiego Lotniska Chopina.', '18.4748840332043', '54.3457511874126', 'ul. Słowackiego 200, Gdańsk', 3, 11),
	(7, 'Gdańsk', 'Gdańsk (łac. Dantiscum, Dantis, Gedanum[4], niem. Danzig) – miasto na prawach powiatu w północnej Polsce, położone nad Morzem Bałtyckim, u ujścia Motławy do Wisły, nad Zatoką Gdańską, na Pobrzeżu Gdańskim. Centrum kulturalne, naukowe i gospodarcze oraz węzeł komunikacyjny północnej Polski, stolica województwa pomorskiego. Ośrodek gospodarki morskiej z dużym portem handlowym', '18.594360351563953', '54.4609161906565', '', 1, 7),
	(8, 'otzgosuk', 'Drogi Marszałku, Wysoka Izbo. PKB rośnie. Różnorakie i koledzy, zmiana przestarzałego systemu szkolenia kadr jest to, iż stałe zabezpieczenie informacyjne naszej działalności umożliwia w określaniu nowych propozycji. Przez ostatnie kilkanaście lat odkryliśmy że zakup nowego sprzętu pomaga w przygotowaniu i znaczenia tych problemów nie zaś teorię, okazuje się iż stałe zabezpieczenie informacyjne naszej działalności organizacyjnej', '11.535644531249938', '45.706179285330805', 'dfsaf 13', 3, 2),
	(9, 'one', 'jakis tam opis', '18.808593750000053', '54.61661705439064', 'ul.Zaroślak 10, Gdańsk', 3, 7),
	(10, 'Castle Color', 'Drogi Marszałku, Wysoka Izbo. PKB rośnie. Różnorakie i koledzy, zmiana przestarzałego systemu szkolenia kadr jest to, iż stałe zabezpieczenie informacyjne naszej działalności umożliwia w określaniu nowych propozycji.', '9.0', '50.0', 'Verona 15', 3, 2),
	(11, 'Montevideo', 'fuego beatu', '19.419434666632906', '54.61789059206546', 'ameykanskopoludniowa 48', 87, 7),
	(12, 'hgh', 'dfh', '50.97656250000034', '11.626412455864271', 'dh', 2, 3);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;

-- Dumping data for table virtualguide.photo: ~0 rows (approximately)
DELETE FROM `photo`;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`ID`, `locationID`, `filename`, `comment`, `userId`) VALUES
	(1, 8, '0eb056a817', NULL, 1),
	(2, 8, '5d18c2cbde', NULL, 1),
	(3, 8, '69f94acf06', NULL, 1),
	(4, 8, '77d5b2a7a7', NULL, 1),
	(5, 8, '6589a8c5ba', NULL, 1),
	(6, 8, '2941397eaa', NULL, 1),
	(7, 10, '77d5b2a7a7', NULL, 1),
	(8, 10, '6589a8c5ba', NULL, 1),
	(9, 10, '2941397eaa', NULL, 1);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

-- Dumping data for table virtualguide.tag: ~0 rows (approximately)
DELETE FROM `tag`;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`ID`, `name`, `locationID`) VALUES
	(1, 'Gdańsk', 8),
	(2, 'otzgo', 8),
	(3, 'castle', 10);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Dumping data for table virtualguide.user: ~0 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'slawek', 'slawpass', '54a2789461cd86ce6ccb2d00c8602ca865b52655d4f51be3466083b3dd28294e', '', 'slaw@mail.pl', 1, 1, 2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
