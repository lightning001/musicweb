<%@page import="entity.Country"%>
<%@page import="DAO.CountryDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null)
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Danh sách quốc gia" name="title" />
</jsp:include>
<!-- Left side column. contains the logo and sidebar -->
<jsp:include page="../sidebar.jsp"></jsp:include>
<%
	CountryDAO countryDAO = new CountryDAO();
	List<Country> list = (List<Country>)request.getAttribute("listCountry");
%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list"></i> Danh sách quốc gia
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
					<jsp:include page="../btnmodal/btnaddcountry.jsp"></jsp:include>
						</span>
					</div>
				</div>
				<br>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<td class="text-center">STT</td>
								<td class="text-left">Quốc gia</td>
								<td class="text-left">Slug</td>
								<td class="text-right">Thao tác</td>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td class="text-center"><%=i + 1%></td>
								<td class="text-left"><%=list.get(i).getCountry()%></td>
								<td class="text-left"><%=list.get(i).getSlugCountry()%></td>
								<td class="text-right"><a
									href="<%=request.getContextPath()%>/admin/infor/country/<%=list.get(i).getSlugCountry()%>">
										<button class="btn btn-info btn-sm" title="Xem thông tin chi tiết">
											<span class="glyphicon glyphicon-info-sign"></span>
										</button>
								</a>
									<button class="btn btn-primary btn-sm" data-toggle="modal"
										data-target="#form-edit-modal-<%=i%>" title="Chỉnh sửa">
										<span class="glyphicon glyphicon-edit"></span>
									</button>
									<div id="form-edit-modal-<%=i%>" class="modal fade"
										role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close"
														data-dismiss="form-edit-modal-<%=i%>"
														onclick="$('#form-edit-modal-<%=i%>').modal('hide');">&times;</button>
													<h4 class="modal-title">Sửa thông tin quốc gia</h4>
												</div>
												<div class="modal-body">
													<form id="form-edit-country<%=i %>" method="post" >
														<!-- Modal content-->
														<input type="hidden" name="oldcountry" value="<%=list.get(i).getCountry()%>">
														<div class="form-group">
															<label>Tên quốc gia</label> <input type="text"
																class="form-control" name="country" value="<%=list.get(i).getCountry()%>"
																placeholder="Nhập tên quốc gia" required>
														</div>
														<div class="clearfix"></div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="form-add-modal"
																onclick="$('#form-edit-modal-<%=i%>').modal('hide');">Hủy</button>
															<button class="btn btn-warning" type="reset">Khôi phục</button>
															<button type="submit" class="btn btn-info"
																data-dismiss="form-edit-modal-<%=i%>" id="btn-submit-country<%=i%>">Lưu chỉnh sửa</button>
														</div>
													</form>
													<script type="text/javascript">
													$("#form-edit-country<%=i %>").submit(function(e){
												        var url = "<%=request.getContextPath()%>/admin/update/country";
														$.ajax({
															type : 'POST',
															url : url,
															data : $('#form-edit-country<%=i %>').serialize(),
															success : function(dat) {
																alert(dat);
															},
															error : function() {
																alert("Sửa thất bại");
															}
														});
														$("#form-edit-modal-<%=i%>").modal("hide");
														e.preventDefault();
													});
													</script>
												</div>
											</div>
										</div>
									</div> <a
									href="<%=request.getContextPath()%>/admin/delete/country/<%=list.get(i).getSlugCountry()%>">
										<button class="btn btn-danger btn-sm" type="button" title="Xóa quốc gia này">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
								</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
</div>

<jsp:include page="../footer.jsp"></jsp:include>