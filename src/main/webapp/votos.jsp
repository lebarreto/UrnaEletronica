<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Urna</title>
	<link href="./css/style.css" rel="stylesheet" type="text/css">
	<link href="./css/home.css" rel="stylesheet" type="text/css">
	<script src="./js/votacao.js"></script>
	<script src="./js/script.js"></script>
</head>
<body>
	<div>
		<div>
		  <div>
		  	 <form action="votacao" method="post">
			  <h1>Votação</h1>
			  				  	
				  <label class="lbl">Candidato:</label>
				  <input type="text" name="candidato" id="candidato" oninput="altera()">
				  <input type="text" id="user" name="user" value="${sessionScope.titulo}" readonly>

				  <input type="hidden" id="numero" name="numero" readonly>					
				 
				  <button class="confirm" onclick="votar()">Confirmar</button>    
			</form>		  
			 <img id="imgCandidato" src="./imagem/0.png" style="width:20%">
		  </div> 
		 
		  
		</div>
	</div>
</body>
</html>