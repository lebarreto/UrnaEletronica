<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Zona Eleitoral</title>
    <meta charset="UTF-8">        
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <link rel="stylesheet" href="./css/bootstrap-responsive.min.css" type="text/css"/>
    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <link href="./css/chefe.css" rel="stylesheet" type="text/css">
    <link href="./css/login.css" rel="stylesheet" type="text/css">
    <script type='text/javascript' src='./js/login.js'></script>
    <script type="text/javascript" src="./js/script.js"></script>
</head>
    
<body>
	<div class="chefe">
		<div class="container-fluid">
			<form action="redireciona" method="POST">  
				<div class="row">
					<div class="col-sm-4">
					 	<button class="confirm" onclick="redirect('votos')">Votar</button>
					</div>
					<div class="col-sm-4">
	     				<button style="display: none;" id="autoriza" class="clear" onclick="redirect('habilitar')">Autorizar</button>
	     			</div>
    				<div class="col-sm-4">
    					<button style="display: none;" id="relatorio" class="other" onclick="redirect('relatorio')">Relatório</button>
					</div>
				</div>
		       	<input type="hidden" name="titulo" id="titulo" value="${sessionScope.titulo}"/>
		       	<input type="hidden" name="nivel" id="nivel" value="${sessionScope.nivel}"/>
		        <input type="hidden" name="pagina" id="pagina"/>
	    	</form>
	    </div>
	</div>
</body>
</html>