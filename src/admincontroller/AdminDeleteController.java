package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import entity.Users;
import processor.SlugProcessor;

/**
 * Servlet implementation class AdminDeleteContrroller
 */
@WebServlet("/AdminDeleteController")
public class AdminDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteController() {
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
			String ids = SlugProcessor.getParam(request.getRequestURI());
			int id = Integer.parseInt(ids);
			Users u = UserDAO.getAdminById(id);
			if (u != null) {
				if (UserDAO.delete(u)) {
					request.getRequestDispatcher("/admin/danhsachadmin").forward(request, response);
					return;
				}
				request.setAttribute("error", "Không xóa được admin");
				request.setAttribute("link", "admin/danhsachadmin");
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
				return;
			}
			request.setAttribute("error", "Admin không tồn tại");
			request.setAttribute("link", "admin/danhsachadmin");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
			return;

		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/danhsachadmin");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
