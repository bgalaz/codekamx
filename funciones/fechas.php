<?php
function implota($fecha) // bd2local
{
	if (($fecha == "") || ($fecha == "0000-00-00"))
		return "";
	$vector_fecha = explode("-",$fecha);
	$aux = $vector_fecha[2];
	$vector_fecha[2] = $vector_fecha[0];
	$vector_fecha[0] = $aux;
	return implode("/",$vector_fecha);
}

function explota($fecha) // local2bd
{
	$vector_fecha = explode("/",$fecha);
	$aux = $vector_fecha[2];
	$vector_fecha[2] = $vector_fecha[0];
	$vector_fecha[0] = $aux;
	return implode("-",$vector_fecha);
};

function mes($mes) 
{
	if ($mes == "01") return "Enero";
	if ($mes == "02") return "Febrero";
	if ($mes == "03") return "Marzo";
	if ($mes == "04") return "Abril";
	if ($mes == "05") return "Mayo";
	if ($mes == "06") return "Junio";
	if ($mes == "07") return "Julio";
	if ($mes == "08") return "Agosto";
	if ($mes == "09") return "Septiembre";
	if ($mes == "10") return "Octubre";
	if ($mes == "11") return "Noviembre";
	if ($mes == "12") return "Diciembre";
};

?>
