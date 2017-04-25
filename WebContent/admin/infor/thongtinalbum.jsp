<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Album"%>
<%@page import="entity.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>

<jsp:include page="../header.jsp">
<jsp:param value="Thông tin album" name="title"/>
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	Album a = null;
	if (request.getAttribute("albuminfor") != null) {
		a = (Album) request.getAttribute("albuminfor");
	} else
		response.sendRedirect(request.getContextPath()+"/admin/danhsachalbum/1");
	int currentpage = 1;
	if (request.getAttribute("page") != null) {
		currentpage = (Integer) request.getAttribute("page");
	}
	request.setAttribute("currentPage", currentpage);
%>
<div class="wrapper">
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid"></div>
			<div class="panel panel-default">
				<%
					if (a == null) {
						out.print("Khong co du lieu de hien thi");
					} else {
				%>
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-book"></i> Thông tin Album
					</h3>
				</div>
				<div class="panel-body">
					<div class="well">
						<div class="row">
							<div class="form-group">
								<div class="col-xs-15">
									<img src="<%=request.getContextPath() + a.getLinkImg()%>"
										class="img-responsive img-thumbnail" height="150px"
										width="auto" />
								</div>
								<div class="col-xs-30">
									<h2
										style="color: blue; font-family: Time-News-Roman; font-weight: bold;">
										Album :
										<%=a.getNameAlbum()%></h2>
									<table>
										<tr>
											<th>Mã album</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=a.getIdAlbum()%></td>
										</tr>
										<tr>
											<th>Key word</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=a.getKeyWord()%></td>
										</tr>
										<tr>
											<th>Slug album</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=a.getSlugAlbum()%></td>
										</tr>
										<tr>
											<th>Thể loại</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=a.getCategory().getCategory()%></td>
										</tr>
										<tr>
											<th>Quốc gia</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=a.getCountry().getCountry()%></td>
										</tr>
										<tr>
											<th>Nghệ sĩ đóng góp</th>
											<td>&nbsp; : &nbsp;</td>
											<td>
												<%
													if (a.getSingers() != null && a.getSingers().size() > 0) {
															out.print(a.getSingers().get(0).getNameSinger());
															if (a.getSingers().size() > 1) {
																for (int i = 1; i < a.getSingers().size(); i++)
																	out.print(", " + a.getSingers().get(i).getNameSinger());
															}
														}
												%>
											</td>
										</tr>
										<tr>
											<th>Ngày đăng</th>
											<td>&nbsp; : &nbsp;</td>
											<td>2016-11-24 23:51:22:0</td>
										</tr>
										<tr>
											<th>Lượt xem</th>
											<td>&nbsp; : &nbsp;</td>
											<td>0</td>
										</tr>
									</table>
								</div>
							</div>

						</div>
					</div>
					<div class="well">
						<label style="font-size: 20px; font-family: Tahoma;">Giới
							thiệu album</label>
						<p>
							<%
								if (a.getInfoAlbum() != null && !"".equals(a.getInfoAlbum()))
										out.print(a.getInfoAlbum());
									else
										out.print("Chưa có thông tin");
							%>
						</p>
					</div>
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-list"></i> Danh sách bài hát
						</h3>
					</div>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center">Mã</th>
									<th class="text-center">Tên bài hát</th>
									<th class="text-center">Ca sĩ thể hiện</th>
									<th class="text-center">Lượt nghe</th>
								</tr>
							</thead>
							<%
								List<Song> listSong = a.getSongs();
									for (int i = 0; i < listSong.size(); i++) {
							%>
							<tbody>

								<tr>
									<td class="text-center"><%=listSong.get(i).getIdSong()%></td>
									<td class="text-left"><%=listSong.get(i).getNameSong()%></td>
									<td class="text-center">
										<%
											if (listSong.get(i).getSingers() != null && a.getSingers().size() > 0) {
														out.print(listSong.get(i).getSingers().get(0).getNameSinger());
														if (listSong.get(i).getSingers().size() > 1) {
															for (int j = 1; j < listSong.get(i).getSingers().size(); j++)
																out.print(", " + listSong.get(i).getSingers().get(j).getNameSinger());
														}
													}
										%>
									</td>
									<td class="text-center"><%=listSong.get(i).getViewcount()%></td>
								</tr>
							</tbody>
							<%
								}
							%>

						</table>
					</div>
				</div>
				<div class="panel-footer">
					<a
						href="<%=request.getContextPath()%>/admin/danhsachalbum/<%=currentpage%>"><button
							class="btn btn-primary">
							<i class="fa fa-reply" aria-hidden="true"></i> OK
						</button></a>
				</div>
				<%
					}
				%>
				
			</div>
		</section>
		<!-- /.Left col -->
	</div>
	<!-- /.row (main row) -->
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="../footer.jsp"></jsp:include>