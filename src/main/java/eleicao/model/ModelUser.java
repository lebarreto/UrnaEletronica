package eleicao.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "ModelUser")
public class ModelUser {

	@Id @GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name = "titulo")
	private String titulo;
	
	@Column(name = "nivel")
	private int nivel;
	
	@Column(name = "emissao")
	private Date emissao;
	
	@Column(name = "nascimento")
	private Date nascimento;
	
	@Column(name = "nome")
	private String nome;
	
	@Column(name = "senha")
	private String senha;
	
	@Column(name = "zona")
	private String zona;
	
	@Column(name = "secao")
	private String secao;
	
	@Column(name = "user_disponivel")
	private char disponivel;
	
	@Column(name = "user_indisponivel")
	private char indisponivel;
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public int getNivel() {
		return nivel;
	}
	
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	
	public Date getEmissao() {
		return emissao;
	}
	
	public void setEmissao(Date emissao) {
		this.emissao = emissao;
	}
	
	public Date getNascimento() {
		return nascimento;
	}
	
	public void setNascimento(Date nascimento) {
		this.nascimento = nascimento;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getSenha() {
		return senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getZona() {
		return zona;
	}
	
	public void setZona(String zona) {
		this.zona = zona;
	}
	
	public String getSecao() {
		return secao;
	}
	
	public void setSecao(String secao) {
		this.secao = secao;
	}

	public char getDisponivel() {
		return disponivel;
	}

	public void setDisponivel(char disponivel) {
		this.disponivel = disponivel;
	}

	public char getIndisponivel() {
		return indisponivel;
	}

	public void setIndisponivel(char indisponivel) {
		this.indisponivel = indisponivel;
	}
	
}
