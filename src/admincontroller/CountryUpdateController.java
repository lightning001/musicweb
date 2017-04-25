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
 * Servlet implementation class CountryUpdateController
 */
@WebServlet("/CountryUpdateController")
public class CountryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CountryUpdateController() {
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
			String nameOldCountry = request.getParameter("oldcountry").trim();
			Country old = CountryDAO.getCountryByName(nameOldCountry);
			String countryName = request.getParameter("country").trim();

			if (countryName == null || "".equals(countryName))
				countryName = old.getCountry();
			else if (countryName.equalsIgnoreCase(nameOldCountry))
				return;
			else if (CountryDAO.getCountryByName(countryName) != null) {
				out.write("Quốc gia đã tồn tại");
				return;
			}
			String slug = TextFormat.createKeyWord(countryName);
			Country country = new Country(countryName, slug, old.getSingers(), old.getCategories(), old.getPlaylists(),
					old.getAlbums(), old.getSongs());
			if (CountryDAO.update(old, country)) {
				out.print("Sửa quốc gia thành công");
			} else {
				out.print("Sửa quốc gia thất bại");
			}
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/danhsachquocgia");
			request.getRequestDispatcher("/admin/errorpage.jsp");
		}
	}

}
