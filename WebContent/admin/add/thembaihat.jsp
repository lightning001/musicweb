<%@page import="entity.Singer"%>
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
	<jsp:param value="Thêm bài hát" name="title" />
</jsp:include>
<jsp:include page="../sidebar.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<%
	List<Singer> listSinger = (List<Singer>) request.getAttribute("listSinger");
	List<Country> listCountry = (List<Country>) request.getAttribute("listCountry");
	List<Album> listAlbum = (List<Album>) request.getAttribute("listAlbum");
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
		<h1>Thêm bài hát</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Quản lý</a></li>
			<li><a href="#">Bài hát</a></li>
			<li><a href="thembaihat.html">Thêm bài hát</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="message" id="message"></div>
			<!--             <section class="col-md-12"> -->
			<div class="box box-primary">
				<form role="form" method="post" enctype="multipart/form-data"
					action="<%=request.getContextPath()%>/admin/add/song">
					<div class="box-body">
						<div class="form-group">
							<label>Tên bài hát</label> <input type="text"
								class="form-control" name="name_song" maxlength="500"
								placeholder="Nhập tên bài hát" required>
						</div>
						<div class="form-group">
							<label>Thuộc Album</label><input type="text" id="txtAlbum"
								class="form-control" name="album">
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
																	});
												})
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
																	});
												})
							</script>
						</div>
						<div class="form-group">
							<label>Quốc gia </label> <select name="country"
								class="form-control">
								<%
									for (Country c : listCountry) {
										out.print("<option value=\"" + c.getSlugCountry() + "\">" + c.getCountry() + "</option>");
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<label>Lời bài hát</label>
							<textarea class="form-control ckeditor" maxlength="4000"
								name="lyric" rows="5"></textarea>
						</div>
						<div class="form-group">
							<label>Nguồn bài hát</label> <input type="file" name="linkSong"
								class="form-control" role="media" required>
							<p class="help-block">File thuộc định dạng *.mp3, *.wav</p>
						</div>

						<div class="form-group text-center">
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-upload"></i> Thêm bài hát
							</button>
							<button type="reset" class="btn btn-warning">
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