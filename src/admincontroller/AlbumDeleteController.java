package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AlbumDAO;
import entity.Album;
import processor.SlugProcessor;

/**
 * Servlet implementation class AlbumDeleteController
 */
@WebServlet("/AlbumDeleteController")
public class AlbumDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlbumDeleteController() {
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
			String slugAlbum = SlugProcessor.getSlugAlbumByUrl(request.getRequestURI());
			Album album = AlbumDAO.getAlbumBySlug(slugAlbum);
			if (album != null) {
				if (AlbumDAO.delete(album)) {
					request.getRequestDispatcher("/admin/danhsachalbum/" + page).forward(request, response);
					return;
				} else {
					request.setAttribute("error", "Không xóa được Album");
					request.setAttribute("link", "admin/danhsachalbum/" + page);
					request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
					return;
				}
			} else {
				request.setAttribute("error", "Album không tồn tại");
				request.setAttribute("link", "admin/danhsachalbum/" + page);
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			request.setAttribute("link", "admin/danhsachalbum/" + page);
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
