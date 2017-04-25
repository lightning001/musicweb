<%@page import="entity.Country"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<button type="button" class="btn btn-info" data-toggle="modal"
	data-target="#form-add-modal">Thêm mới</button>
<div id="form-add-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="form-add-modal"
					onclick="$('#form-add-modal').modal('hide');">&times;</button>
				<h4 class="modal-title">Thêm thể loại mới</h4>
			</div>
			<div class="modal-body">
				<form id="form-add-category">
					<!-- Modal content-->
					<div class="form-group">
						<label>Tên Thể loại</label> <input type="text"
							class="form-control" name="category"
							placeholder="Nhập tên thể loại" required>
					</div>
					<div class="form-group">
						<%
							List<Country> listCountry = (List<Country>)request.getAttribute("listCountry");
						%>
						<label>Thuộc quốc gia</label> <select name="country"
							class="form-control">
							<%
								for (Country c : listCountry) {
							%>
							<option value="<%=c.getCountry()%>"><%=c.getCountry()%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<label>Thông tin thể loại</label>
						<textarea rows="5" class="form-control" name="infor"></textarea>
					</div>
					<div class="clearfix"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							data-dismiss="form-add-modal"
							onclick="$('#form-add-modal').modal('hide');">Hủy</button>
						<button type="submit" class="btn btn-info"
							data-dismiss="form-add-modal" id="btn-submit-category">Thêm</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script>
    $("#form-add-category").submit(function(e){
        var url = "<%=request.getContextPath()%>/admin/add/category";
		$.ajax({
			type : 'POST',
			url : url,
			data : $('#form-add-category').serialize(),
			success : function(dat) {
				alert(dat);
			},
			error : function() {
				alert("Thêm thất bại");
			}
		});
		$("#form-add-modal").modal("hide");
		e.preventDefault();
	});
</script>