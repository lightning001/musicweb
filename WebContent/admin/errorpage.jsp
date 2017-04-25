<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error</title>
</head>
<style>
body {
	/* 	background: rgb(240, 240, 240); */
	margin: auto;
}

button {
	background: orange;
	border: none;
	color: white;
	width: 60px;
	height: 30px;
	border-radius: 2px 2px 2px 2px;
	margin-top: -40px;
}

a {
	text-decoration: none;
}

a:hover {
	color: blue;
}

button:hover {
	color: rgb(255, 255, 180);
	box-shadow: 2px 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>
<body>
	<%
		int currentPage = 1;
		if (request.getAttribute("page") != null)
			currentPage = (Integer) request.getAttribute("page");
		request.setAttribute("currentPage", currentPage);
	%>
	<div style="margin: 20px 50px;">
		<a href="<%=request.getContextPath()%>/admin/index.jsp"><span
			style="font-size: 32px;">Music Life | Admin</span></a>
	</div>
	<hr>
	<div style="width: 450px; height: 320px; margin: 60px auto;">
		<p align="center"
			style="color: red; font-size: 70px; line-spacing: 15px;">Error
		<p>
		<p>
			<%
				if (request.getAttribute("error") != null)
					out.print(request.getAttribute("error"));
			%>
		</p>
		<p align="center">
			<a
				<%if (request.getAttribute("link") != null)
				out.print("href=\"" + request.getContextPath() + "/" + request.getAttribute("link") + "\"");%>><button>Back</button></a>
		</p>
	</div>
</body>
</html>