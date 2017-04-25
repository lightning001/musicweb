package controller;

import DAO.AlbumDAO;
import entity.Album;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class AlbumController
 */
@WebServlet("/AlbumController")
public class AlbumController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlbumController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		int page = 1;
		int pageCount = (int) AlbumDAO.getPageCount();
		System.out.println(pageCount);
		request.setAttribute("pageCount", pageCount);
		try{
			page = Integer.parseInt(request.getParameter("p"));
			if(page<0 || page > pageCount)
				page = 0;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		List<Album> allAlbum = AlbumDAO.getAlbumByPage(page);
		request.setAttribute("allAlbum", allAlbum);

		request.getRequestDispatcher("/frontend/album.jsp").forward(request, response);
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
