<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="registerAPI" value="/api/web/user"/>
<c:url var="loginURL" value="/dang-nhap"/>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- login area start -->
    <div class="login-area">
        <div class="container ">
            <div class="login-box ptb--100">
                <form id="formSubmit">
                    <div class="login-form-head">
                        <h4>ĐĂNG KÝ</h4>
                    </div>
                    <div class="login-form-body">
                        <div class="row mb-3">
                            <input class="form-control" type="text" id="fullName" name="fullName" placeholder="Họ tên">    
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="text" id="userName" name="userName" placeholder="Username">                            
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="password" id="password" name="password" placeholder="Password">    
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="email" id="email" name="email" placeholder="Email">
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="tel" id="phone" name="phone" placeholder="Số điện thoại">
 
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="text" id="address" name="address" placeholder="Địa chỉ">
       
                        </div>
                        <div class="submit-btn-area">
                        	<div class="row">
                            	<a class="btn btn-warning col-sm-4" onclick="registerUser()">Đăng ký</a>
                            	<div class="col-sm-4"></div>
                            	<a class="btn btn-info col-sm-4" href="<c:url value='/trang-chu'/>">Trang chủ</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- login area end -->
    <script type="text/javascript">
	    $.validator.addMethod("soDienThoaiPattern", function (value, element) {
	        return this.optional(element) || /(09|03|07|01)+([0-9]{8})\b/.test(value);
	    }, "Số điện thoại không hợp lệ!");
	    var validator = $("#formSubmit").validate({
	        rules: {
	        	fullName: {
	                required: true,
	                minlength: 3
	            },
	            userName: {
	                required: true
	            
	            },
	            password: {
	                required: true,
	                minlength: 6
	            },
	            email: {
	                required: true
	                
	            },
	            phone: {
	            	required: true,
	            	soDienThoaiPattern: true
	            },
	            address: {
	            	required: true,
	            	minlength: 5
	            },
	        },
	
	        messages: {
	        	fullName: {
	                required: "Vui lòng nhập họ tên",
	                minlength: "Họ tên ít nhất 3 kí tự"
	            },
	            userName: {
	                required: "Vui lòng nhập username"
	            
	            },
	            password: {
	                required: "Vui lòng nhập password",
	                minlength: "Password ít nhất có 6 kí tự"
	            },
	            email: {
	                required: "Vui lòng nhập email"
	                
	            },
	            phone: {
	            	required: "Vui lòng nhập số điện thoại"
	            },
	            address: {
	            	required: "Vui lòng nhập địa chỉ",
	            	minlength: "Địa chỉ ít nhất có 5 kí tự"
	            }
	        },
	        highlight: function (element) {
	            $(element).parent().addClass('error')
	        },
	        unhighlight: function (element) {
	            $(element).parent().removeClass('error')
	        }
	    });
	    
	    function registerUser(){
	    	var check = $('#formSubmit').valid();
			if (check) {
				var formData = $('#formSubmit').serializeArray();
				var data = {};
			    $.each(formData, function (i, v) {
		            data[""+v.name+""] = v.value;
		        });
			    addUser(data);
			}
	    }
	    
	    function addUser(data){
			$.ajax({
				url: '${registerAPI}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					swal({
		      			  title: "Đăng ký thành công",
		      			  type: "success",
		      			  showCancelButton: false,
		      			  confirmButtonClass: "btn-success",
		      			  confirmButtonText: "OK",
		      			  closeOnConfirm: false,
		      			},
		      			function(inputValue){
		      				window.location.href = "${loginURL}";
		      			});
	            },
	            error: function (error) {
	            	swal({
		      			  title: "Đăng ký thất bại",
		      			  text: "Username bị trùng",
		      			  type: "error",
		      			  showCancelButton: false,
		      			  confirmButtonClass: "btn-success",
		      			  confirmButtonText: "OK",
		      			  closeOnConfirm: false,
		      			},
		      			function(inputValue){
		      				location.reload(true);
		      			});
	            }
			});
		}
    </script>
</body>
</html>
