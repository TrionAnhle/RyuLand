<%@include file="/common/taglib.jsp"%>
<%@ page import="com.ryuland.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="categoryAPI" value="/api/category" />
<c:url var="categoryURL" value="/quan-tri/the-loai" />
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
						<li><span>Thể loại</span></li>
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
						 <a	class="dropdown-item" href="#">Cài đặt</a> <a
							class="dropdown-item" href="<c:url value='/thoat'/>">Thoát</a>
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
		<!-- The Modal -->
		<div class="modal fade" id="myModal" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog">
				<form id="formSubmit">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">Loại Sản Phẩm</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="container">
							<div class="modal-body mx-3">
								<div class="md-form mb-3">
									<input type="hidden" id="id" name="id" value="" /> 
									<input placeholder="Tên loại sản phẩm" type="text" id="name" name="name" value="" class="form-control validate"/>
								</div>
							</div>	
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">

							<button type="submit" class="btn btn-success"
								id="btnAddOrUpdateCategory" >Thêm</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- End Modal -->
		<!-- Dark table start -->
		<div class="col-12 mt-5">
			<div class="card">
				<div class="card-body">
					<h1 align="center">Danh sách thể loại</h1>
					<button type="button" class="btn btn-rounded btn-success mb-3" id="btnAdd">
						<span> <i class="fa fa-plus-circle bigger-110 purple"></i>
							Thêm mới
						</span>
					</button>
					<div class="data-tables datatable-dark">
						<table id="dataTable3" class="text-center">
							<thead class="text-capitalize">
								<tr>
									<th>Tên Loại</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${model.listResult}">
									<tr>
										<td>${item.name}</td>
										<td>
											<a class="btn btn-sm btn-primary btn-edit"  onclick="openModal(${item.id})" 
											title="Cập nhật loại sản phẩm"><i class="fa fa-pencil-square-o"></i> </a> 
											<a class="btn btn-sm btn-danger btn-delete" onclick="warningBeforeDelete(${item.id})"
											title="Xóa loại sản phẩm" ><i class="fa fa-times"></i> </a>
										</td>
									</tr>
								</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Dark table end -->
	</div>
	<script>		
	var validator = $("#formSubmit").validate({
        rules: {
            name: {
                required: true,
            }
        },

        messages: {
            name: {
                required: "Vui lòng nhập tên thể loại",
            }
        },
        highlight: function (element) {
            $(element).parent().addClass('error')
        },
        unhighlight: function (element) {
            $(element).parent().removeClass('error')
        }
    });
	$('#btnAdd').click(function (e) {
		validator.resetForm();
		$('#name').val("");
    	$('#id').val("");
    	$('#btnAddOrUpdateCategory').text('Thêm');
    	$('#btnAddOrUpdateCategory').removeClass('btn-primary');
    	$('#btnAddOrUpdateCategory').addClass('btn-success');
    	$("#myModal").modal('show');
	});
		
	function openModal(id) {
		$.ajax({
            url: '${categoryAPI}?id='+id,
            type: 'GET',
            contentType: 'application/json',
            dataType: 'json',
            success: function (result) {
            	validator.resetForm();
            	$('#name').val(result.name);
            	$('#id').val(result.id);
            	$('#btnAddOrUpdateCategory').text('Cập nhật');
            	$('#btnAddOrUpdateCategory').removeClass('btn-success');
            	$('#btnAddOrUpdateCategory').addClass('btn-primary');
            	$("#myModal").modal('show');
            },
            error: function (error) {
            	$("#myModal").modal('show');
            }
        });
	}
	
	function warningBeforeDelete(id) {
		
		swal({
			  title: "Bạn có muốn xóa không",
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
				deleteCategory(id);
			  }else{
				  swal("Đã hủy bỏ");
			  }
			});

	}
	
	
	$('#btnAddOrUpdateCategory').click(function (e) {
		var check = $('#formSubmit').valid();
		if (check) {
		    e.preventDefault();
		    var data = {};
		    var formData = $('#formSubmit').serializeArray();
		    $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
		    var id = $('#id').val();
		    if (id == "") {
		    	addCategory(data);
		    }else{
		    	updateCategory(data)
		    }
		}
	});
	
	function addCategory(data) {
		$.ajax({
            url: '${categoryAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${categoryURL}?message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${categoryURL}?message=insert_fail";
            }
        });
	}
	function updateCategory(data) {
		$.ajax({
            url: '${categoryAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${categoryURL}?message=update_success";
            },
            error: function (error) {
            	window.location.href = "${categoryURL}?message=update_fail";
            }
        });
	} 
	
	function deleteCategory(id) {
		var data = {};
		data["id"] = id;
		deleteCategoryId(data);
	}
	
	function deleteCategoryId(data) {
		$.ajax({
            url: '${categoryAPI}',
            type: 'DELETE',
            async: false,
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href = "${categoryURL}?message=delete_success";
            },
            error: function (error) {
            	window.location.href = "${categoryURL}?message=delete_fail";
            }
        });
	}
	
	
	</script>
</body>
</html>