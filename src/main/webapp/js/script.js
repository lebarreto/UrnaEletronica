
function backPage(valueName){
    valueName += '';
    var url = "&";
    

    document.forms[0].action = "/Eleicao/redirect?pagina=/relatorio.jsp" + url;
    document.forms[0].method = "GET";

}

function goTo(){
    window.location = "/Eleicao/redirect?pagina=/zona.jsp";
}

function validar(){
    document.getElementById("indisponivel").value = "-1";   
}

function habilitar(){
	alert('Usuario autorizado a votar');  
}