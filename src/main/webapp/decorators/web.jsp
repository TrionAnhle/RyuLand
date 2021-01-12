<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<c:url var="loginURL" value="/dang-nhap"/>
<c:url var="productURL" value="/san-pham/danh-sach/tim-kiem"/>

<c:url var="sessionAPI" value="/api/session"/>
<c:url var="productAPI" value="/api/web/product"/>
<c:url var="cartAPI" value="/api/web/cart"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Trang chủ</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicons -->
	<link rel="shortcut icon" href="<c:url value='/template/web/images/favicon.ico'/>">
	<link rel="apple-touch-icon" href=" <c:url value='/template/web/images/icon.png'/> ">

	<!-- Stylesheets -->
	<link rel="stylesheet" href=" <c:url value='/template/web/css/bootstrap.min.css'/> ">
	<link rel="stylesheet" href=" <c:url value='/template/web/css/plugins.css'/> ">
	<link rel="stylesheet" href=" <c:url value='/template/web/style.css'/> ">
	<link rel="stylesheet" href=" <c:url value='/template/web/mystyle.css'/> ">
	
	<!-- Cusom css -->
   <link rel="stylesheet" href=" <c:url value='/template/web/css/custom.css'/> ">

	<!-- datatablse -->
	<script src=" <c:url value='/template/web/js/vendor/jquery-3.2.1.min.js'/> "></script>
	
	
	<!-- Modernizer js -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.min.js"></script>
	
	
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.13.4/jquery.mask.min.js"></script>
	
	
	
	<style type="text/css">
		.error {
		  color: red;
		}
		.img {
		  max-width: 100%;
 		  height: auto;
		}
    </style>
</head>
<body>
	<div class="wrapper" id="wrapper">
		<%@include file='/common/web/header.jsp' %>	
		<dec:body/>
		<%@include file='/common/web/footer.jsp' %>
		<!-- QUICKVIEW PRODUCT -->
		<div id="quickview-wrapper">
		    <!-- Modal -->
		    <div class="modal fade" id="productmodal" data-keyboard="false" data-backdrop="static">
		    	<form id="formSubmitProductModal">
		        <div class="modal-dialog modal__container" role="document">
		            <div class="modal-content">
		                <div class="modal-header modal__header">
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                </div>
		                <div class="modal-body">
		                    <div class="modal-product">
		                        <!-- Start product images -->
		                        <div class="product-images">
		                            <div class="main-image images" id="productModalImage">
		                                <img alt="big images"  src="">
		                            </div>
		                        </div>
		                        <!-- end product images -->
		                        <div class="product-info">
		                            <h1 id="productModalName">Tên sản phẩm</h1>
		                            <input type="hidden" id="productModalId" name="productModalId" value="" />
		                            <div class="price-box-3">
		                                <div class="s-price-box">
		                                    <span class="new-price" id="productModalNewPrice">123456</span>
		                                    <span class="old-price" id="productModalOldPrice">9999999</span>
		                                </div>
		                            </div>        	
		                           	<strong id="productModelDiscount" class="text-danger">100%</strong>
		                           	<div class ="mb-3">
		                           		<label>Số lượng mua: </label> 
		                           		<input type="number" class="form-control " value="1" oninput="this.value = Math.abs(this.value)"  id="productModalQuantity" name="productModalQuantity" min="0" />
		                           	</div>
		                           	
		                            <div class="mx-2 mb-3">
		                                <a class="btn btn-info" onclick="addItemCartByProductModal()">Thêm vào giỏ hàng</a>
		                            </div>
		                           	
		                           	<div class="price-box-3">
			                           	<label for="productModalDesc"><strong>Mô tả sản phẩm: </strong></label>
			                            <div id="productModalDesc">
			                                Mô tả ngắn sản phẩm
			                            </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        </form>
		    </div>
		</div>
		<!-- END QUICKVIEW PRODUCT -->
		<!-- START QUICK ADD CART  -->
		<div class="modal fade" id="quickAddCartModal" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog">
				<form id="formSubmitAddCart">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title" id="quickAddCartName">Thêm vào giỏ hàng</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="container">
							<div class="modal-body mx-3">							
								<div class="md-form mb-3">
									<input type="hidden" id="quickAddCartId" name="quickAddCartId" value="" /> 
									<input placeholder="Số lượng muốn mua" type="number" id="quickAddCartQuantity" name="quickAddCartQuantity" min="0" oninput="this.value = Math.abs(this.value)"  value="1" class="form-control validate"/>
								</div>
							</div>	
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-success"
								id="btnAddItemCart" >Thêm vào giỏ</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- END QUICK ADD CART  -->
		
	</div>
	<!-- JS Files -->
	<script>
		function keyPressSearch(event) {
	        event.keyCode;
	       if (event.keyCode == 13 || event.which == 13) {
	           event.preventDefault();
	           var key = $('#searchvalue').val();
	           window.location.href = "${productURL}?key="+key+"";
	       }
	    }
	
		$.validator.addMethod("soHopLePattern", function (value, element) {
	        return this.optional(element) || (value >0 && /^[,0-9]+$/.test(value)) ;
	    }, "Số lượng mua phải lớn hơn 1 và là số nguyên");
		var validator1 = $("#formSubmitProductModal").validate({
	        rules: {
	        	productModalQuantity: {
	                required: true,
	                soHopLePattern: true
	            }
	           
	        },
	
	        messages: {
	        	productModalQuantity: {
	                required: "Vui lòng số lượng",
	            }
	        },
	        highlight: function (element) {
	            $(element).parent().addClass('error')
	        },
	        unhighlight: function (element) {
	            $(element).parent().removeClass('error')
	        }
	    });
		var validator2 = $("#formSubmitAddCart").validate({
	        rules: {
	        	quickAddCartQuantity: {
	                required: true,
	                soHopLePattern: true
	            }
	           
	        },
	
	        messages: {
	        	quickAddCartQuantity: {
	                required: "Vui lòng số lượng",
	            }
	        },
	        highlight: function (element) {
	            $(element).parent().addClass('error')
	        },
	        unhighlight: function (element) {
	            $(element).parent().removeClass('error')
	        }
	    });
		
		function checkLogin(){
			$.ajax({
	            url: '${sessionAPI}',
	            type: 'POST',
	            contentType: 'application/json',
	            dataType: 'json',
	            success: function (result) {
	       
	            },
	            error: function (error) {
	            	window.location.href = "${loginURL}?noLogin";
	            }
	        });
		}
		function openProductModal(id) {
			checkLogin();
			$.ajax({
	            url: '${productAPI}?id='+id,
	            type: 'GET',
	            contentType: 'application/json',
	            dataType: 'json',
	            success: function (result) {
	            	$('#productModalImage').empty();
	            	$('#productModalId').val(result.id);
	            	$('#productModalQuantity').val(1);
	        		$('#productModalImage').prepend("<img src=\"${pageContext.servletContext.contextPath}/upload/"+result.pathImage+"\" style=\"width:270px;height:340px;\"  alt=\"product image\">");
	            	$('#productModalName').text(result.name);
	            	var oldPrice = parseFloat(result.price).toLocaleString(window.document.documentElement.lang);
	            	var newPrice = parseFloat((result.price-result.price*(result.discount/100))).toLocaleString(window.document.documentElement.lang);
	            	$('#productModalNewPrice').text(newPrice);
	            	$('#productModalOldPrice').text(oldPrice);
	            	$('#productModelDiscount').text("Giảm giá: "+result.discount+"%");
	            	$('#productModalDesc').text(result.description);
	            	$("#productmodal").modal('show');
	            },
	            error: function (error) {
	            	$("#productmodal").modal('show');
	            }
	        });
		}
		function openAddCartModal(id){
			checkLogin();
			$.ajax({
	            url: '${productAPI}?id='+id,
	            type: 'GET',
	            contentType: 'application/json',
	            dataType: 'json',
	            success: function (result) {
	            	$('#quickAddCartId').val(result.id);
	            	$('#quickAddCartName').text(result.name);
	            	$("#quickAddCartModal").modal('show');
	            },
	            error: function (error) {
	            	$("#quickAddCartModal").modal('show');
	            }
	        });
		}
		//// api------------------------------------------------------------
		$('#btnAddItemCart').click(function (evt) {
			var check = $('#formSubmitAddCart').valid();
			if(check){
				evt.preventDefault();
				var data = {};   
			    data["productId"] = $('#quickAddCartId').val();
			    data["quantity"] =  $('#quickAddCartQuantity').val();
			    addItemCart(data);
			}
		});
		
		function addItemCartByProductModal(){
			var check = $('#formSubmitProductModal').valid();
			if(check){
				var data = {};
			    data["productId"] = $('#productModalId').val();
			    data["quantity"] =  $('#productModalQuantity').val();
			    addItemCart(data);
			}
		};
			
		function addItemCart(data,add){
			$.ajax({
				url: '${cartAPI}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					$('#quickAddCartModal').modal('hide');
	            	$('#productmodal').modal('hide');
		            	swal({
		      			  title: "Thêm vào giỏ hàng thành công",
		      			  type: "success",
		      			  showCancelButton: false,
		      			  confirmButtonClass: "btn-success",
		      			  confirmButtonText: "OK",
		      			  closeOnConfirm: false,
		      			},
		      			function(inputValue){
		      				location.reload(true);
		      			});
					
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
	<script>
		$('.numberformat').mask("#,##0", {reverse: true});
	</script>
	<script src=" <c:url value='/template/web/js/popper.min.js'/> "></script>
	<script src=" <c:url value='/template/web/js/bootstrap.min.js'/> "></script>
	<script src=" <c:url value='/template/web/js/plugins.js'/> "></script>
	<script src=" <c:url value='/template/web/js/active.js'/> "></script>
</body>