<?php
include ("../conectar.php");

$cadena_busqueda=$_GET["cadena_busqueda"];

if (!isset($cadena_busqueda)) 
{ $cadena_busqueda=""; } 
else { $array_cadena_busqueda=split("~",$cadena_busqueda); }

if ($cadena_busqueda<>"") {
	$fechainicio=$array_cadena_busqueda[1];
	$fechafin=$array_cadena_busqueda[2];
} else {
	$fechainicio="";
	$fechafin="";
}
$titulo="Clientes";

?>
<html>
	<head>
		<title>Cobros</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
		<link href="../calendario/calendar-blue.css" rel="stylesheet" type="text/css">
		<script type="text/JavaScript" language="javascript" src="../calendario/calendar.js"></script>
		<script type="text/JavaScript" language="javascript" src="../calendario/lang/calendar-sp.js"></script>
		<script type="text/JavaScript" language="javascript" src="../calendario/calendar-setup.js"></script>
		<script language="javascript">
		
		var cursor;
		if (document.all) {
		// Está utilizando EXPLORER
		cursor='hand';
		} else {
		// Está utilizando MOZILLA/NETSCAPE
		cursor='pointer';
		}
		
		
		function inicio() {
			document.getElementById("formulario").submit();
		}
		
		function buscar() {
			var cadena;
			cadena=hacer_cadena_busqueda();
			document.getElementById("cadena_busqueda").value=cadena;
			if (document.getElementById("iniciopagina").value=="") {
				document.getElementById("iniciopagina").value=1;
			} else {
				document.getElementById("iniciopagina").value=document.getElementById("paginas").value;
			}
			document.getElementById("formulario").submit();
		}
		
		function paginar() {
			document.getElementById("iniciopagina").value=document.getElementById("paginas").value;
			document.getElementById("formulario").submit();
		}
		

//		function paginar2() {
			//var com_ven=document.getElementById("paginas2").value;
//			if (document.getElementById("paginas2").value=="Venta") {
//				document.getElementById("formulario").submit();
//										 
//			} else 
//			{
//				document.getElementById("formulario").submit();
//			}
//			
//		}
		
		function hacer_cadena_busqueda() {			
			var fechainicio=document.getElementById("fechainicio").value;
			var fechafin=document.getElementById("fechafin").value;
			var paginas2=document.getElementById("paginas2").value;
			var cadena="";
			cadena="~"+fechainicio+"~"+fechafin+"~"+paginas2+"~";
			return cadena;
			}

		function limpiar() {
			document.getElementById("formulario").reset();
		}
		
		function validar() {
		inicio=document.getElementById('fechainicio').value;
		fin=document.getElementById('fechafin').value;
		inicio=new Date(inicio);
		
		fin=new Date(fin);
		if(inicio>fin)
		alert('Fechas erroneas');
		}


/*************FUNCIONES CALENDARIO NUEVO****************************/
   function esDigito(sChr){ 
    var sCod = sChr.charCodeAt(0); 
    return ((sCod > 47) && (sCod < 58)); 
   } 

   function valSep(oTxt){ 
    var bOk = false; 
    bOk = bOk || ((oTxt.value.charAt(2) == "-") && (oTxt.value.charAt(5) == "-")); 
    bOk = bOk || ((oTxt.value.charAt(2) == "/") && (oTxt.value.charAt(5) == "/")); 
    return bOk; 
   } 

   function finMes(oTxt){ 
    var nMes = parseInt(oTxt.value.substr(3, 2), 10); 
    var nAno = parseInt(oTxt.value.substr(6), 10); 
    var nRes = 0; 
    switch (nMes){ 
     case 1: nRes = 31; break; 
     case 2: nRes = 28; break; 
     case 3: nRes = 31; break; 
     case 4: nRes = 30; break; 
     case 5: nRes = 31; break; 
     case 6: nRes = 30; break; 
     case 7: nRes = 31; break; 
     case 8: nRes = 31; break; 
     case 9: nRes = 30; break; 
     case 10: nRes = 31; break; 
     case 11: nRes = 30; break; 
     case 12: nRes = 31; break; 
    } 
    return nRes + (((nMes == 2) && (nAno % 4) == 0)? 1: 0); 
   } 

   function valDia(oTxt){ 
    var bOk = false; 
    var nDia = parseInt(oTxt.value.substr(0, 2), 10); 
    bOk = bOk || ((nDia >= 1) && (nDia <= finMes(oTxt))); 
    return bOk; 
   } 

   function valMes(oTxt){ 
    var bOk = false; 
    var nMes = parseInt(oTxt.value.substr(3, 2), 10); 
    bOk = bOk || ((nMes >= 1) && (nMes <= 12)); 
    return bOk; 
   } 

   function valAno(oTxt){ 
    var bOk = true; 
    var nAno = oTxt.value.substr(6); 
    bOk = bOk && ((nAno.length == 2) || (nAno.length == 4)); 
    if (bOk){ 
     for (var i = 0; i < nAno.length; i++){ 
      bOk = bOk && esDigito(nAno.charAt(i)); 
     } 
    } 
    return bOk; 
   } 

   function valFecha(oTxt){ 
    var bOk = true; 
    if (oTxt.value != ""){ 
     bOk = bOk && (valAno(oTxt)); 
     bOk = bOk && (valMes(oTxt)); 
     bOk = bOk && (valDia(oTxt)); 
     bOk = bOk && (valSep(oTxt)); 
     return bOk; 
    } 
   } 

   function fechaMayorOIgualQue(fechainicio, fechafin){ 
    var bRes = false; 
    var sDia0 = fechainicio.value.substr(0, 2); 
    var sMes0 = fechainicio.value.substr(3, 2); 
    var sAno0 = fechainicio.value.substr(6, 4); 
    var sDia1 = fechafin.value.substr(0, 2); 
    var sMes1 = fechafin.value.substr(3, 2); 
    var sAno1 = fechafin.value.substr(6, 4); 
    if (sAno0 > sAno1) bRes = true; 
    else { 
     if (sAno0 == sAno1){ 
      if (sMes0 > sMes1) bRes = true; 
      else { 
       if (sMes0 == sMes1) 
        if (sDia0 >= sDia1) bRes = true; 
      } 
     } 
    } 
    return bRes; 
   } 

   function valFechas(){ 
    var bOk = false; 
    if (valFecha(document.formulario.fechainicio)){ 
     if (valFecha(document.formulario.fechafin)){ 
      if (fechaMayorOIgualQue(document.formulario.fechafin, document.formulario.fechainicio)){ 
       bOk = true; 
        
      } else { 
       alert("Rango de fechas invalido"); 
       document.formulario.fechafin.focus(); 
      } 
     } else { 
      alert("Fecha invalida"); 
      document.formulario.fechafin.focus(); 
     } 
    } else { 
     //alert("Fecha invalida"); 
     document.formulario.fechainicio.focus(); 
    } 
   } 

/*****************FIN CALENDARIO NUEVO***************************/
/****************PDF*********************************************/
	function imprimir() {
			var fechainicio=document.getElementById("fechainicio").value;
			var fechafin=document.getElementById("fechafin").value;
			var paginas2=document.getElementById("paginas2").value;
			window.open("../fpdf/libro_diario.php?fechainicio="+fechainicio+"&fechafin="+fechafin+"&paginas2="+paginas2);
						}  

		</script>
		
	</head>
	<body onLoad="inicio()">
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
				<div id="tituloForm" class="header">Buscar MOVIMIENTOS </div>
				<div id="frmBusqueda">
				<form id="formulario" name="formulario" method="post" action="rejilla.php" target="frame_rejilla">
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>					
					  <tr>
						  <td width="16%">Fecha de inicio</td>
					    <td width="69%"><input id="fechainicio" type="text" class="cajaPequena" NAME="fechainicio" maxlength="10" value="<?php echo $fechainicio?>"><img src="../img/calendario.png" name="Image1" id="Image1" width="16" height="16" border="0" title="Calendario">
        <script type="text/javascript">
					Calendar.setup(
					  {
					inputField : "fechainicio",
					ifFormat   : "%d/%m/%Y",
					button     : "Image1"
					  }
					);
		</script>	</td>
					    <td width="5%">&nbsp;</td>
					    <td width="5%">&nbsp;</td>
					    <td width="5%">&nbsp;</td>
					  </tr>
						<tr>
						  <td>Fecha de fin</td>
						  <td><input id="fechafin" type="text" class="cajaPequena" NAME="fechafin" maxlength="10" value="<?php echo $fechafin?>"><img src="../img/calendario.png" name="Image2" id="Image2" width="16" height="16" border="0" title="Calendario2">

	   <script type="text/javascript">
					Calendar.setup(
					  {
					inputField : "fechafin",
					ifFormat   : "%d/%m/%Y",
					button     : "Image2"
					  }
					);
		</script></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
					  </tr>
					</table>
			  </div>
					
					<div id="botonBusqueda"><img src="../img/botonbuscar.jpg" width="69" height="22" border="1" onClick="buscar();valFechas()" onMouseOver="style.cursor=cursor">
			 	  <img src="../img/botonlimpiar.jpg" width="69" height="22" border="1" onClick="limpiar()" onMouseOver="style.cursor=cursor">	
					<img src="../img/botonimprimir.jpg" width="79" height="22" border="1" onClick="imprimir()" onMouseOver="style.cursor=cursor">
				</div>				
			  <div id="lineaResultado">
				</div>
			  <div id="lineaResultado">
			  <table class="fuente8" width="80%" cellspacing=0 cellpadding=3 border=0>
			  	<tr>
				<td width="50%" align="left">N de movimientos encontrados <input id="filas" type="text" class="cajaPequena" NAME="filas" maxlength="5" readonly></td>
				<td width="50%" align="right">Mostrados <select name="paginas" id="paginas" onChange="paginar()">
		          </select></td>
			  </table>
				</div>
				<div id="cabeceraResultado" class="header">
					relacion de MOVIMIENTOS </div>
				<div id="frmResultado">
				<table class="fuente8" width="100%" cellspacing=0 cellpadding=3 border=0 ID="Table1">
						<tr class="cabeceraTabla">
							<td width="5%">ITEM</td>
							<td width="10%">FECHA</td>
							<td width="10%">C/V</td>							
							<td width="10%">FACTURA</td>
							<td width="20%"><?php echo $titulo ?></td>
							<td width="20%">FORMA PAGO</td>
							<td width="15%">NUM. DOC.</td>
							<td width="10%">IMPORTE</td>
						</tr>
				</table>
				</div>
				<input type="hidden" id="iniciopagina" name="iniciopagina">
				<input type="hidden" id="cadena_busqueda" name="cadena_busqueda">
				<div id="vta_fact">
			  	  <td width="50%" align="right">Venta &nbsp/&nbsp Compra &nbsp&nbsp&nbsp
		          </select>
		          <select name="paginas2" id="paginas2" onChange="paginar2()">
                    <option value="2">Seleccione</option>
                    <option value="2">Venta</option>
                    <option value="1">Compra</option>
                </select></td></div>
			</form>
				<div id="lineaResultadoLB">
					<iframe width="100%" height="230" id="frame_rejilla" name="frame_rejilla" frameborder="0">
						<ilayer width="80%" height="230" id="frame_rejilla" name="frame_rejilla"></ilayer>
					</iframe>
				</div>
				<iframe id="frame_datos" name="frame_datos" width="0" height="0" frameborder="0">
					<ilayer width="0" height="0" id="frame_datos" name="frame_datos"></ilayer>
				  </iframe>
				</div>
		  </div>			
		</div>

  	</div>
</body>
</html>
