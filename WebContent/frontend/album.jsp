<%@page import="entity.Singer" %>
<%@page import="java.util.Iterator" %>
<%@page import="entity.Album" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<jsp:include page="header2.jsp">
    <jsp:param value="Music Life ..." name="title"/>
</jsp:include>
<div class="main">
    <div class="container-fluid">


        <div class="tittle-head">
            <h3 class="tittle">
                ALBUM HOT <span class="new">></span>
            </h3>
            <div class="clearfix"></div>
        </div>
        <div class="row">
        <%
            List<Album> list = new ArrayList<>();
            list = (ArrayList<Album>) request.getAttribute("allAlbum");
            for (Album alb : list) {
        %>
        <div class="col-md-12 col-sm-15 col-xs-30 content-grid">
            <a class="content-grid-img"
               href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"><img
                    src="<%=request.getContextPath() + alb.getLinkImg()%>"></img></a> <a
                href="<%=request.getContextPath() + "/album/" + alb.getSlugAlbum()%>"
                class="content-grid-title nowrap"><%=alb.getNameAlbum()%>
        </a>
            <div class="nowrap">
                <%
                    List<Singer> aas = alb.getSingers();
                    for (int i = 0; i < aas.size(); i++) {
                        Singer aa = aas.get(i);
                %>
                <a
                        href="<%=request.getContextPath() + "/nghe-si/" + aa.getSlugSinger()%>"
                        class="content-grid-singer"><%=aa.getNameSinger() + ((i < aas.size() - 1) ? "," : "")%>
                </a>
                <%
                    }
                %>
            </div>

        </div>

        <%
            }
        %>


    </div>
        <nav aria-label="Page navigation" style="float: right;">
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
                        href="<%=request.getContextPath() + "/album?p=" + (p - 1)%>"
                        aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                </a></li>
                <%
                    for (int i = 1; i <= pageCount; i++) {
                %>
                <li <%=(i == p) ? "class=\"active\"" : ""%>><a
                        href="<%=request.getContextPath() + "/album?p=" + (i)%>"><%=i%>
                </a></li>
                <%
                    }
                %>

                <li><a
                        href="<%=request.getContextPath() + "/album?p=" + (p + 1)%>"
                        aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                </a></li>
            </ul>
        </nav>
    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>