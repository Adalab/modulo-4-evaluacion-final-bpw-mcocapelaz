-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `autoras`
--

DROP TABLE IF EXISTS `autoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoras` (
  `id_autoras` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(168) NOT NULL,
  `nacionalidad` varchar(168) DEFAULT NULL,
  PRIMARY KEY (`id_autoras`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoras`
--

LOCK TABLES `autoras` WRITE;
/*!40000 ALTER TABLE `autoras` DISABLE KEYS */;
INSERT INTO `autoras` VALUES (1,'Isabel Allende','Chilena'),(2,'J.K. Rowling','Británica'),(3,'Laura Gallego','Española'),(4,'Jane Austen','Británica'),(5,'Agatha Christie','Británica'),(6,'Virginia Woolf','Británica'),(7,'Margaret Atwood','Canadiense'),(8,'Elena Ferrante','Italiana');
/*!40000 ALTER TABLE `autoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoras_has_libros`
--

DROP TABLE IF EXISTS `autoras_has_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoras_has_libros` (
  `autoras_id_autoras` int NOT NULL,
  `libros_id_libros` int NOT NULL,
  `nombre` varchar(168) DEFAULT NULL,
  `titulo` varchar(168) DEFAULT NULL,
  PRIMARY KEY (`autoras_id_autoras`,`libros_id_libros`),
  KEY `fk_autoras_has_libros_libros1_idx` (`libros_id_libros`),
  KEY `fk_autoras_has_libros_autoras_idx` (`autoras_id_autoras`),
  CONSTRAINT `fk_autoras_has_libros_autoras` FOREIGN KEY (`autoras_id_autoras`) REFERENCES `autoras` (`id_autoras`),
  CONSTRAINT `fk_autoras_has_libros_libros1` FOREIGN KEY (`libros_id_libros`) REFERENCES `libros` (`id_libros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoras_has_libros`
--

LOCK TABLES `autoras_has_libros` WRITE;
/*!40000 ALTER TABLE `autoras_has_libros` DISABLE KEYS */;
INSERT INTO `autoras_has_libros` VALUES (1,1,'Isabel Allende','La casa de los espíritus'),(1,9,'Isabel Allende','Paula '),(2,2,'JK Rowling','Harry Potter y la piedra filosofal'),(2,10,'JK Rowling','Harry Potter y la cámara secreta'),(3,3,'Laura Gallego','Memorias de Idhún '),(4,4,'Jane Austen','Orgullo y prejuicio'),(5,5,'Agatha Christie','Asesinato en el Orient Express'),(6,6,'Virginia Woolf','La señora Dalloway'),(7,7,'Margaret Atwood','El cuento de la criada '),(8,8,'Elena Ferrante','La amiga estupenda');
/*!40000 ALTER TABLE `autoras_has_libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `id_libros` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `autora` varchar(168) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `genero` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_libros`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'La casa de los espíritus','Isabel Allende','prestado','Ficción'),(2,'Harry Potter y la piedra filosofal','JK Rowling','prestado','Fantasía'),(3,'Memorias de Idhún','Laura Gallego','disponible','Fantasía'),(4,'Orgullo y prejuicio','Jane Austen','prestado','Romance'),(5,'Asesinato en el Orient Express','Agatha Christie','disponible','Misterio'),(6,'La señora Dalloway','Virginia Woolf','disponible','Ficción'),(7,'El cuento de la criada','Margaret Atwood','disponible','Distopía'),(8,'La amiga estupenda','Elena Ferrante','prestado','Ficción'),(9,'Paula','Plaza & Janés','Isabel Allende','Autobiografía'),(10,'Harry Potter y la cámara secreta','JK Rowling','disponible','Fantasía');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `id_prestamos` int NOT NULL AUTO_INCREMENT,
  `id_libro` int NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `estado_prestamo` varchar(108) DEFAULT NULL,
  PRIMARY KEY (`id_prestamos`),
  KEY `fk_prestamos_libros_idx` (`id_libro`),
  CONSTRAINT `fk_prestamos_libros` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libros`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,1,'2024-10-10','2024-10-24','devuelto'),(2,2,'2024-11-15','2024-11-29','activo'),(3,3,'2024-09-05','2024-09-19','devuelto'),(4,4,'2024-12-01','2024-12-15','activo'),(5,9,'2024-08-12','2024-08-26','devuelto'),(6,10,'2024-10-01','2024-10-15','devuelto'),(7,7,'2024-11-10','2024-11-24','devuelto'),(8,8,'2024-11-20','2024-12-04','activo');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarias`
--

DROP TABLE IF EXISTS `usuarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarias` (
  `id_usuarias` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(168) NOT NULL,
  `email` varchar(168) NOT NULL,
  `fecha_registro` date NOT NULL,
  `password` varchar(168) NOT NULL,
  PRIMARY KEY (`id_usuarias`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarias`
--

LOCK TABLES `usuarias` WRITE;
/*!40000 ALTER TABLE `usuarias` DISABLE KEYS */;
INSERT INTO `usuarias` VALUES (1,'Agripina López','agripina.lopez@email.com','2024-01-15',''),(2,'Obdulia Ruiz','obdulia.ruiz@email.com','2024-02-20',''),(3,'Jacinta González','jacinta.gonzalez@email.com','2024-03-10',''),(4,'Fernanda Martínez','fernanda.martinez@email.com','2024-04-05',''),(5,'Tomasa Fernández','tomasa.fernandez@email.com','2024-05-12',''),(6,'Amparo Sánchez','amparo.sanchez@email.com','2024-06-18',''),(7,'Visitación Torres','visitacion.torres@email.com','2024-07-22',''),(8,'Alfonsa Morales','alfonsa.morales@email.com','2024-08-30','');
/*!40000 ALTER TABLE `usuarias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 12:51:24
