USE sql9221388;
DROP TABLE IF EXISTS CONSULTAS CASCADE;
DROP TABLE IF EXISTS `PACIENTES` CASCADE;
DROP TABLE IF EXISTS POLIZAS_APROBADAS CASCADE;
DROP TABLE IF EXISTS TIPOS_POLIZA CASCADE;
DROP TABLE IF EXISTS CLIENTES CASCADE;
DROP TABLE IF EXISTS ESTUDIANTES_CURSOS CASCADE ;
DROP TABLE IF EXISTS CURSOS CASCADE;
DROP TABLE IF EXISTS ESTUDIANTES CASCADE ;

CREATE TABLE `PACIENTES` (
  `id` int(11) NOT NULL,
  `tipo_id` enum('cc','ce','rc','ti') COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`,`tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


CREATE TABLE `CONSULTAS` (
  `idCONSULTAS` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_y_hora` datetime NOT NULL,
  `resumen` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `PACIENTES_id` int(11) NOT NULL DEFAULT '0',
  `PACIENTES_tipo_id` enum('cc','ce','rc','ti') COLLATE latin1_general_ci NOT NULL DEFAULT 'cc',
  PRIMARY KEY (`idCONSULTAS`),
  KEY `fk_CONSULTAS_PACIENTES1` (`PACIENTES_id`,`PACIENTES_tipo_id`),
  CONSTRAINT `fk_CONSULTAS_PACIENTES1` FOREIGN KEY (`PACIENTES_id`, `PACIENTES_tipo_id`) REFERENCES `PACIENTES` (`id`, `tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


LOCK TABLES `PACIENTES` WRITE;
/*!40000 ALTER TABLE `PACIENTES` DISABLE KEYS */;

INSERT INTO `PACIENTES` (`id`, `tipo_id`, `nombre`, `fecha_nacimiento`)
VALUES
	(1,'cc','jhon','2015-02-02');
UNLOCK TABLES;


/*----------------------------------------------------------------*/


CREATE TABLE `TIPOS_POLIZA` (
  `codigo_poliza` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `descripcion` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `monto_maximo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo_poliza`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `TIPOS_POLIZA` DISABLE KEYS */;
CREATE TABLE `CLIENTES` (
  `id` int(11) NOT NULL,
  `tipo_id` enum('cc','ce','ti') COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `direccion` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `telefono` varchar(45) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`,`tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `CLIENTES` DISABLE KEYS */;
CREATE TABLE `POLIZAS_APROBADAS` (
  `fecha_aprobacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `CLIENTES_id` int(11) NOT NULL,
  `CLIENTES_tipo_id` enum('cc','ce','ti') COLLATE latin1_general_ci NOT NULL,
  `POLIZAS_codigo_poliza` int(11) NOT NULL,
  PRIMARY KEY (`CLIENTES_id`,`CLIENTES_tipo_id`,`POLIZAS_codigo_poliza`),
  KEY `fk_SOLICITUDES_POLIZAS1` (`POLIZAS_codigo_poliza`),
  CONSTRAINT `fk_SOLICITUDES_CLIENTES` FOREIGN KEY (`CLIENTES_id`, `CLIENTES_tipo_id`) REFERENCES `CLIENTES` (`id`, `tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SOLICITUDES_POLIZAS1` FOREIGN KEY (`POLIZAS_codigo_poliza`) REFERENCES `TIPOS_POLIZA` (`codigo_poliza`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40000 ALTER TABLE `POLIZAS_APROBADAS` DISABLE KEYS */;





/*------------------------------------------------------------------ */
LOCK TABLES `CLIENTES` WRITE;
INSERT INTO `CLIENTES` (`id`, `tipo_id`, `nombre`, `direccion`, `telefono`)
VALUES
	(-1500496460,'cc','Sebascho','sebascho dir','my Phone'),
	(-1500393490,'cc','Sebascho','sebascho dir','my Phone'),
	(-1499201791,'cc','FachadaCliente','fachadaDireccionCliente','TelefonoClienteFachada'),
	(-1499200301,'cc','Sebascho','sebascho dir','my Phone'),
	(-912883381,'cc','Sebascho','sebascho dir','my Phone'),
	(-912881964,'cc','FachadaCliente','fachadaDireccionCliente','TelefonoClienteFachada'),
	(-912358658,'cc','Sebascho','sebascho dir','my Phone'),
	(-912358330,'cc','FachadaCliente','fachadaDireccionCliente','TelefonoClienteFachada'),
	(-909844878,'cc','FachadaCliente','fachadaDireccionCliente','TelefonoClienteFachada'),
	(-909839144,'cc','Sebascho','sebascho dir','my Phone'),
	(-908990817,'cc','FachadaCliente','fachadaDireccionCliente','TelefonoClienteFachada'),
	(-908987436,'cc','Sebascho','sebascho dir','my Phone'),
	(-907096641,'cc','Sebascho','sebascho dir','my Phone'),
	(-907096375,'cc','FachadaCliente','fachadaDireccionCliente','TelefonoClienteFachada'),
	(1,'cc','Juan Perez','CALLE FALSA 123','12345678'),
	(3,'cc','Cosme Fulanito','Avenida Siempre viva 123','018000127000'),
	(10,'cc','paco','av','123'),
	(23,'cc','Diana','Di','1234'),
	(83,'cc','Tata','La vida te da sorpresas','7310301'),
	(100,'cc','nancy','carrera 5 # 86-30','6987369'),
	(114,'cc','nancy','carrera 5 # 86-30','6987369'),
	(115,'cc','nancy','carrera 5 # 86-30','6987369'),
	(123,'cc','Cosme Fulanito','Avenida Siempre viva 123','018000127000'),
	(202,'cc','ana','av','123'),
	(300,'cc','cliente','Calle 100 carrera 30','1234567'),
	(301,'cc','cliente','Calle 100 carrera 30','1234567'),
	(302,'cc','cliente','Calle 100 carrera 30','1234567'),
	(303,'cc','cliente','Calle 100 carrera 30','1234567'),
	(304,'cc','cliente','Calle 100 carrera 30','1234567'),
	(305,'cc','cliente','Calle 100 carrera 30','1234567'),
	(306,'cc','cliente','Calle 100 carrera 30','1234567'),
	(500,'cc','cliente','Calle 100 carrera 30','1234567'),
	(551,'cc','nancy','carrera 5 # 86-30','6987369'),
	(666,'cc','Tata','La vida te da sorpresas','7310301'),
	(777,'cc','nancy','carrera 5 # 86-30','6987369'),
	(787,'cc','Tata','La vida te da sorpresas','7310301'),
	(1010,'cc','paco','av','123'),
	(1234,'cc','Cosme Fulanito','Avenida Siempre viva 123','018000127000'),
	(1274,'cc','nancy','carrera 5 # 86-30','6987369'),
	(1438,'cc','Fabio','Autopista sur','3246533'),
	(1439,'cc','Fabio','Autopista sur','3246533'),
	(4151,'cc','Marcos','xxxxxx','yyyyyy'),
	(12453,'cc','Juanito','Cra 18 #45-78','8524578'),
	(20212,'cc','ana','av','123'),
	(20213,'cc','ana','av','123'),
	(20214,'cc','ana','av','123'),
	(20215,'cc','ana','av','123'),
	(20216,'cc','ana','av','123'),
	(20217,'cc','ana','av','123'),
	(20218,'cc','ana','av','123'),
	(20219,'cc','ana','av','123'),
	(20220,'cc','ana','av','123'),
	(34567,'cc','Juan Perez','CALLE FALSA 123','12345678'),
	(40394,'cc','Miguel M','cll 7','3144482287'),
	(125445,'cc','Juan Perez','CALLE FALSA 123','12345678'),
	(131313,'cc','trollTrolencio','calle del troll','3685800'),
	(373724,'cc','Diego Prieto','Callse','tel'),
	(403944,'cc','Miguel M','cll 7','3144412287'),
	(639427,'cc','Diego Prieto','Callse','tel'),
	(678976,'cc','cathe','Cra 23 56 78 sur','6789098'),
	(911129,'cc','Andres M','Al infinito y mas allá','linea caliente'),
	(1014270,'cc','Marcos','xxxxxx','yyyyyy'),
	(1018462,'cc','Tata','La vida te da sorpresas','7310301'),
	(1020372,'cc','Diego Prieto','Calle falsa 5','1234567'),
	(1024530,'cc','Rodrigo','AK 105','7129886'),
	(1032463,'cc','Pos','calle 123','1234567'),
	(1055694,'cc','Homero Simpson','avenida siempre viva 58','1445644'),
	(2077015,'cc','catherine','trv 45 34','8786543'),
	(2077776,'cc','Duarte NiÃ±o','localidad kennedy','01-9000-696959-9'),
	(2078264,'cc','Pepito Perez','Direccion X','7789809'),
	(2081584,'cc','AndrÃ©s Parra','Cra 83 65 31 sur','7838594'),
	(2082775,'cc','Juan David Castro','Calle falsa 123','555 5555'),
	(2083164,'cc','Daniel','Av. Falsa 123','0123456789'),
	(2083431,'cc','CCGA','Zipaquira','3133882060'),
	(2083809,'cc','CCGA','Zipaquira','3133882060'),
	(2085547,'cc','Mario','Calle 147 # 21',''),
	(10324634,'cc','Posito','calle 1234','1234568'),
	(10394567,'cc','David Saavedra','Cll 170 N 43-60','4568612'),
	(10525658,'cc','Bart Simpson','calle falsa 123','1446644'),
	(20827755,'cc','Juan David Castro S','Calle falsa 123','555 5555'),
	(789456123,'cc','Marte','Extraterrestr','852'),
	(1000222444,'cc','Pedro Gutierrez','Cll 170 N 43-60','4568612'),
	(1014227392,'cc','Gustavo Adolfo Ovalle','Diagonal 86 a # 102 - 50','4767994'),
	(1014250231,'cc','Sebastian','spr','12345'),
	(1015420935,'cc','David Guarnizo','Bogotá','3003331603'),
	(1015428223,'cc','Diana','Di','1234'),
	(1020764472,'cc','Jairo','kra 7h #..','2593953'),
	(1024530883,'cc','Pedro','AK 105','7129886'),
	(1033739673,'cc','Jonathan Sanduchitos','AK Escuela','71727');

/*!40000 ALTER TABLE `CLIENTES` ENABLE KEYS */;
UNLOCK TABLES;




CREATE TABLE `CURSOS` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `nemonico` varchar(45) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

LOCK TABLES `CURSOS` WRITE;
/*!40000 ALTER TABLE `CURSOS` DISABLE KEYS */;

INSERT INTO `CURSOS` (`id`, `nombre`, `nemonico`)
VALUES
	(0,'DiegoPrietoMateria','DPMT'),
	(1,'Construccion de Software 2013','COSW');
	

/*!40000 ALTER TABLE `CURSOS` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `ESTUDIANTES` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

LOCK TABLES `ESTUDIANTES` WRITE;
/*!40000 ALTER TABLE `ESTUDIANTES` DISABLE KEYS */;

INSERT INTO `ESTUDIANTES` (`codigo`, `nombre`)
VALUES
	(2,'DiegoL'),
	(24,'DiegoS');
	

/*!40000 ALTER TABLE `ESTUDIANTES` ENABLE KEYS */;
UNLOCK TABLES;


CREATE TABLE `ESTUDIANTES_CURSOS` (
  `ESTUDIANTES_codigo` int(11) NOT NULL,
  `CURSOS_id` int(11) NOT NULL,
  PRIMARY KEY (`ESTUDIANTES_codigo`,`CURSOS_id`),
  KEY `fk_ESTUDIANTES_has_CURSOS_CURSOS1` (`CURSOS_id`),
  KEY `fk_ESTUDIANTES_has_CURSOS_ESTUDIANTES1` (`ESTUDIANTES_codigo`),
  CONSTRAINT `fk_ESTUDIANTES_has_CURSOS_CURSOS1` FOREIGN KEY (`CURSOS_id`) REFERENCES `CURSOS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ESTUDIANTES_has_CURSOS_ESTUDIANTES1` FOREIGN KEY (`ESTUDIANTES_codigo`) REFERENCES `ESTUDIANTES` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `ESTUDIANTES_CURSOS` DISABLE KEYS */;
LOCK TABLES `TIPOS_POLIZA` WRITE;
INSERT INTO `TIPOS_POLIZA` (`codigo_poliza`, `nombre`, `descripcion`, `monto_maximo`)
VALUES
	(-1500496538,'NuevaPoliza','Esta es una nueva Poliza',25),
	(-1500393573,'NuevaPoliza','Esta es una nueva Poliza',25),
	(-1499201057,'polizaFachada','Esta es una poliza de fachada',25),
	(-1499200317,'NuevaPoliza','Esta es una nueva Poliza',25),
	(-912883511,'NuevaPoliza','Esta es una nueva Poliza',25),
	(-912876506,'polizaFachada','Esta es una poliza de fachada',25),
	(-912358767,'NuevaPoliza','Esta es una nueva Poliza',25),
	(-912355969,'polizaFachada','Esta es una poliza de fachada',25),
	(-909842331,'polizaFachada','Esta es una poliza de fachada',25),
	(-909839238,'NuevaPoliza','Esta es una nueva Poliza',25),
	(-908989367,'polizaFachada','Esta es una poliza de fachada',25),
	(-908987538,'NuevaPoliza','Esta es una nueva Poliza',25),
	(-907096764,'NuevaPoliza','Esta es una nueva Poliza',25),
	(-907095185,'polizaFachada','Esta es una poliza de fachada',25),
	(0,'fachadaOpDiego','fachadaOpDiego',888),
	(1,'Seguro Social','Recuperar pacientes',50000),
	(2,'Theft Policy','Poliza contra Robo',2800000),
	(3,'Seguros Don Barredora','Yo soy don barredora y vengo a limpiar, la en',1000000),
	(38,'jajja','ddddddd',2000),
	(48,'jajja','ddddddd',2000),
	(55,'diegoPrueba','poliza de prueba',2000),
	(101,'arrendamientoo','tipo de poliza ',55555),
	(111,'p1','La poli',2312321),
	(123,'p1','la poliza 444',22),
	(201,'Seguro Social','Recuperar pacientes',500000),
	(355,'arrendamientoo','tipo de poliza ',444),
	(444,'p1','la poliza 444',22),
	(445,'p1','la poliza 444',22),
	(601,'Seguro Social','Recuperar pacientes',500000),
	(888,'arrendamientoo','tipo de poliza ',444),
	(1000,'Poliza prueba','... descripción',12000000),
	(2000,'jajja','ddddddd',2000),
	(2212,'p1','la poliza 444',22),
	(3000,'jajja','ddddddd',2000),
	(3332,'p1','la poliza 444',22),
	(3548,'jajja','ddddddd',2000),
	(3569,'Seguro','nnnnnn',900000),
	(22221,'p1','la poliza 444',22),
	(33322,'p1','LA PRUEBA',22),
	(102037,'fachada','fachada',5852),
	(102038,'fachada','fachada',5852),
	(102039,'fachada','fachadaRest',5852),
	(122221,'p1','la poliza 444',22),
	(201536,'p1','La poli2',2312321),
	(333221,'p1','LA PRUEBA',22),
	(333222,'p1','LA PRUEBA',22),
	(553324,'p1','la poliza 444',22),
	(999999,'NuevaPoliza','Esta es una nueva Poliza',25),
	(1020372,'dPTans','poliza de prueba trans',8050),
	(123451267,'Poliza_Accidente','Descripcion',500000);


UNLOCK TABLES;

LOCK TABLES `ESTUDIANTES_CURSOS` WRITE;
INSERT INTO `ESTUDIANTES_CURSOS` (`ESTUDIANTES_codigo`, `CURSOS_id`)
VALUES
	(2,0),
	(24,1);

/*!40000 ALTER TABLE `ESTUDIANTES_CURSOS` ENABLE KEYS */;
UNLOCK TABLES;