-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projekt_inzynierski
-- ------------------------------------------------------
-- Server version	5.5.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'miechucino','opis','52.334','17.8223','1','jeziorna 205a',1,1),(2,'Kartuzy','małe miasto ','54','45','1','fdsfsdfd',1,1),(3,'Gdańsk','Nadmorskie Miasto','54','54','1','dssdfsd',1,1),(5,'Biskupia górka','jakis tam opis','18.2','54.5',NULL,'ul.Zaroślak 10, Gdańsk',3,2),(6,'Port Lotniczy','międzynarodowy port lotniczy położony w gdańskiej dzielnicy Matarnia, pierwotnie nazywany Gdańsk Rębiechowo, położony w dogodnej lokalizacji od centrów miejskich Gdańska (10 km), Sopotu (10 km) i Gdyni (23 km). Port położony jest niedaleko trójmiejskiej obwodnicy oraz przy skrzyżowaniu ważnych dróg krajowych. W promieniu 100 km od niego mieszka ok. 2,5 mln osób. Gdańskie lotnisko stanowi także lotnisko zapasowe dla warszawskiego Lotniska Chopina.','18.4748840332043','54.3457511874126',NULL,'ul. Słowackiego 200, Gdańsk',3,11),(7,'Gdańsk','Gdańsk (łac. Dantiscum, Dantis, Gedanum[4], niem. Danzig) – miasto na prawach powiatu w północnej Polsce, położone nad Morzem Bałtyckim, u ujścia Motławy do Wisły, nad Zatoką Gdańską, na Pobrzeżu Gdańskim. Centrum kulturalne, naukowe i gospodarcze oraz węzeł komunikacyjny północnej Polski, stolica województwa pomorskiego. Ośrodek gospodarki morskiej z dużym portem handlowym','18.594360351563953','54.4609161906565',NULL,'',1,7),(8,'otzgosuk','Drogi Marszałku, Wysoka Izbo. PKB rośnie. Różnorakie i koledzy, zmiana przestarzałego systemu szkolenia kadr jest to, iż stałe zabezpieczenie informacyjne naszej działalności umożliwia w określaniu nowych propozycji. Przez ostatnie kilkanaście lat odkryliśmy że zakup nowego sprzętu pomaga w przygotowaniu i znaczenia tych problemów nie zaś teorię, okazuje się iż stałe zabezpieczenie informacyjne naszej działalności organizacyjnej','11.535644531249938','45.706179285330805',NULL,'dfsaf 13',3,2),(9,'one','jakis tam opis','18.808593750000053','54.61661705439064',NULL,'ul.Zaroślak 10, Gdańsk',3,7),(10,'Castle Color','Drogi Marszałku, Wysoka Izbo. PKB rośnie. Różnorakie i koledzy, zmiana przestarzałego systemu szkolenia kadr jest to, iż stałe zabezpieczenie informacyjne naszej działalności umożliwia w określaniu nowych propozycji.','9.0','50.0',NULL,'Verona 15',3,2);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-05 12:50:41
