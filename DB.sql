CREATE DATABASE  IF NOT EXISTS `techochile` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `techochile`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 192.168.99.100    Database: techochile
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `cons_comuna`
--

DROP TABLE IF EXISTS `cons_comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cons_comuna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comuna` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provincia_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cons_comuna_cons_provincia1_idx` (`provincia_id`),
  CONSTRAINT `fk_cons_comuna_cons_provincia1` FOREIGN KEY (`provincia_id`) REFERENCES `cons_provincia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cons_comuna`
--

LOCK TABLES `cons_comuna` WRITE;
/*!40000 ALTER TABLE `cons_comuna` DISABLE KEYS */;
INSERT INTO `cons_comuna` VALUES (1,'Arica',1),(2,'Camarones',1),(3,'General Lagos',2),(4,'Putre',2),(5,'Alto Hospicio',3),(6,'Iquique',3),(7,'Camiña',4),(8,'Colchane',4),(9,'Huara',4),(10,'Pica',4),(11,'Pozo Almonte',4),(12,'Tocopilla',5),(13,'María Elena',5),(14,'Calama',6),(15,'Ollague',6),(16,'San Pedro de Atacama',6),(17,'Antofagasta',7),(18,'Mejillones',7),(19,'Sierra Gorda',7),(20,'Taltal',7),(21,'Chañaral',8),(22,'Diego de Almagro',8),(23,'Copiapó',9),(24,'Caldera',9),(25,'Tierra Amarilla',9),(26,'Vallenar',10),(27,'Alto del Carmen',10),(28,'Freirina',10),(29,'Huasco',10),(30,'La Serena',11),(31,'Coquimbo',11),(32,'Andacollo',11),(33,'La Higuera',11),(34,'Paihuano',11),(35,'Vicuña',11),(36,'Ovalle',12),(37,'Combarbalá',12),(38,'Monte Patria',12),(39,'Punitaqui',12),(40,'Río Hurtado',12),(41,'Illapel',13),(42,'Canela',13),(43,'Los Vilos',13),(44,'Salamanca',13),(45,'La Ligua',14),(46,'Cabildo',14),(47,'Zapallar',14),(48,'Papudo',14),(49,'Petorca',14),(50,'Los Andes',15),(51,'San Esteban',15),(52,'Calle Larga',15),(53,'Rinconada',15),(54,'San Felipe',16),(55,'Llaillay',16),(56,'Putaendo',16),(57,'Santa María',16),(58,'Catemu',16),(59,'Panquehue',16),(60,'Quillota',17),(61,'La Cruz',17),(62,'La Calera',17),(63,'Nogales',17),(64,'Hijuelas',17),(65,'Valparaíso',18),(66,'Viña del Mar',18),(67,'Concón',18),(68,'Quintero',18),(69,'Puchuncaví',18),(70,'Casablanca',18),(71,'Juan Fernández',18),(72,'San Antonio',19),(73,'Cartagena',19),(74,'El Tabo',19),(75,'El Quisco',19),(76,'Algarrobo',19),(77,'Santo Domingo',19),(78,'Isla de Pascua',20),(79,'Quilpué',21),(80,'Limache',21),(81,'Olmué',21),(82,'Villa Alemana',21),(83,'Colina',22),(84,'Lampa',22),(85,'Tiltil',22),(86,'Santiago',23),(87,'Vitacura',23),(88,'San Ramón',23),(89,'San Miguel',23),(90,'San Joaquín',23),(91,'Renca',23),(92,'Recoleta',23),(93,'Quinta Normal',23),(94,'Quilicura',23),(95,'Pudahuel',23),(96,'Providencia',23),(97,'Peñalolén',23),(98,'Pedro Aguirre Cerda',23),(99,'Ñuñoa',23),(100,'Maipú',23),(101,'Macul',23),(102,'Lo Prado',23),(103,'Lo Espejo',23),(104,'Lo Barnechea',23),(105,'Las Condes',23),(106,'La Reina',23),(107,'La Pintana',23),(108,'La Granja',23),(109,'La Florida',23),(110,'La Cisterna',23),(111,'Independencia',23),(112,'Huechuraba',23),(113,'Estación Central',23),(114,'El Bosque',23),(115,'Conchalí',23),(116,'Cerro Navia',23),(117,'Cerrillos',23),(118,'Puente Alto',24),(119,'San José de Maipo',24),(120,'Pirque',24),(121,'San Bernardo',25),(122,'Buin',25),(123,'Paine',25),(124,'Calera de Tango',25),(125,'Melipilla',26),(126,'Alhué',26),(127,'Curacaví',26),(128,'María Pinto',26),(129,'San Pedro',26),(130,'Isla de Maipo',27),(131,'El Monte',27),(132,'Padre Hurtado',27),(133,'Peñaflor',27),(134,'Talagante',27),(135,'Codegua',28),(136,'Coínco',28),(137,'Coltauco',28),(138,'Doñihue',28),(139,'Graneros',28),(140,'Las Cabras',28),(141,'Machalí',28),(142,'Malloa',28),(143,'Mostazal',28),(144,'Olivar',28),(145,'Peumo',28),(146,'Pichidegua',28),(147,'Quinta de Tilcoco',28),(148,'Rancagua',28),(149,'Rengo',28),(150,'Requínoa',28),(151,'San Vicente de Tagua Tagua',28),(152,'Chépica',29),(153,'Chimbarongo',29),(154,'Lolol',29),(155,'Nancagua',29),(156,'Palmilla',29),(157,'Peralillo',29),(158,'Placilla',29),(159,'Pumanque',29),(160,'San Fernando',29),(161,'Santa Cruz',29),(162,'La Estrella',30),(163,'Litueche',30),(164,'Marchigüe',30),(165,'Navidad',30),(166,'Paredones',30),(167,'Pichilemu',30),(168,'Curicó',31),(169,'Hualañé',31),(170,'Licantén',31),(171,'Molina',31),(172,'Rauco',31),(173,'Romeral',31),(174,'Sagrada Familia',31),(175,'Teno',31),(176,'Vichuquén',31),(177,'Talca',32),(178,'San Clemente',32),(179,'Pelarco',32),(180,'Pencahue',32),(181,'Maule',32),(182,'San Rafael',32),(183,'Curepto',33),(184,'Constitución',32),(185,'Empedrado',32),(186,'Río Claro',32),(187,'Linares',33),(188,'San Javier',33),(189,'Parral',33),(190,'Villa Alegre',33),(191,'Longaví',33),(192,'Colbún',33),(193,'Retiro',33),(194,'Yerbas Buenas',33),(195,'Cauquenes',34),(196,'Chanco',34),(197,'Pelluhue',34),(198,'Bulnes',35),(199,'Chillán',35),(200,'Chillán Viejo',35),(201,'El Carmen',35),(202,'Pemuco',35),(203,'Pinto',35),(204,'Quillón',35),(205,'San Ignacio',35),(206,'Yungay',35),(207,'Cobquecura',36),(208,'Coelemu',36),(209,'Ninhue',36),(210,'Portezuelo',36),(211,'Quirihue',36),(212,'Ránquil',36),(213,'Treguaco',36),(214,'San Carlos',37),(215,'Coihueco',37),(216,'San Nicolás',37),(217,'Ñiquén',37),(218,'San Fabián',37),(219,'Alto Biobío',38),(220,'Antuco',38),(221,'Cabrero',38),(222,'Laja',38),(223,'Los Ángeles',38),(224,'Mulchén',38),(225,'Nacimiento',38),(226,'Negrete',38),(227,'Quilaco',38),(228,'Quilleco',38),(229,'San Rosendo',38),(230,'Santa Bárbara',38),(231,'Tucapel',38),(232,'Yumbel',38),(233,'Concepción',39),(234,'Coronel',39),(235,'Chiguayante',39),(236,'Florida',39),(237,'Hualpén',39),(238,'Hualqui',39),(239,'Lota',39),(240,'Penco',39),(241,'San Pedro de La Paz',39),(242,'Santa Juana',39),(243,'Talcahuano',39),(244,'Tomé',39),(245,'Arauco',40),(246,'Cañete',40),(247,'Contulmo',40),(248,'Curanilahue',40),(249,'Lebu',40),(250,'Los Álamos',40),(251,'Tirúa',40),(252,'Angol',41),(253,'Collipulli',41),(254,'Curacautín',41),(255,'Ercilla',41),(256,'Lonquimay',41),(257,'Los Sauces',41),(258,'Lumaco',41),(259,'Purén',41),(260,'Renaico',41),(261,'Traiguén',41),(262,'Victoria',41),(263,'Temuco',42),(264,'Carahue',42),(265,'Cholchol',42),(266,'Cunco',42),(267,'Curarrehue',42),(268,'Freire',42),(269,'Galvarino',42),(270,'Gorbea',42),(271,'Lautaro',42),(272,'Loncoche',42),(273,'Melipeuco',42),(274,'Nueva Imperial',42),(275,'Padre Las Casas',42),(276,'Perquenco',42),(277,'Pitrufquén',42),(278,'Pucón',42),(279,'Saavedra',42),(280,'Teodoro Schmidt',42),(281,'Toltén',42),(282,'Vilcún',42),(283,'Villarrica',42),(284,'Valdivia',43),(285,'Corral',43),(286,'Lanco',43),(287,'Los Lagos',43),(288,'Máfil',43),(289,'Mariquina',43),(290,'Paillaco',43),(291,'Panguipulli',43),(292,'La Unión',44),(293,'Futrono',44),(294,'Lago Ranco',44),(295,'Río Bueno',44),(297,'Osorno',45),(298,'Puerto Octay',45),(299,'Purranque',45),(300,'Puyehue',45),(301,'Río Negro',45),(302,'San Juan de la Costa',45),(303,'San Pablo',45),(304,'Calbuco',46),(305,'Cochamó',46),(306,'Fresia',46),(307,'Frutillar',46),(308,'Llanquihue',46),(309,'Los Muermos',46),(310,'Maullín',46),(311,'Puerto Montt',46),(312,'Puerto Varas',46),(313,'Ancud',47),(314,'Castro',47),(315,'Chonchi',47),(316,'Curaco de Vélez',47),(317,'Dalcahue',47),(318,'Puqueldón',47),(319,'Queilén',47),(320,'Quellón',47),(321,'Quemchi',47),(322,'Quinchao',47),(323,'Chaitén',48),(324,'Futaleufú',48),(325,'Hualaihué',48),(326,'Palena',48),(327,'Lago Verde',49),(328,'Coihaique',49),(329,'Aysén',50),(330,'Cisnes',50),(331,'Guaitecas',50),(332,'Río Ibáñez',51),(333,'Chile Chico',51),(334,'Cochrane',52),(335,'O\'Higgins',52),(336,'Tortel',52),(337,'Natales',53),(338,'Torres del Paine',53),(339,'Laguna Blanca',54),(340,'Punta Arenas',54),(341,'Río Verde',54),(342,'San Gregorio',54),(343,'Porvenir',55),(344,'Primavera',55),(345,'Timaukel',55),(346,'Cabo de Hornos',56),(347,'Antártica',56);
/*!40000 ALTER TABLE `cons_comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cons_perfil`
--

DROP TABLE IF EXISTS `cons_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cons_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cons_perfil`
--

LOCK TABLES `cons_perfil` WRITE;
/*!40000 ALTER TABLE `cons_perfil` DISABLE KEYS */;
INSERT INTO `cons_perfil` VALUES (1,'administrador'),(2,'dirigente'),(3,'colaborador');
/*!40000 ALTER TABLE `cons_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cons_provincia`
--

DROP TABLE IF EXISTS `cons_provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cons_provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cons_provincia_cons_region_idx` (`region_id`),
  CONSTRAINT `fk_cons_provincia_cons_region` FOREIGN KEY (`region_id`) REFERENCES `cons_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cons_provincia`
--

LOCK TABLES `cons_provincia` WRITE;
/*!40000 ALTER TABLE `cons_provincia` DISABLE KEYS */;
INSERT INTO `cons_provincia` VALUES (1,'Arica',1),(2,'Parinacota',1),(3,'Iquique',2),(4,'El Tamarugal',2),(5,'Tocopilla',3),(6,'El Loa',3),(7,'Antofagasta',3),(8,'Chañaral',4),(9,'Copiapó',4),(10,'Huasco',4),(11,'Elqui',5),(12,'Limarí',5),(13,'Choapa',5),(14,'Petorca',6),(15,'Los Andes',6),(16,'San Felipe de Aconcagua',6),(17,'Quillota',6),(18,'Valparaiso',6),(19,'San Antonio',6),(20,'Isla de Pascua',6),(21,'Marga Marga',6),(22,'Chacabuco',7),(23,'Santiago',7),(24,'Cordillera',7),(25,'Maipo',7),(26,'Melipilla',7),(27,'Talagante',7),(28,'Cachapoal',8),(29,'Colchagua',8),(30,'Cardenal Caro',8),(31,'Curicó',9),(32,'Talca',9),(33,'Linares',9),(34,'Cauquenes',9),(35,'Diguillín',10),(36,'Itata',10),(37,'Punilla',10),(38,'Bio Bío',11),(39,'Concepción',11),(40,'Arauco',11),(41,'Malleco',12),(42,'Cautín',12),(43,'Valdivia',13),(44,'Ranco',13),(45,'Osorno',14),(46,'Llanquihue',14),(47,'Chiloé',14),(48,'Palena',14),(49,'Coyhaique',15),(50,'Aysén',15),(51,'General Carrera',15),(52,'Capitán Prat',15),(53,'Última Esperanza',16),(54,'Magallanes',16),(55,'Tierra del Fuego',16),(56,'Antártica Chilena',16);
/*!40000 ALTER TABLE `cons_provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cons_region`
--

DROP TABLE IF EXISTS `cons_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cons_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `region_techo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cons_region`
--

LOCK TABLES `cons_region` WRITE;
/*!40000 ALTER TABLE `cons_region` DISABLE KEYS */;
INSERT INTO `cons_region` VALUES (1,'Arica y Parinacota',4),(2,'Tarapacá',1),(3,'Antofagasta',2),(4,'Atacama',3),(5,'Coquimbo',7),(6,'Valparaiso',16),(7,'Metropolitana de Santiago',13),(8,'Libertador General Bernardo O\'Higgins',15),(9,'Maule',12),(10,'Ñuble',14),(11,'Biobío',6),(12,'La Araucanía',8),(13,'Los Ríos',10),(14,'Los Lagos',9),(15,'Aysén del General Carlos Ibáñez del Campo',5),(16,'Magallanes y de la Antártica Chilena',11);
/*!40000 ALTER TABLE `cons_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cons_tipo_actividad`
--

DROP TABLE IF EXISTS `cons_tipo_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cons_tipo_actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cons_tipo_actividad`
--

LOCK TABLES `cons_tipo_actividad` WRITE;
/*!40000 ALTER TABLE `cons_tipo_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `cons_tipo_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_usuario_mesa_trabajo`
--

DROP TABLE IF EXISTS `rel_usuario_mesa_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_usuario_mesa_trabajo` (
  `mesa_trabajo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  KEY `fk_rel_usuario_mesa_trabajo_tr_mesa_trabajo1_idx` (`mesa_trabajo_id`),
  KEY `fk_rel_usuario_mesa_trabajo_tr_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_rel_usuario_mesa_trabajo_tr_mesa_trabajo1` FOREIGN KEY (`mesa_trabajo_id`) REFERENCES `tr_mesa_trabajo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_usuario_mesa_trabajo_tr_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `tr_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_usuario_mesa_trabajo`
--

LOCK TABLES `rel_usuario_mesa_trabajo` WRITE;
/*!40000 ALTER TABLE `rel_usuario_mesa_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_usuario_mesa_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_activades`
--

DROP TABLE IF EXISTS `tr_activades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_activades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `tipo_actividad_id` int(11) NOT NULL,
  `mesa_trabajo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tr_activades_cons_tipo_actividad1_idx` (`tipo_actividad_id`),
  KEY `fk_tr_activades_tr_mesa_trabajo1_idx` (`mesa_trabajo_id`),
  CONSTRAINT `fk_tr_activades_cons_tipo_actividad1` FOREIGN KEY (`tipo_actividad_id`) REFERENCES `cons_tipo_actividad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tr_activades_tr_mesa_trabajo1` FOREIGN KEY (`mesa_trabajo_id`) REFERENCES `tr_mesa_trabajo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_activades`
--

LOCK TABLES `tr_activades` WRITE;
/*!40000 ALTER TABLE `tr_activades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tr_activades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_mesa_trabajo`
--

DROP TABLE IF EXISTS `tr_mesa_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_mesa_trabajo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comunidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `latitud` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `longitud` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `comuna_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tr_mesa_trabajo_cons_comuna1_idx` (`comuna_id`),
  CONSTRAINT `fk_tr_mesa_trabajo_cons_comuna1` FOREIGN KEY (`comuna_id`) REFERENCES `cons_comuna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_mesa_trabajo`
--

LOCK TABLES `tr_mesa_trabajo` WRITE;
/*!40000 ALTER TABLE `tr_mesa_trabajo` DISABLE KEYS */;
INSERT INTO `tr_mesa_trabajo` VALUES (1,'nombre','comunidad','latitud','longitud',0,1),(2,'Mesa 1','Comunidad 1','-231231','-123123',1,91);
/*!40000 ALTER TABLE `tr_mesa_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_usuario`
--

DROP TABLE IF EXISTS `tr_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_paterno` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_materno` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `perfil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tr_usuario_cons_perfil1_idx` (`perfil_id`),
  CONSTRAINT `fk_tr_usuario_cons_perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `cons_perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_usuario`
--

LOCK TABLES `tr_usuario` WRITE;
/*!40000 ALTER TABLE `tr_usuario` DISABLE KEYS */;
INSERT INTO `tr_usuario` VALUES (1,'adm','adm','adm','adm@gmail.com','123456',1,1),(2,'dirigente','dirigente','dirigente','dirigente@gmail.com','123456',1,2),(3,'colaborador','colaborador','colaborador','colaborador@gmail.com','123456',1,3),(4,'dirigenteNuevo','dirigenteNuevo','dirigenteNuevo','dirigenteNuevo@gmail.com','1234567',0,2);
/*!40000 ALTER TABLE `tr_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'techochile'
--

--
-- Dumping routines for database 'techochile'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-12 13:51:55
