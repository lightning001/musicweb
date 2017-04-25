<%@ page import="java.util.List" %>
<%@ page import="javax.swing.text.View" %>
<%@ page import="entity.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<jsp:include page="header2.jsp"></jsp:include>
<div class="main">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-20">
                <div class="panel panel-default panelrank">
                    <div class="panel-heading">
                        Bài hát Việt Nam <a href="<%=request.getContextPath() + "/playlist/bang-xep-hang/viet-nam"%>"><span
                            class="glyphicon glyphicon-play-circle"></span></a>
                    </div>
                    <div class="panel-body">
                        <% List<Viewsong> songVietNam = (List<Viewsong>) request.getAttribute("songVietNam");
                            for (int i = 0; i < songVietNam.size(); i++) {
                                Song svn = songVietNam.get(i).getSongByIdSong();
                        %>
                        <div class="rank-grid">
                            <p class="rank"><%=(i + 1<10)?"0"+(i+1):(i+1)%>
                            </p>
                            <div class="rank-content">
                                <a href="<%=request.getContextPath() + "/nhac/" + svn.getSlugSong()%>"
                                   class="rank-titile"><%=svn.getNameSong()%>
                                </a> <br>
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
                            <p class="view"><%=svn.getViewcount()%>
                            </p>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
            <div class="col-md-20">
                <div class="panel panel-default panelrank">
                    <div class="panel-heading">
                        Bài hát Âu Mỹ <a href="<%=request.getContextPath() + "/playlist/bang-xep-hang/au-my"%>"><span
                            class="glyphicon glyphicon-play-circle"></span></a>
                    </div>
                    <div class="panel-body">
                        <% List<Viewsong> songAuMy = (List<Viewsong>) request.getAttribute("songAuMy");
                            for (int i = 0; i < songAuMy.size(); i++) {
                                Song svn = songAuMy.get(i).getSongByIdSong();
                        %>
                        <div class="rank-grid">
                            <p class="rank"><%=(i + 1<10)?"0"+(i+1):(i+1)%>
                            </p>
                            <div class="rank-content">
                                <a href="<%=request.getContextPath() + "/nhac/" + svn.getSlugSong()%>"
                                   class="rank-titile"><%=svn.getNameSong()%>
                                </a> <br>
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
                            <p class="view"><%=svn.getViewcount()%>
                            </p>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
            <div class="col-md-20">
                <div class="panel panel-default panelrank">
                    <div class="panel-heading">
                        Bài hát Hàn Quốc <a href="<%=request.getContextPath() + "/playlist/bang-xep-hang/han-quoc"%>"><span
                            class="glyphicon glyphicon-play-circle"></span></a>
                    </div>
                    <div class="panel-body">
                        <% List<Viewsong> songKPop = (List<Viewsong>) request.getAttribute("songKPop");
                            for (int i = 0; i < songKPop.size(); i++) {
                                Song svn = songKPop.get(i).getSongByIdSong();
                        %>
                        <div class="rank-grid">
                            <p class="rank"><%=(i + 1<10)?"0"+(i+1):(i+1)%>
                            </p>
                            <div class="rank-content">
                                <a href="<%=request.getContextPath() + "/nhac/" + svn.getSlugSong()%>"
                                   class="rank-titile"><%=svn.getNameSong()%>
                                </a> <br>
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
                            <p class="view"><%=svn.getViewcount()%>
                            </p>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-20">
                <div class="panel panel-default panelrank">
                    <div class="panel-heading">Album Việt Nam</div>
                    <div class="panel-body">
                        <% List<Viewalbum> albumVietNam = (List<Viewalbum>) request.getAttribute("albumVietNam");
                            for (int i = 0; i < albumVietNam.size(); i++) {
                                Album svn = albumVietNam.get(i).getAlbumByIdAlbum();
                        %>
                        <div class="rank-grid">
                            <p class="rank"><%=(i + 1<10)?"0"+(i+1):(i+1)%>
                            </p>
                            <div class="rank-content">
                                <a href="<%=request.getContextPath() + "/album/" + svn.getSlugAlbum()%>"
                                   class="rank-titile"><%=svn.getNameAlbum()%>
                                </a> <br>
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
                            <p class="view"><%=svn.getViewcount()%>
                            </p>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>

            <div class="col-md-20">
                <div class="panel panel-default panelrank">
                    <div class="panel-heading">Album Âu Mỹ</div>
                    <div class="panel-body">
                        <% List<Viewalbum> albumAuMy = (List<Viewalbum>) request.getAttribute("albumAuMy");
                            for (int i = 0; i < albumAuMy.size(); i++) {
                                Album svn = albumAuMy.get(i).getAlbumByIdAlbum();
                        %>
                        <div class="rank-grid">
                            <p class="rank"><%=(i + 1<10)?"0"+(i+1):(i+1)%>
                            </p>
                            <div class="rank-content">
                                <a href="<%=request.getContextPath() + "/album/" + svn.getSlugAlbum()%>"
                                   class="rank-titile"><%=svn.getNameAlbum()%>
                                </a> <br>
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
                            <p class="view"><%=svn.getViewcount()%>
                            </p>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
            <div class="col-md-20">
                <div class="panel panel-default panelrank">
                    <div class="panel-heading">Album Hàn Quốc</div>
                    <div class="panel-body">
                        <% List<Viewalbum> albumKPop = (List<Viewalbum>) request.getAttribute("albumKPop");
                            for (int i = 0; i < albumKPop.size(); i++) {
                                Album svn = albumKPop.get(i).getAlbumByIdAlbum();
                        %>
                        <div class="rank-grid">
                            <p class="rank"><%=(i + 1<10)?"0"+(i+1):(i+1)%>
                            </p>
                            <div class="rank-content">
                                <a href="<%=request.getContextPath() + "/album/" + svn.getSlugAlbum()%>"
                                   class="rank-titile"><%=svn.getNameAlbum()%>
                                </a> <br>
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
                            <p class="view"><%=svn.getViewcount()%>
                            </p>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>