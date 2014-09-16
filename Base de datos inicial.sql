SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for albalinea
-- ----------------------------
DROP TABLE IF EXISTS `albalinea`;
CREATE TABLE `albalinea` (
  `codalbaran` int(11) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) character set utf8 default NULL,
  `cantidad` int(19) NOT NULL default '0.0000',
  `precio` int(19) NOT NULL default '0.0000',
  `importe` int(19) NOT NULL default '0.0000',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for albalineap
-- ----------------------------
DROP TABLE IF EXISTS `albalineap`;
CREATE TABLE `albalineap` (
  `codalbaran` varchar(20) NOT NULL default '0',
  `codproveedor` int(5) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) default NULL,
  `cantidad` int(10) NOT NULL default '0',
  `precio` int(19) NOT NULL default '0.0000',
  `importe` int(19) NOT NULL default '0.0000',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`codproveedor`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for albalineaptmp
-- ----------------------------
DROP TABLE IF EXISTS `albalineaptmp`;
CREATE TABLE `albalineaptmp` (
  `codalbaran` int(11) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) default NULL,
  `cantidad` int(19) NOT NULL default '0.0000',
  `precio` int(19) NOT NULL default '0.0000',
  `importe` int(19) NOT NULL default '0.0000',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for albalineatmp
-- ----------------------------
DROP TABLE IF EXISTS `albalineatmp`;
CREATE TABLE `albalineatmp` (
  `codalbaran` int(11) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) character set utf8 default NULL,
  `cantidad` int(19) NOT NULL default '0.0000',
  `precio` int(19) NOT NULL default '0.0000',
  `importe` int(19) NOT NULL default '0.0000',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for albaranes
-- ----------------------------
DROP TABLE IF EXISTS `albaranes`;
CREATE TABLE `albaranes` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `codfactura` int(11) NOT NULL default '0',
  `fecha` date NOT NULL default '0000-00-00',
  `iva` tinyint(4) NOT NULL default '0',
  `codcliente` int(5) default '0',
  `estado` varchar(1) character set utf8 default '1',
  `totalalbaran` int(19) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for albaranesp
-- ----------------------------
DROP TABLE IF EXISTS `albaranesp`;
CREATE TABLE `albaranesp` (
  `codalbaran` varchar(20) NOT NULL default '0',
  `codproveedor` int(5) NOT NULL default '0',
  `codfactura` varchar(20) default NULL,
  `fecha` date NOT NULL default '0000-00-00',
  `iva` tinyint(4) NOT NULL default '0',
  `estado` varchar(1) default '1',
  `totalalbaran` int(19) NOT NULL default '0.0000',
  PRIMARY KEY  (`codalbaran`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for albaranesptmp
-- ----------------------------
DROP TABLE IF EXISTS `albaranesptmp`;
CREATE TABLE `albaranesptmp` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Temporal de albaranes de proveedores para controlar acceso s';

-- ----------------------------
-- Table structure for albaranestmp
-- ----------------------------
DROP TABLE IF EXISTS `albaranestmp`;
CREATE TABLE `albaranestmp` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COMMENT='Temporal de albaranes para controlar acceso simultaneo';

-- ----------------------------
-- Table structure for articulos
-- ----------------------------
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `codarticulo` int(10) NOT NULL auto_increment,
  `codfamilia` int(5) NOT NULL,
  `referencia` varchar(20) NOT NULL,
  `descripcion` text NOT NULL,
  `impuesto` float NOT NULL,
  `codproveedor1` int(5) NOT NULL default '1',
  `codproveedor2` int(5) NOT NULL,
  `descripcion_corta` varchar(30) NOT NULL,
  `codubicacion` int(3) NOT NULL,
  `stock` int(10) NOT NULL,
  `stock_minimo` int(8) NOT NULL,
  `aviso_minimo` varchar(1) NOT NULL default '0',
  `datos_producto` varchar(200) NOT NULL,
  `fecha_alta` date NOT NULL default '0000-00-00',
  `codembalaje` int(3) NOT NULL,
  `unidades_caja` int(8) NOT NULL,
  `precio_ticket` varchar(1) NOT NULL default '0',
  `modificar_ticket` varchar(1) NOT NULL default '0',
  `observaciones` text NOT NULL,
  `precio_compra` int(19) default NULL,
  `precio_almacen` int(19) default NULL,
  `precio_tienda` int(19) default NULL,
  `precio_pvp` int(19) default NULL,
  `precio_iva` int(19) default NULL,
  `codigobarras` varchar(15) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codarticulo`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Articulos';

-- ----------------------------
-- Table structure for artpro
-- ----------------------------
DROP TABLE IF EXISTS `artpro`;
CREATE TABLE `artpro` (
  `codarticulo` varchar(15) NOT NULL,
  `codfamilia` int(3) NOT NULL,
  `codproveedor` int(5) NOT NULL,
  `precio` int(19) NOT NULL,
  PRIMARY KEY  (`codarticulo`,`codfamilia`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `codcliente` int(5) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `nif` varchar(13) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codprovincia` int(2) NOT NULL default '0',
  `localidad` varchar(35) NOT NULL,
  `codformapago` int(2) NOT NULL default '0',
  `codentidad` int(2) NOT NULL default '0',
  `cuentabancaria` varchar(20) NOT NULL,
  `codpostal` varchar(5) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `web` varchar(45) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codcliente`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Clientes';

-- ----------------------------
-- Table structure for cobros
-- ----------------------------
DROP TABLE IF EXISTS `cobros`;
CREATE TABLE `cobros` (
  `id` int(11) NOT NULL auto_increment,
  `codfactura` int(11) NOT NULL,
  `codcliente` int(5) NOT NULL,
  `importe` int(19) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numdocumento` varchar(30) NOT NULL,
  `fechacobro` date NOT NULL default '0000-00-00',
  `observaciones` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Cobros de facturas a clientes';

-- ----------------------------
-- Table structure for embalajes
-- ----------------------------
DROP TABLE IF EXISTS `embalajes`;
CREATE TABLE `embalajes` (
  `codembalaje` int(3) NOT NULL auto_increment,
  `nombre` varchar(30) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codembalaje`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Embalajes';

-- ----------------------------
-- Table structure for entidades
-- ----------------------------
DROP TABLE IF EXISTS `entidades`;
CREATE TABLE `entidades` (
  `codentidad` int(2) NOT NULL auto_increment,
  `nombreentidad` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codentidad`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Entidades Bancarias';

-- ----------------------------
-- Table structure for factulinea
-- ----------------------------
DROP TABLE IF EXISTS `factulinea`;
CREATE TABLE `factulinea` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` int(19) NOT NULL,
  `precio` int(19) NOT NULL,
  `importe` int(19) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas a clientes';

-- ----------------------------
-- Table structure for factulineap
-- ----------------------------
DROP TABLE IF EXISTS `factulineap`;
CREATE TABLE `factulineap` (
  `codfactura` varchar(20) NOT NULL default '',
  `codproveedor` int(5) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` int(19) NOT NULL,
  `precio` int(19) NOT NULL,
  `importe` int(19) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`codproveedor`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas de proveedores';

-- ----------------------------
-- Table structure for factulineaptmp
-- ----------------------------
DROP TABLE IF EXISTS `factulineaptmp`;
CREATE TABLE `factulineaptmp` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` int(19) NOT NULL,
  `precio` int(19) NOT NULL,
  `importe` int(19) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas de proveedores temporal';

-- ----------------------------
-- Table structure for factulineatmp
-- ----------------------------
DROP TABLE IF EXISTS `factulineatmp`;
CREATE TABLE `factulineatmp` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` int(19) NOT NULL,
  `precio` int(19) NOT NULL,
  `importe` int(19) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Temporal de linea de facturas a clientes';

-- ----------------------------
-- Table structure for facturas
-- ----------------------------
DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  `iva` tinyint(4) NOT NULL,
  `codcliente` int(5) NOT NULL,
  `estado` varchar(1) NOT NULL default '0',
  `totalfactura` int(19) NOT NULL,
  `fechavencimiento` date NOT NULL default '0000-00-00',
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='facturas de ventas a clientes';

-- ----------------------------
-- Table structure for facturasp
-- ----------------------------
DROP TABLE IF EXISTS `facturasp`;
CREATE TABLE `facturasp` (
  `codfactura` varchar(20) NOT NULL default '',
  `codproveedor` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `iva` tinyint(4) NOT NULL,
  `estado` varchar(1) NOT NULL default '0',
  `totalfactura` int(19) NOT NULL,
  `fechapago` date NOT NULL default '0000-00-00',
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfactura`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='facturas de compras a proveedores';

-- ----------------------------
-- Table structure for facturasptmp
-- ----------------------------
DROP TABLE IF EXISTS `facturasptmp`;
CREATE TABLE `facturasptmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='temporal de facturas de proveedores';

-- ----------------------------
-- Table structure for facturastmp
-- ----------------------------
DROP TABLE IF EXISTS `facturastmp`;
CREATE TABLE `facturastmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM AUTO_INCREMENT=305 DEFAULT CHARSET=utf8 COMMENT='temporal de facturas a clientes';

-- ----------------------------
-- Table structure for familias
-- ----------------------------
DROP TABLE IF EXISTS `familias`;
CREATE TABLE `familias` (
  `codfamilia` int(5) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfamilia`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='familia de articulos';

-- ----------------------------
-- Table structure for formapago
-- ----------------------------
DROP TABLE IF EXISTS `formapago`;
CREATE TABLE `formapago` (
  `codformapago` int(2) NOT NULL auto_increment,
  `nombrefp` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codformapago`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Forma de pago';

-- ----------------------------
-- Table structure for impuestos
-- ----------------------------
DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos` (
  `codimpuesto` int(3) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `valor` int(19) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codimpuesto`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='tipos de impuestos';

-- ----------------------------
-- Table structure for librodiario
-- ----------------------------
DROP TABLE IF EXISTS `librodiario`;
CREATE TABLE `librodiario` (
  `id` int(8) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  `tipodocumento` varchar(1) NOT NULL,
  `coddocumento` varchar(20) NOT NULL,
  `codcomercial` int(5) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numpago` varchar(30) NOT NULL,
  `total` int(19) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='Movimientos diarios';

-- ----------------------------
-- Table structure for pagos
-- ----------------------------
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL auto_increment,
  `codfactura` varchar(20) NOT NULL,
  `codproveedor` int(5) NOT NULL,
  `importe` int(19) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numdocumento` varchar(30) NOT NULL,
  `fechapago` date default '0000-00-00',
  `observaciones` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Pagos de facturas a proveedores';

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
  `ivaimp` int(2) default NULL,
  `nombremoneda` varchar(20) default NULL,
  `simbolomoneda` varchar(20) default NULL,
  `codigomoneda` varchar(10) default NULL,
  `nomempresa` tinytext,
  `giro` varchar(50) default NULL,
  `fonos` varchar(30) default NULL,
  `direccion` varchar(30) default NULL,
  `comuna` varchar(30) default NULL,
  `ciudadactual` varchar(30) default NULL,
  `numerofiscal` varchar(20) default NULL,
  `resolucionsii` varchar(50) default NULL,
  `rutempresa` varchar(20) default NULL,
  `giro2` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for petroleo
-- ----------------------------
DROP TABLE IF EXISTS `petroleo`;
CREATE TABLE `petroleo` (
  `mes` int(11) default NULL,
  `precio` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `codproveedor` int(5) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `nif` varchar(12) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codprovincia` int(2) NOT NULL,
  `localidad` varchar(35) NOT NULL,
  `codentidad` int(2) NOT NULL,
  `cuentabancaria` varchar(20) NOT NULL,
  `codpostal` varchar(5) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `web` varchar(45) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codproveedor`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Proveedores';

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `codprovincia` int(2) NOT NULL auto_increment,
  `nombreprovincia` varchar(40) NOT NULL,
  PRIMARY KEY  (`codprovincia`)
) ENGINE=MyISAM AUTO_INCREMENT=16406 DEFAULT CHARSET=utf8 COMMENT='Provincias';

-- ----------------------------
-- Table structure for tabbackup
-- ----------------------------
DROP TABLE IF EXISTS `tabbackup`;
CREATE TABLE `tabbackup` (
  `id` int(6) NOT NULL auto_increment,
  `denominacion` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `archivo` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ubicaciones
-- ----------------------------
DROP TABLE IF EXISTS `ubicaciones`;
CREATE TABLE `ubicaciones` (
  `codubicacion` int(3) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codubicacion`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Ubicaciones';

-- ----------------------------
-- Table structure for uf
-- ----------------------------
DROP TABLE IF EXISTS `uf`;
CREATE TABLE `uf` (
  `Fecha` varchar(20) default NULL,
  `Valor` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(20) NOT NULL auto_increment,
  `full_name` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_name` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_pwd` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_email` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `activation_code` int(10) NOT NULL default '0',
  `joined` date NOT NULL default '0000-00-00',
  `country` varchar(100) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_activated` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vendedores
-- ----------------------------
DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE `vendedores` (
  `codvendedor` int(5) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `nif` varchar(12) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codprovincia` int(2) NOT NULL default '0',
  `localidad` varchar(35) NOT NULL,
  `codpostal` varchar(5) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codvendedor`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Clientes';

-- ----------------------------
-- Records 
-- ----------------------------
Banco de Chile
Banco Internacional
Scotiabank Chile
Banco de Crédito e Inversiones
Corpbanca
Banco Bice
HSBC Bank (Chile)

Banco Santander-Chile
Banco Itaú Chile
Banco Security
Banco Falabella
Deutsche Bank (Chile)
Banco Ripley
Rabobank Chile
Banco Consorcio
Banco Penta
Banco Paris y Banco Bilbao Vizcaya Argentaria
Chile (BBVA)
Banco Estado
INSERT INTO `clientes` VALUES ('1', 'Cliente Mostrador', 'NA', 'NA', '0', '', '0', '0', '', '', '', '', '', '', '0');

INSERT INTO `embalajes` VALUES ('1', 'Caja', '0');

INSERT INTO `entidades` VALUES ('3', 'Banco de Chile', '0');
INSERT INTO `entidades` VALUES ('4', 'Banco Internacional', '0');
INSERT INTO `entidades` VALUES ('5', 'Scotiabank Chile', '0');
INSERT INTO `entidades` VALUES ('6', 'Banco de Crédito e Inversiones', '0');
INSERT INTO `entidades` VALUES ('7', 'Corpbanca', '0');
INSERT INTO `entidades` VALUES ('8', 'Banco Bice', '0');
INSERT INTO `entidades` VALUES ('9', 'HSBC Bank (Chile)', '0');

INSERT INTO `entidades` VALUES ('10', 'Banco Santander-Chile', '0');
INSERT INTO `entidades` VALUES ('11', 'Banco Itaú Chile', '0');
INSERT INTO `entidades` VALUES ('12', 'Banco Security', '0');
INSERT INTO `entidades` VALUES ('13', 'Banco Falabella', '0');
INSERT INTO `entidades` VALUES ('14', 'Deutsche Bank (Chile)', '0');
INSERT INTO `entidades` VALUES ('15', 'Banco Ripley', '0');
INSERT INTO `entidades` VALUES ('16', 'Rabobank Chile', '0');
INSERT INTO `entidades` VALUES ('17', 'Banco Consorcio', '0');
INSERT INTO `entidades` VALUES ('18', 'Banco Penta', '0');
INSERT INTO `entidades` VALUES ('19', 'Banco Paris y Banco Bilbao Vizcaya Argentaria', '0');
INSERT INTO `entidades` VALUES ('20', 'Chile (BBVA)', '0');
INSERT INTO `entidades` VALUES ('21', 'Banco Estado', '0');



INSERT INTO `formapago` VALUES ('1', 'Contado Efectivo', '0');
INSERT INTO `formapago` VALUES ('2', 'Contado Cheque', '0');
INSERT INTO `formapago` VALUES ('3', 'Cheque 30 y 60 ', '0');
INSERT INTO `formapago` VALUES ('4', 'Tarjeta de Credito', '0');

INSERT INTO `impuestos` VALUES ('1', 'IVA', '19.0000', '0');

INSERT INTO `parametros` VALUES ('1', '', '', '', '', '1', '0', 'SI', 'Factura v3.jpg', 'SI', 'logo.jpg', '24', '16', 'Pesos', '$', '$', 'Codeka CL', 'Sistemas para la PYME', '(555) 123-1234', 'Calle Pinguinos No. 123', 'Chile, D.F.', null, 'AAAA-123456-AAA', null, null, null);

--INSERT INTO `provincias` VALUES ('1', 'Aguascalientes');
--INSERT INTO `provincias` VALUES ('2', 'Baja California Norte');
--INSERT INTO `provincias` VALUES ('3', 'Baja California Sur');
--INSERT INTO `provincias` VALUES ('4', 'Chihuahua');
--INSERT INTO `provincias` VALUES ('5', 'Colima');
--INSERT INTO `provincias` VALUES ('6', 'Campeche');
--INSERT INTO `provincias` VALUES ('7', 'Coahuila');
--INSERT INTO `provincias` VALUES ('8', 'Chiapas');
--INSERT INTO `provincias` VALUES ('9', 'Distrito Federal');
--INSERT INTO `provincias` VALUES ('10', 'Durango');
--INSERT INTO `provincias` VALUES ('11', 'Guerrero');
--INSERT INTO `provincias` VALUES ('12', 'Guanajuato');
--INSERT INTO `provincias` VALUES ('13', 'Hidalgo');
--INSERT INTO `provincias` VALUES ('14', 'Jalisco');
--INSERT INTO `provincias` VALUES ('15', 'Michoacán');
--INSERT INTO `provincias` VALUES ('16', 'Morelos');
--INSERT INTO `provincias` VALUES ('17', 'Estado de México');
--INSERT INTO `provincias` VALUES ('18', 'Nayarit');
--INSERT INTO `provincias` VALUES ('19', 'Nuevo León');
--INSERT INTO `provincias` VALUES ('20', 'Oaxaca');
--INSERT INTO `provincias` VALUES ('21', 'Puebla');
--INSERT INTO `provincias` VALUES ('22', 'Quintana Roo');
--INSERT INTO `provincias` VALUES ('23', 'Querétaro');
--INSERT INTO `provincias` VALUES ('24', 'Sinaloa');
--INSERT INTO `provincias` VALUES ('25', 'San Luis Potosí');
--INSERT INTO `provincias` VALUES ('26', 'Sonora');
--INSERT INTO `provincias` VALUES ('27', 'Tabasco');
--INSERT INTO `provincias` VALUES ('28', 'Tlaxcala');
--INSERT INTO `provincias` VALUES ('29', 'Tamaulipas');
--INSERT INTO `provincias` VALUES ('30', 'Veracruz');
--INSERT INTO `provincias` VALUES ('31', 'Yucatán');
--INSERT INTO `provincias` VALUES ('32', 'Zacatecas');

INSERT INTO `ubicaciones` VALUES ('1', 'Bodega Central', '0');

INSERT INTO `provincias` VALUES ('1', 'ALGARROBO');
INSERT INTO `provincias` VALUES ('2', 'ALHUE');
INSERT INTO `provincias` VALUES ('3', 'ALTO BIOBIO');
INSERT INTO `provincias` VALUES ('4', 'ALTO DEL CARMEN');
INSERT INTO `provincias` VALUES ('5', 'ALTO HOSPICIO');
INSERT INTO `provincias` VALUES ('6', 'ANCUD');
INSERT INTO `provincias` VALUES ('7', 'ANDACOLLO');
INSERT INTO `provincias` VALUES ('8', 'ANGOL');
INSERT INTO `provincias` VALUES ('9', 'ANTOFAGASTA');
INSERT INTO `provincias` VALUES ('10', 'ANTUCO');
INSERT INTO `provincias` VALUES ('11', 'ARAUCO');
INSERT INTO `provincias` VALUES ('12', 'ARICA');
INSERT INTO `provincias` VALUES ('13', 'AYSEN');
INSERT INTO `provincias` VALUES ('14', 'BUIN');
INSERT INTO `provincias` VALUES ('15', 'BULNES');
INSERT INTO `provincias` VALUES ('16', 'CABILDO');
INSERT INTO `provincias` VALUES ('17', 'CABO DE HORNOS');
INSERT INTO `provincias` VALUES ('18', 'CABRERO');
INSERT INTO `provincias` VALUES ('19', 'CALAMA');
INSERT INTO `provincias` VALUES ('20', 'CALBUCO');
INSERT INTO `provincias` VALUES ('21', 'CALDERA');
INSERT INTO `provincias` VALUES ('22', 'CALERA DE TANGO');
INSERT INTO `provincias` VALUES ('23', 'CALLE LARGA');
INSERT INTO `provincias` VALUES ('24', 'CAMARONES');
INSERT INTO `provincias` VALUES ('25', 'CAMINA');
INSERT INTO `provincias` VALUES ('26', 'CANELA');
INSERT INTO `provincias` VALUES ('27', 'CANETE');
INSERT INTO `provincias` VALUES ('28', 'CARAHUE');
INSERT INTO `provincias` VALUES ('29', 'CARTAGENA');
INSERT INTO `provincias` VALUES ('30', 'CASABLANCA');
INSERT INTO `provincias` VALUES ('31', 'CASTRO');
INSERT INTO `provincias` VALUES ('32', 'CATEMU');
INSERT INTO `provincias` VALUES ('33', 'CAUQUENES');
INSERT INTO `provincias` VALUES ('34', 'CERRILLOS');
INSERT INTO `provincias` VALUES ('35', 'CERRO NAVIA');
INSERT INTO `provincias` VALUES ('36', 'CHAITEN');
INSERT INTO `provincias` VALUES ('37', 'CHANARAL');
INSERT INTO `provincias` VALUES ('38', 'CHANCO');
INSERT INTO `provincias` VALUES ('39', 'CHEPICA');
INSERT INTO `provincias` VALUES ('40', 'CHIGUAYANTE');
INSERT INTO `provincias` VALUES ('41', 'CHILE CHICO');
INSERT INTO `provincias` VALUES ('42', 'CHILLAN');
INSERT INTO `provincias` VALUES ('43', 'CHILLAN VIEJO');
INSERT INTO `provincias` VALUES ('44', 'CHIMBARONGO');
INSERT INTO `provincias` VALUES ('45', 'CHOLCHOL');
INSERT INTO `provincias` VALUES ('46', 'CHONCHI');
INSERT INTO `provincias` VALUES ('47', 'CISNES');
INSERT INTO `provincias` VALUES ('48', 'COBQUECURA');
INSERT INTO `provincias` VALUES ('49', 'COCHAMO');
INSERT INTO `provincias` VALUES ('50', 'COCHRANE');
INSERT INTO `provincias` VALUES ('51', 'CODEGUA');
INSERT INTO `provincias` VALUES ('52', 'COELEMU');
INSERT INTO `provincias` VALUES ('53', 'COIHUECO');
INSERT INTO `provincias` VALUES ('54', 'COINCO');
INSERT INTO `provincias` VALUES ('55', 'COLBUN');
INSERT INTO `provincias` VALUES ('56', 'COLCHANE');
INSERT INTO `provincias` VALUES ('57', 'COLINA');
INSERT INTO `provincias` VALUES ('58', 'COLLIPULLI');
INSERT INTO `provincias` VALUES ('59', 'COLTAUCO');
INSERT INTO `provincias` VALUES ('60', 'COMBARBALA');
INSERT INTO `provincias` VALUES ('61', 'CONCEPCION');
INSERT INTO `provincias` VALUES ('62', 'CONCHALI');
INSERT INTO `provincias` VALUES ('63', 'CONCON');
INSERT INTO `provincias` VALUES ('64', 'CONSTITUCION');
INSERT INTO `provincias` VALUES ('65', 'CONTULMO');
INSERT INTO `provincias` VALUES ('66', 'COPIAPO');
INSERT INTO `provincias` VALUES ('67', 'COQUIMBO');
INSERT INTO `provincias` VALUES ('68', 'CORONEL');
INSERT INTO `provincias` VALUES ('69', 'CORRAL');
INSERT INTO `provincias` VALUES ('70', 'COYHAIQUE');
INSERT INTO `provincias` VALUES ('71', 'CUNCO');
INSERT INTO `provincias` VALUES ('72', 'CURACAUTIN');
INSERT INTO `provincias` VALUES ('73', 'CURACAVI');
INSERT INTO `provincias` VALUES ('74', 'CURACO DE VELEZ');
INSERT INTO `provincias` VALUES ('75', 'CURANILAHUE');
INSERT INTO `provincias` VALUES ('76', 'CURARREHUE');
INSERT INTO `provincias` VALUES ('77', 'CUREPTO');
INSERT INTO `provincias` VALUES ('78', 'CURICO');
INSERT INTO `provincias` VALUES ('79', 'DALCAHUE');
INSERT INTO `provincias` VALUES ('80', 'DIEGO DE ALMAGRO');
INSERT INTO `provincias` VALUES ('81', 'DONIHUE');
INSERT INTO `provincias` VALUES ('82', 'EL BOSQUE');
INSERT INTO `provincias` VALUES ('83', 'EL CARMEN');
INSERT INTO `provincias` VALUES ('84', 'EL MONTE');
INSERT INTO `provincias` VALUES ('85', 'EL QUISCO');
INSERT INTO `provincias` VALUES ('86', 'EL TABO');
INSERT INTO `provincias` VALUES ('87', 'EMPEDRADO');
INSERT INTO `provincias` VALUES ('88', 'ERCILLA');
INSERT INTO `provincias` VALUES ('89', 'ESTACION CENTRAL');
INSERT INTO `provincias` VALUES ('90', 'FLORIDA');
INSERT INTO `provincias` VALUES ('91', 'FREIRE');
INSERT INTO `provincias` VALUES ('92', 'FREIRINA');
INSERT INTO `provincias` VALUES ('93', 'FRESIA');
INSERT INTO `provincias` VALUES ('94', 'FRUTILLAR');
INSERT INTO `provincias` VALUES ('95', 'FUTALEUFU');
INSERT INTO `provincias` VALUES ('96', 'FUTRONO');
INSERT INTO `provincias` VALUES ('97', 'GALVARINO');
INSERT INTO `provincias` VALUES ('98', 'GENERAL LAGOS');
INSERT INTO `provincias` VALUES ('99', 'GORBEA');
INSERT INTO `provincias` VALUES ('100', 'GRANEROS');
INSERT INTO `provincias` VALUES ('101', 'GUAITECAS');
INSERT INTO `provincias` VALUES ('102', 'HIJUELAS');
INSERT INTO `provincias` VALUES ('103', 'HUALAIHUE');
INSERT INTO `provincias` VALUES ('104', 'HUALANE');
INSERT INTO `provincias` VALUES ('105', 'HUALPEN');
INSERT INTO `provincias` VALUES ('106', 'HUALQUI');
INSERT INTO `provincias` VALUES ('107', 'HUARA');
INSERT INTO `provincias` VALUES ('108', 'HUASCO');
INSERT INTO `provincias` VALUES ('109', 'HUECHURABA');
INSERT INTO `provincias` VALUES ('110', 'ILLAPEL');
INSERT INTO `provincias` VALUES ('111', 'INDEPENDENCIA');
INSERT INTO `provincias` VALUES ('112', 'IQUIQUE');
INSERT INTO `provincias` VALUES ('113', 'ISLA DE MAIPO');
INSERT INTO `provincias` VALUES ('114', 'ISLA DE PASCUA');
INSERT INTO `provincias` VALUES ('115', 'JUAN FERNANDEZ');
INSERT INTO `provincias` VALUES ('116', 'LA CALERA');
INSERT INTO `provincias` VALUES ('117', 'LA CISTERNA');
INSERT INTO `provincias` VALUES ('118', 'LA CRUZ');
INSERT INTO `provincias` VALUES ('119', 'LA ESTRELLA');
INSERT INTO `provincias` VALUES ('120', 'LA FLORIDA');
INSERT INTO `provincias` VALUES ('121', 'LA GRANJA');
INSERT INTO `provincias` VALUES ('122', 'LA HIGUERA');
INSERT INTO `provincias` VALUES ('123', 'LA LIGUA');
INSERT INTO `provincias` VALUES ('124', 'LA PINTANA');
INSERT INTO `provincias` VALUES ('125', 'LA REINA');
INSERT INTO `provincias` VALUES ('126', 'LA SERENA');
INSERT INTO `provincias` VALUES ('127', 'LA UNION');
INSERT INTO `provincias` VALUES ('128', 'LAGO RANCO');
INSERT INTO `provincias` VALUES ('129', 'LAGO VERDE');
INSERT INTO `provincias` VALUES ('130', 'LAGUNA BLANCA');
INSERT INTO `provincias` VALUES ('131', 'LAJA');
INSERT INTO `provincias` VALUES ('132', 'LAMPA');
INSERT INTO `provincias` VALUES ('133', 'LANCO');
INSERT INTO `provincias` VALUES ('134', 'LAS CABRAS');
INSERT INTO `provincias` VALUES ('135', 'LAS CONDES');
INSERT INTO `provincias` VALUES ('136', 'LAUTARO');
INSERT INTO `provincias` VALUES ('137', 'LEBU');
INSERT INTO `provincias` VALUES ('138', 'LICANTEN');
INSERT INTO `provincias` VALUES ('139', 'LIMACHE');
INSERT INTO `provincias` VALUES ('140', 'LINARES');
INSERT INTO `provincias` VALUES ('141', 'LITUECHE');
INSERT INTO `provincias` VALUES ('142', 'LLANQUIHUE');
INSERT INTO `provincias` VALUES ('143', 'LLAY-LLAY');
INSERT INTO `provincias` VALUES ('144', 'LO BARNECHEA');
INSERT INTO `provincias` VALUES ('145', 'LO ESPEJO');
INSERT INTO `provincias` VALUES ('146', 'LO PRADO');
INSERT INTO `provincias` VALUES ('147', 'LOLOL');
INSERT INTO `provincias` VALUES ('148', 'LONCOCHE');
INSERT INTO `provincias` VALUES ('149', 'LONGAVI');
INSERT INTO `provincias` VALUES ('150', 'LONQUIMAY');
INSERT INTO `provincias` VALUES ('151', 'LOS ALAMOS');
INSERT INTO `provincias` VALUES ('152', 'LOS ANDES');
INSERT INTO `provincias` VALUES ('153', 'LOS ANGELES');
INSERT INTO `provincias` VALUES ('154', 'LOS LAGOS');
INSERT INTO `provincias` VALUES ('155', 'LOS MUERMOS');
INSERT INTO `provincias` VALUES ('156', 'LOS SAUCES');
INSERT INTO `provincias` VALUES ('157', 'LOS VILOS');
INSERT INTO `provincias` VALUES ('158', 'LOTA');
INSERT INTO `provincias` VALUES ('159', 'LUMACO');
INSERT INTO `provincias` VALUES ('160', 'MACHALI');
INSERT INTO `provincias` VALUES ('161', 'MACUL');
INSERT INTO `provincias` VALUES ('162', 'MAFIL');
INSERT INTO `provincias` VALUES ('163', 'MAIPU');
INSERT INTO `provincias` VALUES ('164', 'MALLOA');
INSERT INTO `provincias` VALUES ('165', 'MARCHIGUE');
INSERT INTO `provincias` VALUES ('166', 'MARIA ELENA');
INSERT INTO `provincias` VALUES ('167', 'MARIA PINTO');
INSERT INTO `provincias` VALUES ('168', 'MARIQUINA');
INSERT INTO `provincias` VALUES ('169', 'MAULE');
INSERT INTO `provincias` VALUES ('170', 'MAULLIN');
INSERT INTO `provincias` VALUES ('171', 'MEJILLONES');
INSERT INTO `provincias` VALUES ('172', 'MELIPEUCO');
INSERT INTO `provincias` VALUES ('173', 'MELIPILLA');
INSERT INTO `provincias` VALUES ('174', 'MOLINA');
INSERT INTO `provincias` VALUES ('175', 'MONTE PATRIA');
INSERT INTO `provincias` VALUES ('176', 'MULCHEN');
INSERT INTO `provincias` VALUES ('177', 'NACIMIENTO');
INSERT INTO `provincias` VALUES ('178', 'NANCAGUA');
INSERT INTO `provincias` VALUES ('179', 'NATALES');
INSERT INTO `provincias` VALUES ('180', 'NAVIDAD');
INSERT INTO `provincias` VALUES ('181', 'NEGRETE');
INSERT INTO `provincias` VALUES ('182', 'NINHUE');
INSERT INTO `provincias` VALUES ('183', 'NIQUEN');
INSERT INTO `provincias` VALUES ('184', 'NOGALES');
INSERT INTO `provincias` VALUES ('185', 'NUEVA IMPERIAL');
INSERT INTO `provincias` VALUES ('186', 'NUNOA');
INSERT INTO `provincias` VALUES ('187', 'OHIGGINS');
INSERT INTO `provincias` VALUES ('188', 'OLIVAR');
INSERT INTO `provincias` VALUES ('189', 'OLLAGUE');
INSERT INTO `provincias` VALUES ('190', 'OLMUE');
INSERT INTO `provincias` VALUES ('191', 'OSORNO');
INSERT INTO `provincias` VALUES ('192', 'OVALLE');
INSERT INTO `provincias` VALUES ('193', 'PADRE HURTADO');
INSERT INTO `provincias` VALUES ('194', 'PADRE LAS CASAS');
INSERT INTO `provincias` VALUES ('195', 'PAIHUANO');
INSERT INTO `provincias` VALUES ('196', 'PAILLACO');
INSERT INTO `provincias` VALUES ('197', 'PAINE');
INSERT INTO `provincias` VALUES ('198', 'PALENA');
INSERT INTO `provincias` VALUES ('199', 'PALMILLA');
INSERT INTO `provincias` VALUES ('200', 'PANGUIPULLI');
INSERT INTO `provincias` VALUES ('201', 'PANQUEHUE');
INSERT INTO `provincias` VALUES ('202', 'PAPUDO');
INSERT INTO `provincias` VALUES ('203', 'PAREDONES');
INSERT INTO `provincias` VALUES ('204', 'PARRAL');
INSERT INTO `provincias` VALUES ('205', 'PEDRO AGUIRRE CERDA');
INSERT INTO `provincias` VALUES ('206', 'PELARCO');
INSERT INTO `provincias` VALUES ('207', 'PELLUHUE');
INSERT INTO `provincias` VALUES ('208', 'PEMUCO');
INSERT INTO `provincias` VALUES ('209', 'PENAFLOR');
INSERT INTO `provincias` VALUES ('210', 'PENALOLEN');
INSERT INTO `provincias` VALUES ('211', 'PENCAHUE');
INSERT INTO `provincias` VALUES ('212', 'PENCO');
INSERT INTO `provincias` VALUES ('213', 'PERALILLO');
INSERT INTO `provincias` VALUES ('214', 'PERQUENCO');
INSERT INTO `provincias` VALUES ('215', 'PETORCA');
INSERT INTO `provincias` VALUES ('216', 'PEUMO');
INSERT INTO `provincias` VALUES ('217', 'PICA');
INSERT INTO `provincias` VALUES ('218', 'PICHIDEGUA');
INSERT INTO `provincias` VALUES ('219', 'PICHILEMU');
INSERT INTO `provincias` VALUES ('220', 'PINTO');
INSERT INTO `provincias` VALUES ('221', 'PIRQUE');
INSERT INTO `provincias` VALUES ('222', 'PITRUFQUEN');
INSERT INTO `provincias` VALUES ('223', 'PLACILLA');
INSERT INTO `provincias` VALUES ('224', 'PORTEZUELO');
INSERT INTO `provincias` VALUES ('225', 'PORVENIR');
INSERT INTO `provincias` VALUES ('226', 'POZO ALMONTE');
INSERT INTO `provincias` VALUES ('227', 'PRIMAVERA');
INSERT INTO `provincias` VALUES ('228', 'PROVIDENCIA');
INSERT INTO `provincias` VALUES ('229', 'PUCHUNCAVI');
INSERT INTO `provincias` VALUES ('230', 'PUCON');
INSERT INTO `provincias` VALUES ('231', 'PUDAHUEL');
INSERT INTO `provincias` VALUES ('232', 'PUENTE ALTO');
INSERT INTO `provincias` VALUES ('233', 'PUERTO MONTT');
INSERT INTO `provincias` VALUES ('234', 'PUERTO OCTAY');
INSERT INTO `provincias` VALUES ('235', 'PUERTO VARAS');
INSERT INTO `provincias` VALUES ('236', 'PUMANQUE');
INSERT INTO `provincias` VALUES ('237', 'PUNITAQUI');
INSERT INTO `provincias` VALUES ('238', 'PUNTA ARENAS');
INSERT INTO `provincias` VALUES ('239', 'PUQUELDON');
INSERT INTO `provincias` VALUES ('240', 'PUREN');
INSERT INTO `provincias` VALUES ('241', 'PURRANQUE');
INSERT INTO `provincias` VALUES ('242', 'PUTAENDO');
INSERT INTO `provincias` VALUES ('243', 'PUTRE');
INSERT INTO `provincias` VALUES ('244', 'PUYEHUE');
INSERT INTO `provincias` VALUES ('245', 'QUEILEN');
INSERT INTO `provincias` VALUES ('246', 'QUELLON');
INSERT INTO `provincias` VALUES ('247', 'QUEMCHI');
INSERT INTO `provincias` VALUES ('248', 'QUILACO');
INSERT INTO `provincias` VALUES ('249', 'QUILICURA');
INSERT INTO `provincias` VALUES ('250', 'QUILLECO');
INSERT INTO `provincias` VALUES ('251', 'QUILLON');
INSERT INTO `provincias` VALUES ('252', 'QUILLOTA');
INSERT INTO `provincias` VALUES ('253', 'QUILPUE');
INSERT INTO `provincias` VALUES ('254', 'QUINCHAO');
INSERT INTO `provincias` VALUES ('255', 'QUINTA DE TILCOCO');
INSERT INTO `provincias` VALUES ('256', 'QUINTA NORMAL');
INSERT INTO `provincias` VALUES ('257', 'QUINTERO');
INSERT INTO `provincias` VALUES ('258', 'QUIRIHUE');
INSERT INTO `provincias` VALUES ('259', 'RANCAGUA');
INSERT INTO `provincias` VALUES ('260', 'RANQUIL');
INSERT INTO `provincias` VALUES ('261', 'RAUCO');
INSERT INTO `provincias` VALUES ('262', 'RECOLETA');
INSERT INTO `provincias` VALUES ('263', 'RENAICO');
INSERT INTO `provincias` VALUES ('264', 'RENCA');
INSERT INTO `provincias` VALUES ('265', 'RENGO');
INSERT INTO `provincias` VALUES ('266', 'REQUINOA');
INSERT INTO `provincias` VALUES ('267', 'RETIRO');
INSERT INTO `provincias` VALUES ('268', 'RINCONADA');
INSERT INTO `provincias` VALUES ('269', 'RIO BUENO');
INSERT INTO `provincias` VALUES ('270', 'RIO CLARO');
INSERT INTO `provincias` VALUES ('271', 'RIO HURTADO');
INSERT INTO `provincias` VALUES ('272', 'RIO IBANEZ');
INSERT INTO `provincias` VALUES ('273', 'RIO NEGRO');
INSERT INTO `provincias` VALUES ('274', 'RIO VERDE');
INSERT INTO `provincias` VALUES ('275', 'ROMERAL');
INSERT INTO `provincias` VALUES ('276', 'SAAVEDRA');
INSERT INTO `provincias` VALUES ('277', 'SAGRADA FAMILIA');
INSERT INTO `provincias` VALUES ('278', 'SALAMANCA');
INSERT INTO `provincias` VALUES ('279', 'SAN ANTONIO');
INSERT INTO `provincias` VALUES ('280', 'SAN BERNARDO');
INSERT INTO `provincias` VALUES ('281', 'SAN CARLOS');
INSERT INTO `provincias` VALUES ('282', 'SAN CLEMENTE');
INSERT INTO `provincias` VALUES ('283', 'SAN ESTEBAN');
INSERT INTO `provincias` VALUES ('284', 'SAN FABIAN');
INSERT INTO `provincias` VALUES ('285', 'SAN FELIPE');
INSERT INTO `provincias` VALUES ('286', 'SAN FERNANDO');
INSERT INTO `provincias` VALUES ('287', 'SAN FRANCISCO DE MOSTAZAL');
INSERT INTO `provincias` VALUES ('288', 'SAN GREGORIO');
INSERT INTO `provincias` VALUES ('289', 'SAN IGNACIO');
INSERT INTO `provincias` VALUES ('290', 'SAN JAVIER');
INSERT INTO `provincias` VALUES ('291', 'SAN JOAQUIN');
INSERT INTO `provincias` VALUES ('292', 'SAN JOSE DE MAIPO');
INSERT INTO `provincias` VALUES ('293', 'SAN JUAN DE LA COSTA');
INSERT INTO `provincias` VALUES ('294', 'SAN MIGUEL');
INSERT INTO `provincias` VALUES ('295', 'SAN NICOLAS');
INSERT INTO `provincias` VALUES ('296', 'SAN PABLO');
INSERT INTO `provincias` VALUES ('297', 'SAN PEDRO');
INSERT INTO `provincias` VALUES ('298', 'SAN PEDRO DE ATACAMA');
INSERT INTO `provincias` VALUES ('299', 'SAN PEDRO DE LA PAZ');
INSERT INTO `provincias` VALUES ('300', 'SAN RAFAEL');
INSERT INTO `provincias` VALUES ('301', 'SAN RAMON');
INSERT INTO `provincias` VALUES ('302', 'SAN ROSENDO');
INSERT INTO `provincias` VALUES ('303', 'SAN VICENTE');
INSERT INTO `provincias` VALUES ('304', 'SANTA BARBARA');
INSERT INTO `provincias` VALUES ('305', 'SANTA CRUZ');
INSERT INTO `provincias` VALUES ('306', 'SANTA JUANA');
INSERT INTO `provincias` VALUES ('307', 'SANTA MARIA');
INSERT INTO `provincias` VALUES ('308', 'SANTIAGO');
INSERT INTO `provincias` VALUES ('309', 'SANTIAGO OESTE');
INSERT INTO `provincias` VALUES ('310', 'SANTIAGO SUR');
INSERT INTO `provincias` VALUES ('311', 'SANTO DOMINGO');
INSERT INTO `provincias` VALUES ('312', 'SIERRA GORDA');
INSERT INTO `provincias` VALUES ('313', 'TALAGANTE');
INSERT INTO `provincias` VALUES ('314', 'TALCA');
INSERT INTO `provincias` VALUES ('315', 'TALCAHUANO');
INSERT INTO `provincias` VALUES ('316', 'TALTAL');
INSERT INTO `provincias` VALUES ('317', 'TEMUCO');
INSERT INTO `provincias` VALUES ('318', 'TENO');
INSERT INTO `provincias` VALUES ('319', 'TEODORO SCHMIDT');
INSERT INTO `provincias` VALUES ('320', 'TIERRA AMARILLA');
INSERT INTO `provincias` VALUES ('321', 'TIL-TIL');
INSERT INTO `provincias` VALUES ('322', 'TIMAUKEL');
INSERT INTO `provincias` VALUES ('323', 'TIRUA');
INSERT INTO `provincias` VALUES ('324', 'TOCOPILLA');
INSERT INTO `provincias` VALUES ('325', 'TOLTEN');
INSERT INTO `provincias` VALUES ('326', 'TOME');
INSERT INTO `provincias` VALUES ('327', 'TORRES DEL PAINE');
INSERT INTO `provincias` VALUES ('328', 'TORTEL');
INSERT INTO `provincias` VALUES ('329', 'TRAIGUEN');
INSERT INTO `provincias` VALUES ('330', 'TREHUACO');
INSERT INTO `provincias` VALUES ('331', 'TUCAPEL');
INSERT INTO `provincias` VALUES ('332', 'VALDIVIA');
INSERT INTO `provincias` VALUES ('333', 'VALLENAR');
INSERT INTO `provincias` VALUES ('334', 'VALPARAISO');
INSERT INTO `provincias` VALUES ('335', 'VICHUQUEN');
INSERT INTO `provincias` VALUES ('336', 'VICTORIA');
INSERT INTO `provincias` VALUES ('337', 'VICUNA');
INSERT INTO `provincias` VALUES ('338', 'VILCUN');
INSERT INTO `provincias` VALUES ('339', 'VILLA ALEGRE');
INSERT INTO `provincias` VALUES ('340', 'VILLA ALEMANA');
INSERT INTO `provincias` VALUES ('341', 'VILLARRICA');
INSERT INTO `provincias` VALUES ('342', 'VINA DEL MAR');
INSERT INTO `provincias` VALUES ('343', 'VITACURA');
INSERT INTO `provincias` VALUES ('344', 'YERBAS BUENAS');
INSERT INTO `provincias` VALUES ('345', 'YUMBEL');
INSERT INTO `provincias` VALUES ('346', 'YUNGAY');
INSERT INTO `provincias` VALUES ('347', 'ZAPALLAR');