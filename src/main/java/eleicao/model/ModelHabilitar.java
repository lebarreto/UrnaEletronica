package eleicao.model;

import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "ModelHabilitar")
public class ModelHabilitar {

	@Id
	@Column(name = "autoriza")
	private String autoriza;
	
	@Column(name = "titulo")
	private String titulo;
	
	@Column(name = "data")
	private String data;
	
	@Column(name = "user_id")
	private String user_id;
	
	@Column(name = "autorizou")
	private String autorizou;
	
	@Column(name = "disponivel")
	private char disponivel;
	
	@Column(name = "indisponivel")
	private char indisponivel;
	
	public String getAutoriza() {
		return autoriza;
	}
	
	public void setAutoriza() {
		this.autoriza = autoriza;
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getData() {
		return data;
	}
	
	public void setData() {	
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		this.data = dateFormat.format(data);
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getAutorizou() {
		return autorizou;
	}

	public void setAutorizou(String autorizou) {
		this.autorizou = autorizou;
	}
	
	
}
