<%@page import="entity.Secondsubmenu"%>
<%@page import="entity.Submenu"%>
<%@page import="entity.Menu"%>
<%@page import="DAO.MenuDAO"%>
<%@page import="java.util.List"%>
<%@page import="entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Users ad = null;
	if (session.getAttribute("adminaccount") == null) {
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
		return;
	} else {
		ad = (Users) session.getAttribute("adminaccount");
		List<Menu> listMenu = MenuDAO.getAdminMenu();
%>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<%
				String linkImgAdmin = "/img/admin/no-images.png";
					if (ad.getLinkAvatar() != null)
						linkImgAdmin = ad.getLinkAvatar();
			%>
			<div class="pull-left image">
				<img src="<%=request.getContextPath() + linkImgAdmin%>"
					class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>Super admin</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->


		<ul class="sidebar-menu" style="list-style: none;">
			<li class="header">MAIN NAVIGATION</li>
			<%
				for (Menu m : listMenu) {
			%>
			<li class="treeview" style="list-style: none;"><a
				href="<%=request.getContextPath() + "/" + m.getPath()%>"> <i
					class="<%=m.getIcon()%>" aria-hidden="true"></i> <span><%=m.getName()%></span>
					<i class="fa fa-angle-left pull-right" aria-hidden="true"></i>
			</a> <%
 	if (m.getSubmenusByMenuId() != null && !m.getSubmenusByMenuId().isEmpty()) {
 %>
				<ul class="treeview-menu" style="list-style: none;">
					<%
						for (Submenu sm : m.getSubmenusByMenuId()) {
					%>
					<li class="treeview"><a
						href="<%=request.getContextPath() + "/" + sm.getPath()%>"> <i
							class="<%=sm.getIcon()%>" aria-hidden="true"></i> <span><%=sm.getNamemenu()%></span>
							<i class="fa fa-angle-left pull-right" aria-hidden="true"></i></a> <%
 	if (sm.getSecondsubmenusBySubMenuId() != null
 							&& !sm.getSecondsubmenusBySubMenuId().isEmpty()) {
 %>
						<ul class="treeview-menu" style="list-style: none;">
							<%
								for (Secondsubmenu scm : sm.getSecondsubmenusBySubMenuId()) {
							%>
							<li class="treeview"><a
								href="<%=request.getContextPath() + "/" + scm.getPath()%>"> <i
									class="<%=scm.getIcon()%>" aria-hidden="true"></i> <span><%=scm.getName()%></span></a></li>

							<%
								}
							%>
						</ul> <%
 	}
 %></li>
					<%
						}
								}
					%>
				</ul> <%
 	}
 %></li>
		</ul>

	</section>
	<!-- /.sidebar -->
</aside>
<%
	}
%>