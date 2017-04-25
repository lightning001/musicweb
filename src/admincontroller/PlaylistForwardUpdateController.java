package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryDAO;
import DAO.CountryDAO;
import DAO.PlaylistDAO;
import DAO.SingerDAO;
import DAO.SongDAO;
import entity.Playlist;
import processor.SlugProcessor;

/**
 * Servlet implementation class PlaylistForwardUpdateController
 */
@WebServlet("/PlaylistForwardUpdateController")
public class PlaylistForwardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PlaylistForwardUpdateController() {
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
			String slugPlaylist = SlugProcessor.getSlugAlbumByUrl(request.getRequestURI());
			Playlist playlist = PlaylistDAO.getPlaylistBySlug(slugPlaylist);
			request.setAttribute("playlistedit", playlist);
			request.setAttribute("listCategory", CategoryDAO.getAllCat());
			request.setAttribute("listCountry", CountryDAO.getAllCountry());
			request.setAttribute("listSong", SongDAO.getAllSong());
			request.setAttribute("listSinger", SingerDAO.getAllSinger());
			request.getRequestDispatcher("/admin/update/suaplaylist.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/danhsachplaylist/"+page);
			request.getRequestDispatcher("admin/errorpage.jsp").forward(request, response);
			;
		}
	}

}
