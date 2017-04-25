package controller;

import DAO.AlbumDAO;
import DAO.PlaylistDAO;
import DAO.SingerDAO;
import entity.Album;
import entity.Playlist;
import entity.Singer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class IndexControler
 */
@WebServlet("/IndexControler")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		List<Album> newAlbum = AlbumDAO.getNewAlbum();
		request.setAttribute("newAlbum", newAlbum);

		List<Playlist> newPlaylist = PlaylistDAO.getNewPlaylist();
		request.setAttribute("newPlaylist", newPlaylist);

		List<Singer> singers = SingerDAO.getNewSinger();
		request.setAttribute("singer", singers);

		request.getRequestDispatcher("/frontend/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
