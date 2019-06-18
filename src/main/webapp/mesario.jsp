<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Bem vindo mesário</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link href="./css/style.css" rel="stylesheet" type="text/css">
	<link href="./css/mesario.css" rel="stylesheet" type="text/css">
	<script src="./js/mesario.js"></script>
</head>
<body>
	<div class="mesario">
		<div class="container-fluid">
			<div class="row">
			  <div class="col-sm-6">
			  	<input type="button" class="btn" onclick="vote()" value="Votar"/>
			  </div>
			  <div class="col-sm-6">
			  	<input type="button" class="btn" onclick="habilitar()" value="Habilitar um Eleitor"/>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>