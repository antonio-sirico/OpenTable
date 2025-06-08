-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: localeinterattivo
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anagrafica`
--

DROP TABLE IF EXISTS `anagrafica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anagrafica` (
  `CF` char(16) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `DataNas` date DEFAULT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anagrafica`
--

LOCK TABLES `anagrafica` WRITE;
/*!40000 ALTER TABLE `anagrafica` DISABLE KEYS */;
INSERT INTO `anagrafica` VALUES ('1234567890123456','Mario','Rossi','1990-05-15'),('2345678901234567','Giuseppe','Verdi','1987-09-25'),('7890123456789012','Anna','Bianchi','1985-08-20');
/*!40000 ALTER TABLE `anagrafica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attività`
--

DROP TABLE IF EXISTS `attività`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attività` (
  `Piva` varchar(11) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `IDMenu` varchar(10) NOT NULL,
  PRIMARY KEY (`Piva`),
  KEY `IDMenu` (`IDMenu`),
  CONSTRAINT `attività_ibfk_1` FOREIGN KEY (`IDMenu`) REFERENCES `menu` (`IDMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attività`
--

LOCK TABLES `attività` WRITE;
/*!40000 ALTER TABLE `attività` DISABLE KEYS */;
INSERT INTO `attività` VALUES ('11121314151','Ristorante AGS','2'),('12345678910','Pizzeria AGS','1');
/*!40000 ALTER TABLE `attività` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibita`
--

DROP TABLE IF EXISTS `bibita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bibita` (
  `IDB` char(5) NOT NULL,
  `Nome` varchar(15) NOT NULL,
  `Capacità` int NOT NULL,
  `TassoAlcolemico` float DEFAULT NULL,
  `Costo` double DEFAULT NULL,
  `IDMenu` varchar(10) NOT NULL,
  PRIMARY KEY (`IDB`),
  KEY `IDMenu` (`IDMenu`),
  CONSTRAINT `bibita_ibfk_1` FOREIGN KEY (`IDMenu`) REFERENCES `menu` (`IDMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibita`
--

LOCK TABLES `bibita` WRITE;
/*!40000 ALTER TABLE `bibita` DISABLE KEYS */;
INSERT INTO `bibita` VALUES ('B001','Cocacola',33,0,2.5,'1'),('B002','Fanta',33,0,2,'1'),('B003','Sprite',33,0,2,'1'),('B004','Ferrarelle F',75,0,2.5,'1'),('B005','Peroni',33,4.7,2.8,'1'),('B006','Heineken',66,5,3.2,'1');
/*!40000 ALTER TABLE `bibita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cibo`
--

DROP TABLE IF EXISTS `cibo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cibo` (
  `IDC` char(5) NOT NULL,
  `Nome` varchar(15) NOT NULL,
  `TipoPiatto` varchar(25) NOT NULL,
  `Costo` double DEFAULT NULL,
  `IDMenu` varchar(10) NOT NULL,
  PRIMARY KEY (`IDC`),
  KEY `IDMenu` (`IDMenu`),
  CONSTRAINT `cibo_ibfk_1` FOREIGN KEY (`IDMenu`) REFERENCES `menu` (`IDMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cibo`
--

LOCK TABLES `cibo` WRITE;
/*!40000 ALTER TABLE `cibo` DISABLE KEYS */;
INSERT INTO `cibo` VALUES ('C001','Margherita','Pizza',5,'1'),('C002','Patatine','Frittura',2.5,'1'),('C003','Tris Crocchè','Frittura',5,'1'),('C004','Diavola','Pizza',6.5,'1'),('C005','Americana','Pizza',7,'1'),('C006','Tortino','Dolce',5.5,'1');
/*!40000 ALTER TABLE `cibo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compostoda`
--

DROP TABLE IF EXISTS `compostoda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compostoda` (
  `IDC` char(5) NOT NULL,
  `IDIn` char(8) NOT NULL,
  PRIMARY KEY (`IDC`,`IDIn`),
  KEY `IDIn` (`IDIn`),
  CONSTRAINT `compostoda_ibfk_1` FOREIGN KEY (`IDC`) REFERENCES `cibo` (`IDC`),
  CONSTRAINT `compostoda_ibfk_2` FOREIGN KEY (`IDIn`) REFERENCES `ingrediente` (`IDIn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compostoda`
--

LOCK TABLES `compostoda` WRITE;
/*!40000 ALTER TABLE `compostoda` DISABLE KEYS */;
INSERT INTO `compostoda` VALUES ('C001','I0000001'),('C004','I0000001'),('C005','I0000001'),('C001','I0000002'),('C004','I0000002'),('C005','I0000002'),('C001','I0000003'),('C004','I0000003'),('C005','I0000003'),('C002','I0000004'),('C003','I0000004'),('C005','I0000004'),('C003','I0000005'),('C001','I0000006'),('C003','I0000006'),('C004','I0000007'),('C004','I0000008'),('C005','I0000009'),('C006','I0000010'),('C006','I0000011');
/*!40000 ALTER TABLE `compostoda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprendeb`
--

DROP TABLE IF EXISTS `comprendeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprendeb` (
  `IDB` char(5) NOT NULL,
  `IDORD` varchar(7) NOT NULL,
  PRIMARY KEY (`IDB`,`IDORD`),
  KEY `IDORD` (`IDORD`),
  CONSTRAINT `comprendeb_ibfk_1` FOREIGN KEY (`IDB`) REFERENCES `bibita` (`IDB`),
  CONSTRAINT `comprendeb_ibfk_2` FOREIGN KEY (`IDORD`) REFERENCES `ordinazione` (`IDORD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprendeb`
--

LOCK TABLES `comprendeb` WRITE;
/*!40000 ALTER TABLE `comprendeb` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprendeb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprendec`
--

DROP TABLE IF EXISTS `comprendec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprendec` (
  `IDC` char(5) NOT NULL,
  `IDORD` varchar(7) NOT NULL,
  PRIMARY KEY (`IDC`,`IDORD`),
  KEY `IDORD` (`IDORD`),
  CONSTRAINT `comprendec_ibfk_1` FOREIGN KEY (`IDC`) REFERENCES `cibo` (`IDC`),
  CONSTRAINT `comprendec_ibfk_2` FOREIGN KEY (`IDORD`) REFERENCES `ordinazione` (`IDORD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprendec`
--

LOCK TABLES `comprendec` WRITE;
/*!40000 ALTER TABLE `comprendec` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprendec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendente`
--

DROP TABLE IF EXISTS `dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendente` (
  `CodDip` char(10) NOT NULL,
  `Stipendio` double DEFAULT NULL,
  `Livello` int DEFAULT NULL,
  `CF` char(16) NOT NULL,
  `Piva` varchar(11) NOT NULL,
  PRIMARY KEY (`CodDip`),
  KEY `CF` (`CF`),
  KEY `Piva` (`Piva`),
  CONSTRAINT `dipendente_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `anagrafica` (`CF`),
  CONSTRAINT `dipendente_ibfk_2` FOREIGN KEY (`Piva`) REFERENCES `attività` (`Piva`),
  CONSTRAINT `dipendente_chk_1` CHECK (((`Livello` >= 1) and (`Livello` <= 4))),
  CONSTRAINT `dipendente_chk_2` CHECK (((`Livello` >= 1) and (`Livello` <= 3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente`
--

LOCK TABLES `dipendente` WRITE;
/*!40000 ALTER TABLE `dipendente` DISABLE KEYS */;
INSERT INTO `dipendente` VALUES ('0123456789',4006.9,3,'1234567890123456','12345678910'),('1011121314',2500.2,2,'7890123456789012','12345678910'),('1516171819',1200.5,1,'2345678901234567','12345678910');
/*!40000 ALTER TABLE `dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestisce`
--

DROP TABLE IF EXISTS `gestisce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestisce` (
  `IDMenu` varchar(10) NOT NULL,
  `CodDip` char(10) NOT NULL,
  PRIMARY KEY (`CodDip`,`IDMenu`),
  KEY `IDMenu` (`IDMenu`),
  CONSTRAINT `gestisce_ibfk_1` FOREIGN KEY (`CodDip`) REFERENCES `dipendente` (`CodDip`),
  CONSTRAINT `gestisce_ibfk_2` FOREIGN KEY (`IDMenu`) REFERENCES `menu` (`IDMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestisce`
--

LOCK TABLES `gestisce` WRITE;
/*!40000 ALTER TABLE `gestisce` DISABLE KEYS */;
INSERT INTO `gestisce` VALUES ('1','0123456789'),('1','1011121314');
/*!40000 ALTER TABLE `gestisce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `IDIn` char(8) NOT NULL,
  `Nome` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`IDIn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES ('I0000001','Sugo'),('I0000002','Fior di Latte'),('I0000003','Basilico'),('I0000004','Patata'),('I0000005','Pepe'),('I0000006','Parmigiano'),('I0000007','Salame Piccante'),('I0000008','Olio Piccante'),('I0000009','Wrustel'),('I0000010','Cioccolata fondente'),('I0000011','Cacao amaro');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `IDMenu` varchar(10) NOT NULL,
  PRIMARY KEY (`IDMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('1'),('2');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordinazione`
--

DROP TABLE IF EXISTS `ordinazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordinazione` (
  `IDORD` varchar(7) NOT NULL,
  `Dataora` datetime NOT NULL,
  `Conto` double NOT NULL,
  `IDT` varchar(2) NOT NULL,
  PRIMARY KEY (`IDORD`),
  KEY `IDT` (`IDT`),
  CONSTRAINT `ordinazione_ibfk_1` FOREIGN KEY (`IDT`) REFERENCES `tavolo` (`IDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordinazione`
--

LOCK TABLES `ordinazione` WRITE;
/*!40000 ALTER TABLE `ordinazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordinazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recensione`
--

DROP TABLE IF EXISTS `recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recensione` (
  `IDRec` char(7) NOT NULL,
  `Testo` varchar(1000) DEFAULT NULL,
  `Stelle` int DEFAULT NULL,
  `IDB` char(5) DEFAULT NULL,
  `IDC` char(5) DEFAULT NULL,
  `IDT` varchar(2) NOT NULL,
  PRIMARY KEY (`IDRec`),
  KEY `IDB` (`IDB`),
  KEY `IDC` (`IDC`),
  KEY `IDT` (`IDT`),
  CONSTRAINT `recensione_ibfk_1` FOREIGN KEY (`IDB`) REFERENCES `bibita` (`IDB`),
  CONSTRAINT `recensione_ibfk_2` FOREIGN KEY (`IDC`) REFERENCES `cibo` (`IDC`),
  CONSTRAINT `recensione_ibfk_3` FOREIGN KEY (`IDT`) REFERENCES `tavolo` (`IDT`),
  CONSTRAINT `recensione_chk_1` CHECK (((`Stelle` >= 0) and (`Stelle` <= 5))),
  CONSTRAINT `recensione_chk_2` CHECK ((((`IDC` is null) and (`IDB` is not null)) or ((`IDC` is not null) and (`IDB` is null))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensione`
--

LOCK TABLES `recensione` WRITE;
/*!40000 ALTER TABLE `recensione` DISABLE KEYS */;
/*!40000 ALTER TABLE `recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `IDSede` char(10) NOT NULL,
  `Indirizzo` varchar(50) DEFAULT NULL,
  `Città` varchar(25) DEFAULT NULL,
  `Piva` varchar(11) NOT NULL,
  PRIMARY KEY (`IDSede`),
  KEY `Piva` (`Piva`),
  CONSTRAINT `sede_ibfk_1` FOREIGN KEY (`Piva`) REFERENCES `attività` (`Piva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES ('0123456789','Via Università, 3','Fisciano','12345678910');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tavolo`
--

DROP TABLE IF EXISTS `tavolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tavolo` (
  `IDT` varchar(2) NOT NULL,
  `NumPosti` int NOT NULL,
  `NumOcc` int NOT NULL,
  `IDSede` char(10) NOT NULL,
  `IDMenu` varchar(10) NOT NULL,
  `Piva` varchar(11) NOT NULL,
  PRIMARY KEY (`IDT`),
  KEY `IDMenu` (`IDMenu`),
  KEY `Piva` (`Piva`),
  KEY `IDSede` (`IDSede`),
  CONSTRAINT `tavolo_ibfk_1` FOREIGN KEY (`IDMenu`) REFERENCES `menu` (`IDMenu`),
  CONSTRAINT `tavolo_ibfk_2` FOREIGN KEY (`Piva`) REFERENCES `attività` (`Piva`),
  CONSTRAINT `tavolo_ibfk_3` FOREIGN KEY (`IDSede`) REFERENCES `sede` (`IDSede`),
  CONSTRAINT `tavolo_chk_1` CHECK (((`NumOcc` <= `NumPosti`) and (`NumOcc` >= 0) and (`NumPosti` >= 2)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tavolo`
--

LOCK TABLES `tavolo` WRITE;
/*!40000 ALTER TABLE `tavolo` DISABLE KEYS */;
INSERT INTO `tavolo` VALUES ('01',4,0,'0123456789','1','12345678910'),('02',6,0,'0123456789','1','12345678910'),('03',8,0,'0123456789','1','12345678910'),('04',10,0,'0123456789','1','12345678910'),('05',2,0,'0123456789','1','12345678910');
/*!40000 ALTER TABLE `tavolo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-22 16:52:16
