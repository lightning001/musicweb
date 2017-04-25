<%@page import="entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="header.jsp">
<jsp:param value="Thống kê" name="title"/>
</jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Dashboard <small>Control panel domain</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 ">
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
			<div class="col-lg-3 ">
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
			<div class="col-lg-3">
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
			<div class="col-lg-3">
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

	</section>
	<!-- /.Left col -->
</div>
<!-- /.row (main row) -->

<jsp:include page="footer.jsp"></jsp:include>