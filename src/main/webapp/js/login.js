function redirect(){
	var titulo = document.getElementById('titulo').value;
	
	if(titulo == '1234'){
		window.location.href = "../Eleicao/home.html";
	}
	else if(titulo == '5678'){
		window.location.href = "../Eleicao/mesario.html";
	}
	else{
		window.location.href = "../Eleicao/chefe.html";
	}
}
