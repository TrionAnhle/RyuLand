<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h4 class="page-title pull-left">Trang chủ</h4>
				</div>
			</div>
			<div class="col-sm-6 clearfix">
				<div class="user-profile pull-right">
					<img class="avatar user-thumb"
						src="<c:url value='/template/admin/assets/images/author/avatar.png'/> " alt="avatar">
					<h4 class="user-name dropdown-toggle" data-toggle="dropdown">
						<%=SecurityUtils.getPrincipal().getFullName()%><i class="fa fa-angle-down"></i>
					</h4>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<c:url value='/quan-tri/tai-khoan'/> ">Tài khoản</a> <a
							class="dropdown-item" href="<c:url value='/thoat'/> ">Thoát</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- page title area end -->
	<div class="main-content-inner">
		<div class="row" align="center">
			<!-- seo fact area start -->
			<div class="col-lg-8" align="center">
				<h2>Số lượng đơn hàng</h2>
				<div class="row">
					
					<div class="col-md-6 mt-5 mb-3">
						<div class="card">
							<div class="seo-fact sbg1">
								<div
									class="p-4 d-flex justify-content-between align-items-center">
									<div class="seofct-icon">
										Vận chuyển
									</div>
									<h2>${numShip }</h2>
								</div>
								<canvas id="seolinechart1" height="50"></canvas>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-md-5 mb-3">
						<div class="card">
							<div class="seo-fact sbg2">
								<div
									class="p-4 d-flex justify-content-between align-items-center">
									<div class="seofct-icon">
										Thành công
									</div>
									<h2>${numSuccess}</h2>
								</div>
								<canvas id="seolinechart2" height="50"></canvas>
							</div>
						</div>
					</div>
					<div class="col-md-6 mb-3 mb-lg-0">
						<div class="card">
							<div class="seo-fact sbg3">
								<div
									class="p-4 d-flex justify-content-between align-items-center">
									<div class="seofct-icon">
										Chưa xác nhận
									</div>
									<h2>${numNotConfirm}</h2>
									
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<div class="seo-fact sbg4">
								<div
									class="p-4 d-flex justify-content-between align-items-center">
									<div class="seofct-icon">
										Xác nhận
									</div>
									<h2>${numConfirm}</h2>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- seo fact area end -->

		</div>
	</div>
</body>
</html>