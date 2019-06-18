package eleicao.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import eleicao.model.ModelUser;

public class DaoUser extends GenericDao{

	public DaoUser() {
		init();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public <T> T find(String id) {
		return (T) session.find(ModelUser.class, id);
	}

	@Override
	public <T> List<T> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> void save(T t) {
		
		try {
			
			session.getTransaction().begin();
			session.persist(t);
			session.getTransaction().commit();
		} 
		catch (Exception e) {
			session.getTransaction().rollback();
		}		
	}
	
	public static boolean valida(String titulo,String senha){  
		
		boolean status= false; 
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projetoeleicao","root","Mysql2019");  
			      
			PreparedStatement ps=con.prepareStatement("select * from ModelUser where titulo=? and senha=?");  
			ps.setString(1, titulo);  
			ps.setString(2, senha);  
			      
			ResultSet rs=ps.executeQuery();  
			status=rs.next();  
		          
		}catch(Exception e){
			System.out.println(e);
		}  
			return status;  
		}

}  


