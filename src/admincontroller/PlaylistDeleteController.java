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
 * Servlet implementation class PlaylistDeleteController
 */
@WebServlet("/PlaylistDeleteController")
public class PlaylistDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaylistDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		int page = 1;
		if (request.getAttribute("currentPage") != null)
			page = (Integer) request.getAttribute("currentPage");
		request.setAttribute("page", page);
		request.setAttribute("currentPage", page);
		try {
			String slug = SlugProcessor.getParam(request.getRequestURI());
			Playlist play = PlaylistDAO.getPlaylistBySlug(slug);
			if (play != null) {
				if (PlaylistDAO.delete(play)) {
					request.getRequestDispatcher("/admin/danhsachplaylist/"+page).forward(request, response);
					return;
				}
				request.setAttribute("error", "Không xóa được playlist");
				request.setAttribute("link", "admin/danhsachplaylist/"+page);
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
				return;
			}
			request.setAttribute("error", "Playlist không tồn tại");
			request.setAttribute("link", "admin/danhsachplaylist/"+page);
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
			return;

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			request.setAttribute("link", "admin/danhsachplaylist/"+page);
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
