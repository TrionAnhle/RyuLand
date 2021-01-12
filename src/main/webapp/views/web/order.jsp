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
        					<h3>THÔNG TIN KHÁCH HÀNG</h3>
        					<div class="customar__field">
        						<form id="formSubmit">
        						<div class="input_box">
        							<label>Tên khách hàng<span>(X)</span></label>
        							<input type="text" value="<%=SecurityUtils.getPrincipal().getFullName()%>" readonly="true">
        						</div>  				       						        						  						        										
								<div class="margin_between">
									<div class="input_box space_between">
										<label>Phone <span>(*)</span></label>
										<input type="tel" id="phoneOrder" name="phoneOrder" value="<%=SecurityUtils.getPrincipal().getPhone()%>">
									</div>

									<div class="input_box space_between">
										<label>Email<span>(X)</span></label>
										<input type="email"  value="<%=SecurityUtils.getPrincipal().getEmail()%>" readonly="true">
									</div>
								</div>
								<div class="input_box">
        							<label>Địa chỉ giao hàng<span>(*)</span></label>
        							<input type="text" id="addressOrder" name="addressOrder" value="<%=SecurityUtils.getPrincipal().getAddress()%>">
        						</div>
        						<div class="margin_between">
        							<label class="input_box space_between"><strong class="text-danger">(*)</strong>: Thông tin cần thiết</label>
        							<label class="input_box space_between"><strong class="text-danger">(X)</strong>: Thông tin không được sửa</label>
        						</div>
        						</form>
        						<c:if test="${cart.carts.size() > 0}">
        						<div class="input_box" align="center">
        							<button class="btn btn-success" onclick="confirmOrder()">Đặt hàng</button>
        						</div>
        						</c:if>
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
        						<c:forEach var="i" items="${cart.carts}">
        							<li>${i.name} × ${i.quantity}
        								<span class="numberformat">${((i.price-i.price*(i.discount/100))/10)*(i.quantity)}</span>
        							</li>
        						</c:forEach>
        					</ul>
        					<ul class="shipping__method">
        						<li>Tiền hàng<span class="numberformat">${cart.getTotal()-cart.getMoneyShip()}</span></li>
        						<li>Tiền ship<span class="numberformat">${cart.getMoneyShip()}</span>
        						</li>
        					</ul>
        					<ul class="total__amount ">
        						<li>Tổng đơn hàng<span class="numberformat">${cart.getTotal()}</span></li>
        					</ul>
        				</div>		
        			</div>
        		</div>
        	</div>
        </section>
        <!-- End Checkout Area -->
	<script>
		$.validator.addMethod("soDienThoaiPattern", function (value, element) {
	        return this.optional(element) || /(09|03|07|01)+([0-9]{8})\b/.test(value);
	    }, "Số điện thoại không hợp lệ!");
		
		$("#formSubmit").validate({
	        rules: {  
	        	addressOrder: {
	                required: true,
	                minlength: 5
	            },
	            phoneOrder: {
	                required: true,
	                soDienThoaiPattern: true
	            },
	        },
	        messages: {
	        	addressOrder: {
	                required: "Vui lòng nhập địa chỉ!",
	                minlength: "Địa chỉ phải bao gồm ít nhất 5 kí tự!"
	            },
	            phoneOrder: {
	                required: "Vui lòng nhập số điện thoại!"
	            },
	        },
	        highlight: function (element) {
                $(element).parent().addClass('error')
            },
            unhighlight: function (element) {
                $(element).parent().removeClass('error')
            }
	    });
		
		function confirmOrder(){
			var check = $('#formSubmit').valid();
			if(check){
				var data = {};
				data["phone"] = $('#phoneOrder').val();;	
				data["address"] = $('#addressOrder').val();;	
				saveOrder(data);
			}
		}
		
		function saveOrder(data){
			$.ajax({
				url: '${orderAPI}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					window.location.href = "${listOrderURL}?message=order_success";
	            },
	            error: function (error) {
	            		swal({
		      			  title: "Không có sản phẩm!",
		      			  type: "error",
		      			  showCancelButton: false,
		      			  confirmButtonClass: "btn-success",
		      			  confirmButtonText: "OK",
		      			  closeOnConfirm: false,
		      			},
		      			function(inputValue){
		      				location.reload(true)
		      			});
	            }
			});
		}
	</script>
</body>
</html>