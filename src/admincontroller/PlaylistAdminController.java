package admincontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PlaylistDAO;
import entity.Playlist;
import processor.SlugProcessor;

/**
 * Servlet implementation class PlaylistAdminController
 */
@WebServlet("/PlaylistAdminController")
public class PlaylistAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PlaylistAdminController() {
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
			List<Playlist> listPlaylist = PlaylistDAO.pagingPlaylist(page, 10);
			request.setAttribute("page", page);
			request.setAttribute("numPage", PlaylistDAO.getPageCount());
			request.setAttribute("listPlaylist", listPlaylist);
			request.getRequestDispatcher("/admin/danhsach/danhsachplaylist.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/index.jsp");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
