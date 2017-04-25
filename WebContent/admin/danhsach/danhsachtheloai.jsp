<%@page import="entity.Country"%>
<%@page import="entity.Category"%>
<%@page import="entity.Singer"%>
<%@page import="entity.Song"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Danh sách thể loại" name="title" />
</jsp:include>
<!-- Left side column. contains the logo and sidebar -->
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
int currentpage = 1;
if (request.getAttribute("page") != null) {
	currentpage = (Integer) request.getAttribute("page");}
	request.setAttribute("currentPage", currentpage);
	List<Category> list = (List<Category>) request.getAttribute("listCategory");
%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách thể loại
				</h3>
			</div>
			<div class="panel-body">
				<div style="margin: 10px 15px;">
					<div class="input-group" style="width: 50%; margin: auto;">
						<input type="text" id="input-search-album"
							style="border: 1px solid; border-radius: 3px 0px 0px 3px;"
							placeholder="Nhập giá trị tìm kiếm" class="form-control">
						<span class="input-group-btn"> <a href="#">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span> Tìm kiếm
								</button>
						</a> 
						</span>
					<jsp:include page="../btnmodal/btnaddcategory.jsp"></jsp:include>
					</div>
				</div>

				<br>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">Mã thể loại</th>
								<th class="text-left">Tên thể loại</th>
								<th class="text-left">Quốc gia</th>
								<th class="text-left">Thông tin thể loại</th>
								<th class="text-right">Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Category c : list) {
							%>
							<tr>
								<td class="text-center"><%=c.getIdCategory()%></td>
								<td class="text-left"><%=c.getCategory()%></td>
								<td class="text-left">
									<%
										if (c.getCountry() != null)
												out.print(c.getCountry().getCountry());
											else
												out.print("Không rõ");
									%>
								</td>
								<%
									String a = "";
										if (c.getInfoCategory() != null && !"".equals(c.getInfoCategory()))
											a = c.getInfoCategory();
								%>
								<td class="text-left">
									<%
										if (a.length() > 60)
												out.print("<div title=\'Thể loại " + c.getCategory() + ": " + a + "'>" + a.subSequence(0, 60)
														+ "...</div>");
											else if (a.length() > 0)
												out.print("<div title=\'Thể loại " + c.getCategory() + ": " + a + "'>" + a + "</div>");
											else
												out.print("Không có thông tin");
									%>

								</td>
								<td class="text-right"><button
										class="btn btn-primary btn-sm" data-toggle="modal"
										data-target="#form-edit-modal-<%=c.getIdCategory()%>"
										title="Chỉnh sửa">
										<span class="glyphicon glyphicon-edit"></span>
									</button>
									<div id="form-edit-modal-<%=c.getIdCategory()%>"
										class="modal fade" role="dialog">
										<div class="modal-dialog text-left">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close"
														data-dismiss="form-edit-modal-<%=c.getIdCategory()%>"
														onclick="$('#form-edit-modal-<%=c.getIdCategory()%>').modal('hide');">&times;</button>
													<h4 class="modal-title">Sửa thông tin quốc gia</h4>
												</div>
												<div class="modal-body">
													<form id="form-edit-category-<%=c.getIdCategory()%>"
														method="post">
														<input type="hidden" name="idCategory"
															value="<%=c.getIdCategory()%>">
														<div class="form-group">
															<label>Tên Thể loại</label> <input type="text"
																value="<%=c.getCategory()%>" class="form-control"
																name="category" placeholder="Nhập tên thể loại" required>
														</div>
														<div class="form-group">
															<label>Thuộc quốc gia</label> <select name="country"
																class="form-control">
																<%
																	List<Country> listCountry = (List<Country>) request.getAttribute("listCountry");
																		for (Country country : listCountry) {
																			out.print("<option value=\"" + country.getCountry() + "\"");
																			if (c.getCountry() != null)
																				if (c.getCountry().getSlugCountry().equalsIgnoreCase(country.getSlugCountry()))
																					out.print("selected");
																			out.print(">" + country.getCountry() + "</option>");
																		}
																%>
															</select>
														</div>
														<div class="form-group">
															<label>Thông tin thể loại</label>
															<%
																String info = "";
																	if (c.getInfoCategory() != null)
																		info = c.getInfoCategory();
															%>
															<textarea rows="5" class="form-control" name="infor"><%=info%></textarea>
														</div>
														<div class="clearfix"></div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="form-add-modal"
																onclick="$('#form-edit-modal-<%=c.getIdCategory()%>').modal('hide');">Hủy</button>
															<button class="btn btn-warning" type="reset">Khôi
																phục</button>
															<button type="submit" class="btn btn-info"
																data-dismiss="form-edit-modal-<%=c.getIdCategory()%>"
																id="btn-submit-country<%=c.getIdCategory()%>">Lưu
																chỉnh sửa</button>
														</div>
													</form>
													<script type="text/javascript">
													$("#form-edit-category-<%=c.getIdCategory()%>").submit(function(e){
												        var url = "<%=request.getContextPath()%>/admin/update/category";
														$.ajax({
															type : 'POST',
															url : url,
															data : $('#form-edit-category-<%=c.getIdCategory()%>').serialize(),
															success : function(dat) {
																alert(dat);
															},
															error : function() {
																alert("Sửa thất bại");
															}
														});
														$("#form-edit-modal-<%=c.getIdCategory()%>").modal("hide");
																			e.preventDefault();
																		});
													</script>
												</div>
											</div>
										</div>
									</div> <a
									href="<%=request.getContextPath()%>/admin/delete/category/<%=c.getSlugCategory()%>">
										<button class="btn btn-danger btn-sm" type="button"
											title="Xóa thể loại này">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
								</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>

					<div align="center">
						<%
						long numPage = (Long) request.getAttribute("numPage");
						%>
						<ul class="pagination">
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachtheloai/1"><i
									class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
							<%
								for (int i = 1; i <= numPage; i++) {
							%>
							<li<%if(currentpage==i)out.print(" class=\"active\"");%>><a
								href="<%=request.getContextPath()%>/admin/danhsachtheloai/<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<li><a
								href="<%=request.getContextPath()%>/admin/danhsachtheloai/<%=numPage%>"><i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<% request.setAttribute("currentPage", currentpage); %>
<jsp:include page="../footer.jsp"></jsp:include>