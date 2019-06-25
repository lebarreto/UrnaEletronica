<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Habilitar Votação</title>
	<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css"/>
	<link rel="stylesheet" href="./css/bootstrap-responsive.min.css" type="text/css"/>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="./css/style.css" rel="stylesheet" type="text/css">
	<link href="./css/home.css" rel="stylesheet" type="text/css">
	<script src="./js/script.js"></script>
</head>
<body>
	<div>
		<div>
		  <div>
			  <h1>Habilitar</h1>
			   <form action="habilitar" method="POST">
			   		<label>Título</label>
            		<input type="text" name="usuario" id="usuario" value="${requestScope.usuario}"/>	  	
					
					<label>Nome</label>      
			        <input type="text" id="nome" name="nome" value="${requestScope.nome}" readonly/>
			        
			        <label>Autorizado a votar?</label>
			        <input type="text" id="disponivel" name="disponivel" value="${requestScope.disponivel}" readonly/>
			        
			        <label>Ja votou?</label>
			        <input type="text" id="indisponivel" name="indisponivel" value="${requestScope.indisponivel}" readonly/>
			        
			        <input type="hidden" id="titulo" name="titulo" value="${sessionScope.titulo}" readonly/>  
			        <input type="hidden" id="nivel" name="nivel" value="${sessionScope.nivel}" readonly/>
							
					<button class="clear" onclick="validar()">Validar</button>
			        <button class="confirm" onclick="habilitar()">Habilitar</button>
				</form>
			  
		  </div> 
		</div>
	</div>
</body>
</html>