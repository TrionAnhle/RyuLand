<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Trang chủ</title>
</head>
<body>
<!-- Start Search Popup -->
		<div class="brown--color box-search-content search_active block-bg close__top">
			<form id="search_mini_form" class="minisearch" action="#">
				<div class="field__search">
					<input type="text" placeholder="Search entire store here...">
					<div class="action">
						<a href="#"><i class="zmdi zmdi-search"></i></a>
					</div>
				</div>
			</form>
			<div class="close__wrap">
				<span>close</span>
			</div>
		</div>
		<!-- End Search Popup -->
        <!-- Start Slider area -->
        <div class="slider-area brown__nav slider--15 slide__activation slide__arrow01 owl-carousel owl-theme">
        	<!-- Start Single Slide -->
	        <div class="slide animation__style10 bg-image--9 fullscreen align__center--left">
	            <div class="container">
	            	<div class="row">
	    		
	            	</div>
	            </div>
            </div>
			<!-- End Single Slide -->
			<!-- Start Single Slide -->
	        <div class="slide animation__style10 bg-image--8 fullscreen align__center--left">
	            <div class="container">
	            	<div class="row">
	    		
	            	</div>
	            </div>
            </div>
			<!-- End Single Slide -->
			<!-- Start Single Slide -->
	        <div class="slide animation__style10 bg-image--3 fullscreen align__center--left">
	            <div class="container">
	            	<div class="row">
	    		
	            	</div>
	            </div>
            </div>
			<!-- End Single Slide -->
			<!-- Start Single Slide -->
	        <div class="slide animation__style10 bg-image--4 fullscreen align__center--left">
	            <div class="container">
	            	<div class="row">
	    		
	            	</div>
	            </div>
            </div>
			<!-- End Single Slide -->
			<!-- Start Single Slide -->
	        <div class="slide animation__style10 bg-image--5 fullscreen align__center--left">
	            <div class="container">
	            	<div class="row">
	    		
	            	</div>
	            </div>
            </div>
			<!-- End Single Slide -->
			<!-- Start Single Slide -->
	        <div class="slide animation__style10 bg-image--6 fullscreen align__center--left">
	            <div class="container">
	            	<div class="row">
	    		
	            	</div>
	            </div>
            </div>
            <!-- End Single Slide -->
        	
        </div>
        <!-- End Slider area -->
		<!-- Start New Product Area -->
		<section class="wn__product__area brown--color pt--80  pb--30">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section__title text-center">
							<h2 class="title__be--2">SẢN PHẨM <span class="color--theme">MỚI</span></h2>
						</div>
					</div>
				</div>
				<!-- Start Single Tab Content -->
				<div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
					<!-- Start Single Product -->
					<c:forEach var="i" items="${model.listNew}">
					<div class="product product__style--3">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product__thumb">
								<a class="first__img" href="single-product.html"><img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" style="width:270px;height:340px;" alt="product image"></a>
								<a class="second__img animation1" href="single-product.html"><img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" style="width:270px;height:340px;"  alt="product image"></a>
								<div class="hot__box">
									<span class="hot-label">NEW</span>
									<c:if test="${i.discount >0 }">
										<span class="hot-label"> - ${i.discount}%</span>
									</c:if>
								</div>
							</div>
							<div class="product__content content--center">
								<h4><a href="single-product.html">${i.name}</a></h4>
								<ul class="prize d-flex ">
									<c:if test="${i.discount < 100}">
										<li class="numberformat">${(i.price-i.price*(i.discount/100))/10}</li>
									</c:if>
									<c:if test="${i.discount >= 100}">
										<li>0</li>
									</c:if>
									<li class="old_prize numberformat">${i.price}</li>
									
								</ul>
								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" onclick="openAddCartModal(${i.id})"><i class="bi bi-shopping-cart-full"></i></a></li>
											<li><a title="Thông tin" class="quickview modal-view detail-link" onclick="openProductModal(${i.id})"><i class="bi bi-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<!-- End Single Product -->
				</div>
				<!-- End Single Tab Content -->
			</div>
		</section>
		<!-- End New Product Area -->
		<!-- Start Hot Product Area -->
		<section class="wn__product__area brown--color pt--80  pb--30">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section__title text-center">
							<h2 class="title__be--2">SẢN PHẨM <span class="color--theme">GIẢM NHIỀU</span></h2>
						</div>
					</div>
				</div>
				<!-- Start Single Tab Content -->
				<div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
					<!-- Start Single Product -->
					<c:forEach var="i" items="${model.listHot}">
					<div class="product product__style--3">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product__thumb">
								<a class="first__img" href="single-product.html"><img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" style="width:270px;height:340px;" alt="product image"></a>
								<a class="second__img animation1" href="single-product.html"><img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" style="width:270px;height:340px;"  alt="product image"></a>
								<div class="hot__box">
									<span class="hot-label">HOT</span>
									<c:if test="${i.discount >0 }">
										<span class="hot-label"> - ${i.discount}%</span>
									</c:if>
								</div>
							</div>
							<div class="product__content content--center">
								<h4><a href="single-product.html">${i.name}</a></h4>
								<ul class="prize d-flex ">
									<c:if test="${i.discount < 100}">
										<li class="numberformat">${(i.price-i.price*(i.discount/100))/10}</li>
									</c:if>
									<c:if test="${i.discount >= 100}">
										<li>0</li>
									</c:if>
									<li class="old_prize numberformat">${i.price}</li>
									
								</ul>
								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" onclick="openAddCartModal(${i.id})"><i class="bi bi-shopping-cart-full"></i></a></li>
											<li><a title="Thông tin" class="quickview modal-view detail-link" onclick="openProductModal(${i.id})"><i class="bi bi-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<!-- End Single Product -->
					
				</div>
				<!-- End Single Tab Content -->
			</div>
		</section>
		<!-- End Hot Product Area -->
	
		
		
		<!-- Start NEwsletter Area -->
		<section class="wn__newsletter__area bg-image--2">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 offset-lg-5 col-md-12 col-12 ptb--150">
						<div class="section__title text-center">
							<h2>Hãy tham gia với chúng tôi</h2>
						</div>
						<div class="newsletter__block text-center">
							<p>Đăng ký nhận thông báo từ trang web</p>
							<form action="#">
								<div class="newsletter__box">
									<input type="email" placeholder="Enter your e-mail">
									<button>Subscribe</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End NEwsletter Area -->		
		
		<!-- Start BestSeller Product Area -->
		<section class="wn__product__area brown--color pt--80  pb--30">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section__title text-center">
							<h2 class="title__be--2">BEST<span class="color--theme">SELLER</span></h2>
						</div>
					</div>
				</div>
				<!-- Start Single Tab Content -->
				<div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
					<!-- Start Single Product -->
					<c:forEach var="i" items="${model.listBestSeller}">
					<div class="product product__style--3">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product__thumb">
								<a class="first__img" href="single-product.html"><img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" style="width:270px;height:340px;" alt="product image"></a>
								<a class="second__img animation1" href="single-product.html"><img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" style="width:270px;height:340px;"  alt="product image"></a>
								<div class="hot__box">
									<c:if test="${i.discount >0 }">
										<span class="hot-label">- ${i.discount}%</span>
									</c:if>
								</div>
							</div>
							<div class="product__content content--center">
								<h4><a href="single-product.html">${i.name}</a></h4>
								<ul class="prize d-flex ">
									<c:if test="${i.discount < 100}">
										<li class="numberformat">${(i.price-i.price*(i.discount/100))/10}</li>
									</c:if>
									<c:if test="${i.discount >= 100}">
										<li>0</li>
									</c:if>
									<li class="old_prize numberformat">${i.price}</li>
									
								</ul>
								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" onclick="openAddCartModal(${i.id})"><i class="bi bi-shopping-cart-full"></i></a></li>
											<li><a title="Thông tin" class="quickview modal-view detail-link" onclick="openProductModal(${i.id})"><i class="bi bi-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<!-- End Single Product -->
				</div>
				<!-- End Single Tab Content -->
			</div>
		</section>
		<!-- End BestSeller Product Area -->
		
</body>
</html>