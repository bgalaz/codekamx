-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 19-02-2009 a las 16:38:51
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `test`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `users`
-- 

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- Volcar la base de datos para la tabla `users`
-- 

INSERT INTO `users` VALUES (1, 'ignacia', 'ipizarro', 'fe01ce2a7fbac8fafaed7c982a04e229', 'aaa@aaa.com', 7632, '2009-02-18', 'Chile', 1);
