<?php
define('FPDF_FONTPATH','font/');
require('mysql_table.php');
include("comunes.php");
include ("../conectar.php");  
include ("../funciones/fechas.php");

$paginas2=$_GET["paginas2"];
$fechainicio=$_GET["fechainicio"];
if ($fechainicio<>"") { $fechainicio=explota($fechainicio); }
$fechafin=$_GET["fechafin"];
if ($fechafin<>"") { $fechafin=explota($fechafin); }
if ($_GET["cadena_busqueda"]) {
	$cadena_busqueda=$_GET["cadena_busqueda"];
}


$where="1=1";
if (($fechainicio<>"") and ($fechafin<>"")) {
	$where.=" AND fecha between '".$fechainicio."' AND '".$fechafin."'";
} else {
	if ($fechainicio<>"") {
		$where.=" and fecha>='".$fechainicio."'";
	} else {
		if ($fechafin<>"") {
			$where.=" and fecha<='".$fechafin."'";
		}
	}
}

$where.=" and tipodocumento='".$paginas2."'";
$where.=" ORDER BY fecha DESC";
$header=array('Fecha','Factura','Comercial','Forma de Pago','Num.Doc.','Importe');


$pdf=new PDF();
$pdf->Open();
$pdf->AddPage();

//Nombre del Listado
$pdf->SetFillColor(255,255,255);
$pdf->SetFont('Arial','B',16);
$pdf->SetY(40);
$pdf->SetX(0);
    
$titulo="Libro Diario de ";
if ($paginas2==2) {$titulo.="Ventas";} else {$titulo.="Compras";}
$pdf->MultiCell(220,6,$titulo,0,'C',0);

$pdf->Ln();    
	
//Restauracin de colores y fuentes

    $pdf->SetFillColor(224,235,255);
    $pdf->SetTextColor(0);
    $pdf->SetFont('Arial','B',7);

//Colores, ancho de lnea y fuente en negrita

$pdf->SetFillColor(200,200,200);
$pdf->SetTextColor(0);
$pdf->SetDrawColor(0,0,0);
$pdf->SetLineWidth(.2);
$pdf->SetFont('Arial','B',8);
	
//Cabecera
$w=array(20,20,40,30,30,25);
for($i=0;$i<count($header);$i++)
	$pdf->Cell($w[$i],7,$header[$i],1,0,'C',1);
$pdf->Ln();
$pdf->SetFont('Arial','',8);

$sel_resultado="SELECT librodiario.*,formapago.nombrefp FROM librodiario LEFT JOIN formapago ON librodiario.codformapago=formapago.codformapago WHERE ".$where;
$res_resultado=mysql_query($sel_resultado);
$contador=0;
while ($contador < mysql_num_rows($res_resultado)) {
	$pdf->Cell($w[0],5,mysql_result($res_resultado,$contador,"fecha"),'LRTB',0,'C');
	$pdf->Cell($w[1],5,mysql_result($res_resultado,$contador,"coddocumento"),'LRTB',0,'L');

	if (mysql_result($res_resultado,$contador,"tipodocumento")==1) { 
		$codproveedor=mysql_result($res_resultado,$contador,"codcomercial");
		$sel_proveedor="SELECT nombre FROM proveedores WHERE codproveedor='$codproveedor'";
		$rs_proveedor=mysql_query($sel_proveedor);
		$nombrecomercial=mysql_result($rs_proveedor,0,"nombre");
		
		} else { 
		$codcliente=mysql_result($res_resultado,$contador,"codcomercial");
		$sel_proveedor="SELECT nombre FROM clientes WHERE codcliente='$codcliente'";
		$rs_proveedor=mysql_query($sel_proveedor);
		$nombrecomercial=mysql_result($rs_proveedor,0,"nombre"); 
	}  
	$pdf->Cell($w[2],5,$nombrecomercial,'LRTB',0,'L');
	$pdf->Cell($w[3],5,mysql_result($res_resultado,$contador,"nombrefp"),'LRTB',0,'L');
	$pdf->Cell($w[4],5,mysql_result($res_resultado,$contador,"numpago"),'LRTB',0,'C');
	$pdf->Cell($w[5],5,mysql_result($res_resultado,$contador,"total"),'LRTB',0,'C');
	$pdf->Ln();
	$contador++;
};
			
$pdf->Output();
?> 
