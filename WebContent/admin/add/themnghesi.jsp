<%@page import="entity.Country"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Thêm nghệ sĩ" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	List<Category> listCategory = (List<Category>)request.getAttribute("listCategory");
	List<Country> listCountry = (List<Country>) request.getAttribute("listCountry");
	int currentpage = 1;
	if (request.getAttribute("page") != null) {
		currentpage = (Integer) request.getAttribute("page");
	}
	request.setAttribute("currentPage", currentpage);

%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Thêm nghệ sĩ</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Quản lý</a></li>
			<li><a href="#">Nghệ sĩ</a></li>
			<li><a href="#">Thêm nghệ sĩ</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="message" id="message"></div>
			<!-- 					<section class="col-md-12"> -->
			<div class="box box-primary">
				<form role="form" method="post" enctype="multipart/form-data"
					action="<%=request.getContextPath()%>/admin/add/singer">
					<div class="box-body">
						<div class="form-group">
							<label for="name">Tên nghệ sĩ</label> <input type="text"
								class="form-control" name="nameSinger"
								placeholder="Nhập tên ca sĩ" required>
						</div>
						<div class="form-group">
							<label for="">Thể loại nhạc</label> <select class="form-control"
								name="category">
								<%
									for (Category c : listCategory) {
								%>
								<option value="<%=c.getSlugCategory()%>"><%=c.getCategory()%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="">Quốc tịch</label> <select class="form-control"
								name="country">
								<%
									for (Country c : listCountry) {
								%>
								<option value="<%=c.getSlugCountry()%>"><%=c.getCountry()%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="infoSinger">Tiểu sử</label>
							<textarea rows="5" name="infoSinger" class="form-control"></textarea>
						</div>
						<div class="form-group">
							<div class="col-xs-10">
								<label for="avarta">Ảnh đại diện</label>
							</div>
							<div class="col-xs-12">
								<img src="<%=request.getContextPath()%>/img/admin/no-images.png"
									id="img-upload" class="img-responsive img-thumbnail" />
							</div>
							<div class="col-xs-30">
								<input type="file" name="linkImg" class="form-control">
								<p class="help-block">File thuộc định dạng ảnh (*.jpeg,
									*.jpg, *.gif, *.png)</p>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="form-group text-center">
							<button type="submit" name="btn_Singer" class="btn btn-primary">
								<i class="fa fa-upload"></i> Thêm nghệ sĩ
							</button>
							<button type="reset" class="btn btn-default">
								<i class="fa fa-refresh"></i> Nhập lại
							</button>
							<a
								href="<%=request.getContextPath()%>/admin/danhsachnghesi/<%=currentpage%>"><button
									type="button" class="btn btn-default">
									<i class="fa fa-reply"></i> Hủy
								</button></a>
						</div>
					</div>
					<!-- /.box-body -->
				</form>
			</div>
		</div>
	</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>