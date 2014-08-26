<?php

include '../config.php';
include 'dbc.php';
if ($_POST['Submit']=='Send')
{
$host = $_SERVER['HTTP_HOST'];
$rs_search = mysql_query("select user_email from users where user_email='$_POST[email]'");
$user_count = mysql_num_rows($rs_search);

if ($user_count != 0)
{
$newpwd = rand(1000,9999);
$host = $_SERVER['HTTP_HOST'];
$newmd5pwd = md5($newpwd);
mysql_query("UPDATE users set user_pwd='$newmd5pwd' where user_email='$_POST[email]'");
$message = 
"You have requested new login details from $host. Here are the login details...\n
Usted ha solicitado una nueva clave desde $host. Esta es su nueva clave...\n\n 

Usuario: $_POST[email] \n
Nueva Clave: $newpwd \n
______________________________________________________________
Thank you. This is an automated response. PLEASE DO NOT REPLY.
Gracias, esta es una respuesta automática, favor no responda.

";
	mail($_POST['email'], "Datos Solicitados a Facturación PPER", $message,
    "From: \"Sistema de Facturación\" <administrador@$host>\r\n" .
     "X-Mailer: PHP/" . phpversion());
	 
die("Gracias, su nueva Clave fué enviada a su email");
} else die("La casilla de correo que ingresaste no existe");

}
?>
<h3>Olvide mi Clave</h3>
<p>Ingrese su email para enviarle una nueva Clave.</p>
<table width="50%" border="0" cellpadding="1" cellspacing="0">
  <tr>
    <td> 
      <form name="form1" method="post" action="">
        <p><br>
          <strong>Email:</strong> 
          <input name="email" type="text" id="email">
          <input type="submit" name="Submit" value="Send">
        </p>
      </form></td>
  </tr>
</table>
<p>&nbsp;</p>

