package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MenuDAO;

/**
 * Servlet implementation class MenuController
 */
@WebServlet("/MenuController")
public class MenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MenuController() {
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
			request.setAttribute("listMenu", MenuDAO.getAdminMenu());
			request.setAttribute("listUsermenu", MenuDAO.getUserMenu());
			request.getRequestDispatcher("/admin/danhsach/danhsachmenu.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/index.jsp");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
