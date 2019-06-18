package eleicao.dao;

import java.util.List;

import eleicao.model.ModelHabilitar;

public class DaoHabilita extends GenericDao{

	public DaoHabilita() {
		init();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public <T> T find(String id) {
		System.out.println("Leticia "  + id);
		return (T) session.find(ModelHabilitar.class,id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> findAll() {
		List<ModelHabilitar> obj = session.createQuery("SELECT a FROM ModelHabilitar a", ModelHabilitar.class).getResultList();	
		return (List<T>) obj;
	}

	@Override
	public <T> void save(T t) {
		try {
			session.getTransaction().begin();
			session.saveOrUpdate("ModelHabilitar", t);
			session.getTransaction().commit();
		} 
		catch (Exception e) {
			session.getTransaction().rollback();
		}		
	}

}
