package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SongDAO;
import entity.Song;
import processor.SlugProcessor;

/**
 * Servlet implementation class SongDeleteController
 */
@WebServlet("/SongDeleteController")
public class SongDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SongDeleteController() {
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
		int page = 1;
		if (request.getAttribute("currentPage") != null)
			page = (Integer) request.getAttribute("currentPage");
		request.setAttribute("page", page);
		request.setAttribute("currentPage", page);
		try {
			String slugSong = SlugProcessor.getParam(request.getRequestURI());
			Song song = SongDAO.getSongBySlug(slugSong);
			if (song != null) {
				if (SongDAO.delete(song)) {
					request.getRequestDispatcher("/admin/danhsachbaihat/"+page).forward(request, response);
					return;
				} else {
					request.setAttribute("error", "Không xóa được bài hát");
					request.setAttribute("link", "admin/danhsachbaihat/"+page);
					request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
					return;
				}
			} else {
				request.setAttribute("error", "Bài hát không tồn tại");
				request.setAttribute("link", "admin/danhsachbaihat/"+page);
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/danhsachbaihat/"+page);
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
