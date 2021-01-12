<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<c:url var="AdminAPI" value="/api/user"/>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!-- page title area start -->
	<div class="page-title-area">
		<div class="row align-items-center">
			<div class="col-sm-6">
				<div class="breadcrumbs-area clearfix">
					<ul class="breadcrumbs pull-left">
						<li><a href="<c:url value='/quan-tri/trang-chu'/>">Trang chủ</a></li>
						<li><a href="<c:url value='/quan-tri/nguoi-dung/danh-sach'/>">Danh sách</a></li>
						<li><span>Thêm mới</span></li>
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
						 <a	class="dropdown-item" href="<c:url value='/quan-tri/tai-khoan'/>">Tài khoản</a> <a
							class="dropdown-item" href="<c:url value='/thoat'/>">Thoát</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- preloader area end -->
    <!-- login area start -->
    <div class="main-content-inner">
    	<div align="center">
    			<form id="formSubmit">
                    <div class="mb-4" align="center">   	
                        <h4>THÊM QUẢN TRỊ VIÊN MỚI</h4>
                    </div>
                    
                    <div class="col-sm-5">
                    	<input type="hidden" value="" id="id" name="id"/>
                        <div class="row mb-3">
                            <input class="form-control" type="text" id="fullName" name="fullName" placeholder="Họ tên" 
                            value="">    
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="text" id="userName" name="userName" placeholder="Username">                            
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="password" id="password" name="password" placeholder="Password"
                            value="">    
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="email" id="email" name="email" placeholder="Email"
                            value="">
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="tel" id="phone" name="phone" placeholder="Số điện thoại"
                            value="">
 
                        </div>
                        <div class="row mb-3">
                            <input class="form-control" type="text" id="address" name="address" placeholder="Địa chỉ"
                            value="">
       
                        </div>
                        <div class="submit-btn-area">
                        	<div class="row">
                        		<div class="col-sm-4"></div>
                            	<a class="btn btn-info col-sm-4" onclick="registerUser()">Thêm <span class="ti-plus"></span></a>
                            	
                            </div>
                        </div>
                    </div>
                    
                </form>
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
		    addAdmin(data);
		}
    }
    
    function addAdmin(data){
		$.ajax({
			url: '${AdminAPI}',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(data),
			dataType: 'json',
			success: function (result) {
				swal({
	      			  title: "Thành công",
	      			  text: "Đã thêm mới thành công một quản trị viên",
	      			  type: "success",
	      			  showCancelButton: false,
	      			  confirmButtonClass: "btn-success",
	      			  confirmButtonText: "OK",
	      			  closeOnConfirm: false,
	      			});
            },
            error: function (error) {
            	swal({
	      			  title: "Thất bại",
	      			  text: "Đã tồn tại username này",
	      			  type: "error",
	      			  showCancelButton: false,
	      			  confirmButtonClass: "btn-success",
	      			  confirmButtonText: "OK",
	      			  closeOnConfirm: false,
	      			});
            }
		});
	}
    </script>
</body>
</html>
