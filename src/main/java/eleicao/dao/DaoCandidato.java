package eleicao.dao;

import java.util.List;

import javax.persistence.EntityManager;

import eleicao.model.ModelCandidatos;

public class DaoCandidato extends GenericDao{

	protected EntityManager entityManager;

	public DaoCandidato() {
		super();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public <T> T find(String id) {
		return (T) session.find(ModelCandidatos.class, Integer.parseInt(id));
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> findAll() {
		List<ModelCandidatos> obj = session.createQuery("SELECT c FROM ModelCandidatos c", ModelCandidatos.class).getResultList();	
		return (List<T>) obj;
	}

	@Override
	public <T> void save(T t) {
		try {
			session.getTransaction().begin();
			session.saveOrUpdate("ModelCandidatos", t);
			session.getTransaction().commit();
		} 
		catch (Exception e) {
			session.getTransaction().rollback();
		}			
	}

}
