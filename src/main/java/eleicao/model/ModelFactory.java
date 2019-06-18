package eleicao.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ModelFactory {

	public Session getConnection() {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		return session;
	}

	public EntityManager startConnection(){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("projetoeleicao");
		System.out.println("ola1");
		return factory.createEntityManager();
	}
}
