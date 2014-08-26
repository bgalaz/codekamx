<?php
	require("barcode.inc.php");

	$encode=$_GET['encode'];
	$bar= new BARCODE();
	
	if($bar==false)
		die($bar->error());
			
	// OR $bar= new BARCODE("I2O5");

	$barnumber=$_GET['bdata'];
	//$barnumber="200780";
	//$barnumber="801221905";
	//$barnumber="A40146B";
	//$barnumber="Code 128";
	//$barnumber="TEST8052";
	//$barnumber="TEST93";
	
	$bar->setSymblogy($encode);
	$bar->setHeight($_GET['height']);
	$bar->SetFont('Arial','B',6);	
	
	$bar->setScale($_GET['scale']);
	$bar->setHexColor($_GET['color'],$_GET['bgcolor']);

	//$bar->setSymblogy("UPC-E");
	//$bar->setHeight(50);
	//$bar->setFont("arial");
	//$bar->setScale(2);
	//$bar->setHexColor("#000000","#FFFFFF");

	//OR
	//$bar->setColor(255,255,255)   RGB Color
	//$bar->setBGColor(0,0,0)   RGB Color

  	
	$return = $bar->genBarCode($barnumber,$_GET['type'],$_GET['file']);
	if($return==false)
		$bar->error(true);
	
?>