</div>
<!-- jQuery 2.1.4 -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
	$.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.2 JS -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.tokeninput.js"></script>

<!-- Bootstrap WYSIHTML5 -->
<script
	src="<%=request.getContextPath()%>/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
	type="text/javascript"></script>
<!-- Slimscroll -->
<script
	src="<%=request.getContextPath()%>/plugins/slimScroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<!-- FastClick -->
<script
	src='<%=request.getContextPath()%>/plugins/fastclick/fastclick.min.js'></script>
<!-- admin App -->
<script src="<%=request.getContextPath()%>/dist/js/app.min.js"
	type="text/javascript"></script>

<!-- admin dashboard demo (This is only for demo purposes) -->
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/dist/js/pages/dashboard.js" --%>
<!-- 	type="text/javascript"></script> -->

<!-- admin for demo purposes -->
<script src="<%=request.getContextPath()%>/dist/js/demo.js"
	type="text/javascript"></script>
</body>
</html>