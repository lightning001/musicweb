<%@page import="entity.Singer" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entity.Song" %>
<%@page import="entity.Album" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    Song song = (Song) request.getAttribute("song");
%>
<jsp:include page="header2.jsp">
    <jsp:param value="<%=song.getNameSong()%>" name="title"/>
</jsp:include>


<div class="main container-fluid">
    <div class="row content">
        <div class="col-sm-41 ">

            <div class="player">
                <div class="cover" id="cover"></div>
                <div class="over"></div>
                <a class="title" id="title" style="float: left;"></a> <a
                    class="singer" id="artist"></a>
                <div id="song-list-player"></div>
            </div>
            <script src="<%=request.getContextPath()%>/jwplayer/jwplayer.js"></script>
            <script>
                jwplayer.key = "Klpz/KRIhqC4kYkRZPtxgfksIzK10xKH+QwG/w==";
            </script>


            <div class="lyric" id="lyric">
                <h6 id="demo">
                    <b>Lời bài hát: Từng là tất cả</b>
                </h6>
                <div class="lyric-content" id="lyriccontent"></div>
                <a href="#" class="morelink">Xem thêm</a>
            </div>
            <script type="text/javascript" src="../js/script.js"></script>
            <script type="text/javascript">
                jwplayer('song-list-player').setup({
                    width: "100 %",
                    height: 40,
                    "playlist": [
                        {
                            "file": "<%=request.getContextPath() + song.getLinkSong()%>",
                            "title": "<%=song.getNameSong()%>",
                            "artist": "<%List<Singer> itSong = song.getSingers();
                                                    for (int j = 0; j < itSong.size();j++) {
                                            Singer as = itSong.get(j);%> <%=as.getNameSinger()%> <%if (j < itSong.size() - 1) {
                                                                            out.print("<span>,</span>");
                                                            }
                                                        }%>",
                            "url": "<%=request.getContextPath() + song.getSingers().get(0).getLinkImgSinger()%>",
                            "mediaid": "<%=song.getIdSong()%>",
                        }],
                    "autostart": false,
                    "repeat": true

                });

                function playThis(index) {
                    jwplayer().playlistItem(index);
                }
                ;
                function loadLyric(id) {
                    $.get('<%=request.getContextPath()%>/lyric', {idSong: id}, function (data, status) {
                        document.getElementById('lyriccontent').innerHTML = data;
                    });
                }

                jwplayer().on('meta', function (e) {
                    document.getElementById('demo').innerHTML = '<h5> Lời bài hát: <b>' + jwplayer().getPlaylistItem().title + '</b></h5>';
                    document.getElementById('title').innerHTML = jwplayer().getPlaylistItem().title;
                    document.getElementById('artist').innerHTML = jwplayer().getPlaylistItem().artist;
                    document.getElementById('cover').style.background = 'url(' + jwplayer().getPlaylistItem().url + ') no-repeat';
                    document.getElementById('cover').style.backgroundSize = 'cover';
                    document.getElementById('cover').style.backgroundPosition = 'center';
                    loadLyric(jwplayer().getPlaylistItem().mediaid);
                });

            </script>

            <div class="tittle-head">
                <h3 class="tittle">
                    <a href="#">ALBUM <%=song.getSingers().get(0).getNameSinger()%> <span
                            class="new">></span></a>
                </h3>
                <div class="clearfix"></div>
            </div>

            <div class="row">
                <%
                    List<Album> albumByArtist = new ArrayList<>();
                    albumByArtist = (ArrayList<Album>) request.getAttribute("albumByArtist");
                    for (Album alb : albumByArtist) {
                %>
                <div class="col-sm-15 col-xs-30 content-grid">
                    <a
                            href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"><img
                            src="<%=request.getContextPath() + alb.getLinkImg()%>"></img></a> <a
                        class="button"><%=alb.getNameAlbum()%>
                </a>
                </div>

                <%
                    }
                %>

            </div>
        </div>


        <div class="col-sm-19">

            <div class="rightpanel">
                <div class="tittle-head">
                    <h3 class="tittle">
                        <a href="#">CÓ THỂ BẠN MUỐN NGHE<span class="new"></span></a>
                    </h3>
                    <div class="clearfix"></div>
                </div>
                <%
                    List<Song> songOfArtist = new ArrayList<>();
                    songOfArtist = (List<Song>) request.getAttribute("songOfArtist");
                    for (Song s : songOfArtist) {
                %>
                <div class="rightpanel-grid">
                    <a class="rightpanel-thumb"
                       href="<%=request.getContextPath() + "/nhac/" + s.getSlugSong()%>"><img
                            src="<%=request.getContextPath() + s.getSingers().get(0).getLinkImgSinger()%>"></a>
                    <a class="rightpanel-title"><%=s.getNameSong()%>
                    </a><br>

                    <div class="rightpanel-singer nowrap">
                        <%
                            List<Singer> ss = song.getSingers();
                            for (int i = 0; i < ss.size(); i++) {
                                Singer sa = ss.get(i);
                        %>
                        <a
                                href="<%=request.getContextPath() + "/nghe-si/" + sa.getSlugSinger()%>"
                                class="content-grid-singer"><%=sa.getNameSinger()%>
                        </a>
                        <%
                                if (i < ss.size() - 1) {
                                    out.print("<span>,</span>");
                                }
                            }
                        %>
                    </div>
                </div>
                <%
                    }
                %>


                <div class="clearfix"></div>
            </div>


        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>