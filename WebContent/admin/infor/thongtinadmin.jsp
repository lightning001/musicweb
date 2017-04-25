<%@page import="entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Thông tin admin" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	Users u = null;
	if (request.getAttribute("admininfor") != null)
		u = (Users) request.getAttribute("admininfor");
%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>Thông tin admin</h3>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Quản lý admin</a></li>
					<li><a href="#">Chỉnh sửa thông tin</a></li>
				</ol>
			</div>
			<!-- 			<section class="col-md-12"> -->
			<div class="panel-body">
				<div class="well">
					<div class="row">
						<div class="form-group">
							<div class="col-xs-15">
								<img alt="avatar" class="img-thumbnail img-responsive"
									src="<%=request.getContextPath() + u.getLinkAvatar()%>">
								<h2><%=u.getIsAdmin() + ":&nbsp;&nbsp;&nbsp;" + u.getDisplayName()%></h2>
							</div>
							<div class="col-sx-30">
								<table>
									<tr>
										<td><label>Họ và tên: </label></td>
										<td><font> <%=u.getDisplayName()%></font></td>
									</tr>
									<tr>
										<td><label> Tuổi: </label></td>
										<td><font><%=u.getAge()%></font></td>
									</tr>
									<tr>
										<td><label> Giới tính:</label></td>
										<td><font> <%
 	if ("female".equalsIgnoreCase(u.getGender()))
 		out.print("<font>Nữ</font>");
 	else if ("male".equalsIgnoreCase(u.getGender()))
 		out.print("<font>Nam</font>");
 %>
										</font></td>
									</tr>
									<tr>
										<td><label>Email: </label></td>
										<td><font><%=u.getEmail()%></font></td>
									</tr>
									<tr>
										<td><label> Số điện thoại: </label></td>
										<td><font> <%=u.getPhone()%></font></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-footer">
				<a
					href="<%=request.getContextPath()%>/admin/danhsachadmin"><button
						class="btn btn-primary">
						<i class="fa fa-reply" aria-hidden="true"></i> OK
					</button></a>
			</div>
		</div>
	</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>