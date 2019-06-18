
function altera()
{
	var candidato = document.getElementById('candidato').value;
	if(candidato)
	{
		if(candidato === "") candidato = "0";
		document.getElementById('numero').value = candidato;
		document.getElementById('imgCandidato').src = './imagem/' + candidato + '.jpg';
	}
}

function clear()
{
	location.reload();
};

function votar()
{
	var value = document.getElementById('candidato').value;
	document.getElementById('numero').value = value ? value : "0";
}