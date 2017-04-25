<%@ page import="entity.Singer" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<jsp:include page="header2.jsp">
	<jsp:param value="Artist" name="title" />
</jsp:include>

<div class="main">
	<div class="container-fluid">
		<div class="row">
			<%
				List<Singer> list = new ArrayList<>();
				list = (ArrayList<Singer>) request.getAttribute("allSinger");
				for (Singer singer : list) {
			%>
			<div class="col-md-12 col-sm-15 col-xs-30 artist-grid">
				<a href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger()%>"><img src="<%=request.getContextPath() + singer.getLinkImgSinger()%>"></img></a> <a href="<%=request.getContextPath() + "/ca-si/" + singer.getSlugSinger()%>" class="button"><%=singer.getNameSinger()%></a>
			</div>
			<% }%>

		</div>

		<div class="paging">
			<ul class="pagination">
				<%
					int pageCount = (int) request.getAttribute("pageCount");
					int p = 1;
					try {
						p = Integer.parseInt(request.getParameter("p"));
					} catch (Exception e) {

					}
				%>
				<li><a
						href="<%=request.getContextPath() + "/ca-si?p=" + (p - 1)%>"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<%
					for (int i = 1; i <= pageCount; i++) {
				%>
				<li <%=(i == p) ? "class=\"active\"" : ""%>><a
						href="<%=request.getContextPath() + "/ca-si?p=" + (i)%>"><%=i%>
				</a></li>
				<%
					}
				%>

				<li><a
						href="<%=request.getContextPath() + "/ca-si?p=" + (p + 1)%>"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</div>
	</div>

	<div class="clearfix"></div>

</div>

<jsp:include page="footer.jsp"></jsp:include>