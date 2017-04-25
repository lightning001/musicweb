<%@page import="entity.Singer"%>
<%@page import="entity.Song"%>
<%@page import="entity.Album"%>
<%@page import="entity.Country"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Sửa bài hát" name="title" />
</jsp:include>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	Song song = null;
	if (request.getAttribute("songedit") != null)
		song = (Song)request.getAttribute("songedit");
	List<Country> listCountry = (List<Country>)request.getAttribute("listCountry");
	List<Album> listAlbum = (List<Album>) request.getAttribute("listAlbum");
	List<Singer> listSinger = (List<Singer>)request.getAttribute("listSinger");
	int currentpage = 1;
	if (request.getAttribute("page") != null) {
		currentpage = (Integer) request.getAttribute("page");
	}
	request.setAttribute("currentPage", currentpage);
%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Sửa bài hát</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Quản lý</a></li>
			<li><a href="#">Bài hát</a></li>
			<li><a href="#">Sửa bài hát</a></li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="message" id="message"></div>
			<!--             <section class="col-md-12"> -->
			<div class="box box-primary">
				<form role="form" method="post" enctype="multipart/form-data"
					action="<%=request.getContextPath()%>/admin/update/song">
					<div class="box-body">
						<input type="hidden" value="<%=song.getIdSong()%>" name="idSong">
						<div class="form-group">
							<label>Tên bài hát</label> <input type="text"
								class="form-control" name="name_song" maxlength="500"
								placeholder="Nhập tên bài hát" value="<%=song.getNameSong()%>"
								required>
						</div>
						<div class="form-group">
							<label>Thuộc Album</label><input type="text" id="txtAlbum"
								class="form-control" name="album" required>
							<script type="text/javascript">
								$(document)
										.ready(
												function() {
													$("#txtAlbum")
															.tokenInput(
																	[
							<%for (int i = 0; i < listAlbum.size(); i++) {

				out.print("{\"id\" : \"" + listAlbum.get(i).getIdAlbum() + "\", \"name\" : \""
						+ listAlbum.get(i).getNameAlbum() + "\"},");
			}%>
								],
																	{
																		theme : "facebook",
																		preventDuplicates : true,
																		hintText : "Nhập tên album",
																		searchingText : "Đang tìm kiếm...",
																		noResultsText : "Không tìm thấy",
																		tokenDelimiter : "|",
																		tokenLimit : 1,
																			<%if (song.getAlbum() != null){
																	out.print("	prePopulate : [");
				out.print("{\"id\" : \"" + song.getAlbum().getIdAlbum() + "\", \"name\" : \""
						+ song.getAlbum().getNameAlbum() + "\"},],");}
																				%>
																													});
																								});
							</script>
						</div>
						<div class="form-group">
							<label>Ca sĩ thể hiện </label> <input type="text" id="txtSingers"
								class="form-control" name="singers" required>
							<script type="text/javascript">
								$(document)
										.ready(
												function() {
													$("#txtSingers")
															.tokenInput(
																	[
							<%for (int i = 0; i < listSinger.size(); i++) {

				out.print("{\"id\" : \"" + listSinger.get(i).getIdSinger() + "\", \"name\" : \""
						+ listSinger.get(i).getNameSinger() + "\"},");
			}%>
								],
																	{
																		theme : "facebook",
																		preventDuplicates : true,
																		hintText : "Nhập tên nghệ sĩ",
																		searchingText : "Đang tìm kiếm...",
																		noResultsText : "Không tìm thấy",
																		tokenDelimiter : "|",
																		prePopulate : [
							<%if (song.getSingers() != null && !song.getSingers().isEmpty())
				for (Singer s : song.getSingers())
					out.print("{\"id\" : \"" + s.getIdSinger() + "\", \"name\" : \"" + s.getNameSinger() + "\"},");%>
								],
																	});
												})
							</script>
						</div>
						<div class="form-group">
							<label>Quốc gia </label> <select name="country"
								class="form-control">
								<%
									for (Country c : listCountry) {
										out.print("<option value=\"" + c.getSlugCountry() + "\"");
										if (song.getCountry() != null)
											if (song.getCountry().getSlugCountry().equalsIgnoreCase(c.getSlugCountry()))
												out.print("selected class=\"label-info\"");
										out.print(">" + c.getCountry() + "</option>");
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="introduce">Lời bài hát</label>
							<%
								String tmp = "";
								if (song.getLyric() != null) {
									tmp = song.getLyric().getLyric();
								}
							%>

							<textarea class="form-control ckeditor" maxlength="4000" rows="5"
								name="lyric"><%=tmp.trim()%>
								</textarea>
						</div>
						<div class="form-group">
							<label for="avarta">Nguồn bài hát: <%=request.getContextPath() + song.getLinkSong()%></label>
							<input type="file" name="linkSong" class="form-control"
								multiple="multiple" role="media" value="<%=song.getLinkSong()%>">
							<p class="help-block">File thuộc định dạng *.mp3, *.wav,...</p>
						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-info">
								<i class="fa fa-upload"></i> Lưu chỉnh sửa
							</button>
							<button type="reset" class="btn btn-default">
								<i class="fa fa-refresh"></i> Nhập lại
							</button>
							<a
								href="<%=request.getContextPath()%>/admin/danhsachbaihat/<%=currentpage%>"><button
									type="button" class="btn btn-default">
									<i class="fa fa-reply"></i> Hủy
								</button></a>
						</div>
					</div>
					<!-- /.box-body -->
				</form>
			</div>
		</div>
	</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>