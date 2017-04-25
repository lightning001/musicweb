package controller;

import DAO.AlbumDAO;
import DAO.PlaylistDAO;
import DAO.SongDAO;
import entity.Album;
import entity.Playlist;
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
 * Servlet implementation class SinglePlaylistController
 */
@WebServlet("/SinglePlaylistController")
public class SinglePlaylistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SinglePlaylistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String playlistSlug = SlugProcessor.getSlugPlaylistByUrl(request.getRequestURI());
		Playlist playlist = PlaylistDAO.getPlaylistBySlug(playlistSlug);
		request.setAttribute("playlist", playlist);

		List<Song> playlistContent = new ArrayList<Song>();
		playlistContent = playlist.getSongs();
		request.setAttribute("playlistContent", playlistContent);

		List<Song> randSong = new ArrayList<Song>();
		randSong = SongDAO.getRandomSong();
		request.setAttribute("randSong", randSong);
		
		List<Album> albumByArtist = new ArrayList<>();
		albumByArtist = AlbumDAO.getNewAlbum();
		request.setAttribute("albumByArtist", albumByArtist);
		

		request.getRequestDispatcher("/frontend/playlistPlayer.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
