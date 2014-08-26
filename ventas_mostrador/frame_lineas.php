<script>
function eliminar_linea(codfacturatmp,numlinea,importe)
{
	if (confirm(" Desea eliminar esta linea ? "))
		parent.document.formulario_lineas.baseimponible.value=parseFloat(parent.document.formulario_lineas.baseimponible.value) - parseFloat(importe);
		var original=parseFloat(parent.document.formulario_lineas.baseimponible.value);
		var result=Math.round(original*100)/100 ;
		parent.document.formulario_lineas.baseimponible.value=result;

		parent.document.formulario_lineas.baseimpuestos.value=parseFloat(result * parseFloat(parent.document.formulario.iva.value / 100));
		var original1=parseFloat(parent.document.formulario_lineas.baseimpuestos.value);
		var result1=Math.round(original1*100)/100 ;
		parent.document.formulario_lineas.baseimpuestos.value=result1;
		var original2=parseFloat(result + result1);
		var result2=Math.round(original2*100)/100 ;
		parent.document.formulario_lineas.preciototal.value=result2;
		
		document.getElementById("frame_datos").src="eliminar_linea.php?codfacturatmp="+codfacturatmp+"&numlinea=" + numlinea;
}
</script>
<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
<?php 
include ("../conectar.php");
$codfacturatmp=$_POST["codfacturatmp"];
$retorno=0;
if ($modif<>1) {
		if (!isset($codfacturatmp)) { 
			$codfacturatmp=$_GET["codfacturatmp"]; 
			$retorno=1; }
		if ($retorno==0) {	
				$codbarras=$_POST["codbarras"];
				$sel_articulos="SELECT * FROM articulos WHERE codigobarras='$codbarras'";
				$rs_articulos=mysql_query($sel_articulos);			
				$codfamilia=mysql_result($rs_articulos,0,"codfamilia");
				$codarticulo=mysql_result($rs_articulos,0,"codarticulo");
				$cantidad=$_POST["cantidad"];
				$precio=$_POST["precio"];
				$importe=$_POST["importe"];
				$descuento=$_POST["descuento"];
				
				$sel_insert="INSERT INTO factulineatmp (codfactura,numlinea,codigo,codfamilia,cantidad,precio,importe,dcto) VALUES ('$codfacturatmp','','$codarticulo','$codfamilia','$cantidad','$precio','$importe','$descuento')";
				$rs_insert=mysql_query($sel_insert);
		}
}
?>
<div id="xdetalle" align="center">
<table class="fuente8" width="100%" cellspacing=1 cellpadding=3 border=0 ID="Table1">
<?php
$sel_lineas="SELECT factulineatmp.*,articulos.*,familias.nombre as nombrefamilia FROM factulineatmp,articulos,familias WHERE factulineatmp.codfactura='$codfacturatmp' AND factulineatmp.codigo=articulos.codarticulo AND factulineatmp.codfamilia=articulos.codfamilia AND articulos.codfamilia=familias.codfamilia ORDER BY factulineatmp.numlinea ASC";
$rs_lineas=mysql_query($sel_lineas);
for ($i = 0; $i < mysql_num_rows($rs_lineas); $i++) {
	$numlinea=mysql_result($rs_lineas,$i,"numlinea");
	$codfamilia=mysql_result($rs_lineas,$i,"codfamilia");
	$nombrefamilia=mysql_result($rs_lineas,$i,"nombrefamilia");
	$codarticulo=mysql_result($rs_lineas,$i,"codarticulo");
	$referencia=mysql_result($rs_lineas,$i,"referencia");
	$descripcion=mysql_result($rs_lineas,$i,"descripcion");
	$cantidad=mysql_result($rs_lineas,$i,"cantidad");
	$precio=mysql_result($rs_lineas,$i,"precio");
	$importe=mysql_result($rs_lineas,$i,"importe");
	$baseimp=$importe+$baseimp;
		
	$descuento=mysql_result($rs_lineas,$i,"dcto");
	if ($i % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; } ?>

			<tr class="<?php echo $fondolinea?>">
				<td width="4%"><?php echo $i+1?></td>
				<td width="20%"><?php echo $nombrefamilia?></td>
				<td width="16%"><?php echo $referencia?></td>
				<td width="29%"><?php echo $descripcion?></td>
				<td width="9%" class="aCentro"><?php echo $cantidad?></td>
				<td width="8%" class="aCentro"><?php echo $precio?></td>
				<td width="7%" class="aCentro"><?php echo $descuento?></td>
				<td width="6%" class="aCentro"><?php echo number_format($importe,2,".",","); ?></td>
				<td width="2%"><a href="javascript:eliminar_linea(<?php echo $codfacturatmp?>,<?php echo $numlinea?>,<?php echo $importe ?>)"><img src="../img/eliminar.png" border="0"></a></td>
			</tr>
<?php } 

$baseiva=$baseimp*(number_format($ivaimp,2,".",",")/100);
$preciotot=$baseimp+$baseiva;

?>
</table>
</div>
		  <div id="ztotales" align="center">
			<table width="100%" border=0 align="center" cellpadding=3 cellspacing=0 class="fuente8">
			  <tr>
			    <td width="70%" class="busqueda"><b>Sub-total</b></td>
				<td width="30%" align="right"><div align="right"><?php echo $simbolomoneda ?>
			      <input class="cajaTotales" name="baseimponible" type="text" id="baseimponible" size="12" value="<?echo number_format($baseimp,2,".",",");?>" align="right" readonly> 
		        </div></td>																					 
	

			  </tr>
			  <tr>
				<td class="busqueda"><b>IVA</b></td>
				<td align="right"><div align="right"><?php echo $simbolomoneda ?>
			      <input class="cajaTotales" name="baseimpuestos" type="text" id="baseimpuestos" size="12" align="right" value="<?php echo number_format($baseiva,2,".",",");?>" readonly> 
		        </div></td>
			  </tr>
			  <tr>
				<td class="busqueda"><b>Precio Total</b></td>
				<td align="right"><div align="right"><?php echo $simbolomoneda ?>
			      <input class="cajaTotales" name="preciototal" type="text" id="preciototal" size="12" align="right" value="<?php echo number_format($preciotot,2,".",",");?>" readonly> 
		        </div></td>
			  </tr>
		</table>
			  </div>





<iframe id="frame_datos" name="frame_datos" width="0%" height="0" frameborder="0">
	<ilayer width="0" height="0" id="frame_datos" name="frame_datos"></ilayer>
</iframe>
<script>parent.document.getElementById("codbarras").focus();</script>