<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Sansita+One"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Athiti|Jura"
	rel="stylesheet">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<title>${param.title}</title>
</head>
<body>
	<header id="banner" class="body">

		<div>
			<a class="headtitle" href="index.jsp"> Music & Life </a>
			<form action="get">
				<input type="text" id="search" class="input_search"
					placeholder="Tìm kiếm" value autocomplete="on" />
			</form>
		</div>
		<nav>
			<ul>
				<li><a href="index.jsp">Trang chủ</a></li>
				<li><a href="singlemusic.jsp">Bài hát</a></li>

				<li><a href="#">Albums</a></li>
				<li><a href="#">Bảng xếp hạng</a></li>
			</ul>
		</nav>
	</header>