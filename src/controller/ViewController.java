package controller;

import DAO.ViewDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by congp on 02-Dec-16.
 */
@WebServlet("/ViewController")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String view = request.getParameter("view");
			switch (view) {
			case "SONG":
				if (ViewDAO.increaseViewSong(id))
					response.getWriter().write("OK");
				else
					response.getWriter().write("FAILED");
				break;
			case "ALBUM":
				if (ViewDAO.increaseViewAlbum(id))
					response.getWriter().write("OK");
				else
					response.getWriter().write("FAILED");
				break;
			case "PLAYLIST":
				if (ViewDAO.increaseViewPlaylist(id))
					response.getWriter().write("OK");
				else
					response.getWriter().write("FAILED");
				break;
			}
		} catch (Exception e) {

		}

	}
}
