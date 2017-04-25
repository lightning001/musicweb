<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="entity.Album"%>
<%@page import="entity.Playlist"%>
<%@page import="java.util.List"%>
<%@page import="entity.Singer"%>
<%@page import="java.util.Arrays"%>
<%@page import="entity.Song"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp"></jsp:include>
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
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid"></div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-male"></i> Thông tin nghệ sĩ
				</h3>
			</div>
			<div class="panel-body">
				<div class="well">
					<%
						Singer singer = null;
						if (request.getAttribute("singerinfor") != null)
							singer = (Singer) request.getAttribute("singerinfor");
						else
							response.sendRedirect(request.getContextPath() + "/admin/danhsachnghesi/1");
						if (singer == null)
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
								<img
									src="<%=request.getContextPath() + singer.getLinkImgSinger()%>"
									class="img-responsive img-thumbnail" />
							</div>
							<div class="col-xs-30">
								<h2
									style="color: blue; font-family: Time-News-Roman; font-weight: bold;">
									<%=singer.getNameSinger()%></h2>
								<table>
									<tr>
										<th>Mã nghệ sĩ</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=singer.getIdSinger()%></td>
									</tr>
									<tr>
										<th>Key word</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=singer.getKeyWord()%></td>
									</tr>
									<tr>
										<th>Slug singer</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=singer.getSlugSinger()%></td>
									</tr>
									<tr>
										<th>Thể loại</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=singer.getCategory().getCategory()%></td>
									</tr>
									<tr>
										<th>Quốc gia</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=singer.getCountry().getCountry()%></td>
									</tr>
									<tr>
										<th>Lượt theo dõi</th>
										<td>&nbsp; : &nbsp;</td>
										<td><%=singer.getViewcount()%></td>
									</tr>

								</table>
							</div>
						</div>

					</div>
				</div>
				<div class="well">
					<label style="font-size: 20px; font-family: Tahoma;">Thông
						tin</label>
					<p>
						<%
							if (singer.getInfoSinger() != null && !"".equals(singer.getInfoSinger()))
									out.print(singer.getInfoSinger());
								else
									out.print("Không có thông tin");
						%>
					</p>
				</div>
				<div class="well">
					<%
						List<Playlist> listPlaylist = singer.getPlaylists();
					%>
					<div class="container">
						<a href="#"><h3 class="text-left">Playlist >></h3></a>
					</div>
					
				</div>
				<div class="well">
					<%
						List<Album> listAlbum = singer.getAlbums();
					%>
					<div class="container">
						<a href="<%=request.getContextPath()%>/admin/danhsachalbum/1"></a>
					</div>
				</div>
				<div class="well">
					<%
						List<Song> listSong = singer.getSongs();
					%>
					<div class="container">
						<div class="row">
							<a href="#"><h3 class="text-left">Song >></h3></a>
						</div>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="text-center">Mã bài hát</th>
										<th class="text-left">Tên bài hát</th>
										<th class="text-right">Ngày đăng</th>
										<th class="text-right">Số lượt nghe</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Song song : listSong) {
									%>
									<tr>
										<td class="text-center"><%=song.getIdSong()%></td>
										<td class="text-left"><%=song.getNameSong()%></td>
										<td class="text-right"><%=song.getPostDate()%></td>
										<td class="text-right"><%=song.getViewcount()%></td>
									</tr>
									<%
										}
									%>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-footer">
				<a
					href="<%=request.getContextPath()%>/admin/danhsachnghesi/<%=currentpage%>"><button
						class="btn btn-primary">
						<i class="fa fa-reply" aria-hidden="true"></i> OK
					</button></a>
			</div>
		</div>
	</section>
	<!-- /.Left col -->
</div>
<!-- /.row (main row) -->
<%
	}
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/carousel-style.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#media').carousel({
			pause : true,
			interval : false,
		});
	});
	$(document).ready(function() {
		$('#media2').carousel({
			pause : true,
			interval : false,
		});
	});
</script>

<jsp:include page="../footer.jsp"></jsp:include>