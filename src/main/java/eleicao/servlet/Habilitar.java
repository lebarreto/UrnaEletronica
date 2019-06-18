package eleicao.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import eleicao.dao.DaoHabilita;
import eleicao.dao.DaoUser;
import eleicao.dao.GenericDao;
import eleicao.model.ModelHabilitar;
import eleicao.model.ModelUser;

@WebServlet("/habilitar")
public class Habilitar extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Habilitar() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("indisponivel").toString().equals("-1"))
			carrega(request, response);
		else
			salva(request, response);		
	}

	private void carrega(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(500);
		String usuario = (String) request.getParameter("usuario");
		Gson gson = new Gson();				
		

		DaoUser uDao = new DaoUser();
		ModelUser user = uDao.find(usuario);
		String titulo = user.getTitulo();

		System.out.println("NAO AGUENTO MAIS" + uDao.find(titulo));

		uDao.destroy();

		DaoHabilita autDao = new DaoHabilita();
		
		System.out.println("PRINTTTT "+ titulo);
		
		ModelHabilitar aut = new ModelHabilitar();
		aut.setTitulo(titulo);
		System.out.println("TESTE HABILITA " + aut);

		autDao.destroy();
		

		if (aut != null) {
			String javotou = user.getIndisponivel() == 'Y' ? "Sim" : "Nao";
			String liberado = user.getDisponivel() == 'Y' ? "Sim" : "Nao";
			response.setStatus(HttpServletResponse.SC_OK);
			response.setContentType("application/json; charset=utf-8");
			String jsonInString = gson.toJson(user);
			request.setAttribute("nome", user.getNome());
			request.setAttribute("usuario", usuario);
			request.setAttribute("indisponivel", javotou);
			request.setAttribute("disponivel", liberado);
			request.setAttribute("usuarioData", jsonInString);			
			request.getRequestDispatcher("habilitar.jsp").forward(request, response);	
		} 
		else {
			response.setStatus(HttpServletResponse.SC_OK);
			response.setContentType("application/json; charset=utf-8");
			String jsonInString = gson.toJson(user);
			request.setAttribute("nome", user.getNome());
			request.setAttribute("usuario", usuario);
			request.setAttribute("indisponivel", "Nao");
			request.setAttribute("disponivel", "Nao");
			request.setAttribute("usuarioData", jsonInString);			
			request.getRequestDispatcher("habilitar.jsp").forward(request, response);	
		}
	}

	private void salva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Gson gson = new Gson();
		String titulo = request.getParameter("usuario");
		
		GenericDao dao = new DaoHabilita();
		ModelHabilitar aut = dao.find(titulo);
		dao.destroy();
		
		
		System.out.println("aaaaaaaaaaa " + aut);
		int varPassagem = 0;
		
		if(aut != null)
		{
			dao = new DaoUser();
			ModelUser user = dao.find(titulo);

			varPassagem = 1;
			String javotou = aut.getIndisponivel() == 'Y' ? "Sim" : "Nao";
			String liberado = aut.getDisponivel() == 'Y' ? "Sim" : "Nao";
			response.setStatus(HttpServletResponse.SC_OK);
			response.setContentType("application/json");
			String jsonInString = gson.toJson(user);
			request.setAttribute("usuario", titulo);
			request.setAttribute("indisponivel", javotou);
			request.setAttribute("disponivel", liberado);
			request.setAttribute("nome", user.getNome());
			request.setAttribute("data", jsonInString);
			dao.destroy();
			request.getRequestDispatcher("habilitar.jsp").forward(request, response);	
		}		
				
		if(varPassagem == 0)
		{
			DaoUser userdao = new DaoUser();
			ModelUser muser = userdao.find(titulo);
			
			muser.setDisponivel('Y');
			muser.setIndisponivel('N');
			userdao.save(muser);
			request.getRequestDispatcher("habilitar.jsp").forward(request, response);			
		}
	}
}
