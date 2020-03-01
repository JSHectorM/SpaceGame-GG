CREATE DATABASE  IF NOT EXISTS `gg` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gg`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gg
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `apartado`
--

DROP TABLE IF EXISTS `apartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartado` (
  `idApartado` int(11) NOT NULL AUTO_INCREMENT,
  `Diferencia` int(11) NOT NULL,
  `Anticipo` int(11) NOT NULL,
  `VENDEDOR_idVENDEDOR` int(11) NOT NULL,
  PRIMARY KEY (`idApartado`,`VENDEDOR_idVENDEDOR`),
  KEY `fk_APARTADO_VENDEDOR1_idx` (`VENDEDOR_idVENDEDOR`),
  CONSTRAINT `fk_APARTADO_VENDEDOR1` FOREIGN KEY (`VENDEDOR_idVENDEDOR`) REFERENCES `vendedor` (`idVENDEDOR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartado`
--

LOCK TABLES `apartado` WRITE;
/*!40000 ALTER TABLE `apartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcion_apartado`
--

DROP TABLE IF EXISTS `descripcion_apartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descripcion_apartado` (
  `APARTADO_idApartado` int(11) NOT NULL,
  `VIDEOJUEGO_idVIDEOJUEGO` int(11) NOT NULL,
  `Nom_Apart` varchar(45) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`APARTADO_idApartado`,`VIDEOJUEGO_idVIDEOJUEGO`),
  KEY `fk_APARTADO_has_VIDEOJUEGO_VIDEOJUEGO1_idx` (`VIDEOJUEGO_idVIDEOJUEGO`),
  KEY `fk_APARTADO_has_VIDEOJUEGO_APARTADO1_idx` (`APARTADO_idApartado`),
  CONSTRAINT `fk_APARTADO_has_VIDEOJUEGO_APARTADO1` FOREIGN KEY (`APARTADO_idApartado`) REFERENCES `apartado` (`idApartado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_APARTADO_has_VIDEOJUEGO_VIDEOJUEGO1` FOREIGN KEY (`VIDEOJUEGO_idVIDEOJUEGO`) REFERENCES `videojuego` (`idVIDEOJUEGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcion_apartado`
--

LOCK TABLES `descripcion_apartado` WRITE;
/*!40000 ALTER TABLE `descripcion_apartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `descripcion_apartado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcion_venta`
--

DROP TABLE IF EXISTS `descripcion_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descripcion_venta` (
  `VIDEOJUEGO_idVIDEOJUEGO` int(11) NOT NULL,
  `VENTA_idVenta` int(11) NOT NULL,
  `Nom_Compra` varchar(30) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`VIDEOJUEGO_idVIDEOJUEGO`,`VENTA_idVenta`),
  KEY `fk_VIDEOJUEGO_has_VENTA_VENTA1_idx` (`VENTA_idVenta`),
  KEY `fk_VIDEOJUEGO_has_VENTA_VIDEOJUEGO1_idx` (`VIDEOJUEGO_idVIDEOJUEGO`),
  CONSTRAINT `fk_VIDEOJUEGO_has_VENTA_VENTA1` FOREIGN KEY (`VENTA_idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VIDEOJUEGO_has_VENTA_VIDEOJUEGO1` FOREIGN KEY (`VIDEOJUEGO_idVIDEOJUEGO`) REFERENCES `videojuego` (`idVIDEOJUEGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcion_venta`
--

LOCK TABLES `descripcion_venta` WRITE;
/*!40000 ALTER TABLE `descripcion_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `descripcion_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `idVENDEDOR` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(30) NOT NULL,
  `Contrasenia` varchar(30) NOT NULL,
  PRIMARY KEY (`idVENDEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Total` int(11) NOT NULL,
  `VENDEDOR_idVENDEDOR` int(11) NOT NULL,
  PRIMARY KEY (`idVenta`,`VENDEDOR_idVENDEDOR`),
  KEY `fk_VENTA_VENDEDOR1_idx` (`VENDEDOR_idVENDEDOR`),
  CONSTRAINT `fk_VENTA_VENDEDOR1` FOREIGN KEY (`VENDEDOR_idVENDEDOR`) REFERENCES `vendedor` (`idVENDEDOR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videojuego`
--

DROP TABLE IF EXISTS `videojuego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videojuego` (
  `idVIDEOJUEGO` int(11) NOT NULL,
  `Nombre_Video` varchar(45) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Stock` int(4) NOT NULL,
  `Cantidad_Vend` int(3) NOT NULL,
  `Genero` varchar(45) NOT NULL,
  `Costo` int(4) NOT NULL,
  `Consola` varchar(45) DEFAULT NULL,
  `Anio` int(4) DEFAULT NULL,
  PRIMARY KEY (`idVIDEOJUEGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuego`
--

LOCK TABLES `videojuego` WRITE;
/*!40000 ALTER TABLE `videojuego` DISABLE KEYS */;
INSERT INTO `videojuego` VALUES (1,'abc','muy bueno',12,6,'aventura',250,'Xbox',2000);
/*!40000 ALTER TABLE `videojuego` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-28 13:20:07
