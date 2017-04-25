<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("leaderaccount") == null) {
		response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
	}
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
				<form role="form" method="post" enctype="multipart/form-data">
					<div class="box-body">
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" name="email" placeholder="Nhập email"
								required>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" name="password" placeholder="Nhập password"
								required>
						</div>
						<div class="form-group">
							<label for="level">Level</label> <select name="level"
								class="form-control">
								<option value="1">Level 1</option>
								<option value="2">Level 2</option>
							</select>
							<p class="help-block">Level 2: có toàn quyền của hệ thống,
								level 1 chỉ không có quyền thêm sửa xóa admin</p>
						</div>

						<div class="clearfix"></div>
						<div class="form-group text-center" id="form-submit">
							<button type="submit" name="sb_themthanhvien"
								class="btn btn-info" id="submit">Lưu chỉnh sửa</button>
							<button type="reset" class="btn btn-default">
								<i class="fa fa-refresh"></i> Nhập lại
							</button>
							<a href="<%=request.getContextPath()%>/admin/danhsachadmin"><button
									type="button" class="btn btn-default ">
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