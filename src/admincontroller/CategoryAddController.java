package admincontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryDAO;
import DAO.CountryDAO;
import entity.Category;
import entity.Country;

/**
 * Servlet implementation class CategoryAddController
 */
@WebServlet("/CategoryAddController")
public class CategoryAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryAddController() {
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
			String cate = request.getParameter("category");
			String nameCountry = request.getParameter("country");
			if (CategoryDAO.getCategoryByNameAndCountry(cate, nameCountry) != null) {
				out.write("Thể loại đã tồn tại.");
				return;
			}
			int id = (int) CategoryDAO.getLastId() + 1;
			Country country = CountryDAO.getCountryByName(nameCountry);
			String slugCategory = TextFormat.createSlug(cate, id);
			String infoCategory = request.getParameter("infor");
			Category category = new Category(country, cate, slugCategory, infoCategory, null, null, null);
			if (CategoryDAO.insert(category)) {
				out.write("Thêm thể loại thành công.");
			} else {
				out.write("Thêm thể loại thất bại.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.write(e.getMessage());
		}
	}

}
