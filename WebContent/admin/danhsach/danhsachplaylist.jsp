<%@page import="entity.Playlist"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Danh sách playlist" name="title" />
</jsp:include>
<!-- Left side column. contains the logo and sidebar -->
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	int currentpage = 1;
	if (request.getAttribute("page") != null) {
		currentpage = (Integer) request.getAttribute("page");
	}
	request.setAttribute("currentPage", currentpage);
	List<Playlist> list = (List<Playlist>) request.getAttribute("listPlaylist");
%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách Playlist
				</h3>
			</div>
			<%
				if (list == null || list.isEmpty()) {
					out.print("<label>Không có dữ liệu để hiển thị</label>");
				} else {
			%>
			<div class="panel-body">
				<div class="well">
					<div style="margin: 10px 15px;">
					<div class="input-group" style="width: 50%; margin: auto;">
						<input type="text" id="input-search-playlist"
							style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
							placeholder="Nhập giá trị tìm kiếm" class="form-control">
						<span class="input-group-btn"> <a href="#">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span> Tìm kiếm
								</button>
						</a> <a href="<%=request.getContextPath()%>/admin/add/playlists">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-plus"></span> Thêm mới
								</button>
						</a>
						</span>
					</div>
				</div>
				</div>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<td>Mã playlist</td>
								<td class="text-center">Hình ảnh</td>
								<td class="text-center">Tên playlist</td>
								<td class="text-center">Nghệ sĩ đóng góp</td>
								<td class="text-center">Ngày đăng</td>
								<td class="text-right">Số lượt nghe</td>
								<td class="text-right">Thao tác</td>
							</tr>
						</thead>
						<tbody>
							<%
								for (Playlist p : list) {
							%>
							<tr>
								<td class="text-center"><%=p.getIdPlaylist()%></td>
								<td class="text-center"><img class="thumbnail"
									style="max-height: 100px;"
									src="<%=request.getContextPath() + p.getLinkImg()%>"></td>
								<td class="text-center col-xs-10"><%=p.getNamePlaylist()%></td>
								<td class="text-left col-xs-20"><wbr>
									<%
										if (p.getSingers() != null && !p.getSingers().isEmpty()) {
													out.print(p.getSingers().get(0).getNameSinger());
													if (p.getSingers().size() > 1)
														for (int i = 1; i < p.getSingers().size(); i++)
															out.print(", " + p.getSingers().get(i).getNameSinger());
												}
									%>
								</td>
								<td class="text-center"><%=p.getPostDate()%></td>
								<td class="text-right"><%=p.getViewCount()%></td>
								<td class="text-right col-sx-8"><a
									href="<%=request.getContextPath()%>/admin/infor/playlist/<%=p.getSlugPlaylist()%>">
										<button class="btn btn-info btn-sm">
											<span class="glyphicon glyphicon-info-sign"></span>
										</button>
								</a> <a
									href="<%=request.getContextPath()%>/admin/update/playlist/<%=p.getSlugPlaylist()%>">
										<button class="btn btn-primary btn-sm">
											<span class="glyphicon glyphicon-edit"></span>
										</button>
								</a> <a
									href="<%=request.getContextPath()%>/admin/delete/playlist/<%=p.getSlugPlaylist()%>">
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
								href="<%=request.getContextPath()%>/admin/danhsachplaylist/1"><i
									class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
							<%
								for (int i = 1; i <= numPage; i++) {
							%>
							<li
								<%if (currentpage == i)
						out.print(" class=\"active\"");%>><a
								href="<%=request.getContextPath()%>/admin/danhsachplaylist/<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachplaylist/<%=numPage%>"><i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>