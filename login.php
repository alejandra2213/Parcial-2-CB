<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
</head>
<?php 
if (isset($_GET['error'])) {
	$error=$_GET['error'];
	if ($error=="Incorrecto") {
		echo "<h2>El Usuario o contraseña incorrectos</h2>";
	}
	if ($error=="vacio") {
		echo "<h2>Los campos se encuentran vacios</h2>";
	}
}
?>
<body>
	<h2>Iniciar sesión</h2>
<form action="logeo.php" method="POST">
	<p><label for="nickname">Usuario</label></p>
	<input type="text" name="nickname">
	<p><label for="password">Contraseña</label></p>
	<input type="text" name="password">
	<p><input type="submit" value="Acceder"></p>
</form>
<h1>Tengo sueño uwu</h1>
</body>
</html>