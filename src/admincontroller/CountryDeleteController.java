package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CountryDAO;
import entity.Country;
import processor.SlugProcessor;

/**
 * Servlet implementation class CountryDeleteController
 */
@WebServlet("/CountryDeleteController")
public class CountryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CountryDeleteController() {
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
			String slugCountry = SlugProcessor.getParam(request.getRequestURI());
			Country country = CountryDAO.getCountryBySlug(slugCountry);
			if (country != null) {
				if (CountryDAO.delete(country)) {
					request.getRequestDispatcher("/admin/danhsachquocgia").forward(request, response);
					return;
				} else {
					request.setAttribute("error", "Không xóa được ");
					request.setAttribute("link", "admin/danhsachquocgia");
					request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
					return;
				}
			} else {
				request.setAttribute("error", "Quốc gia không tồn tại");
				request.setAttribute("link", "admin/danhsachquocgia");
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			request.setAttribute("link", "admin/danhsachquocgia");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
			return;
		}
	}

}
