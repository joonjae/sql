CREATE DATABASE  IF NOT EXISTS `dbdeposito` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbdeposito`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: dbdeposito
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Dumping data for table `agente`
--

LOCK TABLES `agente` WRITE;
/*!40000 ALTER TABLE `agente` DISABLE KEYS */;
INSERT INTO `agente` VALUES (4,45678901234,'Operario','2012-03-20','Producción',104,'marta.sanchez@example.com',0),(5,56789012345,'Supervisor','2018-11-05','Logística',105,'luis.fernandez@example.com',0),(6,67890123456,'Contador','2011-05-10','Finanzas',106,'lucia.martinez@example.com',0),(7,78901234567,'Técnico','2013-07-22','Mantenimiento',107,'pedro.garcia@example.com',0),(8,89012345678,'Analista','2016-10-02','TI',108,'sofia.hernandez@example.com',0),(9,90123456789,'Jefe de equipo','2009-03-15','Producción',109,'diego.torres@example.com',0),(10,12345678012,'Coordinador','2014-12-01','Logística',110,'laura.mendoza@example.com',0);
/*!40000 ALTER TABLE `agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bobina`
--

LOCK TABLES `bobina` WRITE;
/*!40000 ALTER TABLE `bobina` DISABLE KEYS */;
INSERT INTO `bobina` VALUES (1,'P004','Cobre',10,5,'Inductancia','GHI PLC','http://example.com/b1','1 Ohm','Bobina de 10mH','2023-01-01'),(2,'P004','Hierro',100,10,'Inductancia','DEF Ltd','http://example.com/b2','2 Ohms','Bobina de 100mH','2023-02-01'),(3,'P004','Níquel',47,2,'Inductancia','YZA GmbH','http://example.com/b3','3 Ohms','Bobina de 47mH','2023-03-01'),(4,'P004','Plata',68,1,'Inductancia','MNO Corp','http://example.com/b4','4 Ohms','Bobina de 68mH','2023-04-01');
/*!40000 ALTER TABLE `bobina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `capacitor`
--

LOCK TABLES `capacitor` WRITE;
/*!40000 ALTER TABLE `capacitor` DISABLE KEYS */;
INSERT INTO `capacitor` VALUES (1,'P002',100,10,'Electrolítico','Through Hole','http://example.com/c1','ABC Inc','16V','2023-01-01'),(2,'P002',220,20,'Cerámico','SMD','http://example.com/c2','XYZ Corp','25V','2023-02-01'),(3,'P002',330,5,'Tántalo','Through Hole','http://example.com/c3','PQR Inc','25V','2023-03-01'),(4,'P002',470,10,'Mica','SMD','http://example.com/c4','STU Ltd','50V','2023-04-01');
/*!40000 ALTER TABLE `capacitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ic_compuertas`
--

LOCK TABLES `ic_compuertas` WRITE;
/*!40000 ALTER TABLE `ic_compuertas` DISABLE KEYS */;
INSERT INTO `ic_compuertas` VALUES (1,'P005','CMOS',5,'AND','IC de Compuerta AND','SMD','http://example.com/ic1','JKL GmbH','20mA','2023-01-01'),(2,'P005','TTL',3,'OR','IC de Compuerta OR','Through Hole','http://example.com/ic2','XYZ Corp','15mA','2023-02-01'),(3,'P005','BiCMOS',5,'NAND','IC de Compuerta NAND','Through Hole','http://example.com/ic3','YZA GmbH','25mA','2023-03-01'),(4,'P005','ECL',3,'NOR','IC de Compuerta NOR','SMD','http://example.com/ic4','MNO Corp','10mA','2023-04-01');
/*!40000 ALTER TABLE `ic_compuertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lista_materiales`
--

LOCK TABLES `lista_materiales` WRITE;
/*!40000 ALTER TABLE `lista_materiales` DISABLE KEYS */;
INSERT INTO `lista_materiales` VALUES (1,1,'P001','Resistencia 10k Ohms','Circuito A',100),(2,2,'P002','Capacitor 100uF','Circuito B',200),(3,3,'P003','Transistor NPN','Circuito C',300),(4,4,'P004','Bobina 10mH','Circuito D',150),(5,5,'P005','IC Compuerta AND','Circuito E',50),(6,6,'P006','Diodo 1N4007','Circuito F',200),(7,7,'P007','LED Rojo','Circuito G',500),(8,8,'P008','Potenciómetro 10k','Circuito H',150),(9,9,'P009','Relay 5V','Circuito I',100),(10,10,'P010','Oscilador de cuarzo 16MHz','Circuito J',250);
/*!40000 ALTER TABLE `lista_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_pedido`
--

LOCK TABLES `log_pedido` WRITE;
/*!40000 ALTER TABLE `log_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_stock_materiales`
--

LOCK TABLES `log_stock_materiales` WRITE;
/*!40000 ALTER TABLE `log_stock_materiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_stock_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (4,40,4,5,'Egreso','2023-09-25',4),(6,70,6,7,'Ingreso','2023-11-10',6),(7,40,7,8,'Egreso','2023-12-15',7),(8,30,8,9,'Ingreso','2024-01-20',8),(10,80,10,6,'Ingreso','2024-04-01',10);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (4,4,'Marta','Sánchez','2023-04-25','Suministros'),(5,5,'Luis','Fernández','2023-05-30','Materiales'),(6,6,'Lucía','Martínez','2023-06-01','Herramientas'),(7,7,'Pedro','García','2023-06-15','Materiales'),(8,8,'Sofía','Hernández','2023-07-05','Equipo'),(10,9,'Diego','Torres','2023-07-20','Suministros'),(11,10,'Laura','Mendoza','2023-08-10','Materiales');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (12345678012,'Laura','Mendoza','1996-02-14',1111122334,'F'),(12345678901,'Juan','Pérez','2003-05-10',1122334455,'M'),(23456789012,'Ana','Gómez','2004-08-15',1133445566,'F'),(34567890123,'Carlos','López','1998-12-20',1144556677,'M'),(45678901234,'Marta','Sánchez','1995-03-25',1155667788,'F'),(56789012345,'Luis','Fernández','2002-07-30',1166778899,'M'),(67890123456,'Lucía','Martínez','1988-11-12',1177889900,'F'),(78901234567,'Pedro','García','1992-04-05',1188990011,'M'),(89012345678,'Sofía','Hernández','1993-06-23',1199001122,'F'),(90123456789,'Diego','Torres','2009-09-17',1100112233,'M');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('P001','Resistencia','Resistencia de 10k Ohms'),('P002','Capacitor','Capacitor de 100uF'),('P003','Transistor','Transistor NPN'),('P004','Bobina','Bobina de 10mH'),('P005','IC Compuerta','IC de Compuerta AND'),('P006','Diodo','Diodo 1N4007'),('P007','LED','LED Rojo'),('P008','Potenciómetro','Potenciómetro de 10k'),('P009','Relay','Relay de 5V'),('P010','Oscilador','Oscilador de cuarzo 16MHz');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `resistencia`
--

LOCK TABLES `resistencia` WRITE;
/*!40000 ALTER TABLE `resistencia` DISABLE KEYS */;
INSERT INTO `resistencia` VALUES (1,'P001',10000,5,0,'Through Hole','Carbono','XYZ Corp','Resistencia de 10k Ohms','http://example.com/r1','2023-01-01'),(2,'P001',4700,1,0,'SMD','Metal Film','ABC Inc','Resistencia de 4.7k Ohms','http://example.com/r2','2023-02-01'),(3,'P001',3300,5,0,'Through Hole','Metal Oxide','JKL GmbH','Resistencia de 3.3k Ohms','http://example.com/r3','2023-03-01'),(4,'P001',8200,1,1,'SMD','Carbono','MNO Corp','Resistencia de 8.2k Ohms','http://example.com/r4','2023-04-01');
/*!40000 ALTER TABLE `resistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stock_materiales`
--

LOCK TABLES `stock_materiales` WRITE;
/*!40000 ALTER TABLE `stock_materiales` DISABLE KEYS */;
INSERT INTO `stock_materiales` VALUES (1,'P001',5000,'Resistencias','10k Ohms','XYZ Corp','C001',1),(2,'P002',3000,'Capacitores','100uF','ABC Inc','C002',2),(3,'P003',2000,'Transistores','NPN','DEF Ltd','C003',3),(4,'P004',1500,'Bobinas','10mH','GHI PLC','C004',4),(5,'P005',1000,'ICs','Compuerta AND','JKL GmbH','C005',5),(6,'P006',4000,'Diodos','Diodo 1N4007','MNO Corp','C006',6),(7,'P007',6000,'LEDs','LED Rojo','PQR Inc','C007',7),(8,'P008',3000,'Potenciómetros','Potenciómetro 10k','STU Ltd','C008',8),(9,'P009',2000,'Relays','Relay 5V','VWX PLC','C009',9),(10,'P010',3500,'Osciladores','Oscilador de cuarzo 16MHz','YZA GmbH','C010',10);
/*!40000 ALTER TABLE `stock_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transistor`
--

LOCK TABLES `transistor` WRITE;
/*!40000 ALTER TABLE `transistor` DISABLE KEYS */;
INSERT INTO `transistor` VALUES (1,'P003','BJT','NPN',60,'10A','Through Hole','http://example.com/t1','DEF Ltd','Transistor NPN','2023-01-01'),(2,'P003','MOSFET','P-Channel',30,'5A','SMD','http://example.com/t2','GHI PLC','Transistor P-Channel','2023-02-01'),(3,'P003','IGBT','N-Channel',120,'20A','Through Hole','http://example.com/t3','PQR Inc','Transistor N-Channel IGBT','2023-03-01'),(4,'P003','JFET','N-Channel',30,'1A','SMD','http://example.com/t4','STU Ltd','Transistor N-Channel JFET','2023-04-01');
/*!40000 ALTER TABLE `transistor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-10 14:32:18
