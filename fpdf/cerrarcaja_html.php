<?php
include ("../conectar.php");
include ("../funciones/fechas.php");

$fechainicio=$_GET["fechainicio"];
$minimo=$_GET["minimo"];
$maximo=$_GET["maximo"];
$neto=$_GET["neto"];
$iva=$_GET["iva"];
$total=$_GET["total"];
$contado=$_GET["contado"];
$tarjeta=$_GET["tarjeta"];

//Para obtener el total de los cobros
$sel_cobros="SELECT Sum(cobros.importe) AS total_forma_pago, formapago.nombrefp FROM cobros Inner Join formapago ON cobros.codformapago = formapago.codformapago WHERE cobros.fechacobro =  '$fechainicio' GROUP BY formapago.nombrefp ORDER BY formapago.codformapago ASC";
$rs_cobros=mysql_query($sel_cobros);
$contador = 0;
$total_cobros = 0;
 
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
<script language="javascript">
function imprimir() {
	window.print();
	window.close();
}
</script>
</head>

<body onLoad="imprimir()">
<style type="text/css">
<!--
.Estilo3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
-->
</style>

<table width="50%" border="0">

  <tr>
    <td><span class="Estilo3"><?php echo $nomempresa ?></span></td>
  </tr>
  <tr>
    <td><span class="Estilo3"><?php echo $giro ?></span></td>
  </tr>
  <tr>
    <td><span class="Estilo3">Tel.: <?php echo $fonos ?></span></td>
  </tr>
  <tr>
    <td><span class="Estilo3"><?php echo $direccion ?>, <?php echo $comuna ?></span></td>
  </tr>
  <tr>
    <td><span class="Estilo3">Ciudad <?php echo $CiudadActual ?> </span></td>
  </tr>
  <tr>
    <td>===========================================</td>
  </tr>
  <tr>
    <td><span class="Estilo3">DEL TICKET No.: <?php echo $minimo?> AL TICKET No.: <?php echo $maximo?></span></td>
  </tr>
  <tr>
    <td><span class="Estilo3">NETO: <?php echo number_format($neto,2,".",",")?> + <?php echo $ivaimp ?> % IVA: <?php echo number_format($iva,2,".",",")?></span></td>
  </tr>
  <tr>
    <td><span class="Estilo3">TOTAL: <?php echo number_format($total,2,".",",")?> <?php echo $nombremoneda ?></span></td>
  </tr>
  
  <?php
		if (mysql_num_rows($rs_cobros) <= 0) {
			echo "<tr><td><span class='Estilo3'>No hay cobros en este d&iacute;a.</span></td><td>&nbsp;</td><td>&nbsp;</td></tr>";	
		} else {
			while ($contador < mysql_num_rows($rs_cobros)) { ?>
				<tr>
					<td width="50%"><span class="Estilo3">Total <?php echo mysql_result($rs_cobros, $contador, "nombrefp"); ?></span></td>
					<td><span class="Estilo3"><?php echo $simbolomoneda; ?></span></td>
					<td align="right"><span class="Estilo3"><?php echo number_format(mysql_result($rs_cobros, $contador, "total_forma_pago"),2,".",","); ?></span></td>
				</tr>
			<?php 
			$total_cobros = $total_cobros + mysql_result($rs_cobros, $contador, "total_forma_pago");
			$contador++;
			}
		}
  ?>				                    
    <tr>
        <td><span class="Estilo3"><strong>Total</strong></span></td>
        <td><span class="Estilo3"><?php echo $simbolomoneda ?></span></td>
        <td align="right"><span class="Estilo3"><strong><?php echo number_format($total_cobros,2,".",","); ?></strong></span></td>
    </tr>  
  <tr>
    <td>===========================================</td>
  </tr>

</table>
</body>
</html>