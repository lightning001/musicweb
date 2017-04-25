<%--
  Created by IntelliJ IDEA.
  User: congp
  Date: 02-Dec-16
  Time: 12:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="entity.Singer" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entity.Song" %>
<%@page import="entity.Album" %>
<%@ page import="entity.Users" %>
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
            <%--<div class="playlist table-responsive">
                <table class="table table-hover">
                    <tbody>
                    <%
                        List<Song> songs = (List<Song>) request.getAttribute("albumContent");
                        for (int i = 0; i < songs.size(); i++) {
                    %>
                    <tr id="song<%=songs.get(i).getIdSong()%>" class="song">
                        <td style="width: 25px; padding-right: 0px;"><%=i + 1%></td>
                        <td><a
                                onclick="javascript: playThis('<%=i%>');return false;" href=""><%=songs.get(i).getNameSong()%></a></td>
                        <td>
                            <%
                                List<Singer> itSong = songs.get(i).getSingers();
                                for (int j = 0; j < itSong.size(); j++) {
                                    Singer aa = itSong.get(j);
                            %> <a
                                href="<%=request.getContextPath() + "/nghe-si/" + aa.getSlugSinger()%>"
                                class="content-grid-singer"><%=aa.getNameSinger() + ((j < itSong.size() - 1) ? "," : "")%></a>
                            <%
                                }
                            %>
                        </td>
                        <td style="text-align: right;">332</td>
                    </tr>

                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>--%>
            <div class="likebar">
                <button type="button" id="bntLike" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-heart"> </span> Like</button>
                <a href="<%=song.getLinkSong()%>" download><button type="button" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-download-alt"> </span> Download</button></a>
                <span class="viewcount"><span class="glyphicon glyphicon-headphones"></span> <%=song.getViewcount()%></span>
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
                        <%for (int i = 0; i < 1; i++) {%>
                        {
                            "file": "<%=request.getContextPath() + song.getLinkSong()%>",
                            "title": "<%=song.getNameSong()%>",

                            "artist": "<%List<Singer> sa = song.getSingers();
				for (int j = 0; j < sa.size(); j++) {
					Singer as = sa.get(j);
					out.print(as.getNameSinger() + ((j < (sa.size() - 1)) ? ", " : " "));
				}%>",
                            "url": "<%=request.getContextPath()+sa.get(0).getLinkImgSinger()%>",
                            "mediaid": "<%=song.getIdSong()%>",
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
                    loadLyric(jwplayer().getPlaylistItem().mediaid);
                });
                jwplayer().on('complete', function (e) {
                    increaseView('SONG', jwplayer().getPlaylistItem().mediaid);
                });
                function increaseView(type,id) {
                    $.get('<%=request.getContextPath()%>/ViewController', {id: id, view: type}, function (data, status) {

                    });
                }
                var like = false;
                $("#bntLike").click(function(){
                    <%Users user = (Users)request.getSession().getAttribute("user");
                    if(user!=null){
                    %>
                    if(!like) {
                        likeSong(<%=user.getIdUser()%>, <%=song.getIdSong()%>);
                    }else{
                        unlikeSong(<%=user.getIdUser()%>, <%=song.getIdSong()%>);
                    }
                    <%}else{%>
                    var r = confirm("Đăng nhập để thực hiện chức năng này!");
                    if (r == true) {
                        window.location.href = "/login";
                    } else {
                    }
                    <%}%>
                });


                function likeSong(userID,songID) {
                    $.get('<%=request.getContextPath()%>/like', {id: songID, type: 'LIKESONG', userID: userID}, function (data, status) {
                        if(data == 'OK'){
                            liked();
                            like = true;
                        }
                    });
                }
                function unlikeSong(userID,songID) {
                    $.get('<%=request.getContextPath()%>/like', {id: songID, type: 'UNLIKESONG', userID: userID}, function (data, status) {
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
                <img alt="" src="<%=(song.getSingers()!=null)?(request.getContextPath() + song.getSingers().get(0).getLinkImgSinger()):""%>"
                     class="col-sm-12 img-rounded">
                <div class="col-sm-48">
                    <h4><a><%=(song.getSingers()!=null)?(song.getSingers().get(0).getNameSinger()):""%></a>
                    </h4>
                    <h5>
                        <%=(song.getSingers()!=null)?(song.getSingers().get(0).getInfoSinger()):""%>
                    </h5>
                </div>
            </div>

            <div class="tittle-head">
                <h3 class="tittle">
                    <a href="#">ALBUM <%=song.getSingers().get(0).getNameSinger()%>
                        <span class="new">></span></a>
                </h3>
                <div class="clearfix"></div>
            </div>

            <div class="row">
                <%
                    List<Album> albumByArtist = new ArrayList<>();
                    albumByArtist = (List<Album>) request.getAttribute("albumByArtist");
                    for (Album alb : albumByArtist) {
                %>
                <div class="col-sm-15 col-xs-30 content-grid">
                    <a
                            href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"><img
                            src="<%=request.getContextPath() + alb.getLinkImg()%>"></img></a> <a
                        class="button"
                        href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"><%=alb.getNameAlbum()%>
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
                        if(s.getSingers().size()>0){
                %>
                <div class="rightpanel-grid">
                    <a class="rightpanel-thumb"
                       href="<%=request.getContextPath() + "/nhac/" + s.getSlugSong()%>"><img
                            src="<%=request.getContextPath() + s.getSingers().get(0).getLinkImgSinger()%>"></a> <a
                        class="rightpanel-title"
                        href="<%=request.getContextPath() + "/nhac/" + s.getSlugSong()%>"><%=s.getNameSong()%>
                </a><br>

                    <div class="rightpanel-singer nowrap">
                        <%
                            List<Singer> ss = s.getSingers();
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
