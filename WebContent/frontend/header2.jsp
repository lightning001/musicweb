<%@page import="entity.Category" %>
<%@page import="java.util.List" %>
<%@page import="DAO.CategoryDAO" %>
<%@ page import="entity.Users" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/bootstrap.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery.tokeninput.js"></script>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/token-input-facebook.css"
          type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">

    <!-- <link href="https://fonts.googleapis.com/css?family=Sansita+One"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Coiny"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Righteous"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css?family=Creepster|Special+Elite"
        rel="stylesheet"> -->
    <!-- <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"> -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
    <title>${param.title}</title>
</head>
<body>
<header class="nav-down">

    <div id="banner">
        <div class="container-fluid">
            <div class="row">
                <%-- <a class="headtitle col-md-10 col-sm-10 col-xs-60"
                    href="<%=request.getContextPath()%>/"> <span>M</span>usicLife
                </a> --%>
                <a href="<%=request.getContextPath()+ "/"%>"><img
                        class="col-md-10 col-sm-10 col-xs-60" alt=""
                        src="<%=request.getContextPath()%>/img/logo1.png"
                        style="width: 180px; margin-top: 5px"></a>
                <div class="col-md-25 col-sm-25 col-xs-60"
                     style="position: relative;display: inline-block;margin-top: 10px; margin-bottom: 10px; padding: 0">
                    <div>
                        <script src="<%=request.getContextPath()%>/js/search.js"></script>
                        <input type="text" id="search"
                               class="input_search"
                               placeholder="Nhập nội dung cần tìm" autocomplete="off"/>
                        <div id="search-popup">
                            <ul id="search-list"></ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>


    <nav id="custom-bootstrap-menu" class="navbar navbar-default">
        <div class="container-fluid" style="max-width: 1100px">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#myNavbar">
                    <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath() + "/"%>"><span
                        class="glyphicon glyphicon-home"></span></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">

                    <li class="dropdown"><a
                            href="<%=request.getContextPath()%>/album"
                            class="dropdown-toggle" data-toggle="dropdown" role="button"
                            aria-haspopup="true" aria-expanded="false">Album <span
                            class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%
                                CategoryDAO categoryDAO = new CategoryDAO();
                                List<Category> cat = categoryDAO.getAllCat();
                                for (Category c : cat) {
                            %>
                            <li><a
                                    href="<%=request.getContextPath() + "/theloaialbum/" + c.getSlugCategory()%>"><%=c.getCategory()%>
                            </a></li>
                            <%
                                }
                            %>
                        </ul>
                    </li>

                    <li><a href="<%=request.getContextPath()%>/playlist">Playlist</a></li>
                    <li><a
                            href="<%=request.getContextPath()%>/bang-xep-hang">Bảng
                        xếp hạng</a></li>
                    <li><a
                            href="<%=request.getContextPath()%>/ca-si">Nghệ
                        sĩ</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <%
                        Users user = (Users) request.getSession().getAttribute("user");
                        if (user == null) {
                    %>
                    <li><a href="<%=request.getContextPath()+"/login?url="+request.getAttribute("javax.servlet.forward.request_uri")%>"><span class="glyphicon glyphicon-user"></span>
                        Đăng nhập</a></li>
                    <%} else {%>
                    <li class="dropdown"><a
                            href="<%=request.getContextPath()%>/mymusic"
                            class="dropdown-toggle" data-toggle="dropdown" role="button"
                            aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"> </span> <%=user.getUserName()%> <span
                            class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=request.getContextPath()+"/mymusic/favorites-song"%>">Bài hát yêu thích</a></li>
                            <li><a href="<%=request.getContextPath()+"/mymusic/favorites-album"%>">Album yêu thích</a></li>
                            <li><a href="<%=request.getContextPath()+"/mymusic/favorites-playlist"%>">Playlist yêu thích</a></li>
                            <li><a href="<%=request.getContextPath()+"/logout?url="+request.getAttribute("javax.servlet.forward.request_uri")%>">Đăng xuất</a></li>
                        </ul>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </nav>
</header>