<%@page import="entity.Singer"%>
<%@page import="entity.Song"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Danh sách bài hát" name="title" />
</jsp:include>
<!-- Left side column. contains the logo and sidebar -->
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	int currentpage = 1;
	if (request.getAttribute("page") != null) {
		currentpage = (Integer) request.getAttribute("page");
	}
	request.setAttribute("currentPage", currentpage);
	List<Song> list = (List<Song>) request.getAttribute("listSong");
%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách bài hát
				</h3>
			</div>
			<div class="panel-body">
				<div style="margin: 10px 15px;">
					<div class="input-group" style="width: 50%; margin: auto;">
						<input type="text" id="input-search-song"
							style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
							placeholder="Nhập giá trị tìm kiếm" class="form-control">
						<span class="input-group-btn"> <a href="#">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span> Tìm kiếm
								</button>
						</a> <a href="<%=request.getContextPath()%>/admin/add/songs">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-plus"></span> Thêm mới
								</button>
						</a>
						</span>
					</div>
				</div>
				<br>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">Mã bài hát</th>
								<th class="text-left">Tên bài hát</th>
								<th class="text-left">Nghệ sĩ thể hiện</th>
								<th class="text-left">Album</th>
								<th class="text-right">Ngày đăng</th>
								<th class="text-right">Số lượt nghe</th>
								<th class="text-right">Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Song song : list) {
							%>
							<tr>
								<td class="text-center"><%=song.getIdSong()%></td>
								<td class="text-left"><%=song.getNameSong()%></td>

								<td class="text-left">
									<%
										if (song.getSingers() != null && !song.getSingers().isEmpty()) {
												out.print("" + song.getSingers().get(0).getNameSinger());
												if (song.getSingers().size() > 1)
													for (int i = 1; i < song.getSingers().size(); i++)
														out.print(", " + song.getSingers().get(i).getNameSinger());
											} else {
												out.print("Unknown");
											}
									%>
								</td>
								<td class="text-left">
									<%
										if (song.getAlbum() != null)
												out.print(song.getAlbum().getNameAlbum());
											else
												out.print("");
									%>
								</td>
								<td class="text-right"><%=song.getPostDate()%></td>
								<td class="text-right"><%=song.getViewcount()%></td>

								<td class="text-right"><a
									href="<%=request.getContextPath()%>/admin/infor/song/<%=song.getSlugSong()%>">
										<button class="btn btn-info">
											<span class="glyphicon glyphicon-info-sign"></span>
										</button>
								</a> <a
									href="<%=request.getContextPath()%>/admin/update/song/<%=song.getSlugSong()%>">
										<button class="btn btn-primary">
											<span class="glyphicon glyphicon-edit"></span>
										</button>
								</a> <a
									href="<%=request.getContextPath()%>/admin/delete/song/<%=song.getSlugSong()%>">
										<button class="btn btn-danger" type="button">
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
								href="<%=request.getContextPath()%>/admin/danhsachbaihat/1"><i
									class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
							<%
								for (int i = 1; i <= numPage; i++) {
							%>
							<li
								<%if (currentpage == i)
					out.print(" class=\"active\"");%>><a
								href="<%=request.getContextPath()%>/admin/danhsachbaihat/<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachbaihat/<%=numPage%>"><i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						</ul>


					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>