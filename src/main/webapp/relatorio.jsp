<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<%@page import="eleicao.dao.DaoCandidato"%>
<%@page import="eleicao.model.ModelCandidatos"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="./css/bootstrap-responsive.min.css" type="text/css"/>
<link rel="stylesheet" href="./css/styles.css" type="text/css"/>
<script type="text/javascript" src="./js/script.js"></script>
<title>Relatório</title>
</head>
<body>
<% List<ModelCandidatos> candidatos = new DaoCandidato().findAll(); %>
	<div>
		<div>
		  <div>
			  <h1>Relatório de Votação</h1>
			  <% for(ModelCandidatos cand : candidatos) { %>
			  <div class="candidatos">
				 <label class="lbl">Candidato Ciro Gomes: <%=cand.getVoto()%> votos</label>	
			  </div>				
			  <div class="candidatos">
				 <label class="lbl">Candidato José Serra: <%=cand.getVoto()%> votos </label>	
			  </div>	
			  <div class="candidatos">
				 <label class="lbl">Candidato Jair Bolsonaro: <%=cand.getVoto()%> votos </label>	
			  </div>
			  <div class="candidatos">
				 <label class="lbl">Candidato Cabo Daciolo: <%=cand.getVoto()%> votos </label>	
			  </div>
			  <%}%>
			  
			  <input type="submit" id="btnVoltar" onclick="goTo()" value="Voltar" /> 
		  </div> 
		</div>
	</div>
</body>
</html>