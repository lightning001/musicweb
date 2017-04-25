<%@ page import="java.util.List" %>
<%@ page import="entity.Song" %>
<%@ page import="entity.Album" %>
<%@ page import="entity.Singer" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>


<jsp:include page="header2.jsp">
    <jsp:param value="Artist" name="title"/>
</jsp:include>

<% Singer singer = (Singer) request.getAttribute("singer");%>

<div class="main">
    <div class="container-fluid">
        <div class="artistcover">
            <div class="cover" id="cover"
                 style="background: url('<%=request.getContextPath() + singer.getLinkImgSinger()%>') no-repeat; background-size: cover;background-position: center"></div>
            <div class="over"></div>
            <img src="<%=request.getContextPath() + singer.getLinkImgSinger()%>" class="artist-img img-circle"
                 alt="Cinque Terre" width="150" height="150">
            <div class="artist-info"><h3><%=singer.getNameSinger()%>
            </h3>
                <p><%=(singer.getInfoSinger() != null) ? singer.getInfoSinger() : "" %>
                </p>
            </div>
        </div>
        <ol class="breadcrumb">
            <li><a href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger() + "/bai-hat"%>">Bài hát</a>
            </li>
            <li class="active"><a href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger() + "/album"%>">Album</a>
            </li>
        </ol>
        <div class="row">
            <div class="col-sm-41">
                <%
                    List<Song> songs = (List<Song>) request.getAttribute("songs");
                    List<Album> albums = (List<Album>) request.getAttribute("albums");
                    if (songs != null) {
                %>
                <div>
                    <div class="rightpanel">
                        <div class="tittle-head">
                            <h3 class="tittle">
                                <a href="#">BÀI HÁT <%=singer.getNameSinger()%><span class="new"></span></a>
                            </h3>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <table class="table table-striped artist-table">
                        <tbody>
                        <% for (Song song : songs) { %>
                        <tr>
                            <td>
                                <a href="<%=request.getContextPath() + "/nhac/" + song.getSlugSong()%>"><%=song.getNameSong()%>
                                </a></td>
                            <td>
                                <div class="nowrap">
                                    <%
                                        List<Singer> aas = song.getSingers();
                                        for (int i = 0; i < aas.size(); i++) {
                                            Singer aa = aas.get(i);
                                    %>
                                    <a
                                            href="<%=request.getContextPath() + "/ca-si/" + aa.getSlugSinger()%>"
                                            class="content-grid-singer"><%=aa.getNameSinger() + ((i < aas.size() - 1) ? "," : "")%>
                                    </a>
                                    <%
                                        }
                                    %>
                                </div>
                            </td>
                            <td><%=song.getViewcount()%>
                            </td>
                        </tr>
                        <%} %>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation" style="float: right;">
                        <ul class="pagination">
                            <%
                                int pageCount = (int) request.getAttribute("pageCount");
                                int p = 1;
                                try {
                                    p = Integer.parseInt(request.getParameter("p"));
                                } catch (Exception e) {

                                }
                            %>
                            <li><a
                                    href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger() + "/bai-hat?p=" + (p - 1)%>"
                                    aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                            <%
                                for (int i = 1; i <= pageCount; i++) {
                            %>
                            <li <%=(i == p) ? "class=\"active\"" : ""%>><a
                                    href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger() + "/bai-hat?p=" + (i)%>"><%=i%>
                            </a></li>
                            <%
                                }
                            %>

                            <li><a
                                    href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger() + "/bai-hat?p=" + (p + 1)%>"
                                    aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </ul>
                    </nav>
                    <div class="clearfix"></div>
                </div>
                <%
                    }
                    if (albums != null) {
                %>
                <div class="rightpanel">
                    <div class="tittle-head">
                        <h3 class="tittle">
                            <a href="#">ALBUM <%=singer.getNameSinger()%><span class="new"></span></a>
                        </h3>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="row">
                    <%
                        for (Album alb : albums) {
                    %>
                    <div class="col-md-12 col-sm-15 col-xs-30 content-grid">
                        <a class="content-grid-img"
                           href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"><img
                                src="<%=request.getContextPath() + alb.getLinkImg()%>"></img></a> <a
                            href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"
                            class="content-grid-title nowrap"><%=alb.getNameAlbum()%>
                    </a>
                        <div class="nowrap">
                            <%
                                List<Singer> aas = alb.getSingers();
                                for (int i = 0; i < aas.size(); i++) {
                                    Singer aa = aas.get(i);
                            %>
                            <a
                                    href="<%=request.getContextPath() + "/nghe-si/" + aa.getSlugSinger()%>"
                                    class="content-grid-singer"><%=aa.getNameSinger() + ((i < aas.size() - 1) ? "," : "")%>
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
                <nav aria-label="Page navigation" style="float: right;">
                    <ul class="pagination">
                        <%
                            int pageCount = (int) request.getAttribute("pageCount");
                            int p = 1;
                            try {
                                p = Integer.parseInt(request.getParameter("p"));
                            } catch (Exception e) {

                            }
                        %>
                        <li><a
                                href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger() + "/album?p=" + (p - 1)%>"
                                aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                        <%
                            for (int i = 1; i <= pageCount; i++) {
                        %>
                        <li <%=(i == p) ? "class=\"active\"" : ""%>><a
                                href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger() + "/album?p=" + (i)%>"><%=i%>
                        </a></li>
                        <%
                            }
                        %>

                        <li><a
                                href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger() + "/album?p=" + (p + 1)%>"
                                aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </ul>
                </nav>
                <div class="clearfix"></div>
                <%}%>
            </div>
            <div class="col-sm-19">
                <div class="rightpanel">
                    <div class="tittle-head">
                        <h3 class="tittle">
                            <a href="#">CA SĨ TƯƠNG TỰ<span class="new"></span></a>
                        </h3>
                        <div class="clearfix"></div>
                    </div>
                    <%
                        List<Singer> randSinger = (List<Singer>) request.getAttribute("randSinger");
                        for (Singer s : randSinger) {%>
                    <div class="rightpanel-grid">
                        <a class="rightpanel-thumb"
                           href="<%=request.getContextPath() + "/ca-si/" + s.getSlugSinger()%>"><img
                                src="<%=request.getContextPath() + s.getLinkImgSinger()%>"></a> <a
                            class="rightpanel-title"
                            href="<%=request.getContextPath() + "/ca-si/" + s.getSlugSinger()%>"><%=s.getNameSinger()%>
                    </a><br>
                    </div>

                    <% }
                    %>
                    <div class="clearfix"></div>
                </div>

            </div>

        </div>

    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>