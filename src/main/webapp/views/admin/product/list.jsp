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
		<h2>Danh sách các sản phẩm</h2>

		<div class="widget-box table-filter">
			<div class="table-btn-controls">
				<div class="pull-right tableTools-container">
					<div class="dt-buttons btn-overlap btn-group">
						<c:url var="createNewURL" value="/quan-tri/san-pham/chinh-sua" />
						<a flag="info"
							class="dt-button buttons-colvis btn btn-white btn-success btn-bold"
							data-toggle="tooltip" title='Thêm sản phẩm'
							href='${createNewURL}'> 
							<span> 
								<i class="fa fa-plus-circle bigger-110 purple"></i>
								Thêm sản phẩm
							</span>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="table-responsive-sm">
			<table class="table table-bordered table-image">
				<thead class="thead-light">
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Giá</th>
						<th scope="col">Giảm giá</th>
						<th scope="col">Số lượng</th>
						<th scope="col">Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Mật ong</td>
						<td>15 000</td>
						<td>10%</td>
						<td>15</td>
						<td><a class="btn btn-sm btn-primary btn-edit"
							data-toggle="tooltip" title="Cập nhật sản phẩm"
							href='${updateNewURL}'><i class="fa fa-pencil-square-o"
								aria-hidden="true"></i> </a> <a
							class="btn btn-sm btn-danger btn-delete" data-toggle="tooltip"
							title="Xóa sản phẩm" href='${updateNewURL}'><i
								class="fa fa-times" aria-hidden="true"></i> </a></td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
	<!-- .content -->
</body>
</html>