<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="orderAPI" value="/api/order" />
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
					<h1 align="center">Danh sách người dùng</h1>
					<a class="btn btn-rounded btn-success mb-3" href="<c:url value='/quan-tri/nguoi-dung/them-moi'/> " role="button">
						<i class="fa fa-plus-circle bigger-110 purple"></i> Thêm mới
					</a>
					
					<div class="data-tables datatable-dark">
						<table id="dataTable" class="text-center">
							<thead class="text-capitalize">
								<tr>
									<th>Id</th>
									<th>Họ Tên</th>
									<th>Vai trò</th>
									<th>Số điện thoại</th>
									<th>Email</th>
									<th>Địa chỉ</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${model.listResult}">
									<tr>
										<td>${i.id}</td>
										<td>${i.fullName}</td>
										<td>
											<c:if test="${i.role == 1 }">Quản trị</c:if>
											<c:if test="${i.role == 2 }">Người dùng</c:if>
										</td>
										<td>${i.phone}</td>
										<td>${i.email}</td>
										<td>${i.address}</td>
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
		
	</script>
</body>
</html>