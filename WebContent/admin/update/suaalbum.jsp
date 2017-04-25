<%@page import="entity.Singer"%>
<%@page import="entity.Category"%>
<%@page import="entity.Country"%>
<%@page import="entity.Song"%>
<%@page import="entity.Album"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Sửa Album" name="title" />
</jsp:include>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<jsp:include page="../sidebar.jsp"></jsp:include>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Sửa Album</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Quản lý </a></li>
			<li><a href="#">Album</a></li>
			<li><a href="#">Sửa Album</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<%
			Album album = null;
			if (request.getAttribute("albumedit") != null)
				album = (Album) request.getAttribute("albumedit");
			if (album == null) {
		%>
		<div>Không có Album</div>
		<a href="<%=request.getContextPath()%>/admin/danhsachalbum/1">
			<button type="submit" class="btn btn-primary">
				<span class="glyphicon glyphicon-ok"></span> OK
			</button>
		</a>
		<%
			} else {
				List<Song> listSong = (List<Song>) request.getAttribute("listSong");

				List<Singer> listSinger = (List<Singer>) request.getAttribute("listSinger");

				List<Country> listCountry = (List<Country>) request.getAttribute("listCountry");

				List<Category> listCategory = (List<Category>) request.getAttribute("listCategory");

				int currentPage = 1;
				if (request.getAttribute("page") != null)
					currentPage = (Integer) request.getAttribute("page");
				request.setAttribute("currentPage", currentPage);
		%>


		<div class="row">
			<div class="message" id="message"></div>
			<!-- 			<section class="col-md-12"> -->
			<div class="box box-primary">
				<form role="form" method="post" enctype="multipart/form-data"
					action="<%=request.getContextPath()%>/admin/update/album">
					<div class="box-body">
						<div class="form-group">
							<input type="hidden" class="form-control disabled"
								value="<%=album.getIdAlbum()%>" name="idAlbum">
						</div>
						<div class="form-group">
							<label for="name">Tên Album</label> <input type="text"
								class="form-control" name="nameAlbum"
								value="<%=album.getNameAlbum()%>" required>
						</div>

						<div class="form-group">
							<label for="name">Thể loại</label> <select name="category"
								class="form-control">
								<%
									for (int i = 0; i < listCategory.size(); i++) {
											out.println("<option value=\"" + listCategory.get(i).getIdCategory() + "\"");
											if (album.getCategory() != null) {
												if (album.getCategory().getIdCategory() == (listCategory.get(i).getIdCategory())) {
													out.print(" selected");
												}
											}
											out.print("> " + listCategory.get(i).getIdCategory() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
													+ listCategory.get(i).getCategory() + "</option>");
										}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="name">Quốc gia</label> <select name="country"
								class="form-control">
								<%
									for (int i = 0; i < listCountry.size(); i++) {
											out.println("<option value=\"" + listCountry.get(i).getCountry() + "\"");
											if (album.getCountry() != null) {
												if (album.getCountry().getCountry().equals(listCountry.get(i).getCountry())) {
													out.print(" selected");
												}
											}
											out.print("> " + (i + 1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + listCountry.get(i).getCountry()
													+ "</option>");
										}
								%>
							</select>
						</div>

						<div class="form-group">
							<span> <label for="name">Nghệ sĩ đóng góp</label> <span
								class="input-group"> <input type="text"
									id="input-search-singer"
									style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
									class="form-control" name="singers"> <script
										type="text/javascript">
										$(document)
												.ready(
														function() {
															$(
																	"#input-search-singer")
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
										<%if (album.getSingers() != null && !album.getSingers().isEmpty())
					for (Singer s : album.getSingers())
						out.print("{\"id\" : \"" + s.getIdSinger() + "\", \"name\" : \"" + s.getNameSinger() + "\"},");%>
											],
																				});
															})
										</script>
							</span>
							</span> <span> <label for="name">Bài hát</label> <span
								class="input-group"> <input type="text"
									id="input-search-song"
									style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
									placeholder="Nhập tên bài hát" class="form-control"
									name="songs"> <script type="text/javascript">
										$(document)
												.ready(
														function() {
															$(
																	"#input-search-song")
																	.tokenInput(
																			[
									<%for (int i = 0; i < listSong.size(); i++) {

					out.print("{\"id\" : \"" + listSong.get(i).getIdSong() + "\", \"name\" : \""
							+ listSong.get(i).getNameSong() + "\"},");
				}%>
										],
																			{
																				theme : "facebook",
																				preventDuplicates : true,
																				hintText : "Nhập tên bài hát",
																				searchingText : "Đang tìm kiếm...",
																				noResultsText : "Không tìm thấy",
																				tokenDelimiter : "|",
																				prePopulate : [
									<%if (album.getSongs() != null && !album.getSongs().isEmpty())
					for (Song s : album.getSongs())
						out.print("{\"id\" : \"" + s.getIdSong() + "\", \"name\" : \"" + s.getNameSong() + "\"},");%>
										],
																			});
														})
									</script>
							</span>
							</span>
						</div>
						<div class="clearfix"></div>

						<div class="form-group">
							<label>Thông tin</label>
							<%
								String info = "";
									if (album.getInfoAlbum() != null)
										info = album.getInfoAlbum();
							%>
							<textarea class="form-control" name="infoAlbum" maxlength="4000"><%=info%></textarea>

						</div>
						<div class="form-group">
							<div class="col-xs-9">
								<label for="avarta">Ảnh bìa Album</label>
							</div>
							<div class="col-xs-9">
								<img
									src="<%=request.getContextPath() + "/" + album.getLinkImg()%>"
									id="img-upload" class="img-responsive img-thumbnail" />
							</div>
							<div class="col-xs-20">
								<input type="file" name="linkImg" class="form-control"
									value="<%=request.getContextPath() + "/" + album.getLinkImg()%>">
								<p class="help-block">File thuộc định dạng ảnh</p>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-info">
								<span class="glyphicon glyphicon-saved"></span> Lưu chỉnh sửa
							</button>
							<button type="reset" class="btn btn-default">
								<i class="fa fa-refresh"></i> Nhập lại
							</button>
							<a
								href="<%=request.getContextPath()%>/admin/danhsachalbum/<%=currentPage%>"><button
									type="button" class="btn btn-default ">
									<i class="fa fa-reply"></i> Hủy
								</button></a>
						</div>
					</div>
				</form>
			</div>
			<%
				}
			%>
		</div>
	</section>

</div>
<jsp:include page="../footer.jsp"></jsp:include>