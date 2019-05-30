-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: tp_bases
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `Alojamiento`
--

DROP TABLE IF EXISTS `Alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alojamiento` (
  `idParque` int(10) unsigned NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `capacidad` int(10) unsigned DEFAULT NULL,
  `codigoCategoria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idParque`,`codigo`),
  KEY `FK_Alojamiento_Categoria` (`codigoCategoria`),
  CONSTRAINT `FK_Alojamiento_Categoria` FOREIGN KEY (`codigoCategoria`) REFERENCES `Categoria` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alojamiento`
--

LOCK TABLES `Alojamiento` WRITE;
/*!40000 ALTER TABLE `Alojamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Animal` (
  `denominacionCientifica` varchar(200) NOT NULL,
  `periodoDeCelo` varchar(200) DEFAULT NULL,
  `tipoAnimal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`denominacionCientifica`),
  CONSTRAINT `FK_Animal_ElementoNatural` FOREIGN KEY (`denominacionCientifica`) REFERENCES `ElementoNatural` (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Area`
--

DROP TABLE IF EXISTS `Area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Area` (
  `idParque` int(10) unsigned NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `extension` decimal(12,2) DEFAULT NULL,
  `idProvincia` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idParque`,`codigo`),
  KEY `FK_Area_Provincia` (`idProvincia`),
  CONSTRAINT `FK_Area_Parque` FOREIGN KEY (`idParque`) REFERENCES `ParqueNatural` (`idParque`),
  CONSTRAINT `FK_Area_Provincia` FOREIGN KEY (`idProvincia`) REFERENCES `Provincia` (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Area`
--

LOCK TABLES `Area` WRITE;
/*!40000 ALTER TABLE `Area` DISABLE KEYS */;
/*!40000 ALTER TABLE `Area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `codigo` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conservador`
--

DROP TABLE IF EXISTS `Conservador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conservador` (
  `DNI` varchar(10) NOT NULL,
  `especializacion` varchar(100) DEFAULT NULL,
  `idParque` int(10) unsigned DEFAULT NULL,
  `codigoAreaMantiene` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `FK_Conservador_Area` (`idParque`,`codigoAreaMantiene`),
  CONSTRAINT `FK_Conservador_Area` FOREIGN KEY (`idParque`, `codigoAreaMantiene`) REFERENCES `Area` (`idParque`, `codigo`),
  CONSTRAINT `FK_Conservador_Empleado` FOREIGN KEY (`DNI`) REFERENCES `Empleado` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conservador`
--

LOCK TABLES `Conservador` WRITE;
/*!40000 ALTER TABLE `Conservador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Conservador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ElementoNatural`
--

DROP TABLE IF EXISTS `ElementoNatural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ElementoNatural` (
  `denominacionCientifica` varchar(200) NOT NULL,
  `denominacionVulgar` varchar(200) DEFAULT NULL,
  `tipoElementoNatural` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ElementoNatural`
--

LOCK TABLES `ElementoNatural` WRITE;
/*!40000 ALTER TABLE `ElementoNatural` DISABLE KEYS */;
/*!40000 ALTER TABLE `ElementoNatural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empleado` (
  `DNI` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `CUIL` varchar(11) NOT NULL,
  `telefonoMovil` varchar(50) DEFAULT NULL,
  `sueldo` decimal(12,2) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `tipoEmpleado` varchar(30) DEFAULT NULL,
  `idParque` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entrada`
--

DROP TABLE IF EXISTS `Entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entrada` (
  `numero` int(10) unsigned NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entrada`
--

LOCK TABLES `Entrada` WRITE;
/*!40000 ALTER TABLE `Entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Excursion`
--

DROP TABLE IF EXISTS `Excursion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Excursion` (
  `idExcursion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enVehiculo` varchar(100) DEFAULT NULL,
  `hora` varchar(20) DEFAULT NULL,
  `dias` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idExcursion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Excursion`
--

LOCK TABLES `Excursion` WRITE;
/*!40000 ALTER TABLE `Excursion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Excursion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gestor`
--

DROP TABLE IF EXISTS `Gestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gestor` (
  `DNI` varchar(10) NOT NULL,
  `numeroEntrada` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `FK_Gestor_Entrada` (`numeroEntrada`),
  CONSTRAINT `FK_Gestor_Empleado` FOREIGN KEY (`DNI`) REFERENCES `Empleado` (`DNI`),
  CONSTRAINT `FK_Gestor_Entrada` FOREIGN KEY (`numeroEntrada`) REFERENCES `Entrada` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gestor`
--

LOCK TABLES `Gestor` WRITE;
/*!40000 ALTER TABLE `Gestor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Gestor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Investigador`
--

DROP TABLE IF EXISTS `Investigador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Investigador` (
  `DNI` varchar(10) NOT NULL,
  `titulacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `FK_Investigador_Empleado` FOREIGN KEY (`DNI`) REFERENCES `Empleado` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Investigador`
--

LOCK TABLES `Investigador` WRITE;
/*!40000 ALTER TABLE `Investigador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Investigador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mineral`
--

DROP TABLE IF EXISTS `Mineral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mineral` (
  `denominacionCientifica` varchar(200) NOT NULL,
  `tipoMineral` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`denominacionCientifica`),
  CONSTRAINT `FK_Mineral_ElementoNatural` FOREIGN KEY (`denominacionCientifica`) REFERENCES `ElementoNatural` (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mineral`
--

LOCK TABLES `Mineral` WRITE;
/*!40000 ALTER TABLE `Mineral` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mineral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganismoRegulador`
--

DROP TABLE IF EXISTS `OrganismoRegulador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganismoRegulador` (
  `razonSocial` varchar(100) NOT NULL,
  PRIMARY KEY (`razonSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganismoRegulador`
--

LOCK TABLES `OrganismoRegulador` WRITE;
/*!40000 ALTER TABLE `OrganismoRegulador` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrganismoRegulador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizadoPor`
--

DROP TABLE IF EXISTS `OrganizadoPor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizadoPor` (
  `idExcursion` int(10) unsigned NOT NULL,
  `idParque` int(10) unsigned NOT NULL,
  `codigoAlojamiento` varchar(30) NOT NULL,
  PRIMARY KEY (`idExcursion`,`idParque`,`codigoAlojamiento`),
  KEY `FK_Organizado_Alojamiento` (`idParque`,`codigoAlojamiento`),
  CONSTRAINT `FK_Organizado_Alojamiento` FOREIGN KEY (`idParque`, `codigoAlojamiento`) REFERENCES `Alojamiento` (`idParque`, `codigo`),
  CONSTRAINT `FK_Organizado_Excursion` FOREIGN KEY (`idExcursion`) REFERENCES `Excursion` (`idExcursion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizadoPor`
--

LOCK TABLES `OrganizadoPor` WRITE;
/*!40000 ALTER TABLE `OrganizadoPor` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrganizadoPor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParqueNatural`
--

DROP TABLE IF EXISTS `ParqueNatural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParqueNatural` (
  `idParque` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `declaradoEn` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idParque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParqueNatural`
--

LOCK TABLES `ParqueNatural` WRITE;
/*!40000 ALTER TABLE `ParqueNatural` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParqueNatural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipaDe`
--

DROP TABLE IF EXISTS `ParticipaDe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParticipaDe` (
  `DNIInvestigador` varchar(10) NOT NULL,
  `nombreProyecto` varchar(100) NOT NULL,
  PRIMARY KEY (`DNIInvestigador`,`nombreProyecto`),
  KEY `fk_Participa_Proyecto` (`nombreProyecto`),
  CONSTRAINT `fk_Participa_Investigador` FOREIGN KEY (`DNIInvestigador`) REFERENCES `Investigador` (`DNI`),
  CONSTRAINT `fk_Participa_Proyecto` FOREIGN KEY (`nombreProyecto`) REFERENCES `ProyectoDeInvestigacion` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipaDe`
--

LOCK TABLES `ParticipaDe` WRITE;
/*!40000 ALTER TABLE `ParticipaDe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParticipaDe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipaDeExcursion`
--

DROP TABLE IF EXISTS `ParticipaDeExcursion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParticipaDeExcursion` (
  `DNIVisitante` varchar(10) NOT NULL,
  `idExcursion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DNIVisitante`,`idExcursion`),
  KEY `FK_ParticipaDeExcursion_Excursion` (`idExcursion`),
  CONSTRAINT `FK_ParticipaDeExcursion_Excursion` FOREIGN KEY (`idExcursion`) REFERENCES `Excursion` (`idExcursion`),
  CONSTRAINT `FK_ParticipaDeExcursion_Visitante` FOREIGN KEY (`DNIVisitante`) REFERENCES `Visitante` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipaDeExcursion`
--

LOCK TABLES `ParticipaDeExcursion` WRITE;
/*!40000 ALTER TABLE `ParticipaDeExcursion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParticipaDeExcursion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincia`
--

DROP TABLE IF EXISTS `Provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provincia` (
  `idProvincia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `razonOrganismoRegulador` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProvincia`),
  KEY `FK_Provincia_Organismo` (`razonOrganismoRegulador`),
  CONSTRAINT `FK_Provincia_Organismo` FOREIGN KEY (`razonOrganismoRegulador`) REFERENCES `OrganismoRegulador` (`razonSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincia`
--

LOCK TABLES `Provincia` WRITE;
/*!40000 ALTER TABLE `Provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProyectoDeInvestigacion`
--

DROP TABLE IF EXISTS `ProyectoDeInvestigacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProyectoDeInvestigacion` (
  `nombre` varchar(100) NOT NULL,
  `periodo` varchar(100) DEFAULT NULL,
  `presupuesto` decimal(12,2) DEFAULT NULL,
  `sobre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  KEY `FK_Proyecto_Elemento` (`sobre`),
  CONSTRAINT `FK_Proyecto_Elemento` FOREIGN KEY (`sobre`) REFERENCES `ElementoNatural` (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProyectoDeInvestigacion`
--

LOCK TABLES `ProyectoDeInvestigacion` WRITE;
/*!40000 ALTER TABLE `ProyectoDeInvestigacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProyectoDeInvestigacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reside`
--

DROP TABLE IF EXISTS `Reside`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reside` (
  `idParque` int(10) unsigned NOT NULL,
  `codigoArea` varchar(20) NOT NULL,
  `denominacionCientifica` varchar(100) NOT NULL,
  `inventario` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idParque`,`codigoArea`,`denominacionCientifica`),
  KEY `FK_Reside_ElementoNatural` (`denominacionCientifica`),
  CONSTRAINT `FK_Reside_Area` FOREIGN KEY (`idParque`, `codigoArea`) REFERENCES `Area` (`idParque`, `codigo`),
  CONSTRAINT `FK_Reside_ElementoNatural` FOREIGN KEY (`denominacionCientifica`) REFERENCES `ElementoNatural` (`denominacionCientifica`),
  CONSTRAINT `FK_Reside_Parque` FOREIGN KEY (`idParque`) REFERENCES `ParqueNatural` (`idParque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reside`
--

LOCK TABLES `Reside` WRITE;
/*!40000 ALTER TABLE `Reside` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reside` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeAlojaEn`
--

DROP TABLE IF EXISTS `SeAlojaEn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeAlojaEn` (
  `DNIVisitante` varchar(10) NOT NULL,
  `idParque` int(10) unsigned NOT NULL,
  `codigoAlojamiento` varchar(30) NOT NULL,
  `fechaDesde` date NOT NULL,
  `fechaHasta` date DEFAULT NULL,
  PRIMARY KEY (`DNIVisitante`,`idParque`,`codigoAlojamiento`,`fechaDesde`),
  KEY `FK_SeAlojaEn_Alojamiento` (`idParque`,`codigoAlojamiento`),
  CONSTRAINT `FK_SeAlojaEn_Alojamiento` FOREIGN KEY (`idParque`, `codigoAlojamiento`) REFERENCES `Alojamiento` (`idParque`, `codigo`),
  CONSTRAINT `FK_SeAlojaEn_Visitante` FOREIGN KEY (`DNIVisitante`) REFERENCES `Visitante` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeAlojaEn`
--

LOCK TABLES `SeAlojaEn` WRITE;
/*!40000 ALTER TABLE `SeAlojaEn` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeAlojaEn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SirveDeAlimentoA`
--

DROP TABLE IF EXISTS `SirveDeAlimentoA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SirveDeAlimentoA` (
  `denominacionCientificaElemento` varchar(100) NOT NULL,
  `denominacionCientificaAnimal` varchar(100) NOT NULL,
  PRIMARY KEY (`denominacionCientificaElemento`,`denominacionCientificaAnimal`),
  KEY `FK_SirveDeAlimento_Animal` (`denominacionCientificaAnimal`),
  CONSTRAINT `FK_SirveDeAlimento_Alimento` FOREIGN KEY (`denominacionCientificaElemento`) REFERENCES `ElementoNatural` (`denominacionCientifica`),
  CONSTRAINT `FK_SirveDeAlimento_Animal` FOREIGN KEY (`denominacionCientificaAnimal`) REFERENCES `ElementoNatural` (`denominacionCientifica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SirveDeAlimentoA`
--

LOCK TABLES `SirveDeAlimentoA` WRITE;
/*!40000 ALTER TABLE `SirveDeAlimentoA` DISABLE KEYS */;
/*!40000 ALTER TABLE `SirveDeAlimentoA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehiculo`
--

DROP TABLE IF EXISTS `Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehiculo` (
  `matricula` varchar(10) NOT NULL,
  `tipoVehiculo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehiculo`
--

LOCK TABLES `Vehiculo` WRITE;
/*!40000 ALTER TABLE `Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vigila`
--

DROP TABLE IF EXISTS `Vigila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vigila` (
  `DNIVigilante` varchar(10) NOT NULL,
  `idParque` int(10) unsigned NOT NULL,
  `codigoArea` varchar(20) NOT NULL,
  `matriculaVehiculo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DNIVigilante`,`idParque`,`codigoArea`),
  KEY `FK_Vigila_Area` (`idParque`,`codigoArea`),
  KEY `FK_Vigila_Vehiculo` (`matriculaVehiculo`),
  CONSTRAINT `FK_Vigila_Area` FOREIGN KEY (`idParque`, `codigoArea`) REFERENCES `Area` (`idParque`, `codigo`),
  CONSTRAINT `FK_Vigila_Vehiculo` FOREIGN KEY (`matriculaVehiculo`) REFERENCES `Vehiculo` (`matricula`),
  CONSTRAINT `FK_Vigila_Vigilante` FOREIGN KEY (`DNIVigilante`) REFERENCES `Vigilante` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vigila`
--

LOCK TABLES `Vigila` WRITE;
/*!40000 ALTER TABLE `Vigila` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vigila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vigilante`
--

DROP TABLE IF EXISTS `Vigilante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vigilante` (
  `DNI` varchar(10) NOT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `FK_Vigilante_Empleado` FOREIGN KEY (`DNI`) REFERENCES `Empleado` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vigilante`
--

LOCK TABLES `Vigilante` WRITE;
/*!40000 ALTER TABLE `Vigilante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vigilante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visitante`
--

DROP TABLE IF EXISTS `Visitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visitante` (
  `DNI` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `domicilio` varchar(200) DEFAULT NULL,
  `profesion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visitante`
--

LOCK TABLES `Visitante` WRITE;
/*!40000 ALTER TABLE `Visitante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visitante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-30  1:48:01
