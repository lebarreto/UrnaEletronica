package eleicao.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "ModelCandidatos")
public class ModelCandidatos {

	@Id
	@Column(name = "numero")
	private String numero;
	
	@Column(name = "voto")
	private int voto;
	
	@Column(name = "nome")
	private String nome;

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public int getVoto() {
		return voto;
	}

	public void setVoto(int voto) {
		this.voto = voto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	
}
