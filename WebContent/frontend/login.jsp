<%--
  Created by IntelliJ IDEA.
  User: congp
  Date: 30-Dec-16
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<jsp:include page="header2.jsp">
    <jsp:param value="" name="title"/>
</jsp:include>
<div class="main container-fluid">
    <div class="row" style="margin-top: 90px">
        <div class="col-md-30 col-md-offset-15">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-30">
                            <a href="#" class="active" id="login-form-link">Login</a>
                        </div>
                        <div class="col-xs-30">
                            <a href="#" id="register-form-link">Register</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-60">
                            <form id="login-form" action="login"
                                  method="post" role="form" style="display: block;">
                                <div class="form-group">
                                    <input type="text" hidden name="url" value="<%=request.getAttribute("url")%>">
                                    <input type="text" name="username" id="username" tabindex="1"
                                           class="form-control" placeholder="Username" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password"
                                           tabindex="2" class="form-control" placeholder="Password">
                                </div>
                                <p style="color: red"><%=(request.getAttribute("loginfail")!=null)?request.getAttribute("loginfail"):""%></p>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-30 col-sm-offset-15">
                                            <input type="submit" name="login-submit" id="login-submit"
                                                   tabindex="4" class="form-control btn btn-login"
                                                   value="Log In">
                                        </div>
                                    </div>
                                </div>

                            </form>
                            <form id="register-form"
                                  action="register" method="post"
                                  role="form" style="display: none;">
                                <div class="form-group">
                                    <input type="text" name="username" id="username" tabindex="1"
                                           class="form-control" placeholder="Username" required value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password"
                                           tabindex="2" class="form-control" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="confirm-password"
                                           id="confirm-password" tabindex="2" class="form-control"
                                           placeholder="Confirm Password" required>
                                </div>
                                <p style="color: red"><%=(request.getAttribute("registerfail")!=null)?request.getAttribute("registerfail"):""%></p>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-30 col-sm-offset-15">
                                            <input type="submit" name="register-submit"
                                                   id="register-submit" tabindex="4"
                                                   class="form-control btn btn-register" value="Register Now">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $('#login-form-link').click(function (e) {
            $("#login-form").delay(100).fadeIn(100);
            $("#register-form").fadeOut(100);
            $('#register-form-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
        });
        $('#register-form-link').click(function (e) {
            $("#register-form").delay(100).fadeIn(100);
            $("#login-form").fadeOut(100);
            $('#login-form-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
        });
        <% if(request.getAttribute("registerfail")!=null || request.getAttribute("register")!=null){ %>
        $("#register-form-link").click();
        <% }%>
    });
</script>
</div>
<jsp:include page="footer.jsp"></jsp:include>