<?php  
$error;
if (!empty($_POST['nickname'])&& !empty($_POST['password'])) {
	$nickname=$_POST['nickname'];
	$password=$_POST['password'];

if ($nickname=="tamalito" && $password=="12345") {
	$error="OK";
	echo "Ingreso al sistema :3";
	//header("Location: principal.php");
}else{
	$error="Incorrecto";
	//echo "Usuario o contraseña incorrectos";
	header("Location: login.php?error=$error");
    }
}else{
	$error="vacio";
	//echo "Los celdas están vacios";
	header("Location: login.php?error=$error");
}

?>