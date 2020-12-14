<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="productAPI" value="/api/product" />
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Trang chủ</title>
    
   	<!-- jquery latest version -->
    <script src="<c:url value='/template/admin/assets/js/vendor/jquery-2.2.4.min.js'/> "></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/font-awesome.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/themify-icons.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/metisMenu.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/owl.carousel.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/slicknav.min.css'/> ">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/typography.css'/> "> 
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/default-css.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/styles.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/responsive.css'/> ">
    <!-- modernizr css -->
    <script src="<c:url value='/template/admin/assets/js/vendor/modernizr-2.8.3.min.js'/> "></script>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> 
    
    <!-- Start datatable css -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    
    <!-- Start datatable js -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    
     
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
		  image-rendering: auto;
		  image-rendering: crisp-edges;
		  image-rendering: pixelated;
		}
    </style>
</head>
<body>
	<!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
	<div class="page-container">
		<%@include file='/common/admin/menu.jsp' %>
		<div class="main-content">
			<%@include file='/common/admin/header.jsp' %>
			<dec:body/>
		</div>
		<%@include file='/common/admin/footer.jsp' %>
	</div>
	<script>
		$('.numberformat').mask("#,##0", {reverse: true});
		
	</script>
	
    <!-- bootstrap 4 js -->
    <script src="<c:url value='/template/admin/assets/js/popper.min.js'/> "></script>
    <script src="<c:url value='/template/admin/assets/js/bootstrap.min.js'/> "></script>
    <script src="<c:url value='/template/admin/assets/js/owl.carousel.min.js'/> "></script>
    <script src="<c:url value='/template/admin/assets/js/metisMenu.min.js'/> "></script>
    <script src="<c:url value='/template/admin/assets/js/jquery.slimscroll.min.js'/> "></script>
    <script src="<c:url value='/template/admin/assets/js/jquery.slicknav.min.js'/> "></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <!-- start amcharts -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/ammap.js"></script>
    <script src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    <!-- all line chart activation -->
    <script src="<c:url value='/template/admin/assets/js/line-chart.js'/> "></script>
    <!-- all pie chart -->
    <script src="<c:url value='/template/admin/assets/js/pie-chart.js'/> "></script>
    <!-- all bar chart -->
    <script src="<c:url value='/template/admin/assets/js/bar-chart.js'/> "></script>
    <!-- all map chart -->
    <script src="<c:url value='/template/admin/assets/js/maps.js'/> "></script>
    <!-- others plugins -->
    <script src="<c:url value='/template/admin/assets/js/plugins.js'/> "></script>
    <script src="<c:url value='/template/admin/assets/js/scripts.js'/> "></script>
    
    
</body>
</html>
	