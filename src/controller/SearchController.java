package controller;

import DAO.SearchDAO;
import entity.Album;
import entity.Playlist;
import entity.Song;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String key = request.getParameter("key");
        if (key != null) {
            SearchDAO searchDAO = new SearchDAO();
            List<Song> songs = searchDAO.searchSong(key);
            List<Album> albums = searchDAO.searchAlbum(key);
            List<Playlist> playlist = searchDAO.searchPlaylist(key);
            StringBuffer resultJson = new StringBuffer("{");

            resultJson.append("\"songs\":[");
            for (int i = 0; i < songs.size(); i++) {
                if(i > 0)resultJson.append(',');
                resultJson.append(songs.get(i).toJson());
            }
            resultJson.append("],");

            resultJson.append("\"albums\":[");
            for (int i = 0; i < albums.size(); i++) {
                if(i > 0)resultJson.append(',');
                resultJson.append(albums.get(i).toJson());
            }
            resultJson.append("],");

            resultJson.append("\"playlist\":[");
            for (int i = 0; i < playlist.size(); i++) {
                if(i > 0)resultJson.append(',');
                resultJson.append(playlist.get(i).toJson());
            }
            resultJson.append("]}");
            System.out.println(resultJson.toString());
            response.getWriter().write(resultJson.toString());
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

}
