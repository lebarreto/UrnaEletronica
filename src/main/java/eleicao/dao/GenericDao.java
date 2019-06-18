package eleicao.dao;

import java.util.List;

import org.hibernate.Session;

import eleicao.model.ModelFactory;

public abstract class GenericDao {
	protected Session session;

	public void init()
	{
		this.session = new ModelFactory().getConnection();
	}

	public void destroy()
	{
		this.session.close();
	}
	
	public abstract <T> T find(String id);

	public abstract <T> List<T> findAll();

	public abstract <T> void save(T t);
}
