<%@page import="java.io.File"%>
<%@page import="entity.Singer"%>
<%@page import="DAO.AlbumDAO"%>
<%@page import="entity.Album"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null){
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
		return;
	}
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Danh sách Album" name="title" />
</jsp:include>
<style type="text/css">
.cke {
	visibility: hidden;
}
</style>
<jsp:include page="../sidebar.jsp"></jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách Album
				</h3>
			</div>
			<%
				int currentpage = 1;
				if (request.getAttribute("page") != null) {
					currentpage = (Integer) request.getAttribute("page");
				}
				request.setAttribute("currentPage", currentpage);
				List<Album> list = (List<Album>) request.getAttribute("listAlbum");
			%>
			<div class="panel-body">
				<div style="margin: 10px 15px;">
					<div class="input-group" style="width: 50%; margin: auto;">
						<input type="text" id="input-search-album"
							style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
							placeholder="Nhập giá trị tìm kiếm" class="form-control">
						<span class="input-group-btn"> <a href="#">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span> Tìm kiếm
								</button>
						</a> <a href="<%=request.getContextPath()%>/admin/add/albums">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-plus"></span> Thêm mới
								</button>
						</a>
						</span>
					</div>
				</div>
				<%
					if (list == null)
						out.print("Không có dữ liệu");
					else {
				%>
				<div>
					<table class="table table-striped"
						style="overflow: scroll; width: 98%; margin: auto;">
						<tr>
							<th>Id</th>
							<th>Ảnh bìa</th>
							<th>Tên Album</th>
							<th>Nghệ sĩ đóng góp</th>
							<th>Ngày đăng</th>
							<th>Lượt xem</th>
							<th>Trích dẫn</th>
							<th></th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getIdAlbum()%></td>
							<%
								String linkImg = "/img/album/no-images.png";
										if (list.get(i).getLinkImg() != null && !"".equals(list.get(i).getLinkImg()))
											linkImg = request.getContextPath() + list.get(i).getLinkImg();
							%>
							<td><img src="<%=linkImg%>" class="img-thumbnail"
								width="100px" height="auto"></td>
							<td><%=list.get(i).getNameAlbum()%></td>
							<td>
								<%
									if (!list.get(i).getSingers().isEmpty()) {
												out.print(list.get(i).getSingers().get(0).getNameSinger());
												if (list.get(i).getSingers().size() > 1)
													for (int j = 1; j < list.get(i).getSingers().size(); j++) {
														out.print(", " + list.get(i).getSingers().get(j).getNameSinger());
													}
											}
								%>
							</td>
							<td><%=list.get(i).getPostDate()%></td>
							<td><%=list.get(i).getViewcount()%></td>
							<td>
								<%
									if (list.get(i).getInfoAlbum() == null || list.get(i).getInfoAlbum().equals(""))
												out.print("Không có");
											else
												out.print(list.get(i).getInfoAlbum());
								%>
							</td>
							<td><a
								href="<%=request.getContextPath()%>/admin/infor/album/<%=list.get(i).getSlugAlbum()%>">
									<button class="btn btn-info btn-sm">
										<span class="glyphicon glyphicon-info-sign"></span>
									</button>
							</a> <a
								href="<%=request.getContextPath()%>/admin/update/album/<%=list.get(i).getSlugAlbum()%>">
									<button class="btn btn-primary btn-sm">
										<span class="glyphicon glyphicon-edit"></span>
									</button>

							</a> <a
								href="<%=request.getContextPath()%>/admin/delete/album/<%=list.get(i).getSlugAlbum()%>">
									<button class="btn btn-danger btn-sm" type="button">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
							</a></td>
						</tr>
						<%
							}
						%>
					</table>
					<div align="center">
						<%
							long numPage = (Long) request.getAttribute("numPage");
						%>
						<ul class="pagination">
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachalbum/1"><i
									class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
							<%
								for (int i = 1; i <= numPage; i++) {
							%>
							<li
								<%if (currentpage == i)
						out.print(" class=\"active\"");%>><a
								href="<%=request.getContextPath()%>/admin/danhsachalbum/<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachalbum/<%=numPage%>"><i
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
<!-- /.row (main row) -->
<jsp:include page="../footer.jsp"></jsp:include>