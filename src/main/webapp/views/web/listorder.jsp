<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<c:url var="cartAPI" value="/api/web/cart"/>
<c:url var="orderAPI" value="/api/web/order"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Trang chủ</title>
</head>
<body>
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Checkout</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Checkout</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start List Order Area -->
        <section class="wn__checkout__area section-padding--lg bg__white">
        	<div class="container">
        		<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
			  				<h4>${message}</h4>
						</div>
				</c:if>
				
        		<h2 align="center">DANH SÁCH ĐƠN HÀNG ĐÃ MUA</h2>
        		<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">MÃ ĐƠN</th>
				      <th scope="col">NGÀY ĐẶT</th>
				      <th scope="col">SỐ MẶT HÀNG</th>
				      <th scope="col">TỔNG ĐƠN</th>
				      <th scope="col">TRẠNG THÁI</th>
				      <th scope="col">THAO TÁC</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="i" items="${model.listResult}">
						<tr>
							<td>${i.id}</td>
							<td>
								<f:formatDate pattern="dd/MM/yyyy HH:mm" value="${i.createdDate}" />
							</td>
							<td>${i.totalProduct}</td>
							<td>
								<span class="numberformat" >${i.totalOrder}</span>
							</td>
							<td>
								<c:if test="${i.status == 0}"><a class="text-danger">Đã hủy</a></c:if>
		                        <c:if test="${i.status == 1}"><a class="text-warning">Chưa xác nhận</a></c:if>
		                        <c:if test="${i.status == 2}"><a class="text-info">Xác nhận</a></c:if>
		                        <c:if test="${i.status == 3}"><a class="text-primary">Vận chuyển</a></c:if>
		                        <c:if test="${i.status == 4}"><a class="text-success">Thành công</a></c:if>
							</td>
							<td>
							<c:url var="orderDetailURL" value="/don-hang/chi-tiet">
								<c:param name="id" value="${i.id}"></c:param>
							</c:url>
								<a class="btn btn-info" href="${orderDetailURL}"
									title="Xem chi tiết" ><i class="ti-pencil-alt"></i>Xem chi tiết</a>
							</td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
        	</div>
        </section>
        <!-- End List Order Area -->
	
</body>
</html>