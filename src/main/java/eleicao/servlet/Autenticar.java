package eleicao.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import eleicao.dao.DaoUser;
import eleicao.model.ModelUser;

@WebServlet("/autenticar")
public class Autenticar extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Autenticar() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			HttpSession session = req.getSession(true);
					
			String titulo = req.getParameter("titulo");
			String senha = req.getParameter("senha");
			
			System.out.println(titulo);
			
			DaoUser dao = new DaoUser();
			ModelUser user = (ModelUser) dao.find(titulo);
			
			System.out.println("nivel = " + user.getNivel());
						
			System.out.println(user.getTitulo());
			
			System.out.println("AAAAAAAAAA " + user);
	
			if (user != null && user.getSenha().equals(senha)) {
				session.setMaxInactiveInterval(500);
				resp.setStatus(HttpServletResponse.SC_OK);
				session.setAttribute("usuario", user);
				session.setAttribute("titulo", user.getTitulo());
				session.setAttribute("nivel", String.valueOf(user.getNivel()));
				session.setAttribute("user_disponivel", String.valueOf(user.getDisponivel()));
				session.setAttribute("user_indisponivel", String.valueOf(user.getIndisponivel()));
				req.getRequestDispatcher("zona.jsp").forward(req, resp);
				resp.getWriter().flush();

				dao.destroy();
			} else {
				String url = req.getHeader("referer");
				req.getRequestDispatcher(url).forward(req, resp);

				resp.getWriter().flush();
				dao.destroy();
			}
		} catch (java.lang.IllegalStateException e) {
			try {
				Thread.sleep(1000);
				doPost(req, resp);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}		
	}

	
}
