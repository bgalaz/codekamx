<?php
header('Cache-Control: no-cache');
header('Pragma: no-cache'); 
?>
<html>
<head>
<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
</head>
<script language="javascript">

function pon_prefijo(nombre,nif) {
	parent.document.form_busqueda.nombre.value=nombre;
	parent.document.form_busqueda.nif.value=nif;
}

function limpiar() {
	parent.document.form_busqueda.nombre.value="";
	parent.document.form_busqueda.nif.value="";
	parent.document.form_busqueda.codproveedor.value="";
}

</script>
<?php include ("../conectar.php"); ?>
<body>
<?php
	$codproveedor=$_GET["codproveedor"];
	$consulta="SELECT * FROM proveedores WHERE codproveedor='$codproveedor' AND borrado=0";
	$rs_tabla = mysql_query($consulta);
	if (mysql_num_rows($rs_tabla)>0) {
		?>
		<script languaje="javascript">
		pon_prefijo("<?php echo mysql_result($rs_tabla,0,nombre) ?>","<?php echo mysql_result($rs_tabla,0,nif) ?>");
		</script>
		<?php 
	} else { ?>
	<script>
	alert ("No existe ningun proveedor con ese codigo");
	limpiar();
	</script>
	<?php }
?>
</div>
</body>
</html>
