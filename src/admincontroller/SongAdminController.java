package admincontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SongDAO;
import entity.Song;
import processor.SlugProcessor;

/**
 * Servlet implementation class SongAdminController
 */
@WebServlet("/SongAdminController")
public class SongAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SongAdminController() {
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
			int page = Integer.parseInt(SlugProcessor.getParam(request.getRequestURI()));
			List<Song> listSong = SongDAO.pagingSong(page, 10);
			request.setAttribute("page", page);
			request.setAttribute("numPage", SongDAO.getPageCount());
			request.setAttribute("listSong", listSong);
			request.getRequestDispatcher("/admin/danhsach/danhsachbaihat.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/index.jsp");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
