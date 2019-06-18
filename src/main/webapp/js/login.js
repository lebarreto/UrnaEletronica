//function redirect(){
//	var titulo = document.getElementById('titulo').value;
//	
//	if(titulo == '1234'){
//		window.location.href = "../Eleicao/home.html";
//	}
//	else if(titulo == '5678'){
//		window.location.href = "../Eleicao/mesario.html";
//	}
//	else{
//		window.location.href = "../Eleicao/chefe.html";
//	}
//}


window.onload = function()
{
    var nivel = document.getElementById("nivel").value;
    if(nivel > 2)
    {
        document.getElementById("autoriza").style.display = "block";
        document.getElementById("relatorio").style.display = "block";
    }
    else if(nivel == 2)
    {
        
        document.getElementById("autoriza").style.display = "block";
        document.getElementById("relatorio").style.display = "none";
    }
    else
    {        
        document.getElementById("autoriza").style.display = "none";
        document.getElementById("relatorio").style.display = "none";
    }
};

function redirect(action)
{
    var url = "/" + action + ".jsp";
    document.getElementById("pagina").value = url;
};