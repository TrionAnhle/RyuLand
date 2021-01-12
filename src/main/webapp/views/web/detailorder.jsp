<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<c:url var="cartAPI" value="/api/web/cart"/>
<c:url var="orderAPI" value="/api/web/order"/>
<c:url var="listOrderURL" value="/don-hang/danh-sach"/>
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
        <!-- Start Checkout Area -->
        <section class="wn__checkout__area section-padding--lg bg__white">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-6 col-12">
        				
        				<div class="customer_details">
        					<h3>THÔNG TIN ĐƠN HÀNG</h3>
        					<div class="customar__field">
        						<form id="formSubmit">
        						<div class="margin_between">
        							<label class="input_box space_between">Ngày đặt: <f:formatDate pattern="dd/MM/yyyy HH:mm" value="${model.createdDate}" />
        							</label>
        							<label class="input_box space_between">  
        								<c:if test="${model.status == '1'}"><a class="text-warning"><strong>Trạng thái: Chưa Xác nhận</strong></a></c:if>      								
        								<c:if test="${model.status == '2'}"><a class="text-info"><strong>Trạng thái: Xác nhận</strong></a></c:if>
                                        <c:if test="${model.status == '3'}"><a class="text-primary"><strong>Trạng thái: Vận chuyển</strong></a></c:if>
                                        <c:if test="${model.status == '4'}"><a class="text-success"><strong>Trạng thái: Thành công</strong></a></c:if>
                                        <c:if test="${model.status == '0'}"><a class="text-danger"><strong>Trạng thái: Hủy đơn</strong></a></c:if>
        							</label>
        						</div>
        						<div class="input_box">
        							<label>Tên Người Nhận</label>
        							<input type="text" value="<%=SecurityUtils.getPrincipal().getFullName()%>" readonly="true">
        						</div>  				       						        						  						        										
								<div class="margin_between">
									<div class="input_box space_between">
										<label>Số Điện Thoại<label>
										<input type="tel" id="phoneOrder" name="phoneOrder" value="${model.phone}" readonly="true">
									</div>

									<div class="input_box space_between">
										<label>Email</label>
										<input type="email"  value="<%=SecurityUtils.getPrincipal().getEmail()%>" readonly="true">
									</div>
								</div>
								<div class="input_box">
        							<label>Địa chỉ giao hàng</label>
        							<input type="text" id="addressOrder" name="addressOrder" value="${model.address}" readonly="true">
        						</div>
        						</form>
        						<div class="input_box" align="center">
        							<a class="btn btn-warning" href="<c:url value='/don-hang/danh-sach'/> ">Quay Lại Danh Sách Đơn Hàng</a>
        						</div>
        					</div>
        				</div>
        			</div>
        			<div class="col-lg-6 col-12 md-mt-40 sm-mt-40">
        				<div class="wn__order__box">
        					<h3 class="onder__title">ĐƠN HÀNG</h3>
        					<ul class="order__total">
        						<li>Sản phẩm</li>
        						<li>Thành tiền</li>
        					</ul>
        					<ul class="order_product">
        						<c:forEach var="i" items="${model.products}">
        							<li>${i.product.name} × ${i.quantity}
        								<span class="numberformat">${i.priceAtBuy*i.quantity}</span>
        							</li>
        						</c:forEach>
        					</ul>
        					<ul class="shipping__method">
        						<li>Tiền hàng<span class="numberformat">${model.totalOrder - model.totalQuantity*10000}</span></li>
        						<li>Tiền ship<span class="numberformat">${model.totalQuantity*10000}</span>
        						</li>
        					</ul>
        					<ul class="total__amount ">
        						<li>Tổng đơn hàng<span class="numberformat">${model.totalOrder }</span></li>
        					</ul>
        				</div>	
        			</div>
        		</div>
        	</div>
        </section>
        <!-- End Checkout Area -->
</body>
</html>