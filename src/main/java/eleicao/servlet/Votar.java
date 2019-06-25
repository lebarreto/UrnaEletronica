package eleicao.servlet;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eleicao.dao.DaoCandidato;
import eleicao.dao.DaoUser;
import eleicao.model.ModelCandidatos;
import eleicao.model.ModelUser;

@WebServlet("/votacao")
public class Votar extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected EntityManager entityManager;
	
	public Votar() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String titulo = (String) request.getParameter("user");
		String candidato = request.getParameter("numero");
		
		System.out.println(candidato);
		
		if(titulo == null) titulo = (String) session.getAttribute("titulo");

		ModelUser controle = new DaoUser().find(titulo);
		DaoCandidato candidatoDao = new DaoCandidato();
		ModelCandidatos candidatosm = (ModelCandidatos) candidatoDao.find(candidato);
		System.out.println("CANDIDATOOOOO " + candidatosm.getNumero());
		
		if(controle != null){
			
			if(controle.getDisponivel() == 'Y' && controle.getIndisponivel() == 'N'){				
				
				DaoUser userdao = new DaoUser();
				ModelUser muser = userdao.find(titulo);
				
				muser.setDisponivel('N');
				muser.setIndisponivel('Y');
				userdao.save(muser);

				int calcula = candidatosm.getVoto() + 1;
				candidatosm.setVoto(calcula);
				
				candidatoDao.save(candidatosm);
				
				
				int tipo = (int) Integer.parseInt(String.valueOf(session.getAttribute("nivel")));
				session.setAttribute("titulo", titulo);
				session.setAttribute("nivel", tipo);
				
				request.getRequestDispatcher("index.jsp").forward(request, response);	
				response.getWriter().flush();	
			}
			else{				
				request.getRequestDispatcher("index.jsp").forward(request, response);	
				response.getWriter().flush();		
			}
		}else{				
			request.getRequestDispatcher("index.jsp").forward(request, response);	
			response.getWriter().flush();		
		}
	}
}
