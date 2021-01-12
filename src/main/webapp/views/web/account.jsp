<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>

<c:url var="updateUserAPI" value="/api/web/user"/>
<c:url var="thoatURL" value="/thoat"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Trang chủ</title>
</head>
<body>
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--6">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">My Account</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Tài khoản</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <div class="container ">
            <div class="login-box ptb--100" align="center">
                <form id="formSubmit">
                    <div class="mb-4" align="center">   	
                        <h4>THÔNG TIN TÀI KHOẢN</h4>
                    </div>
                    <div class="col-sm-3"></div>
                    <div class="col-sm-5">
                    	<input type="hidden" value="<%=SecurityUtils.getPrincipal().getId()%>" id="id" name="id"/>
                        <div class="row mb-3">
                            <input class="form-control" type="text" id="fullName" name="fullName" placeholder="Họ tên" 
                            value="<%=SecurityUtils.getPrincipal().getFullName()%>">    
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="password" id="password" name="password" placeholder="Password"
                            value="">    
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="email" id="email" name="email" placeholder="Email"
                            value="<%=SecurityUtils.getPrincipal().getEmail()%>">
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="tel" id="phone" name="phone" placeholder="Số điện thoại"
                            value="<%=SecurityUtils.getPrincipal().getPhone()%>">
 
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="text" id="address" name="address" placeholder="Địa chỉ"
                            value="<%=SecurityUtils.getPrincipal().getAddress()%>">
       
                        </div>
                        <div class="submit-btn-area">
                        	<div class="row" align="center">
                        		<div class="col-sm-4"></div>
                            	<a class="btn btn-info col-sm-4" onclick="registerUser()">Cập nhật</a>
                            	
                            </div>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div>
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
	            password: {
	                required: "Vui lòng nhập password mới",
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
				url: '${updateUserAPI}',
				type: 'PUT',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					swal({
		      			  title: "Cập nhật thành công",
		      			  text: "Bạn sẽ bị đăng xuất khỏi hệ thông, Vui đăng nhập với thông tin đã cập nhật",
		      			  type: "success",
		      			  showCancelButton: false,
		      			  confirmButtonClass: "btn-success",
		      			  confirmButtonText: "OK",
		      			  closeOnConfirm: false,
		      			},
		      			function(inputValue){
		      				window.location.href = "${thoatURL}";
		      			});
	            },
	            error: function (error) {
	            	
	            }
			});
		}
    </script>
</body>
</html>