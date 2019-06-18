package eleicao.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eleicao.model.ModelUser;

@WebServlet("/redireciona")
public class Redireciona extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Redireciona() {
		super();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String pagina = req.getParameter("pagina");
		String titulo = (String) session.getAttribute("titulo");
		String nivel = (String) session.getAttribute("nivel");
		ModelUser user = (ModelUser) session.getAttribute("user");
		
		try {
			
			resp.setContentType("application/json; charset=utf-8");
			
			session.setAttribute("titulo", titulo);
			session.setAttribute("nivel", nivel);
			req.setAttribute("titulo", user.getTitulo());
			req.setAttribute("nivel", user.getNivel());
			
			resp.setStatus(HttpServletResponse.SC_OK);	
			System.out.println(pagina);
			req.getRequestDispatcher(pagina).forward(req, resp);	
			
		} catch (Exception e) {
			req.getRequestDispatcher(pagina).forward(req, resp);
		}
		finally{
			resp.getWriter().flush();	
			destroy();	
		}	
		
	}

}
