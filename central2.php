<?php
include ("./conectar.php");
$hoy=date("Y-m-d");

$sel_tmp="SELECT codalbaran FROM albaranestmp WHERE datediff('$hoy',fecha) > 2";
$rs_tmp=mysql_query($sel_tmp);
$contador=0;
while ($contador < mysql_num_rows($rs_tmp)) {
	$codalbaran=mysql_result($rs_tmp,$contador,"codalbaran");
	$sel_borrar="DELETE FROM albalineatmp WHERE codalbaran='$codalbaran'";
	$rs_borrar=mysql_query($sel_borrar);
	$contador++;
}

$sel_borrar="DELETE FROM albaranestmp WHERE datediff('$hoy',fecha) > 2";
$rs_borrar=mysql_query($sel_borrar);

$sel_tmp="SELECT codalbaran FROM albaranesptmp WHERE datediff('$hoy',fecha) > 2";
$rs_tmp=mysql_query($sel_tmp);
$contador=0;
while ($contador < mysql_num_rows($rs_tmp)) {
	$codalbaran=mysql_result($rs_tmp,$contador,"codalbaran");
	$sel_borrar="DELETE FROM albalineaptmp WHERE codalbaran='$codalbaran'";
	$rs_borrar=mysql_query($sel_borrar);
	$contador++;
}

$sel_borrar="DELETE FROM albaranesptmp WHERE datediff('$hoy',fecha) > 2";
$rs_borrar=mysql_query($sel_borrar);

$sel_tmp="SELECT codfactura FROM facturastmp WHERE datediff('$hoy',fecha) > 2";
$rs_tmp=mysql_query($sel_tmp);
$contador=0;
while ($contador < mysql_num_rows($rs_tmp)) {
	$codfactura=mysql_result($rs_tmp,$contador,"codfactura");
	$sel_borrar="DELETE FROM factulineatmp WHERE codfactura='$codfactura'";
	$rs_borrar=mysql_query($sel_borrar);
	$contador++;
}

$sel_borrar="DELETE FROM facturastmp WHERE datediff('$hoy',fecha) > 2";
$rs_borrar=mysql_query($sel_borrar);

$sel_tmp="SELECT codfactura FROM facturasptmp WHERE datediff('$hoy',fecha) > 2";
$rs_tmp=mysql_query($sel_tmp);
$contador=0;
while ($contador < mysql_num_rows($rs_tmp)) {
	$codfactura=mysql_result($rs_tmp,$contador,"codfactura");
	$sel_borrar="DELETE FROM factulineaptmp WHERE codfactura='$codfactura'";
	$rs_borrar=mysql_query($sel_borrar);
	$contador++;
}

$sel_borrar="DELETE FROM facturasptmp WHERE datediff('$hoy',fecha) > 2";
$rs_borrar=mysql_query($sel_borrar);

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
<style type="text/css">

</style>

<script type="text/javascript">
function CambiaColor(esto,fondo,texto)
 {
    esto.style.background=fondo;
    esto.style.color=texto;
 }

function doBlink() { 
var blink = document.all.tags("BLINK") 
for (var i=0; i < blink.length; i++) 
blink[i].style.visibility = blink[i].style.visibility == "" ? "hidden" : "" 
} 

function startBlink() { 
if (document.all) setInterval("doBlink()",500) 
} 
window.onload = startBlink; 
 
 
</script>

</head>
<body>
<table width="90%" border="0" align="center">
	<tr height="200px">
		<td><div align="center"><img src="img/codekamx.png" width="550" height="200" border="0" /></div></td>
	</tr>
	<tr>		
		<td height="27">&nbsp;</td>
	</tr>
</table>
<table width="90%" border="0" align="center">
	<tr>
		<td width="38%"><div align="center"><img src="img/fx-80x15.png" width="80" height="15" /> Sistema Optimizado para Firefox </div></td>
    </tr>    
</table>
</body>
</html>