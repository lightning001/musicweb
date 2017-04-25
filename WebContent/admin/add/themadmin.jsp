<%@page import="java.util.Date"%>
<%@page import="entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("leaderaccount") == null) {
		response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
	}
	int currentpage = 1;
	if (request.getAttribute("page") != null) {
		currentpage = (Integer) request.getAttribute("page");
	}
	request.setAttribute("currentPage", currentpage);
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Thêm admin" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Thêm admin</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Thêm admin</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="message" id="message"></div>
		<div class="row">
			<!--             <section class="col-lg-12"> -->
			<div class="box box-primary">
				<form role="form" method="post"
					action="<%=request.getContextPath()%>/admin/add/admin">
					<div class="box-body">
						<div class="form-group">
							<label>Tên đăng nhập</label> <input type="text"
								class="form-control" name="userName" placeholder="Nhập username"
								required>
						</div>
						<div class="form-group">
							<label>Mật khẩu</label> <input type="password"
								class="form-control" name="passwd" placeholder="Nhập password"
								required>
						</div>
						<div class="form-group">
							<label>Họ và tên</label> <input type="text" class="form-control"
								name="displayName" placeholder="Nhập họ và tên" required>
						</div>
						<div class="form-group">
							<label>Năm sinh</label> <select class="form-control" name="year">
								<%
									Date date = new Date(System.currentTimeMillis());
									for (int i = date.getYear() + 1900; i >= 1930; i--)
										out.print("<option value=\"" + i + "\">" + i + "</option>");
								%>
							</select>
						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" class="form-control"
								name="email" placeholder="Nhập email" required>
						</div>
						<div class="form-group">
							<label>Số điện thoại</label> <input type="tel"
								class="form-control" name="phone"
								placeholder="Nhập phone number">
						</div>

						<div class="form-group">
							<label>Giới tính </label> &nbsp;&nbsp;&nbsp;&nbsp;<input
								type="radio" name="gender" value="MALE" checked> Nam
							&nbsp;&nbsp;&nbsp;<input type="radio" name="gender"
								value="FEMALE"> Nữ
						</div>
						<div class="form-group">
							<label>Chứng minh nhân dân</label> <input type="text"
								class="form-control" name="passport" placeholder="Nhập CMND">
						</div>

						<div class="form-group">
							<label>Cấp admin</label> <select name="isAdmin"
								class="form-control">
								<option value="Leader">Leader</option>
								<option value="Mod">Mod</option>
							</select>
							<p class="help-block">Leader: có toàn quyền của hệ thống, Mod
								không có quyền thêm sửa xóa admin</p>
						</div>
						<div class="clearfix"></div>
						<div class="form-group text-center" id="form-submit">
							<button type="submit" class="btn btn-primary">Thêm admin</button>
							<i class="fa fa-spinner fa-spin icon-loading" id="icon-loading"></i>
							<button type="reset" class="btn btn-default">
								<i class="fa fa-refresh"></i> Nhập lại
							</button>
							<a href="<%=request.getContextPath()%>/admin/danhsachadmin"><button
									type="button" class="btn btn-default">
									<i class="fa fa-reply"></i> Hủy
								</button></a>
						</div>

					</div>
				</form>
			</div>
		</div>
	</section>
</div>


<jsp:include page="../footer.jsp"></jsp:include>