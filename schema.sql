-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: tpbases
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alojamiento`
--

DROP TABLE IF EXISTS `alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alojamiento` (
  `idParque` int(10) unsigned NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `capacidad` int(10) unsigned DEFAULT NULL,
  `codigoCategoria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idParque`,`codigo`),
  KEY `FK_Alojamiento_Categoria` (`codigoCategoria`),
  CONSTRAINT `FK_Alojamiento_Categoria` FOREIGN KEY (`codigoCategoria`) REFERENCES `categoria` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamiento`
--

LOCK TABLES `alojamiento` WRITE;
/*!40000 ALTER TABLE `alojamiento` DISABLE KEYS */;
INSERT INTO `alojamiento` VALUES (1,'POSA','La posada de Posadas',35,'POSADA'),(2,'ALE','Lo de Ale',54,'HOTEL');
/*!40000 ALTER TABLE `alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animal` (
  `denominacionCientifica` varchar(200) NOT NULL,
  `periodoDeCelo` varchar(200) DEFAULT NULL,
  `tipoAnimal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`denominacionCientifica`),
  CONSTRAINT `FK_Animal_ElementoNatural` FOREIGN KEY (`denominacionCientifica`) REFERENCES `elementonatural` (`denominacionCientifica`),
  CONSTRAINT `chk_tipoAnimal` CHECK (((`tipoAnimal` = _utf8mb4'Carnivoro') or (`tipoAnimal` = _utf8mb4'Omnivoro') or (`tipoAnimal` = _utf8mb4'Herviboro')))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES ('Nasua nasua','anual','Carnivoro'),('Ramphastos toco','periodico','Herviboro');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area` (
  `idParque` int(10) unsigned NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `extension` decimal(12,2) DEFAULT NULL,
  `idProvincia` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idParque`,`codigo`),
  KEY `FK_Area_Provincia` (`idProvincia`),
  CONSTRAINT `FK_Area_Parque` FOREIGN KEY (`idParque`) REFERENCES `parquenatural` (`idParque`),
  CONSTRAINT `FK_Area_Provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'UNI','Area 1',123.00,1),(2,'NEU','Area Neuquen',25.00,4),(3,'RN','Area Rio Negro',80.00,5),(3,'UNI','Area 1',177.00,2);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `codigo` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('HOTEL'),('POSADA');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conservador`
--

DROP TABLE IF EXISTS `conservador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conservador` (
  `DNI` varchar(10) NOT NULL,
  `especializacion` varchar(100) DEFAULT NULL,
  `idParque` int(10) unsigned DEFAULT NULL,
  `codigoAreaMantiene` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `FK_Conservador_Area` (`idParque`,`codigoAreaMantiene`),
  CONSTRAINT `FK_Conservador_Area` FOREIGN KEY (`idParque`, `codigoAreaMantiene`) REFERENCES `area` (`idParque`, `codigo`),
  CONSTRAINT `FK_Conservador_Empleado` FOREIGN KEY (`DNI`) REFERENCES `empleado` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conservador`
--

LOCK TABLES `conservador` WRITE;
/*!40000 ALTER TABLE `conservador` DISABLE KEYS */;
INSERT INTO `conservador` VALUES ('6930291','Fauna',1,'UNI');
/*!40000 ALTER TABLE `conservador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementonatural`
--

DROP TABLE IF EXISTS `elementonatural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `elementonatural` (
  `denominacionCientifica` varchar(200) NOT NULL,
  `denominacionVulgar` varchar(200) DEFAULT NULL,
  `tipoElementoNatural` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementonatural`
--

LOCK TABLES `elementonatural` WRITE;
/*!40000 ALTER TABLE `elementonatural` DISABLE KEYS */;
INSERT INTO `elementonatural` VALUES ('Anadenanthera colubrina','Curupay','Vegetal'),('Nasua nasua','Coati','Animal'),('Nectandra lanceolata','Laurel Blanco','Vegetal'),('Ramphastos toco','Tucan Toco','Animal');
/*!40000 ALTER TABLE `elementonatural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empleado` (
  `DNI` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `CUIL` varchar(20) NOT NULL,
  `telefonoMovil` varchar(50) DEFAULT NULL,
  `sueldo` decimal(12,2) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `tipoEmpleado` varchar(30) DEFAULT NULL,
  `idParque` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('13455334','Mateo Vila','20-13455334-1','12345678',20000.00,'Calle Falsa 123','Vigilante',2),('18394827','Darío Medina','20-18394827-1','12345678',90000.00,'Calle Falsa 123','Vigilante',1),('30928345','Sergio Fuentes','20-30928345-1','12345678',45000.00,'Calle Falsa 123','Gestor',2),('36754331','Javier Parra','20-36754331-1','12345678',25000.00,'Calle Falsa 123','Investigador',1),('6930291','Leo Sanz Soto','20-6930291-1','12345678',33000.00,'Calle Falsa 123','Conservador',1),('9183743','David Hernandez','20-9183743-1','12345678',44000.00,'Calle Falsa 123','Gestor',1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entrada` (
  `numero` int(10) unsigned NOT NULL,
  `idParque` int(10) NOT NULL,
  PRIMARY KEY (`numero`,`idParque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excursion`
--

DROP TABLE IF EXISTS `excursion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `excursion` (
  `idExcursion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enVehiculo` tinyint(4) DEFAULT NULL,
  `hora` varchar(20) DEFAULT NULL,
  `dias` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idExcursion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursion`
--

LOCK TABLES `excursion` WRITE;
/*!40000 ALTER TABLE `excursion` DISABLE KEYS */;
INSERT INTO `excursion` VALUES (1,0,'08:00','LUN,JUE','Salto dentro de un barril por la garganta del diablo'),(2,1,'06:00','SAB','Paseo en 4x4');
/*!40000 ALTER TABLE `excursion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestor`
--

DROP TABLE IF EXISTS `gestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gestor` (
  `DNI` varchar(10) NOT NULL,
  `numeroEntrada` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `FK_Gestor_Entrada` (`numeroEntrada`),
  CONSTRAINT `FK_Gestor_Empleado` FOREIGN KEY (`DNI`) REFERENCES `empleado` (`DNI`),
  CONSTRAINT `FK_Gestor_Entrada` FOREIGN KEY (`numeroEntrada`) REFERENCES `entrada` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor`
--

LOCK TABLES `gestor` WRITE;
/*!40000 ALTER TABLE `gestor` DISABLE KEYS */;
INSERT INTO `gestor` VALUES ('30928345',1);
/*!40000 ALTER TABLE `gestor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigador`
--

DROP TABLE IF EXISTS `investigador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `investigador` (
  `DNI` varchar(10) NOT NULL,
  `titulacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `FK_Investigador_Empleado` FOREIGN KEY (`DNI`) REFERENCES `empleado` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigador`
--

LOCK TABLES `investigador` WRITE;
/*!40000 ALTER TABLE `investigador` DISABLE KEYS */;
INSERT INTO `investigador` VALUES ('36754331','Biologo');
/*!40000 ALTER TABLE `investigador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mineral`
--

DROP TABLE IF EXISTS `mineral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mineral` (
  `denominacionCientifica` varchar(200) NOT NULL,
  `tipoMineral` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`denominacionCientifica`),
  CONSTRAINT `FK_Mineral_ElementoNatural` FOREIGN KEY (`denominacionCientifica`) REFERENCES `elementonatural` (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mineral`
--

LOCK TABLES `mineral` WRITE;
/*!40000 ALTER TABLE `mineral` DISABLE KEYS */;
/*!40000 ALTER TABLE `mineral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismoregulador`
--

DROP TABLE IF EXISTS `organismoregulador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organismoregulador` (
  `razonSocial` varchar(100) NOT NULL,
  PRIMARY KEY (`razonSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismoregulador`
--

LOCK TABLES `organismoregulador` WRITE;
/*!40000 ALTER TABLE `organismoregulador` DISABLE KEYS */;
INSERT INTO `organismoregulador` VALUES ('Parques de La Rioja S.A.'),('Parques de Misiones S.A.'),('Parques de Neuquen S.A.'),('Parques de Rio Negro S.A.'),('Parques de Salta S.A.');
/*!40000 ALTER TABLE `organismoregulador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizadopor`
--

DROP TABLE IF EXISTS `organizadopor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organizadopor` (
  `idExcursion` int(10) unsigned NOT NULL,
  `idParque` int(10) unsigned NOT NULL,
  `codigoAlojamiento` varchar(30) NOT NULL,
  PRIMARY KEY (`idExcursion`,`idParque`,`codigoAlojamiento`),
  KEY `FK_Organizado_Alojamiento` (`idParque`,`codigoAlojamiento`),
  CONSTRAINT `FK_Organizado_Alojamiento` FOREIGN KEY (`idParque`, `codigoAlojamiento`) REFERENCES `alojamiento` (`idParque`, `codigo`),
  CONSTRAINT `FK_Organizado_Excursion` FOREIGN KEY (`idExcursion`) REFERENCES `excursion` (`idExcursion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizadopor`
--

LOCK TABLES `organizadopor` WRITE;
/*!40000 ALTER TABLE `organizadopor` DISABLE KEYS */;
INSERT INTO `organizadopor` VALUES (1,1,'POSA'),(2,2,'ALE');
/*!40000 ALTER TABLE `organizadopor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parquenatural`
--

DROP TABLE IF EXISTS `parquenatural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parquenatural` (
  `idParque` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `declaradoEn` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idParque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parquenatural`
--

LOCK TABLES `parquenatural` WRITE;
/*!40000 ALTER TABLE `parquenatural` DISABLE KEYS */;
INSERT INTO `parquenatural` VALUES (1,'Parque Nacional Iguazú','2001-05-01','iguazu@parques.com.ar'),(2,'Parque Nacional Baritú','1998-01-01','Baritu@parques.com.ar'),(3,'Parque Nacional Nahuel Huapi','1994-02-01','nahuelhuapi@parques.com.ar');
/*!40000 ALTER TABLE `parquenatural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participade`
--

DROP TABLE IF EXISTS `participade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `participade` (
  `DNIInvestigador` varchar(10) NOT NULL,
  `nombreProyecto` varchar(100) NOT NULL,
  PRIMARY KEY (`DNIInvestigador`,`nombreProyecto`),
  KEY `fk_Participa_Proyecto` (`nombreProyecto`),
  CONSTRAINT `fk_Participa_Investigador` FOREIGN KEY (`DNIInvestigador`) REFERENCES `investigador` (`DNI`),
  CONSTRAINT `fk_Participa_Proyecto` FOREIGN KEY (`nombreProyecto`) REFERENCES `proyectodeinvestigacion` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participade`
--

LOCK TABLES `participade` WRITE;
/*!40000 ALTER TABLE `participade` DISABLE KEYS */;
INSERT INTO `participade` VALUES ('36754331','Reproduccion del Tucan');
/*!40000 ALTER TABLE `participade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participadeexcursion`
--

DROP TABLE IF EXISTS `participadeexcursion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `participadeexcursion` (
  `DNIVisitante` varchar(10) NOT NULL,
  `idExcursion` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`DNIVisitante`,`idExcursion`,`fecha`),
  KEY `FK_ParticipaDeExcursion_Excursion` (`idExcursion`),
  CONSTRAINT `FK_ParticipaDeExcursion_Excursion` FOREIGN KEY (`idExcursion`) REFERENCES `excursion` (`idExcursion`),
  CONSTRAINT `FK_ParticipaDeExcursion_Visitante` FOREIGN KEY (`DNIVisitante`) REFERENCES `visitante` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participadeexcursion`
--

LOCK TABLES `participadeexcursion` WRITE;
/*!40000 ALTER TABLE `participadeexcursion` DISABLE KEYS */;
INSERT INTO `participadeexcursion` VALUES ('28910299',1,'2019-05-02'),('38918273',2,'2019-02-05');
/*!40000 ALTER TABLE `participadeexcursion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `provincia` (
  `idProvincia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `razonOrganismoRegulador` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProvincia`),
  KEY `FK_Provincia_Organismo` (`razonOrganismoRegulador`),
  CONSTRAINT `FK_Provincia_Organismo` FOREIGN KEY (`razonOrganismoRegulador`) REFERENCES `organismoregulador` (`razonSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Salta','Parques de Salta S.A.'),(2,'Misiones','Parques de Misiones S.A.'),(3,'La Rioja','Parques de La Rioja S.A.'),(4,'Neuquen ','Parques de Neuquen S.A.'),(5,'Rio Negro','Parques de Rio Negro S.A.');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectodeinvestigacion`
--

DROP TABLE IF EXISTS `proyectodeinvestigacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proyectodeinvestigacion` (
  `nombre` varchar(100) NOT NULL,
  `periodo` varchar(100) DEFAULT NULL,
  `presupuesto` decimal(12,2) DEFAULT NULL,
  `sobre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  KEY `FK_Proyecto_Elemento` (`sobre`),
  CONSTRAINT `FK_Proyecto_Elemento` FOREIGN KEY (`sobre`) REFERENCES `elementonatural` (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectodeinvestigacion`
--

LOCK TABLES `proyectodeinvestigacion` WRITE;
/*!40000 ALTER TABLE `proyectodeinvestigacion` DISABLE KEYS */;
INSERT INTO `proyectodeinvestigacion` VALUES ('Reproduccion del Tucan','2019-2020',570000.00,'Ramphastos toco');
/*!40000 ALTER TABLE `proyectodeinvestigacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reside`
--

DROP TABLE IF EXISTS `reside`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reside` (
  `idParque` int(10) unsigned NOT NULL,
  `codigoArea` varchar(20) NOT NULL,
  `denominacionCientifica` varchar(100) NOT NULL,
  `inventario` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idParque`,`codigoArea`,`denominacionCientifica`),
  KEY `FK_Reside_ElementoNatural` (`denominacionCientifica`),
  CONSTRAINT `FK_Reside_Area` FOREIGN KEY (`idParque`, `codigoArea`) REFERENCES `area` (`idParque`, `codigo`),
  CONSTRAINT `FK_Reside_ElementoNatural` FOREIGN KEY (`denominacionCientifica`) REFERENCES `elementonatural` (`denominacionCientifica`),
  CONSTRAINT `FK_Reside_Parque` FOREIGN KEY (`idParque`) REFERENCES `parquenatural` (`idParque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reside`
--

LOCK TABLES `reside` WRITE;
/*!40000 ALTER TABLE `reside` DISABLE KEYS */;
INSERT INTO `reside` VALUES (1,'UNI','Anadenanthera colubrina',765),(1,'UNI','Nasua nasua',122),(1,'UNI','Nectandra lanceolata',97),(1,'UNI','Ramphastos toco',8);
/*!40000 ALTER TABLE `reside` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sealojaen`
--

DROP TABLE IF EXISTS `sealojaen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sealojaen` (
  `DNIVisitante` varchar(10) NOT NULL,
  `idParque` int(10) unsigned NOT NULL,
  `codigoAlojamiento` varchar(30) NOT NULL,
  `fechaDesde` date NOT NULL,
  `fechaHasta` date DEFAULT NULL,
  PRIMARY KEY (`DNIVisitante`,`idParque`,`codigoAlojamiento`,`fechaDesde`),
  KEY `FK_SeAlojaEn_Alojamiento` (`idParque`,`codigoAlojamiento`),
  CONSTRAINT `FK_SeAlojaEn_Alojamiento` FOREIGN KEY (`idParque`, `codigoAlojamiento`) REFERENCES `alojamiento` (`idParque`, `codigo`),
  CONSTRAINT `FK_SeAlojaEn_Visitante` FOREIGN KEY (`DNIVisitante`) REFERENCES `visitante` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sealojaen`
--

LOCK TABLES `sealojaen` WRITE;
/*!40000 ALTER TABLE `sealojaen` DISABLE KEYS */;
INSERT INTO `sealojaen` VALUES ('28910299',1,'POSA','2019-04-25','2019-05-02'),('38918273',2,'ALE','2019-02-02','2019-02-17');
/*!40000 ALTER TABLE `sealojaen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sirvedealimentoa`
--

DROP TABLE IF EXISTS `sirvedealimentoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sirvedealimentoa` (
  `denominacionCientificaElemento` varchar(100) NOT NULL,
  `denominacionCientificaAnimal` varchar(100) NOT NULL,
  PRIMARY KEY (`denominacionCientificaElemento`,`denominacionCientificaAnimal`),
  KEY `FK_SirveDeAlimento_Animal` (`denominacionCientificaAnimal`),
  CONSTRAINT `FK_SirveDeAlimento_Alimento` FOREIGN KEY (`denominacionCientificaElemento`) REFERENCES `elementonatural` (`denominacionCientifica`),
  CONSTRAINT `FK_SirveDeAlimento_Animal` FOREIGN KEY (`denominacionCientificaAnimal`) REFERENCES `animal` (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sirvedealimentoa`
--

LOCK TABLES `sirvedealimentoa` WRITE;
/*!40000 ALTER TABLE `sirvedealimentoa` DISABLE KEYS */;
INSERT INTO `sirvedealimentoa` VALUES ('Ramphastos toco','Nasua nasua');
/*!40000 ALTER TABLE `sirvedealimentoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehiculo` (
  `matricula` varchar(10) NOT NULL,
  `tipoVehiculo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('AAB-116','Pick-up');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vigila`
--

DROP TABLE IF EXISTS `vigila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vigila` (
  `DNIVigilante` varchar(10) NOT NULL,
  `idParque` int(10) unsigned NOT NULL,
  `codigoArea` varchar(20) NOT NULL,
  `matriculaVehiculo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DNIVigilante`,`idParque`,`codigoArea`),
  KEY `FK_Vigila_Area` (`idParque`,`codigoArea`),
  KEY `FK_Vigila_Vehiculo` (`matriculaVehiculo`),
  CONSTRAINT `FK_Vigila_Area` FOREIGN KEY (`idParque`, `codigoArea`) REFERENCES `area` (`idParque`, `codigo`),
  CONSTRAINT `FK_Vigila_Vehiculo` FOREIGN KEY (`matriculaVehiculo`) REFERENCES `vehiculo` (`matricula`),
  CONSTRAINT `FK_Vigila_Vigilante` FOREIGN KEY (`DNIVigilante`) REFERENCES `vigilante` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vigila`
--

LOCK TABLES `vigila` WRITE;
/*!40000 ALTER TABLE `vigila` DISABLE KEYS */;
INSERT INTO `vigila` VALUES ('18394827',1,'UNI','AAB-116');
/*!40000 ALTER TABLE `vigila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vigilante`
--

DROP TABLE IF EXISTS `vigilante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vigilante` (
  `DNI` varchar(10) NOT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `FK_Vigilante_Empleado` FOREIGN KEY (`DNI`) REFERENCES `empleado` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vigilante`
--

LOCK TABLES `vigilante` WRITE;
/*!40000 ALTER TABLE `vigilante` DISABLE KEYS */;
INSERT INTO `vigilante` VALUES ('13455334'),('18394827');
/*!40000 ALTER TABLE `vigilante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitante`
--

DROP TABLE IF EXISTS `visitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visitante` (
  `DNI` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `domicilio` varchar(200) DEFAULT NULL,
  `profesion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitante`
--

LOCK TABLES `visitante` WRITE;
/*!40000 ALTER TABLE `visitante` DISABLE KEYS */;
INSERT INTO `visitante` VALUES ('28910299','Paola Grau Gimenez','Calle Falsa 123','Enfermera'),('38918273','Claudia Sanchez','Calle Falsa 123','Estudiante');
/*!40000 ALTER TABLE `visitante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-30 22:34:05
