<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.ryuland.util.SecurityUtils" %>
<!-- Header -->
		<header id="wn__header" class="header__area header__absolute sticky__header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-6 col-lg-2">
						<div class="logo">
							<a href="index.html">
								<img src="<c:url value='/template/web/images/logo/logo.png'/> " alt="logo images">
							</a>
						</div>
					</div>
					<div class="col-lg-6 d-none d-lg-block">
						<nav class="mainmenu__nav">
							<ul class="meninmenu d-flex justify-content-start">
								<li class="drop with--one--item"><a href="<c:url value='/trang-chu'/>  ">Trang chủ</a></li>
								<li class="drop"><a href="#">Thể loại</a>
									<div class="megamenu mega03">
										<ul class="item item03">
											<li><a href="<c:url value='/san-pham/danh-sach?ten=tat-ca'/> ">Tất cả</a></li>
											<c:forEach var="i" items="${category1}">
											<li><a href="<c:url value='/san-pham/danh-sach?ten=${i.code}'/> ">${i.name}</a></li>
											</c:forEach>
										</ul>
										<ul class="item item03">
											<c:forEach var="i" items="${category2}">
											<li><a href="<c:url value='/san-pham/danh-sach?ten=${i.code}'/>">${i.name}</a></li>
											</c:forEach>
										</ul>
										<ul class="item item03">
											<c:forEach var="i" items="${category3}">
											<li><a href="<c:url value='/san-pham/danh-sach?ten=${i.code}'/>">${i.name}</a></li>
											</c:forEach>
										</ul>
									</div>
								</li>								
								<li><a href="#">Liên lạc</a></li>
							</ul>
						</nav>
					</div>
					<div class="col-md-6 col-sm-6 col-6 col-lg-4">
						<ul class="header__sidebar__right d-flex justify-content-end align-items-center">
							<li class="shop_search col-2"><a class="search__active" href="#"></a></li>
							<security:authorize access = "isAnonymous()">
								<li class="nav-item"><a class="btn btn-success" href="<c:url value='/dang-nhap'/>">Đăng nhập</a></li>
							</security:authorize>
							<security:authorize access = "isAuthenticated()">
								
								<li class="shopcart"><a class="cartbox_active" href="#"><span class="product_qun">${cart.getCarts().size()}</span></a>
									<!-- Start Shopping Cart -->
									<div class="block-minicart minicart__active">
										<div class="minicart-content-wrapper">
											<div class="micart__close">
												<span>ĐÓNG</span>
											</div>
											<div class="items-total d-flex justify-content-between">
												<span>${cart.getCarts().size()} sản phẩm</span>
											</div>
											<div class="mini_action checkout">
												<a class="checkout__btn" href="<c:url value='/gio-hang'/> " >Xem Giỏ Hàng</a>
											</div>
											<!-- Start single product -->
											<c:forEach var="i" items="${cart.carts}">
											<div class="single__items slidebarcart">
												<div class="miniproduct">
													<div class="item01 d-flex">
														<div class="thumb">
															<a>
																<img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" 
																style="width:75px;height:94px;"  alt="product image">
															</a>
														</div>
														<div class="content">
															<h6><a>${i.name}</a></h6>
															<span class="prize numberformat">${(i.price-i.price*(i.discount/100))/10}</span>
															<div class="product_prize d-flex justify-content-between">
																<span class="qun">Số lượng: ${i.quantity}</span>
															</div>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
											<!-- End single product -->
										</div>
									</div>
									<!-- End Shopping Cart -->
								</li>
								<li class="setting__bar__icon"><a class="setting__active" href="#"></a>
									<div class="searchbar__content setting__block">
										<div class="content-inner">
											<div class="switcher-currency">
												<strong class="label switcher-label meninmenu">
													<span><%=SecurityUtils.getPrincipal().getFullName()%></span>
												</strong>
												<div class="switcher-options">
													<div class="switcher-currency-trigger">
														<div class="setting__menu">
															<span><a href="<c:url value='/tai-khoan'/> ">TÀI KHOẢN</a></span>
															<span><a href="<c:url value='/don-hang/danh-sach'/>">ĐƠN HÀNG</a></span>
															<span><a href="<c:url value='/thoat'/>">THOÁT</a></span>
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
							</security:authorize>
						</ul>
					</div>
				</div>
				<!-- Start Mobile Menu -->
				<div class="row d-none">
					<div class="col-lg-12 d-none">
						<nav class="mobilemenu__nav">
							<ul class="meninmenu">
								
								<li><a href="<c:url value='/trang-chu'/> ">Trang chủ</a></li>
								<li><a class="search__active">Tìm kiếm</a></li>
								<li><a href="#">Thể loại</a>
									<ul>
											<li><a href="<c:url value='/san-pham/danh-sach?ten=tat-ca'/> ">Tất cả</a></li>
										<c:forEach var="i" items="${category1}">
											<li><a href="<c:url value='/san-pham/danh-sach?ten=${i.code}'/> ">${i.name}</a></li>
										</c:forEach>
										
										<c:forEach var="i" items="${category2}">
											<li><a href="<c:url value='/san-pham/danh-sach?ten=${i.code}'/>">${i.name}</a></li>
										</c:forEach>
										
										<c:forEach var="i" items="${category3}">
											<li><a href="<c:url value='/san-pham/danh-sach?ten=${i.code}'/>">${i.name}</a></li>
										</c:forEach>
									</ul>
								</li>
								<li><a>Liên lạc</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- End Mobile Menu -->
	            <div class="mobile-menu d-block d-lg-none">
	            </div>
	            <!-- Mobile Menu -->	
			</div>		
		</header>
		<!-- //Header -->
		<!-- Start Search Popup -->
		<div class="box-search-content search_active block-bg close__top">
			<form id="search_mini_form" class="minisearch" action="#">
				<div class="field__search">
					<input type="text" placeholder="Tìm kiếm ở đây....." id="searchvalue" name="searchvalue" onkeypress="keyPressSearch(event)">
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