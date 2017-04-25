package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import entity.Users;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");

		if (email != null && !"".equals(email) && passwd != null && !"".equals(passwd)) {
			Users u = UserDAO.getAdminByEmailAndPass(email, passwd);
			if (u != null) {
				HttpSession session = request.getSession();
				if ("leader".equalsIgnoreCase(u.getIsAdmin())) {
					session.setAttribute("leaderaccount", u);
				}
				session.setAttribute("adminaccount", u);
				request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
			} else {
				request.setAttribute("loginerror", "Email or Password is incorrect");
				request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("loginerror", "Error");
			request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
		}
	}

}
