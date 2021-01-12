<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="productAPI" value="/api/product" />
<c:url var="productURL" value="/quan-tri/san-pham/danh-sach" />
<c:url var="productAPI" value="/api/product" />
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Trang chủ</title>
</head>
<body>
	<!-- page title area start -->
	<div class="page-title-area">
		<div class="row align-items-center">
			<div class="col-sm-6">
				<div class="breadcrumbs-area clearfix">
					<ul class="breadcrumbs pull-left">
						<li><a href="<c:url value='/quan-tri/trang-chu'/>">Trang chủ</a></li>
						<li><span>Danh sách</span></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-6 clearfix">
				<div class="user-profile pull-right">
					<img class="avatar user-thumb"
						src="<c:url value='/template/admin/assets/images/author/avatar.png'/> "
						alt="avatar">
					<h4 class="user-name dropdown-toggle" data-toggle="dropdown">
						<%=SecurityUtils.getPrincipal().getFullName()%><i class="fa fa-angle-down"></i>
					</h4>
					<div class="dropdown-menu">
						 <a class="dropdown-item" href="<c:url value='/quan-tri/tai-khoan'/> ">Tài khoản</a> <a
							class="dropdown-item" href="<c:url value='/thoat'/>">Thoát</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- page title area end -->
	<div class="main-content-inner">
		<div class="col-12 mt-5">
		<c:if test="${not empty message}">
			<div class="alert alert-${alert}">
  				<h4>${message}</h4>
			</div>
		</c:if>
		</div>
		<!-- Dark table start -->
		<div class="col-12 mt-5">
			<div class="card">
				<div class="card-body">
					<h1 align="center">Danh sách sản phẩm</h1>
					<a class="btn btn-rounded btn-success mb-3" href="<c:url value='/quan-tri/san-pham/them-moi'/> " role="button">
						<i class="fa fa-plus-circle bigger-110 purple"></i> Thêm mới
					</a>
					<div class="data-tables datatable-dark">
						<table id="dataTable3" class="text-center">
							<thead class="text-capitalize">
								<tr>
									<th>Id</th>
									<th>Tên</th>
									<th>Loại</th>
									<th>Giảm giá</th>
									<th>Giá gốc</th>
									<th>Số lượng</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${model.listResult}">
									<tr>
										<td>${i.id}</td>
										<td>${i.name}</td>
										<td>${i.categoryCode}</td>
										<td>${i.discount}%</td>
										<td class="numberformat">${i.price}</td>
										<td class="numberformat">${i.quantity}</td>
										<td>
											<c:url var="updateProductURL" value="/quan-tri/san-pham/chinh-sua">
												<c:param name="id" value="${i.id}"></c:param>
											</c:url>
											<a class="btn btn-sm btn-primary btn-edit"  href="${updateProductURL}"
											title="Cập nhật sản phẩm"><i class="fa fa-pencil-square-o"></i> </a> 
											<a class="btn btn-sm btn-danger btn-delete" onclick="warningBeforeDelete(${i.id})"
											title="Xóa sản phẩm" ><i class="fa fa-times"></i> </a>
										</td>
									</tr>
								</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Dark table end -->
	</div>
	<script>		
		function warningBeforeDelete(id) {
			swal({
				  title: "Bạn có muốn xóa không",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-success",
				  cancelButtonClass: "btn-danger",
				  confirmButtonText: "Xác nhận",
				  cancelButtonText: "Hủy bỏ",
				  closeOnConfirm: false,
				  closeOnCancel: false
				},
				function(inputValue){
				  if (inputValue===true) {
					  deleteProduct(id)
				  }else{
					  swal("Đã hủy bỏ");
				  }
				});
		}
		function deleteProduct(id) {
			var data = {};
			data["id"] = id;
			deleteProductId(data);
		}
		
		function deleteProductId(data) {
			$.ajax({
	            url: '${productAPI}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	window.location.href = "${productURL}?message=delete_success";
	            },
	            error: function (error) {
	            	window.location.href = "${productURL}?message=delete_fail";
	            }
	        });
		}
	
	</script>
</body>
</html>