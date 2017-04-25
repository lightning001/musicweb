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
 * Servlet implementation class CategoryUpdateController
 */
@WebServlet("/CategoryUpdateController")
public class CategoryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryUpdateController() {
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
			int id = Integer.parseInt(request.getParameter("idCategory"));
			Category old = CategoryDAO.getCategoryByID(id);
			String cate = request.getParameter("category");
			if (cate == null || "".equals(cate))
				cate = old.getCategory();
			String nameCountry = request.getParameter("country");
			Country country = CountryDAO.getCountryByName(nameCountry);
			String slugCategory = TextFormat.createSlug(cate, id);
			String infoCategory = request.getParameter("infor");
			Category category = new Category(id, country, cate, slugCategory, infoCategory, old.getAlbums(),
					old.getPlaylists(), old.getSingers());
			if (CategoryDAO.update(category)) {
				out.write("Chỉnh sửa thành công");
			} else {
				out.write("Chỉnh sửa thất bại");
			}
		} catch (Exception e) {
			out.write(e.getMessage());
		}
	}

}
