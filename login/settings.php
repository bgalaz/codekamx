<?php 
session_start();

if (!isset($_SESSION['user']))
{
	header("Location: login.php");
}

include ('../config.php');
include ('dbc.php'); 

if ($_POST['Submit']=='Change')
{
$rsPwd = mysql_query("select user_pwd from users where user_email='$_SESSION[user]'") or die(mysql_error());
list ($oldpwd) = mysql_fetch_row($rsPwd);

if ($oldpwd == md5($_POST['oldpwd']))
 {
  $newpasswd = md5($_POST['newpwd']);
  
  mysql_query("Update users
  				SET user_pwd = '$newpasswd'
				WHERE user_email = '$_SESSION[user]'
				") or die(mysql_error());
  header("Location: settings.php?msg=Password updated...");				
  } else 
  { header("Location: settings.php?msg=ERROR: Password does not match..."); }
}

?>
<h1>Settings</h1>
<p> 
  <?php if (isset($_GET['msg'])) { echo "<div class=\"msg\"> $_GET[msg] </div>"; } ?>
</p>
<h2>Cambiar la Clave</h2>
<form action="settings.php" method="post" name="form3" id="form3">
  <p>Clave Antigua: 
    <input name="oldpwd" type="password" id="oldpwd">
  </p>
  <p>Nueva Clave: 
    <input name="newpwd" type="password" id="newpwd">
  </p>
  <p> 
    <input name="Submit" type="submit" id="Submit" value="Change">
  </p>
</form>
