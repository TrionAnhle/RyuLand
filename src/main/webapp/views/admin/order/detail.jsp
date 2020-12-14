<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="orderAPI" value="/api/order" />
<c:url var="orderURL" value="/quan-tri/don-hang/chi-tiet" />
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
						<li><a href="<c:url value='/quan-tri/don-hang/danh-sach'/>">Danh sách</a></li>
						<li><span>Thông tin đơn hàng</span></li>
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
						<a class="dropdown-item" href="#">Cài đặt</a> <a
							class="dropdown-item" href="<c:url value='/thoat'/> ">Thoát</a>
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
		<div class="card col-xs-12 mt-5">
			<div class="card-body">
				<h1 align="center">Thông tin đơn hàng</h1>
				<div class="mt-5"></div>
				<form:form id="formSubmit" enctype="multipart/form-data" modelAttribute="model">
					<div class="flex-container">
						<div class="row">
							<div class="col-sm-4">
								<div class="col-sm-12 form-group">
									<label class="control-label no-padding-left">Trạng thái</label>
									<div class="dropdown">
										<button class="btn btn-rounded btn-light dropdown-toggle" type="button" 
										data-toggle="dropdown" aria-expanded="false" id="status" name="status">
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" x-placement="bottom-start" style="position: absolute; transform: translate3d(15px, 43px, 0px); top: 0px; left: 0px; will-change: transform;">
                                            <a class="dropdown-item text-info"    onclick="confirmOrder()">Xác nhận</a>
                                            <a class="dropdown-item text-primary" onclick="deliveryOrder()">Vận chuyển</a>
                                            <a class="dropdown-item text-success" onclick="successOrder()">Thành công</a>
                                            <a class="dropdown-item text-danger"  onclick="cancelOrder()">Hủy đơn</a>
                                        </div>
									</div>
								</div>
								<div class="col-sm-12 form-group">
									<label class="control-label no-padding-left">Ngày đặt</label>
									<div>
										<h4><f:formatDate pattern="dd/MM/yyyy HH:mm" value="${model.createdDate}" /></h4>
									</div>
								</div>					
							</div>
							<div class="left-edit-course col-sm-8">
								<div class="col-sm-12 form-group">
									<label class="control-label no-padding-left">Tên khách hàng</label>
									<form:input type="text" class="form-control" readonly="true"
										id="name" path="fullname" />
								</div>
								<div class="col-sm-12 form-group">
									<label class="control-label no-padding-left">Số điện thoại</label>
									<form:input type="text" class="form-control" 
										id="phone" path="phone" />
								</div>
								<div class="col-sm-12 form-group overlay">
									<label class="control-label no-padding-left">Địa chỉ nhận</label> 
									 <form:textarea class="form-control rounded-0" rows="4"
									 	id="address" path="address"/>
								</div>
							</div>
							<form:input type="hidden" id="id" path="id"/>
						</div>
						<div class="row">
							<div class="col-sm-12 form-group">
								<table class="table">
								  <thead class="thead-dark">
								    <tr>
								      <th scope="col">Id</th>
								      <th scope="col">Tên sản phẩm</th>
								      <th scope="col">Số lượng</th>
								      <th scope="col">Giá</th>
								      <th scope="col">Thành tiền</th>
								    </tr>
								  </thead>
								  <tbody>
								  	<c:forEach var="i" items="${model.products}">
								  		<tr>
									      <th scope="row">${i.product.id}</th>
									      <td>${i.product.name}</td>
									      <td class="numberformat">${i.quantity}</td>
									      <td class="numberformat">${i.priceAtBuy}</td>
									      <td class="numberformat">${i.priceAtBuy * i.quantity}</td>
									    </tr>
								  	</c:forEach>
								  	<tr>
								  		<td colspan="4" align="right"><strong>Tổng tiền</strong></td>
								  		<td class="numberformat">${model.totalOrder }</td>
								  	</tr>
								  </tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="invoice-buttons text-right">
								<button class="btn btn-info" type="button" id="btnAddOrUpdateProduct" onclick="warningBeforeDelete()">
									<i class="fa fa-check bigger-110"></i>
									Cập nhật đơn hàng
								</button>
						</div>		
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script>
	$.validator.addMethod("soDienThoaiPattern", function (value, element) {
        return this.optional(element) || /(09|03|07|01)+([0-9]{8})\b/.test(value);
    }, "Số điện thoại không hợp lệ!");
	$("#formSubmit").validate({
        rules: {
        	phone: {
                required: true,
                soDienThoaiPattern: true
            },
            address: {
                required: true,
            },
        },
        messages: {
        	address: {
                required: "Vui lòng nhập địa chỉ"
            },
            phone: {
                required: "Vui lòng nhập số điện thoại!"
            }
        },
    });
	
	var status = ${model.status};
	$( document ).ready(function() {
        if(${model.status == '1'}){
        	$('#status').empty();
    		$('#status').prepend("<a class=\"text-warning\"><h4>Chưa xác nhận</h4></a>");
        }else if(${model.status == '2'}){
        	confirmOrder();
        }else if(${model.status == '3'}){
        	deliveryOrder();
        }else if(${model.status == '4'}){
        	successOrder();
        }else if(${model.status == '0'}){
        	cancelOrder();
        }
    });
	function confirmOrder(){
		status = 2 ;
		$('#status').empty();
		$('#status').prepend("<a class=\"text-info\"><strong><h4>Xác nhận</h4></strong></a>");
	}
	function deliveryOrder(){
		status = 3 ;
		$('#status').empty();
		$('#status').prepend("<a class=\"text-primary\"><strong><h4>Vận chuyển</h4></strong></a>");			
	}
	function successOrder(){
		status = 4 ;
		$('#status').empty();
		$('#status').prepend("<a class=\"text-success\"><strong><h4>Thành công</h4></strong></a>");
	}
	function cancelOrder(){
		status = 0 ;
		$('#status').empty();
		$('#status').prepend("<a class=\"text-danger\"><strong><h4>Hủy Đơn</h4></strong></a>");
	}
	
	function warningBeforeDelete() {
		var check = $('#formSubmit').valid();
		if(check){
			swal({
				  title: "Bạn có muốn cập nhật không?",
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
					updateOrder();
				  }else{
					swal("Đã hủy bỏ");
				  }
				});
		}
	}
	function updateOrder(){
			var data = {};
		    var formData = $('#formSubmit').serializeArray();
		    $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
		    data["status"] = status; 
		    updateOrderAPI(data);
	}	
	function updateOrderAPI(data) {
		$.ajax({
            url: '${orderAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${orderURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${orderURL}?id="+error.id+"&message=update_fail";
            }
        });
	}
	</script>

</body>
</html>