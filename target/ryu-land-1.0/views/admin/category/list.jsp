<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>Trang chủ</title>
</head>
<body>
	<div class="breadcrumbs">
		<div class="col-sm-4">
			<div class="page-header float-left">
				<div class="page-title">
					<h1>Hàng Hóa</h1>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="page-header float-right">
				<div class="page-title">
					<ol class="breadcrumb text-right">
						<li class="active">Hàng hóa</li>
						<li class="active">Danh sách</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<div class="content mt-3">
		<!-- table -->
		<div class="container">
			<h2>Danh sách các thể loại sản phẩm</h2>
			<div class="row"></div>
			<div class="col-sm-5">
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
					<span> <i class="fa fa-plus-circle bigger-110 purple"></i>
						Thêm
					</span>
				</button>
				<!-- The Modal -->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog">
						<form id="formSubmit">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">Thể Loại</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
	
								<!-- Modal body -->
								<div class="container">
									<input type="text" id="name" name="name" value="${modelEdit.name}"/>
								</div>
	
								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-success"
										data-dismiss="modal">Thêm</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Hủy</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- End Modal -->
				<table class="table table-striped">
						<thead class="thead-dark">
							<tr>
								<th class="th-lg">Tên</th>
								<th class="th-sm">Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${model.listResult}">
								<tr>
									<td>${item.name}</td>
									<td>
										<c:url var="updateCategoryURL" value="/quan-tri/the-loai">
											<c:param name="id" value="${item.id}"/>															
										</c:url>
										
										<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" id="btnEdit"
										title="Cập nhật sản phẩm" href='${updateCategoryURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i> </a> 
										<a class="btn btn-sm btn-danger btn-delete" data-toggle="tooltip"
										title="Xóa sản phẩm" href=''><i class="fa fa-times"	aria-hidden="true"></i> </a></td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- end table -->
	</div>
	<!-- .content -->
	<script>
	$(document).ready(function () {
		  var modal = $('#myModal');
		  var btn = $('#btnEdit');
		  btn.click(function () {
		    modal.show();
		    
		  });
		});
	</script>
</body>
</html>