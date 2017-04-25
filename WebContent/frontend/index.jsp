<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="entity.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="header2.jsp">
	<jsp:param value="Music Life" name="title" />
</jsp:include>


<div class="main">
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-42 ">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="<%=request.getContextPath()%>/img/1.jpg" alt="Chania"
								style="width: 100%">
						</div>

						<div class="item">
							<img src="<%=request.getContextPath()%>/img/2.jpg" alt="Chania"
								style="width: 100%">
						</div>

						<div class="item">
							<img src="<%=request.getContextPath()%>/img/3.jpg" alt="Flower"
								style="width: 100%">
						</div>

						<div class="item">
							<img src="<%=request.getContextPath()%>/img/4.jpg" alt="Flower"
								style="width: 100%">
						</div>
						<div class="item">
							<img src="<%=request.getContextPath()%>/img/5.jpg" alt="Flower"
								style="width: 100%">
						</div>
					</div>

					<!-- Left and right controls -->

				</div>
				<div class="tittle-head">
					<h3 class="tittle">
						<a href="/album"> ALBUM <span class="new">></span></a>
					</h3>
					<div class="clearfix"></div>
				</div>

				<div class="row">
					<%
						List<Album> list = new ArrayList<>();
						list = (ArrayList<Album>) request.getAttribute("newAlbum");
						for (Album alb : list) {
					%>
					<div class="col-sm-15 col-xs-30 content-grid">
						<a class="content-grid-img"
							href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"><img
							src="<%=request.getContextPath() + alb.getLinkImg()%>"></img></a> <a
							href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"
							class="content-grid-title nowrap"><%=alb.getNameAlbum()%></a>
						<div class="nowrap">

							<%
								List<Singer> aas = alb.getSingers();
									for (int i = 0; i < aas.size(); i++) {
										Singer aa = aas.get(i);
							%>
							<a
								href="<%=request.getContextPath() + "/nghe-si/" + aa.getSlugSinger()%>"
								class="content-grid-singer nowrap"><%=aa.getNameSinger().trim() + ((i < aas.size() - 1) ? ',' : "")%>
							</a>
							<%
								}
							%>
						</div>

					</div>

					<%
						}
					%>

				</div>

				<div class="tittle-head">
					<h3 class="tittle">
						<a href="#"> PLAYLIST <span class="new">></span></a>
					</h3>
					<div class="clearfix"></div>
				</div>

				<div class="row">
					<%
						List<Playlist> playlist = new ArrayList<>();
						playlist = (ArrayList<Playlist>) request.getAttribute("newPlaylist");
						for (Playlist pl : playlist) {
					%>
					<div class="col-sm-15 col-xs-30 content-grid">
						<a class="content-grid-img"
							href="<%=request.getContextPath() + "/playlist/" + pl.getSlugPlaylist()%>"><img
							src="<%=request.getContextPath() + pl.getLinkImg()%>"></img></a> <a
							href="<%=request.getContextPath() + "/playlist/" + pl.getSlugPlaylist()%>"
							class="content-grid-title nowrap"><%=pl.getNamePlaylist()%></a>
						<div>
							<%
								List<Singer> aas = pl.getSingers();
									for (int i = 0; i < aas.size(); i++) {
										Singer aa = aas.get(i);
							%>
							<a
								href="<%=request.getContextPath() + "/nghe-si/" + aa.getSlugSinger()%>"
								class="content-grid-singer"><%=aa.getNameSinger()+ ((i < aas.size() - 1) ? ',' : "")%></a>
							<%
									}
							%>
						</div>

					</div>

					<%
						}
					%>
				</div>

				<div class="tittle-head">
					<h3 class="tittle">
						<a href="#"> CA SĨ NỔI BẬT <span class="new">></span></a>
					</h3>
					<div class="clearfix"></div>
				</div>

				<div class="row" style="padding-left: 5px; padding-right: 5px;">
					<%
						List<Singer> singer = new ArrayList<>();
						singer = (ArrayList<Singer>) request.getAttribute("singer");
						boolean firstThumb = true;
						for (Singer sg : singer) {
							if (firstThumb) {
								firstThumb = false;
					%>
					<div class="col-sm-20 col-xs-30"
						style="padding-left: 5px; padding-right: 5px">
						<div class="artist-index-grid">
							<a href="<%=request.getContextPath() +"/ca-si/"+ sg.getSlugSinger()%>" class="thumb"><img
								src="<%=request.getContextPath() + sg.getLinkImgSinger()%>"></img></a>
							<a href="<%=request.getContextPath() +"/ca-si/"+ sg.getSlugSinger()%>" class="singerName"><%=sg.getNameSinger()%></a>
						</div>
					</div>

					<%
						} else {
					%>
					<div class="col-sm-10 col-xs-30"
						style="padding-left: 5px; padding-right: 5px">
						<div class="artist-index-grid">
							<a href="<%=request.getContextPath() +"/ca-si/"+ sg.getSlugSinger()%>" class="thumb"><img
								src="<%=request.getContextPath() + sg.getLinkImgSinger()%>"></img></a>
							<a href="<%=request.getContextPath() +"/ca-si/"+ sg.getSlugSinger()%>" class="singerName"><%=sg.getNameSinger()%></a>
						</div>
					</div>
					<%
						}
						}
					%>
				</div>
			</div>


			<div class="col-sm-18">

				<div class="rightpanel">
					<div class="tittle-head">
						<h3 class="tittle">
							<a href="#">HOT LIST <span class="new"></span></a>
						</h3>
						<div class="clearfix"></div>
					</div>
					<%
						for (Playlist pl : playlist) {
					%>
					<div class="rightpanel-grid">
						<a class="rightpanel-thumb"><img
							src="<%=request.getContextPath() + pl.getLinkImg()%>"></a> <a
							class="rightpanel-title"><%=pl.getNamePlaylist()%></a><br> <a
							class="rightpanel-singer">Karik</a>
					</div>
					<%
						}
					%>

					<div class="clearfix"></div>
				</div>
				<ul class="nav nav-pills nav-justified">
					<li class="active"><a data-toggle="pill" href="#home">VN</a></li>
					<li><a data-toggle="pill" href="#menu1">US/UK</a></li>
					<li><a data-toggle="pill" href="#menu2">KPOP</a></li>
				</ul>

				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<% List<Viewsong> songVietNam = (List<Viewsong>) request.getAttribute("songVietNam");
							for (int i = 0; i < songVietNam.size(); i++) {
								Song svn = songVietNam.get(i).getSongByIdSong();
						%>
						<div class="rank-grid">
							<p class="rank"><%= (i + 1<10)?"0"+(i+1):(i+1)%></p>
							<div class="rank-content">
								<a href="<%=request.getContextPath() + "/nhac/" + svn.getSlugSong()%>" class="rank-titile"><%=svn.getNameSong()%></a> <br>
							<div class="nowrap">
								<%
									List<Singer> aas = svn.getSingers();
									for (int j = 0; j < aas.size(); j++) {
										Singer aa = aas.get(j);
								%>
								<a
										href="<%=request.getContextPath() + "/ca-si/" + aa.getSlugSinger()%>"
										class="content-grid-singer"><%=aa.getNameSinger() + ((j < aas.size() - 1) ? "," : "")%>
								</a>
								<%
									}
								%>
							</div>
							</div>
							<p class="view"><%=svn.getViewcount()%></p>
						</div>
						<% } %>
					</div>
					<div id="menu1" class="tab-pane fade">
						<% List<Viewsong> songAuMy = (List<Viewsong>) request.getAttribute("songAuMy");
							for (int i = 0; i < songAuMy.size(); i++) {
								Song svn = songAuMy.get(i).getSongByIdSong();
						%>
						<div class="rank-grid">
							<p class="rank"><%= (i + 1<10)?"0"+(i+1):(i+1)%></p>
							<div class="rank-content">
								<a href="<%=request.getContextPath() + "/nhac/" + svn.getSlugSong()%>" class="rank-titile"><%=svn.getNameSong()%></a> <br>
								<div class="nowrap">
									<%
										List<Singer> aas = svn.getSingers();
										for (int j = 0; j < aas.size(); j++) {
											Singer aa = aas.get(j);
									%>
									<a
											href="<%=request.getContextPath() + "/ca-si/" + aa.getSlugSinger()%>"
											class="content-grid-singer"><%=aa.getNameSinger() + ((j < aas.size() - 1) ? "," : "")%>
									</a>
									<%
										}
									%>
								</div>
							</div>
							<p class="view"><%=svn.getViewcount()%></p>
						</div>
						<% } %>
					</div>
					<div id="menu2" class="tab-pane fade">
						<% List<Viewsong> songKPop = (List<Viewsong>) request.getAttribute("songKPop");
							for (int i = 0; i < songKPop.size(); i++) {
								Song svn = songKPop.get(i).getSongByIdSong();
						%>
						<div class="rank-grid">
							<p class="rank"><%= (i + 1<10)?"0"+(i+1):(i+1)%></p>
							<div class="rank-content">
								<a href="<%=request.getContextPath() + "/nhac/" + svn.getSlugSong()%>" class="rank-titile"><%=svn.getNameSong()%></a> <br>
								<div class="nowrap">
									<%
										List<Singer> aas = svn.getSingers();
										for (int j = 0; j < aas.size(); j++) {
											Singer aa = aas.get(j);
									%>
									<a
											href="<%=request.getContextPath() + "/ca-si/" + aa.getSlugSinger()%>"
											class="content-grid-singer"><%=aa.getNameSinger() + ((j < aas.size() - 1) ? "," : "")%>
									</a>
									<%
										}
									%>
								</div>
							</div>
							<p class="view"><%=svn.getViewcount()%></p>
						</div>
						<% } %>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>
<%
	String name = request.getContextPath() + "/frontend/footer.jsp";
%>
<jsp:include page="footer.jsp"></jsp:include>


