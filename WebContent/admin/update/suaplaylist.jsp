<%@page import="entity.Singer"%>
<%@page import="entity.Song"%>
<%@page import="entity.Playlist"%>
<%@page import="entity.Country"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Sửa Playlist" name="title" />
</jsp:include>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<jsp:include page="../sidebar.jsp"></jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Sửa Playlist</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Quản lý </a></li>
			<li><a href="#">Playlist</a></li>
			<li><a href="#">Sửa Playlist</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<%
			Playlist playlist =null;
			if (request.getAttribute("playlistedit") != null)
				playlist = (Playlist) request.getAttribute("playlistedit");
				if (playlist == null) {
					out.print("Không có dữ liệu để hiển thị");
				} else {
					List<Category> listCate = (List<Category>)request.getAttribute("listCategory");
					List<Country> listCountry = (List<Country>)request.getAttribute("listCountry");
					List<Song> listSong =  (List<Song>)request.getAttribute("listSong");
					List<Singer> listSinger =  (List<Singer>)request.getAttribute("listSinger");
					int currentPage = 1;
					if (request.getAttribute("page") != null)
						currentPage = (Integer) request.getAttribute("page");
					request.setAttribute("currentPage", currentPage);
			%>
			<div class="message" id="message"></div>
			<!-- 			<section class="col-md-12"> -->
			<div class="box box-primary">
				<form role="form" method="post" enctype="multipart/form-data"
					action="<%=request.getContextPath()%>/admin/update/playlist">
					<div class="box-body">
						<input type="hidden" name="idPlaylist"
							value="<%=playlist.getIdPlaylist()%>">
						<div class="form-group">
							<label for="name">Tên Playlist</label> <input type="text"
								class="form-control" name="namePlaylist"
								value="<%=playlist.getNamePlaylist()%>"
								placeholder="Nhập tên Playlist" required>
						</div>
						<div class="form-group ">
							<label>Thể loại</label> <select class="form-control"
								name="category">
								<%
									for (Category c : listCate) {
											if (c != null) {
								%>
								<option value="<%=c.getIdCategory()%>"
									<%if (playlist.getCategory() != null
								&& playlist.getCategory().getIdCategory() == c.getIdCategory())
							out.print("selected");%>><%=c.getCategory()%></option>
								<%
									}
										}
								%>
							</select>
						</div>
						<div class="form-group ">
							<label for="title">Quốc gia</label> <select class="form-control"
								name="country">
								<%
									for (Country c : listCountry) {
											if (c != null) {
								%>
								<option value="<%=c.getSlugCountry()%>"
									<%if (playlist.getCountry() != null
								&& playlist.getCountry().getSlugCountry().equals(c.getSlugCountry()))
							out.print("selected");%>><%=c.getCountry()%></option>
								<%
									}
										}
								%>
							</select>
						</div>
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
									<%if (playlist.getSingers() != null && !playlist.getSingers().isEmpty())
					for (Singer s : playlist.getSingers())
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
								placeholder="Nhập tên bài hát" class="form-control" name="songs">
								<script type="text/javascript">
									$(document)
											.ready(
													function() {
														$("#input-search-song")
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
								<%if (playlist.getSongs() != null && !playlist.getSongs().isEmpty())
					for (Song s : playlist.getSongs())
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
						<label for="description">Thông tin PlayList</label>
						<textarea rows="5" name="infoPlaylist" maxlength="4000"
							class="form-control">
								<%
									if (playlist.getInfoPlaylist() != null)
											out.print(playlist.getInfoPlaylist());
								%>
							</textarea>
						<p class="help-block">Mô tả chứa tối đa 4000 ký tự</p>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<label for="avarta">Hình ảnh</label>
						</div>
						<div class="col-xs-10">
							<%
								String link = "";
									if (playlist.getLinkImg() != null && !"".equals(playlist.getLinkImg()))
										link = playlist.getLinkImg();
									else
										link = "/img/playlist/no-images.png";
							%>
							<img src="<%=request.getContextPath() + link%>" id="img-upload"
								class="img-responsive img-thumbnail" />
						</div>
						<div class="col-xs-30">
							<input type="file" name="linkImg" class="form-control">
							<p class="help-block">File thuộc định dạng ảnh</p>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="form-group text-center">
						<button type="submit" name="btn_Album" class="btn btn-info">
							<i class="fa fa-upload"></i> Lưu chỉnh sửa
						</button>
						<button type="reset" class="btn btn-default">
							<i class="fa fa-refresh"></i> Nhập lại
						</button>
						<a
							href="<%=request.getContextPath()%>/admin/danhsachplaylist/<%=currentPage%>"><button
								type="button" class="btn btn-default">
								<i class="fa fa-reply"></i> Hủy
							</button></a>
					</div>
					<!-- /.box-body -->
				</form>
			</div>
			<%
				}
			%>
		</div>
	</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>