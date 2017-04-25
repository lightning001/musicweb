package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SongDAO;
import entity.Album;
import entity.Song;
import processor.SlugProcessor;

/**
 * Servlet implementation class MusicController
 */
@WebServlet("/MusicController")
public class SongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SongController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String slugSong = SlugProcessor.getSlugSongByUrl(request.getRequestURI());
		Song song = SongDAO.getSongBySlug(slugSong);
		request.setAttribute("song", song);
		
		List<Album> albumByArtist = new ArrayList<>();
		//albumByArtist = albumDAO.getAlbumBySinger(song.getSingers().iterator().next());
		request.setAttribute("albumByArtist", albumByArtist);
		
		List<Song> songOfArtist = new ArrayList<Song>();
		songOfArtist = SongDAO.getRandomSong();
		request.setAttribute("songOfArtist", songOfArtist);
		request.getRequestDispatcher("/frontend/singlePlayer.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
