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
	<jsp:param value="Thêm Album" name="title" />
</jsp:include>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<jsp:include page="../sidebar.jsp"></jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Thêm Album</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Quản lý </a></li>
			<li><a href="#">Album</a></li>
			<li><a href="#">Thêm Album</a></li>
		</ol>
	</section>


	<%
		List<Song> listSong = (List<Song>) request.getAttribute("listSong");

		List<Singer> listSinger = (List<Singer>) request.getAttribute("listSinger");

		List<Country> listCountry = (List<Country>) request.getAttribute("listCountry");

		List<Category> listCategory = (List<Category>) request.getAttribute("listCategory");
		int currentpage = 1;
		if (request.getAttribute("page") != null) {
			currentpage = (Integer) request.getAttribute("page");
		}
		request.setAttribute("currentPage", currentpage);
	%>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="message" id="message"></div>
			<!-- 			<section class="col-md-12"> -->
			<div class="box box-primary">
				<div class="box-body">
					<form role="form" method="post" enctype="multipart/form-data"
						action="<%=request.getContextPath()%>/admin/add/album">
						<div class="form-group">
							<label for="name">Tên Album</label> <input type="text"
								class="form-control" name="nameAlbum"
								placeholder="Nhập tên Album" required>
						</div>
						<div class="form-group">
							<label for="name">Thể loại</label> <select name="category"
								class="form-control">
								<%
									for (int i = 0; i < listCategory.size(); i++) {
										out.println("<option value=\"" + listCategory.get(i).getIdCategory() + "\"" + ">"
												+ listCategory.get(i).getIdCategory() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
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
										out.println("<option value=\"" + listCountry.get(i).getCountry() + "\"" + ">" + (i + 1)
												+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + listCountry.get(i).getCountry() + "</option>");
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<span> <label for="name">Nghệ sĩ đóng góp</label> <span
								class="input-group"> <input type="text"
									id="input-search-singer"
									style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
									placeholder="Nhập tên nghệ sĩ" class="form-control"
									name="singers"> <script type="text/javascript">
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
																			});
														})
									</script>
							</span>
							</span> <span> <label for="name">Bài hát</label> <span
								class="input-group"> <input type="text"
									id="input-search-song"
									style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
									placeholder="Nhập tên bài hát" class="form-control col-xs-30"
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

																			});
														})
									</script>
							</span>
							</span>
						</div>
						<div class="clearfix"></div>

						<div class="form-group">
							<label>Thông tin</label>
							<textarea class="form-control" name="infoAlbum" rows="5"
								placeholder="Nhập thông tin Album" maxlength="4000"></textarea>

						</div>
						<input type="hidden" name="linkImg" id="linkImgFormFill">
						<div class="form-group">
							<label for="avarta">Ảnh bìa Album</label>
							<div id="filePath"></div>
							<div class="col-xs-9">
								<img src="<%=request.getContextPath()%>/img/album/no-images.png"
									id="img-upload" class="img-responsive img-thumbnail" />
							</div>
							<div class="col-xs-20">
								<input type="file" name="linkImg" class="form-control"
									id="file-choose">
								<p class="help-block">File thuộc định dạng hình ảnh</p>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-upload"></i> Thêm Album
							</button>
							<button type="reset" class="btn btn-default">
								<i class="fa fa-refresh"></i> Nhập lại
							</button>
							<a
								href="<%=request.getContextPath()%>/admin/danhsachalbum/<%=currentpage%>"><button
									type="button" class="btn btn-default">
									<i class="fa fa-reply"></i> Hủy
								</button></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>
<script type="text/javascript">
	$("#file-choose").change(function() {
		document.getElementById('filePath').innerHTML = $(this).val();
	});
</script>
<jsp:include page="../footer.jsp"></jsp:include>