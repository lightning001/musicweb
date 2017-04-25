package admincontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MenuDAO;
import entity.Menu;
import entity.Submenu;

/**
 * Servlet implementation class MenuDeleteController
 */
@WebServlet("/MenuDeleteController")
public class MenuDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MenuDeleteController() {
		super();
		// TODO Auto-generated constructor stub
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
		try {
			String[] secondsubmenulist = request.getParameterValues("checkdel3");
			if (secondsubmenulist != null) {
				List<Submenu> listMenu = new ArrayList<>();
				for (int i = 0; i < secondsubmenulist.length; i++) {
					listMenu.add(MenuDAO.getSubMenuByID(Integer.parseInt(secondsubmenulist[i])));
				}
				if (!MenuDAO.deleteListSubMenu(listMenu)) {
					request.setAttribute("error", "Xóa menu cấp 3 không thành công");
					request.setAttribute("link", "admin/quanlymenu");
					request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
					return;
				}
			}
			String[] submenulist = request.getParameterValues("checkdel2");
			if (submenulist != null) {
				List<Submenu> listMenu = new ArrayList<>();
				for (int i = 0; i < submenulist.length; i++) {
					listMenu.add(MenuDAO.getSubMenuByID(Integer.parseInt(submenulist[i])));
				}
				if (!MenuDAO.deleteListSubMenu(listMenu)) {
					request.setAttribute("error", "Xóa menu cấp 2 không thành công");
					request.setAttribute("link", "admin/quanlymenu");
					request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
					return;
				}
			}
			String[] menulist = request.getParameterValues("checkdel1");
			if (menulist != null) {
				List<Menu> listMenu = new ArrayList<>();
				for (int i = 0; i < menulist.length; i++) {
					listMenu.add(MenuDAO.getMenuByID(Integer.parseInt(menulist[i])));
				}
				if (!MenuDAO.deleteListMenu(listMenu)) {
					request.setAttribute("error", "Xóa menu cấp 1 không thành công");
					request.setAttribute("link", "admin/quanlymenu");
					request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
				}
			}
			request.getRequestDispatcher("/admin/quanlymenu").forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/quanlymenu");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
			return;
		}
	}

}
