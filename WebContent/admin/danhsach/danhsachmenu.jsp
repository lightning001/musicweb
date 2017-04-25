<%@page import="entity.Secondsubmenu"%>
<%@page import="entity.Submenu"%>
<%@page import="entity.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null) {
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
		return;
	}
	List<Menu> listMenuAdmin = (List<Menu>) request.getAttribute("listMenu");
	List<Menu> listMenuUser = (List<Menu>) request.getAttribute("listUsermenu");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Quản lí menu" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Quản lí menu</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Quản lí menu</a></li>
		</ol>
	</section>
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách Menu
				</h3>
				<a href="<%=request.getContextPath()%>/admin/add/menus"><button
						type="button" class="btn btn-info">Thêm menu</button></a>
				<button class="btn btn-warning" id="btn-del" value="submit" form="form-del" type="submit">Xóa
					menu</button>
			</div>
			<div class="panel-body">
				<div class="well">
					<div class="table-responsive">
						<form role="form" method="post" id="form-del"
							action="<%=request.getContextPath()%>/admin/delete/menu">
							<table class="table" style="border: none; max-width: 650px;">
								<caption>
									<h4>Menu trang admin</h4>
								</caption>
								<tbody>
									<%
										for (Menu m : listMenuAdmin) {
									%>
									<tr style="border-top: 1px solid;">
										<td colspan="2"><%=m.getName()%></td>
										<td></td>
										<td></td>
										<td><input type="checkbox" name="checkdel1"
											value='<%=m.getMenuId()%>'></td>
									</tr>
									<%
										if (m.getSubmenusByMenuId() != null && !m.getSubmenusByMenuId().isEmpty()) {
												for (Submenu sub : m.getSubmenusByMenuId()) {
													out.print("<tr><td></td>");
													out.print("<td colspan='2'>" + sub.getNamemenu() + "</td>");
													out.print("<td></td>");
													out.print("<td><input type=\"checkbox\" name=\"checkdel2\" value='" + sub.getSubMenuId()
															+ "'></td>");
													out.print("</tr>");
													if (sub.getSecondsubmenusBySubMenuId() != null
															&& !sub.getSecondsubmenusBySubMenuId().isEmpty()) {
														for (Secondsubmenu ssub : sub.getSecondsubmenusBySubMenuId()) {
															out.print("<tr><td></td>");
															out.print("<td></td>");
															out.print("<td colspan='2'>" + ssub.getName() + "</td>");
															out.print("<td><input type=\"checkbox\" name=\"checkdel3\" value='" + ssub.getId()
																	+ "'></td></tr>");
														}
													}
												}
											}
										}
									%>
								</tbody>
							</table>
							<table class="table" style="border: none; max-width: 650px;">
								<caption>
									<h4>Menu trang chính</h4>
								</caption>
								<tbody>
									<%
										for (Menu m : listMenuUser) {
									%>
									<tr>
										<td colspan="2"><%=m.getName()%></td>
										<td></td>
										<td></td>
										<td><input type="checkbox" name="checkdel1"
											value='<%=m.getMenuId()%>'></td>
									</tr>
										<%
											if (m.getSubmenusByMenuId() != null && !m.getSubmenusByMenuId().isEmpty()) {
													for (Submenu sub : m.getSubmenusByMenuId()) {
														out.print("<tr><td></td>");
														out.print("<td colspan='2'>" + sub.getNamemenu() + "</td>");
														out.print("<td></td>");
														out.print("<td><input type=\"checkbox\" name=\"checkdel2\" value='" + sub.getSubMenuId()
																+ "'></td>");
														out.print("</tr>");
														if (sub.getSecondsubmenusBySubMenuId() != null
																&& !sub.getSecondsubmenusBySubMenuId().isEmpty()) {
															for (Secondsubmenu ssub : sub.getSecondsubmenusBySubMenuId()) {
																out.print("<tr><td></td>");
																out.print("<td></td>");
																out.print("<td colspan='2'>" + ssub.getName() + "</td>");
																out.print("<td><input type=\"checkbox\" name=\"checkdel3\" value='" + ssub.getId()
																		+ "'></td></tr>");
															}
														}
													}
												}
										%>
									<%
										}
									%>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /.Left col -->
</div>
<!-- /.row (main row) -->
<jsp:include page="../footer.jsp"></jsp:include>