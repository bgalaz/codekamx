<?php 
include 'dbc.php';

$user_email = mysql_real_escape_string($_POST['email']);

if ($_POST['Submit']=='Aceptar')
{
	$md5pass = md5($_POST['pwd']);
	$sql = "SELECT id,user_email FROM users WHERE 
            user_email = '$user_email' AND 
            user_pwd = '$md5pass' AND user_activated='1'"; 
			
	$result = mysql_query($sql) or die (mysql_error()); 
	$num = mysql_num_rows($result);

    if ( $num != 0 ) { 

       // A matching row was found - the user is authenticated. 
       session_start(); 
	   list($user_id,$user_email) = mysql_fetch_row($result);
		
		// this sets variables in the session 
		$_SESSION['user']= $user_email;  
					
		if (isset($_GET['ret']) && !empty($_GET['ret']))
		{
			header("Location: $_GET[ret]");
		} else
		{
			//header("Location: myaccount.php");
			header("Location: ../index.php");

		}
		//echo "Logged in...";
		exit();
    } 

	header("Location: login.php?msg=Invalid Login");
	//echo "Error:";
	exit();		
}

?>

<link href="styles.css" rel="stylesheet" type="text/css">
<?php if (isset($_GET['msg'])) { echo "<div class=\"msg\"> $_GET[msg] </div>"; } ?>

<p>&nbsp;</p>

<table  width="50%" height="400" border="2" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td bgcolor="#d5e8f9" class="mnuheader" >
		<div align="center"><font size="4"><strong>Ingreso de Usuarios</strong></font></div>
	</td>
  </tr>
  
  <tr> 
	<td class="tabla" bgcolor="#e5ecf9" >
		
		<form name="form1" method="post" action="">
			<p>&nbsp;</p><p>&nbsp;</p>
			<p>&nbsp;</p><p>&nbsp;</p>
			<p>&nbsp;</p><p>&nbsp;</p>
			<p>&nbsp;</p>
			<p align="center">Ingrese su Email: 
				<input name="email" type="text" id="email"> (admin)
			</p>
			<p align="center"> Ingrese su Clave: 
				<input name="pwd" type="password" id="pwd"> (admin)
			</p>
			<p align="center"> 
				<input type="submit" name="Submit" value="Aceptar">
			</p>
			<p align="center">
				<a href="register.php">Registrarse</a> | <a href="forgot.php">Olvide la Clave</a>
			</p>
		</form>
	</td>
  </tr>
</table>
	
