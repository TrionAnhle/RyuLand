<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="cartAPI" value="/api/web/cart"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Trang chủ</title>
</head>
<body>
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--3">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Shopping Cart</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Shopping Cart</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
                <!-- cart-main-area start -->
        <div class="cart-main-area section-padding--lg bg--white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ol-lg-12">
                        <form action="#">               
                            <div class="table-content wnro__table table-responsive">
                                <table>
                                    <thead>
                                        <tr class="title-top">
                                            <th class="product-thumbnail">Hình Ảnh</th>
                                            <th class="product-name">Sản phẩm</th>
                                            <th class="product-price">Giá</th>
                                            <th class="product-quantity">Số lượng</th>
                                            <th class="product-subtotal">Thành tiền</th>
                                            <th class="product-remove">Xóa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<form id="fromSubmitCart">
                                    	<c:forEach var="i" items="${cart.carts}">
                                        <tr>
                                            <td class="product-thumbnail">
                                            	<a href="#">
                                            	<img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" 
																style="width:80px;height:100px;"  alt="product image">
                                            	</a>
                                            </td>
                                            <td class="product-name"><a>${i.name}</a></td>
                                            <td class="product-price">
                                            	<span class="amount numberformat" id="price_${i.id}" >${(i.price-i.price*(i.discount/100))/10}</span>
                                            </td>
                                            <td class="product-quantity">
                                            	<input type="hidden" id="quantityOld_${i.id}" value="${i.quantity}">
                                            	<input type="number" value="${i.quantity}" id="quantity_${i.id}"  onchange="changeSubTotal(${i.id})"
                                            	oninput="this.value = Math.abs(this.value)" min="1">
                                            </td>
                                            <td class="product-subtotal numberformat" id="subtotal_${i.id}">${((i.price-i.price*(i.discount/100))/10)*(i.quantity)}</td>
                                            <td class="product-remove"><a class="text-danger" onclick="deleteItemCart(${i.id})">Xóa</a></td>
                                        </tr>
                                        </c:forEach>
                                        </form>
                                    </tbody>
                                </table>
                            </div>
                        </form> 
                        <div class="cartbox__btn">
                        	<c:if test="${cart.carts.size() > 0}">
                            <ul class="cart__btn__list d-flex flex-wrap flex-md-nowrap flex-lg-nowrap justify-content-between">
                                <li><a href="<c:url value='/don-hang'/> ">Đặt hàng</a></li>
                            </ul>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 offset-lg-6">
                        <div class="cartbox__total__area">
                            <div class="cartbox-total d-flex justify-content-between">
                                <ul class="cart__total__list">
                                    <li>Tiền hàng</li>
                                    <li>Tiền ship</li>
                                </ul>
                                <ul class="cart__total__tk">
                                    <li class="numberformat" style="text-align:right;" id="totalItem">${cart.getTotal()-cart.getMoneyShip()}</li>
                                    <li class="numberformat" style="text-align:right;" id="totalShip">${cart.getMoneyShip()}</li>
                                </ul>
                            </div>
                            <div class="cart__total__amount">
                                <span>Tổng</span>
                                <span id = "total" class="numberformat">${cart.getTotal()}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <!-- cart-main-area end -->		
	<script>	
		function changeSubTotal(id){
			var	price = parseInt($('#price_'+id).text().replace(/,/g, ""));
			var quantityNew = $('#quantity_'+id).val();
			var quantityOld = $('#quantityOld_'+id).val()
			if(quantityNew > 0){
			$('#quantityOld_'+id).val(quantityNew);
			
			var subtotal = parseFloat(price*quantityNew).toLocaleString(window.document.documentElement.lang);
			$('#subtotal_'+id).text(subtotal);
			
			var totalItem = parseInt($('#totalItem').text().replace(/,/g, ""));
			var totalShip = parseInt($('#totalShip').text().replace(/,/g, ""));
			if(quantityNew > quantityOld){
				totalItem += (quantityNew - quantityOld)*price;
				totalShip += (quantityNew - quantityOld)*10000;
				$('#totalItem').text(parseFloat(totalItem).toLocaleString(window.document.documentElement.lang));
				$('#totalShip').text(parseFloat(totalShip).toLocaleString(window.document.documentElement.lang));
				$('#total').text(parseFloat(totalItem+totalShip).toLocaleString(window.document.documentElement.lang));
			}else{
				totalItem -= (quantityOld - quantityNew)*price;
				totalShip -= (quantityOld - quantityNew)*10000;
				$('#totalItem').text(parseFloat(totalItem).toLocaleString(window.document.documentElement.lang));
				$('#totalShip').text(parseFloat(totalShip).toLocaleString(window.document.documentElement.lang));
				$('#total').text(parseFloat(totalItem+totalShip).toLocaleString(window.document.documentElement.lang));
			}
			
			var data = {};
		    data["productId"] = id;
		    data["quantity"] =  quantityNew;
		    updateItemCart(data)
			}else $('#quantity_'+id).val(quantityOld);
		}
		
		function deleteItemCart(id){
			var data = {};
		    data["productId"] = id;		    
		    deleteItem(data);
		}
		
		function deleteItem(data){
			$.ajax({
				url: '${cartAPI}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function (result) {
					location.reload(true);
	            },
	            error: function (error) {
	            	location.reload(true);
	            }
			});
		}
		
		function updateItemCart(data){
			$.ajax({
				url: '${cartAPI}',
				type: 'PUT',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					$('#quickAddCartModal').modal('hide');
	            	$('#productmodal').modal('hide');
	            	location.reload(true);
	            },
	            error: function (error) {
	            	$('#quickAddCartModal').modal('hide');
	            	$('#productmodal').modal('hide');
	            	
	            	swal({
		      			  title: "Hết hàng\nKhông đủ số lượng sản phẩm",
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