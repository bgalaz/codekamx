<?php
include ("../conectar.php"); 
include ("../funciones/fechas.php"); 

$codfactura=$_GET["codfactura"];
$cadena_busqueda=$_GET["cadena_busqueda"];

$query="SELECT * FROM facturas WHERE codfactura='$codfactura'";
$rs_query=mysql_query($query);
$codcliente=mysql_result($rs_query,0,"codcliente");
$fecha=mysql_result($rs_query,0,"fecha");
$iva=mysql_result($rs_query,0,"iva");

?>

<html>
	<head>
		<title>Principal</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		var cursor;
		if (document.all) {
		// Está utilizando EXPLORER
		cursor='hand';
		} else {
		// Está utilizando MOZILLA/NETSCAPE
		cursor='pointer';
		}
		
		function aceptar() {
			location.href="index.php?cadena_busqueda=<?php echo $cadena_busqueda?>";
		}
		
		function imprimir(codfactura) {
			window.open("../fpdf/imprimir_factura.php?codfactura="+codfactura);
		}
		
		</script>
	</head>
	<body>
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
				<div id="tituloForm" class="header">VER FACTURA </div>
				<div id="frmBusqueda">
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>
						<?php 
						 $sel_cliente="SELECT * FROM clientes WHERE codcliente='$codcliente'"; 
						  $rs_cliente=mysql_query($sel_cliente); ?>
						<tr>
							<td width="15%">Cliente</td>
							<td width="85%" colspan="2"><?php echo mysql_result($rs_cliente,0,"nombre");?></td>
					    </tr>
						<tr>
							<td width="15%">RUT</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_cliente,0,"nif");?></td>
					    </tr>
						<tr>
						  <td>Direcci&oacute;n</td>
						  <td colspan="2"><?php echo mysql_result($rs_cliente,0,"direccion"); ?></td>
					  </tr>
						<tr>
						  <td>C&oacute;digo de factura</td>
						  <td colspan="2"><?php echo $codfactura?></td>
					  </tr>
					  <tr>
						  <td>Fecha</td>
						  <td colspan="2"><?php echo implota($fecha)?></td>
					  </tr>
					  <tr>
						  <td>IVA</td>
						  <td colspan="2"><?php echo $iva?> %</td>
					  </tr>
					  <tr>
						  <td></td>
						  <td colspan="2"></td>
					  </tr>
				  </table>
					 <table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0 ID="Table1">
						<tr class="cabeceraTabla">
							<td width="5%">ITEM</td>
							<td width="25%">REFERENCIA</td>
							<td width="30%">DESCRIPCION</td>
							<td width="10%">CANTIDAD</td>
							<td width="10%">PRECIO</td>
							<td width="10%">DCTO %</td>
							<td width="10%">IMPORTE</td>
						</tr>
					</table>
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0 ID="Table1">
					  <?php $sel_lineas="SELECT factulinea.*,articulos.*,familias.nombre as nombrefamilia FROM factulinea,articulos,familias WHERE factulinea.codfactura='$codfactura' AND factulinea.codigo=articulos.codarticulo AND factulinea.codfamilia=articulos.codfamilia AND articulos.codfamilia=familias.codfamilia ORDER BY factulinea.numlinea ASC";
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
							$descuento=mysql_result($rs_lineas,$i,"dcto");
							if ($i % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; } ?>
									<tr class="<?php echo $fondolinea?>">
										<td width="5%" class="aCentro"><?php echo $i+1?></td>
										<td width="25%"><?php echo $referencia?></td>
										<td width="30%"><?php echo $descripcion?></td>
										<td width="10%" class="aCentro"><?php echo $cantidad?></td>
										<td width="10%" class="aCentro"><?php echo $precio?></td>
										<td width="10%" class="aCentro"><?php echo $descuento?></td>
										<td width="10%" class="aCentro"><?php echo $importe?></td>
									</tr>
									<?php $baseimponible=$baseimponible+$importe; ?>
					<?php } ?>
					</table>
			  </div>
			  <?php $baseimpuestos=$baseimponible*($iva/100);
				$preciototal=$baseimponible+$baseimpuestos;
				$preciototal=number_format($preciototal,2); ?>
					<div id="frmBusqueda">
					<table width="25%" border=0 align="right" cellpadding=3 cellspacing=0 class="fuente8">
						<tr>
							<td width="15%">Base imponible</td>
							<td width="15%"><?php echo number_format($baseimponible,2);?> <?php echo $simbolomoneda ?></td>
						</tr>
						<tr>
							<td width="15%">IVA</td>
							<td width="15%"><?php echo number_format($baseimpuestos,2);?> <?php echo $simbolomoneda ?></td>
						</tr>
						<tr>
							<td width="15%">Total</td>
							<td width="15%"><?php echo $preciototal?> <?php echo $simbolomoneda ?></td>
						</tr>
					</table>
			  </div>
				<div id="botonBusqueda">
					<div align="center">
					  <img src="../img/botonaceptar.jpg" width="85" height="22" onClick="aceptar()" border="1" onMouseOver="style.cursor=cursor">
					 <img src="../img/botonimprimir.jpg" width="79" height="22" border="1" onClick="imprimir(<?php echo $codfactura?>)" onMouseOver="style.cursor=cursor">
				        </div>
					</div>
			  </div>
		  </div>
		</div>
	</body>
</html>
