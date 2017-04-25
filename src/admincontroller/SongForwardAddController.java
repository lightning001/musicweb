package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AlbumDAO;
import DAO.CountryDAO;
import DAO.SingerDAO;

/**
 * Servlet implementation class SongForwardAddController
 */
@WebServlet("/SongForwardAddController")
public class SongForwardAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SongForwardAddController() {
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
			request.setAttribute("listCountry", CountryDAO.getAllCountry());
			request.setAttribute("listAlbum", AlbumDAO.getAllAlbum());
			request.setAttribute("listSinger", SingerDAO.getAllSinger());
			request.getRequestDispatcher("/admin/add/thembaihat.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/danhsachbaihat/" + page);
			request.getRequestDispatcher("admin/errorpage.jsp").forward(request, response);
			;
		}
	}

}
