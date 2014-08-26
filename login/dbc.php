<?php
$dbname = $BaseDeDatos;
$link = mysql_connect($Servidor,$Usuario,$Password) or die("Couldn't make connection.");
$db = mysql_select_db($dbname, $link) or die("Couldn't select database");
?>