<%@page import="entity.Singer"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SingerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Danh sách nghệ sĩ" name="title" />
</jsp:include><jsp:include page="../sidebar.jsp"></jsp:include>
<%
	int currentpage = 1;
	if (request.getAttribute("page") != null) {
		currentpage = (Integer) request.getAttribute("page");
	}
	request.setAttribute("currentPage", currentpage);
	List<Singer> list = (List<Singer>) request.getAttribute("listSinger");
%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách nghệ sĩ
				</h3>
			</div>
			<div class="panel-body">
				<div class="well">
					<div style="margin: 10px 15px;">
					<div class="input-group" style="width: 50%; margin: auto;">
						<input type="text" id="input-search-singer"
							style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
							placeholder="Nhập giá trị tìm kiếm" class="form-control">
						<span class="input-group-btn"> <a href="#">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span> Tìm kiếm
								</button>
						</a> <a href="<%=request.getContextPath()%>/admin/add/singers">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-plus"></span> Thêm mới
								</button>
						</a>
						</span>
					</div>
				</div>
				</div>
				<%
					if (list == null || list.isEmpty()) {
						out.print("<label>Không có dữ liệu để hiển thị</label>");
					} else {
				%>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<td class="text-center">Mã nghệ sĩ</td>
								<td class="text-left">Hình ảnh</td>
								<td class="text-left"><a href="#">Tên ca sĩ</a></td>

								<td class="text-right"><a href="#">Quốc gia</a></td>

								<td class="text-center"><a href="#">Theo dõi</a></td>
								<td class="text-right">Thao tác</td>
							</tr>
						</thead>
						<tbody>
							<%
								for (Singer s : list) {
							%>
							<tr>
								<td class="text-center"><%=s.getIdSinger()%></td>
								<td class="text-center"><img
									src="<%=request.getContextPath() + s.getLinkImgSinger()%>"
									class="thumbnail" alt="Hình ảnh nghệ sĩ"
									style="max-height: 100px;"></td>
								<td class="text-left"><%=s.getNameSinger()%></td>
								<td class="text-right"><%=s.getCountry().getCountry()%></td>
								<td class="text-center"><%=s.getViewcount()%></td>
								<td class="text-right"><a
									href="<%=request.getContextPath()%>/admin/infor/singer/<%=s.getSlugSinger()%>">
										<button class="btn btn-info btn-sm">
											<span class="glyphicon glyphicon-info-sign"></span>
										</button>
								</a> <a
									href="<%=request.getContextPath()%>/admin/update/singer/<%=s.getSlugSinger()%>">
										<button class="btn btn-primary btn-sm">
											<span class="glyphicon glyphicon-edit"></span>
										</button>
								</a> <a
									href="<%=request.getContextPath()%>/admin/delete/singer/<%=s.getSlugSinger()%>">
										<button class="btn btn-danger btn-sm" type="button">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
								</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<div align="center">
						<%
						long numPage = (Long) request.getAttribute("numPage");
						%>
						<ul class="pagination">
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachnghesi/1"><i
									class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
							<%
								for (int i = 1; i <= numPage; i++) {
							%>
							<li <%if (currentpage == i)
						out.print(" class=\"active\"");%>><a
								href="<%=request.getContextPath()%>/admin/danhsachnghesi/<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachnghesi/<%=numPage%>"><i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</section>
	<!-- /.Left col -->
</div>
<jsp:include page="../footer.jsp"></jsp:include>