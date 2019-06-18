package eleicao.config;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ConfigJpa {
	protected static EntityManager entityManager;
	
	public static EntityManager getEntityManager() {

	    EntityManagerFactory factory = Persistence.createEntityManagerFactory("projetoeleicao");

	    if (entityManager == null) {
	    	entityManager = factory.createEntityManager();
	    }
	 
	    return entityManager;
   }
	
	public static void shutdown() {

		if (entityManager != null) {
			entityManager.close();
		}
	}
}
