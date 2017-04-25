<%@page import="entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%Users admin =null;
if(session.getAttribute("adminaccount")==null)
	response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
else 
 admin = (Users) session.getAttribute("adminaccount");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/token-input.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/token-input-facebook.css">

<link href="<%=request.getContextPath()%>/dist/css/font-awesome.min.css"
	rel="stylesheet" />

<!-- Theme style -->
<link href="<%=request.getContextPath()%>/dist/css/admin.min.css"
	rel="stylesheet" type="text/css" />
<!-- admin Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link
	href="<%=request.getContextPath()%>/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />

<link
	href="<%=request.getContextPath()%>/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />

<title>${param.title}</title>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="<%=request.getContextPath()%>/admin/index.jsp" class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels --> <span
				class="logo-mini"><b>ML</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg" style="color: rgb(245, 231, 245);"><b>Music
						Life </b></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<%String linkImgAdmin = "/img/admin/admin.jpg";
								if(admin.getLinkAvatar()!=null)
									linkImgAdmin = admin.getLinkAvatar();
								%>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="<%=request.getContextPath()+linkImgAdmin%>"
								class="user-image" alt="User Image" /> <span class="hidden-xs"
								style="color: rgb(245, 231, 245);">Admin</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header">
									 <img src="<%=request.getContextPath()+linkImgAdmin%>"
									class="img-circle" alt="User Image" width="100px" height="auto" />
									<p style="color: black;">Admin | Music Life</p>
								</li>
								<!-- Menu Body -->

								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-right">
										<a href="<%=request.getContextPath() %>/Logout" class="btn btn-default btn-flat">Đăng xuất</a>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>