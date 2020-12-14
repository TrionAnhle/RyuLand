	<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Trang chủ</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<c:url value='/template/admin/apple-icon.png'/> ">
    <link rel="shortcut icon" href=" <c:url value='/template/admin/favicon.ico'/> ">
	
	
    <link rel="stylesheet" href=" <c:url value='/template/admin/vendors/bootstrap/dist/css/bootstrap.min.css'/> ">
    <link rel="stylesheet" href=" <c:url value='/template/admin/vendors/font-awesome/css/font-awesome.min.css'/> ">
    <link rel="stylesheet" href=" <c:url value='/template/admin/vendors/themify-icons/css/themify-icons.css'/> ">
    <link rel="stylesheet" href=" <c:url value='/template/admin/vendors/flag-icon-css/css/flag-icon.min.css'/> ">
    <link rel="stylesheet" href=" <c:url value='/template/admin/vendors/selectFX/css/cs-skin-elastic.css'/> ">
    <link rel="stylesheet" href=" <c:url value='/template/admin/vendors/jqvmap/dist/jqvmap.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/style.css'/> ">
    <link rel="stylesheet" href="<c:url value='/template/admin/tablestyle.css'/> ">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
	<script src="<c:url value='/ckfinder/ckfinder.js' />"></script>
	
    
	
</head>
<body>
	<%@include file='/common/admin/menu.jsp' %>
	<div id="right-panel" class="right-panel">
		<%@include file='/common/admin/header.jsp' %>
		<dec:body/>
	</div>	
	
	
	
    <script src=" <c:url value='/template/admin/vendors/popper.js/dist/umd/popper.min.js'/> "></script>
    <script src=" <c:url value='/template/admin/vendors/bootstrap/dist/js/bootstrap.min.js'/> "></script>
    <script src=" <c:url value='/template/admin/assets/js/main.js'/> "></script>
    <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
</body>
</html>
	