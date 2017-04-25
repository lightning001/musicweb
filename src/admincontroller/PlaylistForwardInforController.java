package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PlaylistDAO;
import entity.Playlist;
import processor.SlugProcessor;

/**
 * Servlet implementation class PlaylistForwardInforController
 */
@WebServlet("/PlaylistForwardInforController")
public class PlaylistForwardInforController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PlaylistForwardInforController() {
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

		int page = 1;
		if (request.getAttribute("currentPage") != null)
			page = (Integer) request.getAttribute("currentPage");
		request.setAttribute("page", page);
		request.setAttribute("currentPage", page);
		try {
			String slugPlaylist = SlugProcessor.getParam(request.getRequestURI());
			Playlist p = PlaylistDAO.getPlaylistBySlug(slugPlaylist);
			request.setAttribute("playlistinfor", p);

			request.getRequestDispatcher("/admin/infor/thongtinplaylist.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/danhsachplaylist/" + page);
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
			;
		}
	}

}
