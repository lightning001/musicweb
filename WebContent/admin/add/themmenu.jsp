<%@page import="entity.Secondsubmenu"%>
<%@page import="entity.Submenu"%>
<%@page import="java.util.List"%>
<%@page import="entity.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null) {
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
		return;
	}
%>

<jsp:include page="../header.jsp">
	<jsp:param value="Thêm menu" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>
<!-- Left side column. contains the logo and sidebar -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Thêm menu</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/admin/index.jsp"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Thêm menu</a></li>
		</ol>
	</section>

	<%
		List<Menu> listMenu = (List<Menu>) request.getAttribute("listMenu");
		List<Submenu> listSubmenu = (List<Submenu>) request.getAttribute("listSubmenu");
		List<Secondsubmenu> listSecondSubmenu = (List<Secondsubmenu>) request.getAttribute("listSecondSubmenu");
	%>
	<!-- Main content -->
	<section class="content">
		<div class="message" id="message"></div>
		<section class="content">
			<div class="message" id="message"></div>
			<div class="box box-primary">
				<form role="form" method="post"
					action="<%=request.getContextPath()%>/admin/add/menu">
					<div class="box-body">
						<div class="form-group">
							<label for="name">ID</label> <input type="number"
								class="form-control" name="idMenu" required>
						</div>
						<div class="form-group">
							<label for="name">Menu</label> <input type="text"
								class="form-control" name="ten_Menu" required>
						</div>
						<div class="form-group">
							<label for="name">Link dẫn</label> <input type="text"
								class="form-control" name="link" required>
						</div>
						<div class="form-group">
							<label for="name">Icon</label>
							<p style="font-size: 13px; font-style: italic;">
								* Tham khảo mẫu font từ <a href="http://fontawesome.io/icons/">FontAwesome</a>
							</p>
							<input type="text" class="form-control" name="name_icon">
						</div>
						<div class="form-group">
							<label for="name">Loại menu</label> <select name="type"
								class="form-control">
								<option value="admin">Menu trang admin</option>
								<option value="user">Menu trang chính</option>
							</select>
						</div>

						<div class="form-group">
							<label>Cấp menu</label>
							<div class="form-inline">
								<details>
									<summary>
										<input type="radio" id="menu1" value="menu" name="loaimenu"
											checked> Menu cấp 1 &nbsp;&nbsp;&nbsp;
									</summary>
								</details>
								<details>
									<summary>
										<input type="radio" id="menu2" value="submenu" name="loaimenu">
										Menu cấp 2 &nbsp;&nbsp;&nbsp;
									</summary>
									<div class="form-group">
										<label>Menu cha</label> <select name="menu_c2"
											class="form-control">
											<%
												for (Submenu sub : listSubmenu) {
													out.println("<option value='" + sub.getSubMenuId() + "'>" + sub.getNamemenu() + "</option>");
												}
											%>
										</select>
									</div>
								</details>
								<details>
									<summary>
										<input type="radio" id="menu3" value="secondsubmenu"
										 name="loaimenu"> Menu cấp 3
									</summary>
									<div class="form-group">
										<label>Menu cha</label> <select name="menu_c3">
											<option value="none">None</option>
											<%
												for (Secondsubmenu sub : listSecondSubmenu) {
													out.println("<option value='" + sub.getId() + "'>" + sub.getName() + "</option>");
												}
											%>
										</select>
									</div>
								</details>

							</div>
						</div>
						<div class="form-group">
							<div class="form-group text-center">
								<button type="submit" name="btn_Song" class="btn btn-info">
									<i class="fa fa-upload"></i> Thêm
								</button>
								<button type="reset" name="btn_Album" class="btn">
									<i class="fa fa-repeat"></i> Nhập lại
								</button>
								<a href="<%=request.getContextPath()%>/admin/quanlymenu"><button
										type="button" name="btn_Album" class="btn">
										<i class="fa fa-repeat"></i> Hủy
									</button></a>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
				</form>
			</div>
		</section>
		<!-- /.content -->
	</section>
</div>
<!-- /.row (main row) -->
<jsp:include page="../footer.jsp"></jsp:include>
