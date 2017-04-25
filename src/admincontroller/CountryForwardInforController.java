package admincontroller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BXHDAO;
import DAO.CountryDAO;
import entity.Country;
import entity.Viewalbum;
import entity.Viewsong;
import processor.SlugProcessor;

/**
 * Servlet implementation class CountryForwardInforController
 */
@WebServlet("/CountryForwardInforController")
public class CountryForwardInforController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CountryForwardInforController() {
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
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		try {
			String slug = SlugProcessor.getParam(request.getRequestURI());
			Country country = CountryDAO.getCountryBySlug(slug);
			BXHDAO bxh = new BXHDAO();
			Date date  = new Date(System.currentTimeMillis());
			List<Viewsong> listViewSong = bxh.getTopSong(date.getMonth()+1, date.getYear()+1900, country.getCountry());
			List<Viewalbum> listAlbum = bxh.getTopAlbum(date.getMonth()+1, date.getYear()+1900, country.getCountry());
			request.setAttribute("listViewSong", listViewSong);
			request.setAttribute("listViewAlbum", listAlbum);
			request.setAttribute("countryinfor", country);
			request.getRequestDispatcher("/admin/infor/thongtinquocgia.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			request.setAttribute("link", "admin/danhsachquocgia");
			response.sendRedirect("admin/errorpage.jsp");
		}
	}

}
