package admincontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MenuDAO;
import entity.Menu;
import entity.Secondsubmenu;
import entity.Submenu;

/**
 * Servlet implementation class themmenu
 */
@WebServlet("/MenuAddController")
public class MenuAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MenuAddController() {
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
			int id = Integer.parseInt(request.getParameter("idMenu"));
			String ten_Menu = request.getParameter("ten_Menu");
			String link = request.getParameter("link");
			String name_icon = request.getParameter("name_icon");
			String loaimenu = request.getParameter("loaimenu");
			String type = request.getParameter("type");
			if ("menu".equals(loaimenu)) {
				Menu m = new Menu(id, ten_Menu, link, name_icon, 0, null, type);
				if (MenuDAO.insertMenu(m)) {
					request.getRequestDispatcher("/admin/quanlymenu").forward(request, response);
					return;
				}
				else{
					request.setAttribute("error", "Thêm thất bại");
					request.setAttribute("link", "admin/quanlymenu");
					request.getRequestDispatcher("/admin/errorpage.jsp");
					return;
				}
			}
			else if("submenu".equals(loaimenu)){
				int menuId = Integer.parseInt(request.getParameter("menu_c2"));
				Menu menu = MenuDAO.getMenuByID(menuId);
				Submenu submenu = new Submenu(id, ten_Menu, link, name_icon, 0, menu, null);
				if(MenuDAO.insertSubMenu(submenu)){
					request.getRequestDispatcher("/admin/quanlymenu").forward(request, response);
					return;
				}else{
					request.setAttribute("error", "Thêm thất bại");
					request.setAttribute("link", "admin/quanlymenu");
					request.getRequestDispatcher("/admin/errorpage.jsp");
					return;
				}
			}
			else if("secondsubmenu".equals(loaimenu)){
				int menuId = Integer.parseInt(request.getParameter("menu_c3"));
				Submenu menu = MenuDAO.getSubMenuByID(menuId);
				Secondsubmenu ssubmenu = new Secondsubmenu(id, ten_Menu, link, name_icon, 0, menu);
				if(MenuDAO.insertSecondSubMenu(ssubmenu)){
					request.getRequestDispatcher("/admin/quanlymenu").forward(request, response);
					return;
				}else{
					request.setAttribute("error", "Thêm thất bại");
					request.setAttribute("link", "admin/quanlymenu");
					request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);;
					return;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/quanlymenu");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);;
		}

	}

}
