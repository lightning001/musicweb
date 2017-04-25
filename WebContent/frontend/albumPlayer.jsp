<%@page import="entity.Singer" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entity.Song" %>
<%@page import="entity.Album" %>
<%@ page import="entity.Users" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    Album album = (Album) request.getAttribute("album");
%>
<jsp:include page="header2.jsp">
    <jsp:param value="<%=album.getNameAlbum()%>" name="title"/>
</jsp:include>


<div class="main container-fluid">
    <div class="row content">
        <div class="col-sm-41 ">
            <div class="row albuminfo">
                <img alt="" src="<%=request.getContextPath() + album.getLinkImg()%>"
                     class="col-sm-14 img-rounded">
                <div class="col-sm-46">
                    <h4><%=album.getNameAlbum()%>
                        - <span> <%
                            List<Singer> aas = album.getSingers();
                            for (int i = 0; i < aas.size(); i++) {
                                Singer aa = aas.get(i);
                        %> <a
                                href="<%=request.getContextPath() + "/nghe-si/" + aa.getSlugSinger()%>"
                                class="content-grid-singer"><%=aa.getNameSinger() + ((i < aas.size() - 1) ? "," : "")%></a>
							<%
                                }
                            %>
						</span>
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
                        List<Song> songs = (List<Song>) request.getAttribute("albumContent");
                        for (int i = 0; i < songs.size(); i++) {
                    %>
                    <tr id="song<%=songs.get(i).getIdSong()%>" class="song">
                        <td style="width: 25px; padding-right: 0px;"><%=i + 1%>
                        </td>
                        <td><a
                                onclick="javascript: playThis('<%=i%>');return false;"
                                href=""><%=songs.get(i).getNameSong()%>
                        </a></td>
                        <td>
                            <%
                                List<Singer> itSong = songs.get(i).getSingers();
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
                        <td style="text-align: right;"><%=songs.get(i).getViewcount()%>
                        </td>
                    </tr>

                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>


            <div class="likebar">
                <button type="button" id="bntLike" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-heart"> </span> Like</button>
                <span class="viewcount"><span class="glyphicon glyphicon-headphones"></span> <%=album.getViewcount()%></span>
                <div class="clearfix"></div>
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
                        <%for (int i = 0; i < songs.size(); i++) {%>
                        {
                            "file": "<%=request.getContextPath() + songs.get(i).getLinkSong()%>",
                            "title": "<%=songs.get(i).getNameSong()%>",

                            "artist": "<%List<Singer> sa = songs.get(i).getSingers();
				for (int j = 0; j < sa.size(); j++) {
					Singer as = sa.get(j);
					out.print(as.getNameSinger() + ((j < (sa.size() - 1)) ? ", " : " "));
				}%>",
                            "url": "<%=request.getContextPath() + songs.get(i).getSingers().get(0).getLinkImgSinger()%>",
                            "mediaid": "<%=songs.get(i).getIdSong()%>",
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

                function increaseView(type,id) {
                    $.get('<%=request.getContextPath()%>/ViewController', {id: id, view: type}, function (data, status) {

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
                jwplayer().on('complete', function (e) {
                        increaseView('SONG', jwplayer().getPlaylistItem().mediaid);
                });
                increaseView('ALBUM',<%=album.getIdAlbum()%>);

                var like = false;
                $("#bntLike").click(function(){
                    <%Users user = (Users)request.getSession().getAttribute("user");
                    if(user!=null){
                    %>
                    if(!like) {
                        likeALbum(<%=user.getIdUser()%>, <%=album.getIdAlbum()%>);
                    }else{
                        unlikeAlbum(<%=user.getIdUser()%>, <%=album.getIdAlbum()%>);
                    }
                    <%}else{%>
                    var r = confirm("Đăng nhập để thực hiện chức năng này!");
                    if (r == true) {
                        window.location.href = "/login";
                    } else {
                    }
                    <%}%>
                });


                function likeAlbum(userID,songID) {
                    $.get('<%=request.getContextPath()%>/like', {id: songID, type: 'LIKEALBUM', userID: userID}, function (data, status) {
                        if(data == 'OK'){
                            liked();
                            like = true;
                        }
                    });
                }
                function unlikeAlbum(userID,songID) {
                    $.get('<%=request.getContextPath()%>/like', {id: songID, type: 'UNLIKEALBUM', userID: userID}, function (data, status) {
                        if(data == 'OK'){
                            unlike();
                            like = false;
                        }
                    });
                }
                function unlike() {
                    $("#bntLike").removeClass("btn-default");
                    $("#bntLike").addClass("btn-primary");
                    $("#bntLike").html("<span class=\"glyphicon glyphicon-heart\"> </span> Like");
                }
                function liked() {
                    $("#bntLike").removeClass("btn-primary");
                    $("#bntLike").addClass("btn-default");
                    $("#bntLike").html("<span class=\"glyphicon glyphicon-heart\"> </span> Liked");
                }
                <%if(request.getAttribute("liked")!=null){%>
                liked();
                like = true;
                <%}%>

            </script>

            <div class="row singerInfo">
                <img alt="" src="<%=(album.getSingers()!=null)?(request.getContextPath() + album.getSingers().get(0).getLinkImgSinger()):""%>"
                     class="col-sm-12 img-rounded">
                <div class="col-sm-48">
                    <h4><a><%=(album.getSingers()!=null)?(album.getSingers().get(0).getNameSinger()):""%></a>
                    </h4>
                    <h5>
                        <%=(album.getSingers()!=null)?(album.getSingers().get(0).getInfoSinger()):""%>
                    </h5>
                </div>
            </div>
            <div class="tittle-head">
                <h3 class="tittle">
                    <a href="#">ALBUM <%=album.getSingers().get(0).getNameSinger()%>
                        <span class="new">></span></a>
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
                    for (Song song : songOfArtist) {
                        if(song.getSingers().size()>=1){
                %>
                <div class="rightpanel-grid">
                    <a class="rightpanel-thumb"
                       href="<%=request.getContextPath() + "/nhac/" + song.getSlugSong()%>"><img
                            src="<%=request.getContextPath() + song.getSingers().get(0).getLinkImgSinger()%>"></a> <a
                        class="rightpanel-title"
                        href="<%=request.getContextPath() + "/nhac/" + song.getSlugSong()%>"><%=song.getNameSong()%>
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
                    }}
                %>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>