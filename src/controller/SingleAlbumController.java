package controller;

import DAO.AlbumDAO;
import DAO.SongDAO;
import entity.Album;
import entity.Song;
import processor.SlugProcessor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class SingleAlbumController
 */
@WebServlet("/SingleAlbumController")
public class SingleAlbumController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SingleAlbumController() {
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

		String albumSlug = SlugProcessor.getSlugAlbumByUrl(request.getRequestURI());
		Album album = AlbumDAO.getAlbumBySlug(albumSlug);
		request.setAttribute("album", album);
		
		//Singer singer = album.getSingers().iterator().next();
		//request.setAttribute("singer", singer);

		List<Song> albumContent = new ArrayList<Song>();
		albumContent = album.getSongs();
		//albumContent.sort((a1, a2) -> a1.getIdSong().compareTo(a2.getIdSong()));
		request.setAttribute("albumContent", albumContent);

		List<Song> songOfArtist = new ArrayList<Song>();
		songOfArtist = SongDAO.getRandomSong();
		request.setAttribute("songOfArtist", songOfArtist);

		List<Album> albumByArtist = new ArrayList<>();
		//albumByArtist = albumDAO.getAlbumBySinger(singer);
		request.setAttribute("albumByArtist", albumByArtist);
		request.getRequestDispatcher("/frontend/albumPlayer.jsp").forward(request, response);

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
