<%@page import="entity.Users"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("leaderaccount")==null)
		response.sendRedirect(request.getContextPath()+"/admin/index.jsp");
	if (request.getAttribute("listAdmin") == null)
		response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
	else {
		List<Users> listAdmin = (List<Users>) request.getAttribute("listAdmin");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Quản lí Admin" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Quản lí admin</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Quản lí admin</a></li>
		</ol>
	</section>
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách admin
				</h3>
			</div>
			<div class="panel-body">
				<div class="well row">
					<div class="form-inline">
						<label class="control-label" for="input-name"> Email </label> <input
							type="text" name="filter_name" value="" placeholder="Email admin"
							id="input-name" class="form-control" autocomplete="off">
						<ul class="dropdown-menu"></ul>
						<label class="control-label" for="input-name"> Cấp bậc </label> <input
							type="text" name="filter_name" value="" placeholder="Key word"
							id="input-name" class="form-control" autocomplete="off">
						<ul class="dropdown-menu"></ul>
						<button type="button" id="button-filter"
							class="btn btn-primary pull-right">
							<i class="fa fa-search"></i> Lọc
						</button>
					</div>
				</div>
				<div class="table-responsive">
					<form role="form" method="post"
						action="<%=request.getContextPath()%>/admin/update/admin">
						<table class="table table-hover">
							<thead>
								<tr>
									<td align="center">Mã admin</td>
									<td class="text-center">Hình ảnh</td>
									<td class="text-left"><a href="#" class="desc">Tên
											admin</a></td>
									<td class="text-right"><a href="#">Cấp bậc</a></td>
									<td class="text-right">Thao tác</td>
								</tr>
							</thead>
							<tbody>
								<%
									for (Users user : listAdmin) {
								%>
								<tr>
									<td class="text-center"><%=user.getIdUser()%></td>
									<td class="text-center"><img alt="avatar" width="60px"
										height="auto"
										src="<%=request.getContextPath() + user.getLinkAvatar()%>"></td>
									<td class="text-left"><%=user.getDisplayName()%></td>
									<td class="text-right"><div id="adminlv"><%=user.getIsAdmin()%></div></td>
									<td class="text-right"><a
										href="<%=request.getContextPath()%>/forward/admin/infor/<%=user.getIdUser()%>">
											<button class="btn btn-info btn-sm" type="button">
												<span class="glyphicon glyphicon-info-sign"></span>
											</button>
									</a>
										<button class="btn btn-primary btn-sm" data-toggle="modal"
											data-target="#level<%=user.getIdUser()%>" type="button">
											<span class="glyphicon glyphicon-edit"></span>
										</button>

										<div class="modal fade" id="level<%=user.getIdUser()%>"
											role="dialog">
											<div class="modal-dialog text-left">

												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close"
															data-dismiss="level<%=user.getIdUser()%>">&times;</button>
														<h4 class="modal-title">
															Chỉnh sửa quyền admin của
															<%=user.getDisplayName()%></h4>
													</div>
													<div class="modal-body">
														<input name="id" type="checkbox"
															value="<%=user.getIdUser() + "-Leader"%>"> Leader
														<input name="id" type="checkbox"
															value="<%=user.getIdUser() + "-Mod"%>"> Mod
													</div>
													<div class="modal-footer">
														<button type="submit" class="btn btn-info"
															data-dismiss="level<%=user.getIdUser()%>">OK</button>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="level<%=user.getIdUser()%>">Hủy</button>
													</div>
												</div>
											</div>
										</div> <a
										href="<%=request.getContextPath()%>/admin/delete/admin/<%=user.getIdUser()%>">
											<button class="btn btn-danger  btn-sm" type="button">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
									</a></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.Left col -->
</div>
<!-- /.row (main row) -->
<jsp:include page="../footer.jsp"></jsp:include>
<%
	}
%>
