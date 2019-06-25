<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<%@page import="eleicao.dao.DaoCandidato"%>
<%@page import="eleicao.model.ModelCandidatos"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="./css/style.css" rel="stylesheet" type="text/css">
	<link href="./css/home.css" rel="stylesheet" type="text/css">
	<script src="./js/votacao.js"></script>
	<script src="./js/script.js"></script>
	<title>Relatório</title>
</head>
<body>
	<div>
		<div>
		  <div>
			  <h1>Relatório de Votação</h1>
			  <% List<ModelCandidatos> candidatos = new DaoCandidato().findAll(); %>
				<% for(ModelCandidatos c : candidatos) { %>
			 <div class="candidatos">
			 	  <img id="img" src="./imagem/<%=c.getNumero()%>.jpg">
	              <div class="lbl"> <b>Numero:</b><%=c.getNumero()%></div>
	              <div class="lbl"> <b>Nome:</b><%=c.getNome()%></div>
	              <div class="lbl"> <b>Votos:</b><%=c.getVoto()%></div>
		     </div>
			  
 			<%}%>
 			<br>
 			<button class="otherBtn" onclick="window.history.back()">Voltar</button>
 			
 
		  </div> 
		</div>
	</div>
</body>
</html>