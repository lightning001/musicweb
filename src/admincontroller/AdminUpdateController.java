package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import entity.Users;

/**
 * Servlet implementation class AdminUpdateController
 */
@WebServlet("/AdminUpdateController")
public class AdminUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUpdateController() {
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
		try {
			String s = request.getParameter("id");
			int id = Integer.parseInt(s.split("-")[0]);
			String admin = s.split("-")[1];
			Users u = UserDAO.getAdminById(id);
			if ("".equals(admin) || admin == null)
				admin = u.getIsAdmin();
			u.setIsAdmin(admin);
			System.out.println(u.toString());
			if (UserDAO.update(u)) {
				request.getRequestDispatcher("/admin/danhsachadmin").forward(request, response);
			} else {
				request.setAttribute("error", "Update false");
				request.setAttribute("link", "admin/danhsachadmin");
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);;
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/danhsachadmin");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);;
		}
	}

}
