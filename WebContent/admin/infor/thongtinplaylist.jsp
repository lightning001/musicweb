<%@page import="java.util.List"%>
<%@page import="entity.Playlist"%>
<%@page import="entity.Song"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Thông tin Playlist" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>
<style type="text/css">
.cke {
	visibility: hidden;
}

a.non-textdecoration {
	color: white;
	text-decoration: none;
}

.col-sm-3 button {
	margin-top: 25px;
}
</style>

</head>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid"></div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-play"></i> Thông tin Playlist
				</h3>
			</div>
			<div class="panel-body">
				<div class="well">

					<%
						Playlist playlist = null;
						if (request.getAttribute("playlistinfor") != null)
							playlist = (Playlist) request.getAttribute("playlistinfor");
						else
							response.sendRedirect(request.getContextPath()+"/admin/danhsachplaylist/1");
						if (playlist == null)
							out.print("Không có dữ liệu để hiển thị");
						else {
							int currentpage = 1;
							if (request.getAttribute("page") != null) {
								currentpage = (Integer) request.getAttribute("page");
							}
							request.setAttribute("currentPage", currentpage);
					%>
					<div class="row">
						<div class="form-group">
							<div class="col-xs-15">
								<%
									String linkImg = "";
										if (playlist.getLinkImg() != null && !"".equals(playlist.getLinkImg()))
											linkImg = playlist.getLinkImg();
										else
											linkImg = "/img/playlist/no-images.png";
								%>
								<img src="<%=request.getContextPath() + linkImg%>"
									class="img-responsive img-thumbnail" />
							</div>
							<div class="col-xs-30">
								<h2
									style="color: blue; font-family: Time-News-Roman; font-weight: bold;">
									Playlist :
									<%=playlist.getNamePlaylist()%></h2>
								<table>
									<tr>
										<th>Mã playlist</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=playlist.getIdPlaylist()%></td>
									</tr>
									<tr>
										<th>Key word</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=playlist.getKeyWord()%></td>
									</tr>
									<tr>
										<th>Slug playlist</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=playlist.getSlugPlaylist()%></td>
									</tr>
									<tr>
										<th>Thể loại</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=playlist.getCategory().getCategory()%></td>
									</tr>
									<tr>
										<th>Quốc gia</th>
										<td>&nbsp; : &nbsp;</td>
										<td>
											<%
												if (playlist.getCountry() != null)
														out.print(playlist.getCountry().getCountry());
													else
														out.print("Không rõ");
											%>
										</td>
									</tr>
									<tr>
										<th>Ngày đăng</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=playlist.getPostDate()%></td>
									</tr>
									<tr>
										<th>Lượt nghe</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=playlist.getViewCount()%></td>
									</tr>
									<tr>
										<th>Lượt like</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=playlist.getLikes()%> <i class="fa fa-thumbs-o-up"></i></td>
									</tr>
								</table>
							</div>
						</div>

					</div>
				</div>
				<div class="well">
					<label style="font-size: 20px; font-family: Tahoma;">Nghệ
						sĩ đóng góp: </label>
					<p>
						<%
							if (playlist.getSingers() != null && playlist.getSingers().size() > 0) {
									out.print(playlist.getSingers().get(0).getNameSinger());
									if (playlist.getSingers().size() > 1) {
										for (int i = 1; i < playlist.getSingers().size(); i++)
											out.print(", " + playlist.getSingers().get(i).getNameSinger());
									}
								} else
									out.print("Không rõ");
						%>
					</p>
					<label style="font-size: 20px; font-family: Tahoma;">Mô tả
						playlist</label>
					<p>
						<%
							if (playlist.getInfoPlaylist() != null)
									out.print(playlist.getInfoPlaylist());
								else
									out.print("Không có mô tả");
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
								<th class="col-xs-1">STT</th>
								<th class="text-center">Mã</th>
								<th class="text-center">Tên bài hát</th>
								<th class="text-center">Ca sĩ thể hiện</th>
								<th class="text-center">Lượt nghe</th>
							</tr>
						</thead>

						<%
							List<Song> listSong = playlist.getSongs();
							for (int i = 0; i < listSong.size(); i++) {
						%>

						<tbody>

							<tr>
								<td class="text-center"><%=i+1 %></td>
								<td class="text-center"><%=listSong.get(i).getIdSong()%></td>
								<td class="text-left"><a href=""><%=listSong.get(i).getNameSong()%></a></td>
								<td class="text-left"><a href=""> <%
 	if (listSong.get(i).getSingers() != null && listSong.get(i).getSingers().size() > 0) {
 				out.print(listSong.get(i).getSingers().get(0).getNameSinger());
 				if (listSong.get(i).getSingers().size() > 1) {
 					for (int j = 1; j < listSong.get(i).getSingers().size(); j++)
 						out.print(", " + listSong.get(i).getSingers().get(j).getNameSinger());
 				}
 			} else
 				out.print("Không rõ");
 %>
								</a></td>
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
					href="<%=request.getContextPath()%>/admin/danhsachplaylist/<%=currentpage%>"><button
						class="btn btn-primary">
						<i class="fa fa-reply" aria-hidden="true"></i> OK
					</button></a>
			</div>
		</div>
	</section>
</div>
<%
	}
%>
<jsp:include page="../footer.jsp"></jsp:include>