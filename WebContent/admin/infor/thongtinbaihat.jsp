<%@page import="java.util.Arrays"%>
<%@page import="entity.Song"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Chi tiết bài hát" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	Song song = null;
	if (request.getAttribute("songinfor") != null) {
		song = (Song) request.getAttribute("songinfor");
	}
	else
		response.sendRedirect(request.getContextPath()+"/admin/danhsachbaihat/1");
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
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-music"></i> Thông tin Bài hát
					</h3>
				</div>
				<%
					if (song == null)
						out.print("Khong co du lieu de hien thi");
					else {
				%>
				<div class="panel-body">
					<div class="well">
						<div class="row">
							<div class="form-group">
								<div class="col-xs-15">
									<%
										String link = "";
											if (song.getSingers() != null)
												if (song.getSingers().get(0).getLinkImgSinger() != null)
													link = song.getSingers().get(0).getLinkImgSinger();
												else
													link = "/img/song/no-images.png";
									%>
									<img src="<%=request.getContextPath() + link%>"
										class="img-responsive img-thumbnail" />
								</div>
								<div class="col-xs-30">
									<h2
										style="color: blue; font-family: Time-News-Roman; font-weight: bold;">
										Bài hát :
										<%=song.getNameSong()%></h2>
									<table>
										<tr>
											<th>Mã bài hát</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=song.getIdSong()%></td>
										</tr>
										<tr>
											<th>Thuộc album</th>
											<td>&nbsp; : &nbsp;</td>
											<td>
												<%
													if (song.getAlbum() != null)

															out.print(song.getAlbum().getNameAlbum());
												%>
											</td>
										</tr>
										<tr>
											<th>Key word</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=song.getKeyWord()%></td>
										</tr>
										<tr>
											<th>Slug song</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=song.getSlugSong()%></td>
										</tr>
										<tr>
											<th>Ca sĩ thể hiện</th>
											<td>&nbsp; : &nbsp;</td>
											<td>
												<%
													if (song.getSingers() != null && song.getSingers().size() > 0) {
															out.print(song.getSingers().get(0).getNameSinger());
															if (song.getSingers().size() > 1) {
																for (int j = 1; j < song.getSingers().size(); j++)
																	out.print(", " + song.getSingers().get(j).getNameSinger());
															}
														}
												%>
											</td>
										</tr>
										<tr>
											<th>Quốc gia</th>
											<td>&nbsp; : &nbsp;</td>
											<td>
												<%
													if (song.getCountry() != null)
															song.getCountry().getCountry();
												%>
											</td>
										</tr>
										<tr>
											<th>Ngày đăng</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=song.getPostDate()%></td>
										</tr>
										<tr>
											<th>Lượt xem</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=song.getViewcount()%></td>
										</tr>
										<tr>
											<th>Lượt like</th>
											<td>&nbsp; : &nbsp;</td>
											<td><%=song.getLikes()%> <i class="fa fa-thumbs-o-up"></i></td>
										</tr>
									</table>
								</div>
							</div>

						</div>
					</div>
					<div class="well">
						<label style="font-size: 20px; font-family: Tahoma;">Lyrics</label>
						<p>
							<%
								if (song.getLyric() != null)
										out.print(song.getLyric().getLyric());
									else
										out.print("Chưa có lời bài hát");
							%>
						</p>
					</div>
				</div>
				<div class="panel-footer">
					<a
						href="<%=request.getContextPath()%>/admin/danhsachbaihat/<%=currentpage%>"><button
							class="btn btn-default">
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