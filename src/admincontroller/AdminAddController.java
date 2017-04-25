package admincontroller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import entity.Users;

/**
 * Servlet implementation class AdminAddController
 */
@WebServlet("/AdminAddController")
public class AdminAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAddController() {
		super();
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
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try {
			String userName = request.getParameter("userName");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("displayName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String passport = request.getParameter("passport");
			String level = request.getParameter("isAdmin");
			String gender = request.getParameter("gender");
			Date date = new Date(System.currentTimeMillis());
			int age = date.getYear() + 1900 - Integer.parseInt(request.getParameter("year"));
			String linkImg = "/img/admin/no-image-admin.png";
			Users u = new Users(userName, passwd, name, email, phone, gender, age, passport, linkImg, level, null, null,
					null, null, null);
			if (UserDAO.insert(u)) {
				request.getRequestDispatcher("/admin/danhsachadmin").forward(request, response);
			} else {
				request.setAttribute("error", "Insert false");
				request.setAttribute("link", "admin/add/admins");
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/add/admins");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
