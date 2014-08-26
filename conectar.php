<?php

  include("config.php");
   
  $conexion=mysql_connect($Servidor,$Usuario,$Password) or die("Error: El servidor no puede conectar con la base de datos");
  $descriptor=mysql_select_db($BaseDeDatos,$conexion);
  
  // Se recuperan valores de parametros
  $query_tmp="SELECT * FROM parametros WHERE indice=1";
  $rs_tmp=mysql_query($query_tmp);
  
  // Variables para la numeracion de facturas
  $numeracionfactura=mysql_result($rs_tmp,0,"numeracionfactura");
  $setnumfac=mysql_result($rs_tmp,0,"setnumfac");
  
  // Variables para impresion de Facturas y Guias de Despacho
  $imagenfac=mysql_result($rs_tmp,0,"imagenfac");
  $fondofac=mysql_result($rs_tmp,0,"fondofac");
  $imagenguia=mysql_result($rs_tmp,0,"imagenguia");
  $fondoguia=mysql_result($rs_tmp,0,"fondoguia");
  $FilasDetalleFactura=mysql_result($rs_tmp,0,"filasdetallefactura");
    
  // Variables de Impuesto y Moneda
  $ivaimp=mysql_result($rs_tmp,0,"ivaimp");
  $nombremoneda=mysql_result($rs_tmp,0,"nombremoneda");
  $simbolomoneda=mysql_result($rs_tmp,0,"simbolomoneda");
  $codigomonedate=mysql_result($rs_tmp,0,"codigomoneda");
  
  // Personalización Empresa
  $nomempresa=mysql_result($rs_tmp,0,"nomempresa");
  $giro=mysql_result($rs_tmp,0,"giro");
  $giro2=mysql_result($rs_tmp,0,"giro2");
  $fonos=mysql_result($rs_tmp,0,"fonos");
  $direccion=mysql_result($rs_tmp,0,"direccion");
  $comuna=mysql_result($rs_tmp,0,"comuna");
  $CiudadActual=mysql_result($rs_tmp,0,"ciudadactual");
  $numerofiscal=mysql_result($rs_tmp,0,"numerofiscal");
  $resolucionsii=mysql_result($rs_tmp,0,"resolucionsii");
  $rutempresa=mysql_result($rs_tmp,0,"rutempresa");
  
?>
