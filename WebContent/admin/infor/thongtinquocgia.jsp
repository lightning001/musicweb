<%@page import="entity.Viewsong"%>
<%@page import="entity.Country"%>
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
	<jsp:param value="Thông tin quốc gia" name="title" />
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

<%
	Country country = null;
	if (request.getAttribute("countryinfor") != null)
		country = (Country) request.getAttribute("countryinfor");
	else
		response.sendRedirect(request.getContextPath() + "/admin/danhsachquocgia");
	if (country == null)
		out.print("Không có dữ liệu để hiển thị");
	else {
		
%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid"></div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-play"></i> Thông tin Quốc gia
				</h3>
			</div>
			<div class="panel-body">
				<div class="well">
					<div class="row">
						<table>
							<tr>
								<td>Quốc gia:</td>
								<td>&nbsp;&nbsp;</td>
								<td><%=country.getCountry()%></td>
							</tr>
							<tr>
								<td>Slug:</td>
								<td>&nbsp;&nbsp;</td>
								<td><%=country.getSlugCountry()%></td>
							</tr>

						</table>
					</div>
				</div>
				<div class="well">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-list"></i> Top 10 bài hát
						</h3>
					</div>
					<%
						List<Viewsong> listView = (List<Viewsong>) request.getAttribute("listViewSong");
							List<Song> listSong = new ArrayList<Song>();
							for (Viewsong v : listView)
								listSong.add(v.getSongByIdSong());
					%>

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
								for (int i = 0; i < listSong.size(); i++) {
							%>

							<tbody>

								<tr>

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
			</div>
			<div class="panel-footer">
				<a href="<%=request.getContextPath()%>/admin/danhsachquocgia"><button
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