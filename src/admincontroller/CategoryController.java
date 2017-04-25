package admincontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryDAO;
import DAO.CountryDAO;
import entity.Category;
import processor.SlugProcessor;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryController() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try {
			int page = Integer.parseInt(SlugProcessor.getParam(request.getRequestURI()));
			List<Category> listCategory = CategoryDAO.pagingCategory(page, 10);
			request.setAttribute("numPage", CategoryDAO.getPageCount());
			request.setAttribute("listCategory", listCategory);
			request.setAttribute("listCountry", CountryDAO.getAllCountry());
			request.getRequestDispatcher("/admin/danhsach/danhsachtheloai.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/index.jsp");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
