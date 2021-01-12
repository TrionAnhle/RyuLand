<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="productAPI" value="/api/product" />
<c:url var="addProductURL" value="/quan-tri/san-pham/them-moi" />
<c:url var="updateProductURL" value="/quan-tri/san-pham/chinh-sua" />
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
						<li><a href="<c:url value='/quan-tri/san-pham/danh-sach'/>">Danh sách</a></li>
						<c:if test="${not empty model.id}">
							<li><span>Cập nhật</span></li>
						</c:if>
						<c:if test="${empty model.id}">
							<li><span>Thêm</span></li>
						</c:if>
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
						<a class="dropdown-item" href="<c:url value='/quan-tri/tai-khoan'/> ">Tài khoản</a> <a
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
				<h1 align="center">Thông tin sản phẩm</h1>
				<form:form id="formSubmit" enctype="multipart/form-data" modelAttribute="model">
					<div class="flex-container">
						<div class="row">
							<div class="col-sm-4">
								<label class="control-label no-padding-left">Hình ảnh</label>
								<input type="file" accept='image/*' class="form-control" id="file" name="file" onchange="openFile(event)"/>
								<c:if test="${not empty model.pathImage}">
									<img src="${pageContext.servletContext.contextPath}/upload/${model.pathImage}" />
								</c:if>								
							</div>
							<div class="left-edit-course col-sm-8">
								<div class="col-sm-12 form-group">
									<label class="control-label no-padding-left">Tên</label>
									<form:input type="text" class="form-control" id="name"
										path="name" />
								</div>
								<div class="col-sm-12 form-group">
									<div class="row">
										<div class="col-sm-6 form-group">
											<label class="control-label no-padding-left">Loại</label> 
										  	<form:select class="form-control"  path="categoryId" items="${categories}" itemLabel="name" itemValue="id"/>
										  		
										</div>
										<div class="col-sm-6 form-group">
											<label class="control-label no-padding-left">Giá</label> 
											<form:input type="text" class="form-control numberformat" id="price"
												path="price" />
											
										</div>
									</div>
								</div>
								<div class="col-sm-12 form-group">
									<div class="row">
										<div class="col-sm-6 form-group">
											<label class="control-label no-padding-left">Giảm giá</label> 
											<form:input type="number" class="form-control" id="discount" min="0" max="100"
													path="discount"/>	
										</div>
										<div class="col-sm-6 form-group">
											<label class="control-label no-padding-left">Số lượng</label> 
											<form:input type="text" class="form-control numberformat" id="quantity"
												path="quantity"/>
										</div>
									</div>
								</div>
								<div class="col-sm-12 form-group overlay">
									<label class="control-label no-padding-left">Mô tả ngắn</label> 
									 <form:textarea class="form-control rounded-0" rows="8"
									 id="description" path="description"/>
								</div>
							</div>
							<form:input type="hidden" id="id" path="id"/>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-9 col-md-offset-8 pull-right">
							<c:if test="${not empty model.id}">
								<button class="btn btn-info" type="button" id="btnAddOrUpdateProduct">
									<i class="fa fa-check bigger-110"></i>
									Cập nhật sản phẩm
								</button>
							</c:if>
							<c:if test="${empty model.id}">
								<button class="btn btn-info" type="button" id="btnAddOrUpdateProduct">
									<i class="fa fa-check bigger-110"></i>
									Thêm sản phẩm
								</button>
							</c:if>
								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset">
									<i class="fa fa-undo bigger-110"></i>
									Hủy
								</button>
						</div>		
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script>
		$.validator.addMethod("soPattern", function (value, element) {
	        return this.optional(element) || /^[,0-9]+$/.test(value);
	    }, "Chỉ được nhập số!");
		$.validator.addMethod("soHopLePattern", function (value, element) {
	        return this.optional(element) || (parseInt(value.replace(/,/g, "")) >0) ;
	    }, "Chỉ được nhập số lớn hơn 0");		
		$.validator.addMethod("filesize", function(value, element) {
		    return this.optional(element) || (element.files[0].size <= 1048576) 
		});
		$.validator.addMethod("discountrange", function(value, element) {
		    return this.optional(element) || (value >=0 && value <=100) 
		});
		var validator = $("#formSubmit").validate({
	        rules: {
	            name: {
	                required: true,
	            },
	            price: {
	                required: true,
	                soPattern : true,
	                soHopLePattern: true
	            },
	            discount: {
	                required: true,
	            },
	            quantity: {
	                required: true,
	                soPattern : true,
	                soHopLePattern: true
	            },
	            file: {
	            	filesize: true
	            },
	            discount: {
	            	discountrange: true
	            },
	        },
	
	        messages: {
	            name: {
	                required: "Vui lòng nhập tên sản phẩm",
	            },
	            price: {
	                required: "Vui lòng nhập giá sản phẩm",
	            },
	            discount: {
	                required: "Vui lòng nhập mức giảm giá",
	            },
	            quantity: {
	                required: "Vui lòng nhập số lượng",
	            },
	            file: "File phải là JPG, GIF hoặc PNG, ít hơn 1MB",
	            discount: "Giảm giá chỉ được nhập từ 0 đến 100"
	        },
	        highlight: function (element) {
	            $(element).parent().addClass('error')
	        },
	        unhighlight: function (element) {
	            $(element).parent().removeClass('error')
	        }
	    });
		var data = {};
		$('#btnAddOrUpdateProduct').click(function (evt) {
			var check = $('#formSubmit').valid();
			if (check) {
				evt.preventDefault();
				var formData = $('#formSubmit').serializeArray();
			    $.each(formData, function (i, v) {
		            data[""+v.name+""] = v.value;
		        });
			    
			    data["price"] = $('#price').val().replace(/,/g, "");
			    data["quantity"] =  $('#quantity').val().replace(/,/g, "");
			    
			    var id = $('#id').val();
			    if (id == "") {
			    	addProduct(data);
			    } else {
			    	updateProduct(data);
			    }
			}
		});
		var openFile = function(event) {
		    var input = event.target;
		    var reader = new FileReader();
		    reader.onload = function(e){
		      data["base64"] = e.target.result;
			  data["pathImage"] = input.files[0].name;
			  
		    };
		    reader.readAsDataURL(input.files[0]);
		};
		
		function addProduct(data){
			$.ajax({
				url: '${productAPI}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					window.location.href = "${addProductURL}?id="+result.id+"&message=insert_success";
	            },
	            error: function (error) {
	            	window.location.href = "${addProductURL}?message=insert_fail";
	            }
			});
		}
		
		function updateProduct(data){
			$.ajax({
				url: '${productAPI}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					window.location.href = "${updateProductURL}?id="+result.id+"&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${updateProductURL}?message=update_fail";
	            }
			});
		}
	</script>

</body>
</html>