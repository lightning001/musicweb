<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(session.getAttribute("adminaccount")!=null)
	response.sendRedirect(request.getContextPath()+"/admin/index.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Music Life | Log in</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<%=request.getContextPath()%>/dist/css/admin.min.css"
	rel="stylesheet" type="text/css" />

</head>
<body class="login-page">
	<div class="login-box">
		<div class="login-logo">
			<h1>
				<b>Admin</b>Music Life
			</h1>
		</div>
		<!-- /.login-logo -->
		<div class="message">
			<%
				if (request.getAttribute("loginerror") != null) {
					out.print("<font size=\"2\" color=\"red\">" + request.getAttribute("loginerror") + "</font>");
				}
			%>
		</div>
		<div class="login-box-body">
			<form method="post" action="<%=request.getContextPath()%>/loginadmin">
				<div class="form-group has-feedback">
					<label for="username">Email: </label> <input type="text"
						class="form-control trasparent" name="email" required /> <span
						class="glyphicons glyphicons-envelope"></span>
				</div>
				<div class="form-group has-feedback trasparent">
					<label for="password">Password: </label> <input type="password"
						class="form-control trasparent" name="passwd" required /> <span
						class="glyphicons glyphicons-lock"></span>
				</div>
				<div class="row">
					<button type="submit"
						class="btn btn-primary btn-block btn-flat trasparent"
						style="color: #000; width: 90px; margin: auto;">Sign In</button>
				</div>
			</form>


		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"
		type="text/javascript"></script>

</body>
</html>