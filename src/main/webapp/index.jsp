<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/login.css" rel="stylesheet" type="text/css">
	<link href="./css/style.css" rel="stylesheet" type="text/css">
	<title>Login</title>
</head>
<body>
	<div class="loginBox">
		<form action="autenticar" method="POST">
			<h1>Login</h1>
			<input type="text" id="titulo" name="titulo" value="Título" class="titulo"/>	  
			<input type="password" id="senha" name="senha" value="Senha" class="senha" />	  
			<button type="submit" class="btnLogin" id="btnLogin"> Entrar </button> 
		</form>
	</div>
</body>
</html>