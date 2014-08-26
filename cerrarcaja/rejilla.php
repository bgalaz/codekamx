<?php
include ("../conectar.php");
include ("../funciones/fechas.php");

$fechainicio=$_POST["fechainicio"];
if ($fechainicio<>"") { $fechainicio=explota($fechainicio); }

$cadena_busqueda=$_POST["cadena_busqueda"];

$sel_facturas="SELECT Max(facturas.codfactura) AS maximo, Min(facturas.codfactura) AS minimo, Sum(facturas.totalfactura) AS totalfac, Sum(facturas.totalfactura - facturas.totalfactura / (1+(facturas.iva /100))) AS totaliva FROM facturas WHERE facturas.borrado =  '0' AND facturas.fecha =  '$fechainicio'";
$rs_facturas=mysql_query($sel_facturas);

if (mysql_num_rows($rs_facturas) > 0 ) {
	$minimo=mysql_result($rs_facturas,0,"minimo");
	$maximo=mysql_result($rs_facturas,0,"maximo");
	$total=mysql_result($rs_facturas,0,"totalfac");
	$total_iva=mysql_result($rs_facturas,0,"totaliva");
} else {
	$minimo=0;
	$maximo=0;
	$total=0;
}
$neto=$total-$total_iva;
$iva=$total_iva;

// Relación de cobros.
//$sel_cobros="SELECT Sum(importe) AS suma, cobros.codformapago, formapago.nombrefp FROM cobros Inner Join formapago ON cobros.codformapago = formapago.codformapago WHERE fechacobro='$fechainicio' GROUP BY codformapago ORDER BY codformapago ASC";

$sel_cobros="SELECT Sum(cobros.importe) AS total_forma_pago, formapago.nombrefp FROM cobros Inner Join formapago ON cobros.codformapago = formapago.codformapago WHERE cobros.fechacobro =  '$fechainicio' GROUP BY formapago.nombrefp ORDER BY formapago.codformapago ASC";
$rs_cobros=mysql_query($sel_cobros);
$contador = 0;
$total_cobros = 0;

//if (mysql_num_rows($rs_cobros) > 0) { $contado=mysql_result($rs_cobros,0,"suma"); } else { $contado=0; }
//if (mysql_num_rows($rs_cobros) > 1) { $tarjeta=mysql_result($rs_cobros,1,"suma"); } else { $tarjeta=0; }

?>
<html>
	<head>
		<title>Cierre Caja</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">	
		<script>
		
		var cursor;
		if (document.all) {
		// Está utilizando EXPLORER
		cursor='hand';
		} else {
		// Está utilizando MOZILLA/NETSCAPE
		cursor='pointer';
		}
		
		 function imprimir(fechainicio,minimo,maximo,neto,iva,total,contado,tarjeta) {
			location.href="../fpdf/cerrarcaja_html.php?fechainicio="+fechainicio+"&minimo="+minimo+"&maximo="+maximo+"&neto="+neto+"&iva="+iva+"&total="+total+"&contado="+contado+"&tarjeta="+tarjeta;	
		 }
		</script>
	</head>
	<body Scroll="NO">	
		<div id="pagina">
			<div id="zonaContenidoCC">
			<div align="center">
				<form id="formulario" name="formulario" method="post" action="rejilla.php" target="frame_rejilla">
	            <table class="fuente8" width="40%" cellspacing=0 cellpadding=3 border=0>
				  <tr><strong>Totales de facturaci&oacute;n</strong></tr>
                  <tr>
                    <td>Cierre de Caja al:</td>
                    <td><?php echo implota($fechainicio)?></td>
					<td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td><strong>Totales de facturaci&oacute;n</strong></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
                  </tr>				  
                  <tr>
                    <td>De la factura n&deg;</td>
                    <td><?php echo $minimo?></td>
					<td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>A la factura n&deg;</td>
                    <td><?php echo $maximo?></td>
					<td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>Subtotal</td>                    
                    <td><?php echo $simbolomoneda ?></td>
                    <td align="right"><?php echo number_format($neto,2,".",",")?></td>
                  </tr>
                  <tr>
                    <td><?php echo $ivaimp?> % IVA</td>
                    <td><?php echo $simbolomoneda ?></td>
                    <td align="right"><?php echo number_format($iva,2,".",",")?> </td>                    
                  </tr>
                  <tr>
                    <td><strong>Total</strong></td>
                    <td><?php echo $simbolomoneda ?></td>
                    <td align="right"><strong><?php echo number_format($total,2,".",",")?></strong></td>
                  </tr>
				  <tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				  </tr>
				  <tr>
					<td><strong>Relaci&oacute;n de cobros</strong></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				  </tr> 
				  <?php
					if (mysql_num_rows($rs_cobros) <= 0) {
						echo "<tr><td>No hay cobros en este d&iacute;a.</td><td>&nbsp;</td><td>&nbsp;</td></tr>";	
					} else {
						while ($contador < mysql_num_rows($rs_cobros)) { ?>
							<tr>
								<td>Total <?php echo mysql_result($rs_cobros, $contador, "nombrefp"); ?></td>
								<td><?php echo $simbolomoneda; ?></td>
								<td align="right"><?php echo number_format(mysql_result($rs_cobros, $contador, "total_forma_pago"),2,".",","); ?></td>
							</tr>
							<?php 
							$total_cobros = $total_cobros + mysql_result($rs_cobros, $contador, "total_forma_pago");
							$contador++;
						}
					}
				  ?>				                    
                  <tr>
                    <td><strong>Total</strong></td>
                    <td><?php echo $simbolomoneda ?></td>
                    <td align="right"><strong><?php echo number_format($total_cobros,2,".",","); ?></strong></td>
                  </tr>
                </table>
    </div>
			<div id="botonBusquedaCC">
			  <img src="../img/botonimprimir.jpg" width="79" height="22" border="1" onClick="imprimir('<?php echo $fechainicio?>','<?php echo $minimo?>','<?php echo $maximo?>','<?php echo $neto?>','<?php echo $iva?>','<?php echo $total?>','<?php echo $contado?>','<?php echo $tarjeta?>')" onMouseOver="style.cursor=cursor">		
			</div>
			</div>	
		</div>
	</body>
</html>