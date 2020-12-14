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
						 <a	class="dropdown-item" href="#">Cài đặt</a> <a
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
					<h1 align="center">Danh sách đơn hàng</h1>
					<div class="data-tables datatable-dark">
						<table id="dataTable3" class="text-center">
							<thead class="text-capitalize">
								<tr>
									<th>Id</th>
									<th>Họ Tên</th>
									<th>Số điện thoại</th>
									<th>Địa chỉ</th>
									<th>Ngày đặt</th>
									<th>Trạng thái</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${model.listResult}">
									<tr>
										<td>${i.id}</td>
										<td>${i.fullname}</td>
										<td>${i.phone}</td>
										<td>${i.address}</td>
										<td>
											<f:formatDate pattern="dd/MM/yyyy HH:mm" value="${i.createdDate}" />
										</td>
										<td>
											<c:if test="${i.status == 0}"><a class="text-danger">Đã hủy</a></c:if>
		                                    <c:if test="${i.status == 1}"><a class="text-warning">Chưa xác nhận</a></c:if>
		                                    <c:if test="${i.status == 2}"><a class="text-info">Xác nhận</a></c:if>
		                                    <c:if test="${i.status == 3}"><a class="text-primary">Vận chuyển</a></c:if>
		                                    <c:if test="${i.status == 4}"><a class="text-success">Thành công</a></c:if>
										</td>
										<td>
											<c:url var="orderDetailURL" value="/quan-tri/don-hang/chi-tiet">
												<c:param name="id" value="${i.id}"></c:param>
											</c:url>
											<a class="btn btn-sm btn-info" href="${orderDetailURL}"
											title="Xem chi tiết" ><i class="ti-pencil-alt"></i> </a>
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
	</script>
</body>
</html>