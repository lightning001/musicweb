package admincontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CountryDAO;
import entity.Country;

/**
 * Servlet implementation class CountryAddController
 */
@WebServlet("/CountryAddController")
public class CountryAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CountryAddController() {
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
		PrintWriter out = response.getWriter();
		try {
			String countryName = request.getParameter("country");
			if (CountryDAO.getCountryByName(countryName) != null) {
				out.write("Quốc gia đã tồn tại");
				return;
			}
			String slug = TextFormat.createKeyWord(countryName);
			Country country = new Country(countryName, slug, null, null, null, null, null);
			if (CountryDAO.insert(country)) {
				out.write("Thêm quốc gia mới thành công");
				return;
			} else {
				out.write("Thêm quốc gia mới thất bại");
				return;
			}
		} catch (Exception e) {
			out.write(e.getMessage());
		}
	}

}
