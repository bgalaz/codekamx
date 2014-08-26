<?php

include("../config.php"); 
class PDF extends FPDF
{
//Cabecera de pgina
function Header($imagenfacguia,$equis,$yy,$anch,$alt)
{
    //Logo
    //$this->Image('./logo/logo.jpg',20,8,150);

	$this->Image('./logo/' . $imagenfacguia, $equis, $yy, $anch, $alt);
	$this->Ln(5);	
}

//Pie de pgina
function Footer()
{
    $this->SetFont('Arial','',6);
	$this->SetY(-10);
	// $this->Cell(0,10,'Facturación y Control de Inventario WEB - www.pper.cl - 2009',0,0,'C');
}

}
?>