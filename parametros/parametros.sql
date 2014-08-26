/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 08-02-2009 18:46:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for parametros
-- ----------------------------
DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros` (
  `indice` int(1) default NULL,
  `usuario` varchar(10) default NULL,
  `clave` varchar(10) default NULL,
  `servidor` varchar(20) default NULL,
  `basedatos` varchar(20) default NULL,
  `numeracionfactura` decimal(10,0) default NULL,
  `setnumfac` decimal(1,0) default NULL,
  `fondofac` text,
  `imagenfac` varchar(30) default NULL,
  `fondoguia` text,
  `imagenguia` varchar(30) default NULL,
  `filasdetallefactura` int(2) default NULL,
  `ivaimp` decimal(2,0) default NULL,
  `nombremoneda` varchar(30) default NULL,
  `simbolomoneda` varchar(1) default NULL,
  `codigomonedate` varchar(10) default NULL,
  `nomempresa` varchar(30) default NULL,
  `giro` varchar(30) default NULL,
  `fonos` varchar(30) default NULL,
  `direccion` varchar(30) default NULL,
  `comuna` varchar(30) default NULL,
  `ciudadactual` varchar(30) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `parametros` VALUES ('1', 'root', 'mp5252', 'localhost', 'test', '800', '0', 'SI', 'Factura v3.jpg', 'SI', 'logo.jpg', '24', '19', 'Pesos', '$', 'chr36;', 'Profesionales y Empresas', 'Desarrollo de Sistemas', '72717721', 'Portugal 12', 'Santiago', 'Santiago');
