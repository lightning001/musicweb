<%@page import="entity.Users"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null){
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
		return;
	}
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Danh sách người dùng" name="title" />
</jsp:include>
<!-- Left side column. contains the logo and sidebar -->
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	int currentpage = 1;
	if (request.getAttribute("page") != null) {
		currentpage = (Integer)request.getAttribute("page");
	}
	List<Users> listUser =(List<Users>) request.getAttribute("listUser");
%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách người dùng
				</h3>
			</div>
			<div class="panel-body">
				<div>
					<input type="text" name="filter_name"
						placeholder="Nhập giá trị tìm kiếm" id="input-name"
						autocomplete="off" class="form-control" style="max-width: 70%;">
					<ul class="dropdown-menu"></ul>
				</div>
				<br>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">ID</th>
								<th class="text-center">Ảnh đại diện</th>
								<th class="text-left">Tên đăng nhập</th>
								<th class="text-left">Tên người dùng</th>
								<th class="text-left">Email</th>
								<th class="text-right">Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < listUser.size(); i++) {
							%>
							<tr>
								<td class="text-center"><%=listUser.get(i).getIdUser()%></td>
								<td><img class="img-thumbnail img-responsive" alt="Ảnh đại diện"
									src="<%=request.getContextPath() + listUser.get(i).getLinkAvatar()%>"></td>
								<td><%=listUser.get(i).getUserName()%></td>
								<td><%=listUser.get(i).getDisplayName()%></td>
								<td><%=listUser.get(i).getEmail()%></td>
								<td>
								<a href="<%=request.getContextPath()%>/admin/delete/user/<%=listUser.get(i).getIdUser()%>"><button class="btn btn-warning btn-sm"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></button></a>
								</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					
					<div align="center">
						<%
							long numPage = (Long) request.getAttribute("numPage");
						if(numPage>=2){
						%>
						<ul class="pagination">
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachuser/1"><i
									class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
							<%if(numPage>1){
								for (int i = 2; i < numPage; i++) {
							%>
							<li
								<%if (currentpage == i)
						out.print(" class=\"active\"");%>><a
								href="<%=request.getContextPath()%>/admin/danhsachuser/<%=i%>"><%=i%></a></li>
							<%
								}}
							%>
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachuser/<%=numPage%>"><i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						</ul>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<jsp:include page="../footer.jsp"></jsp:include>