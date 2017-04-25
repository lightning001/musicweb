<%@page import="entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Users admin = null;
	if (session.getAttribute("adminaccount") == null) {
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
		return;
	}
%>
<jsp:include page="header.jsp">
	<jsp:param value="Trang chủ Admin" name="title" />
</jsp:include>

<jsp:include page="sidebar.jsp"></jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Thống kê</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class=" col-xs-15">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>150</h3>
						<p>150 lượt download</p>
					</div>
					<div class="icon">
						<i class="ion ion-bag"></i>
					</div>
					<a href="#" class="small-box-footer">Xem thêm <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class=" col-xs-15">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>5</h3>
						<p>5 lượt share</p>
					</div>
					<div class="icon">
						<i class="ion ion-stats-bars"></i>
					</div>
					<a href="#" class="small-box-footer">Xem thêm <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class=" col-xs-15">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<h3>44</h3>
						<p>User đã đăng ký</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="#" class="small-box-footer">Xem thêm <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class=" col-xs-15">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>565</h3>
						<p>Truy cập trong ngày</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<a href="#" class="small-box-footer">Xem thêm <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->
		<!-- Main row -->
		<div class="row">
			<!-- Left col -->
			<section class="col-xs-60">
				<!-- quick email widget -->
				<div class="box box-info">
					<div class="box-header">
						<i class="fa fa-envelope"></i>
						<h3 class="box-title">
							Mail to <em>DPM.com</em>
						</h3>
					</div>
					<div class="box-body">
						<form name="support" method="post">
							<div class="form-group">
								<input type="text" class="form-control" name="title"
									placeholder="Tiêu đề" />
							</div>
							<div class="form-group">
								<select class="form-control" name="select">
									<option value="1">Góp ý</option>
									<option value="1">Hỗ trợ</option>
								</select>
							</div>
							<div>
								<textarea class="textarea" placeholder="Nội dung"
									style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"
									name="content"></textarea>
							</div>
						</form>
					</div>
					<div class="box-footer clearfix">
						<button class="pull-right btn btn-default" id="sendEmail">
							Gửi <i class="fa fa-arrow-circle-right"></i>
						</button>
					</div>
				</div>

			</section>
			<!-- /.Left col -->
		</div>
		<!-- /.row (main row) -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="footer.jsp"></jsp:include>
