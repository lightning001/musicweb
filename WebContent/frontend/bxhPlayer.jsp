<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="entity.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    List<Viewsong> viewsongs = (List<Viewsong>) request.getAttribute("viewsongs");
%>
<jsp:include page="header2.jsp">
    <jsp:param value="<%=request.getAttribute(\"title\")%>" name="title"/>
</jsp:include>


<div class="main container-fluid">
    <div class="row content">
        <div class="col-sm-41 ">
            <div class="row albuminfo">
                <img alt="" src="<%=request.getContextPath()%>"
                     class="col-sm-14 img-rounded">
                <div class="col-sm-46">
                    <h4><%=request.getAttribute("title")%>
                    </h4>
                    <h5>
                        Thể loại : <span><a>Nhạc trẻ</a></span>
                    </h5>
                    <h5>Năm phát hành: 2016</h5>
                </div>
            </div>
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
            <div class="playlist table-responsive">
                <table class="table table-hover">
                    <tbody>
                    <%
                        for (int i = 0; i < viewsongs.size(); i++) {
                    %>
                    <tr id="song<%=viewsongs.get(i).getIdSong()%>" class="song">
                        <td style="width: 25px; padding-right: 0px;"><%=i + 1%>
                        </td>
                        <td><a
                                onclick="javascript: playThis('<%=i%>');return false;"
                                href=""><%=viewsongs.get(i).getSongByIdSong().getNameSong()%>
                        </a></td>
                        <td>
                            <%
                                List<Singer> itSong = viewsongs.get(i).getSongByIdSong().getSingers();
                                for (int j = 0; j < itSong.size(); j++) {
                                    Singer aa = itSong.get(j);
                            %> <a
                                href="<%=request.getContextPath() + "/nghe-si/" + aa.getSlugSinger()%>"
                                class="content-grid-singer"><%=aa.getNameSinger() + ((j < itSong.size() - 1) ? "," : "")%>
                        </a>
                            <%
                                }
                            %>
                        </td>
                        <td style="text-align: right;"><%=viewsongs.get(i).getSongByIdSong().getViewcount()%></td>
                    </tr>

                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

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
                        <%for (int i = 0; i < viewsongs.size(); i++) {%>
                        {
                            "file": "<%=request.getContextPath() + viewsongs.get(i).getSongByIdSong().getLinkSong()%>",
                            "title": "<%=viewsongs.get(i).getSongByIdSong().getNameSong()%>",

                            "artist": "<%List<Singer> sa = viewsongs.get(i).getSongByIdSong().getSingers();
				for (int j = 0; j < sa.size(); j++) {
					Singer as = sa.get(j);
					out.print(as.getNameSinger() + ((j < (sa.size() - 1)) ? ", " : " "));
				}%>",
                            "url": "<%=request.getContextPath() + viewsongs.get(i).getSongByIdSong().getSingers().get(0).getLinkImgSinger()%>",
                            "mediaid": "<%=viewsongs.get(i).getIdSong()%>",
                        }, <%}%>],
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
                    var x = document.getElementsByClassName('song');
                    var i;
                    for (i = 0; i < x.length; i++) {
                        x[i].style.color = "black";
                    }
                    document.getElementById('song' + jwplayer().getPlaylistItem().mediaid).style.color = '#348AC7';
                    loadLyric(jwplayer().getPlaylistItem().mediaid);
                });


            </script>

            <div class="tittle-head">
                <h3 class="tittle">
                    <a href="#">ALBUM<span class="new">></span></a>
                </h3>
                <div class="clearfix"></div>
            </div>

            <div class="row">


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
                    List<Song> randSong = new ArrayList<>();
                    randSong = (List<Song>) request.getAttribute("randSong");
                    for (Song song : randSong) {
                %>
                <div class="rightpanel-grid">
                    <a class="rightpanel-thumb"
                       href="<%=request.getContextPath() + "/nhac/" + song.getSlugSong()%>"><img
                            src="<%=request.getContextPath() + song.getSingers().get(0).getLinkImgSinger()%>"></a> <a
                        class="rightpanel-title" href="<%=request.getContextPath() + "/nhac/" + song.getSlugSong()%>"><%=song.getNameSong()%>
                </a><br>

                    <div class="rightpanel-singer nowrap">
                        <%
                            List<Singer> ss = song.getSingers();
                            for (int i = 0; i < ss.size(); i++) {
                                Singer sa = ss.get(i);
                        %>
                        <a
                                href="<%=request.getContextPath() + "/ca-si/" + sa.getSlugSinger()%>"
                                class="content-grid-singer"><%=sa.getNameSinger() + ((i < ss.size() - 1) ? "," : "")%>
                        </a>
                        <%
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