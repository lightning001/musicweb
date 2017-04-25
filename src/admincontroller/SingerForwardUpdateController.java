package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryDAO;
import DAO.CountryDAO;
import DAO.SingerDAO;
import entity.Singer;
import processor.SlugProcessor;

/**
 * Servlet implementation class SingerForwardUpdateController
 */
@WebServlet("/SingerForwardUpdateController")
public class SingerForwardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SingerForwardUpdateController() {
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
		int page = 1;
		if (request.getAttribute("currentPage") != null)
			page = (Integer) request.getAttribute("currentPage");
		request.setAttribute("page", page);
		request.setAttribute("currentPage", page);
		try {
			String slugSinger = SlugProcessor.getParam(request.getRequestURI());
			Singer singer = SingerDAO.getSingerBySlug(slugSinger);
			request.setAttribute("listCategory", CategoryDAO.getAllCat());
			request.setAttribute("listCountry", CountryDAO.getAllCountry());
			request.setAttribute("singeredit", singer);
			request.getRequestDispatcher("/admin/update/suanghesi.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/danhsachnghesi/" + page);
			request.getRequestDispatcher("/admin/errorpage.jsp");
		}
	}

}
