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
											<li><a href="shop-grid.html">Shop Grid</a></li>
											<li><a href="single-product.html">Single Product</a></li>
										</ul>
										<ul class="item item03">
											<li><a href="my-account.html">My Account</a></li>
											<li><a href="cart.html">Cart Page</a></li>
											<li><a href="checkout.html">Checkout Page</a></li>
											<li><a href="wishlist.html">Wishlist Page</a></li>
											<li><a href="error404.html">404 Page</a></li>
											<li><a href="faq.html">Faq Page</a></li>
										</ul>
										<ul class="item item03">
											<li><a href="shop-grid.html">Bargain Bestsellers</a></li>
											<li><a href="shop-grid.html">Activity Kits</a></li>
											<li><a href="shop-grid.html">B&N Classics</a></li>
											<li><a href="shop-grid.html">Books Under $5</a></li>
											<li><a href="shop-grid.html">Bargain Books</a></li>
										</ul>
									</div>
								</li>								
								<li><a href="#">Liên lạc</a></li>
							</ul>
						</nav>
					</div>
					<div class="col-md-6 col-sm-6 col-6 col-lg-4">
						<ul class="header__sidebar__right d-flex justify-content-end align-items-center">
							<li class="shop_search"><a class="search__active" href="#"></a></li>
							<security:authorize access = "isAnonymous()">
								<li class="nav-item"><a class="btn btn-success" href="<c:url value='/dang-nhap'/>">Đăng nhập</a></li>
							</security:authorize>
							<security:authorize access = "isAuthenticated()">
								<li class="wishlist"><a href="#"></a></li>
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
															<span><a href="#">TÀI KHOẢN</a></span>
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
								<li><a href="index.html">Home</a></li>
								<li><a href="#">Pages</a>
									<ul>
										<li><a href="about.html">About Page</a></li>
										<li><a href="portfolio.html">Portfolio</a>
											<ul>
												<li><a href="portfolio.html">Portfolio</a></li>
												<li><a href="portfolio-details.html">Portfolio Details</a></li>
											</ul>
										</li>
										<li><a href="my-account.html">My Account</a></li>
										<li><a href="cart.html">Cart Page</a></li>
										<li><a href="checkout.html">Checkout Page</a></li>
										<li><a href="wishlist.html">Wishlist Page</a></li>
										<li><a href="error404.html">404 Page</a></li>
										<li><a href="faq.html">Faq Page</a></li>
										<li><a href="team.html">Team Page</a></li>
									</ul>
								</li>
								<li><a href="shop-grid.html">Shop</a>
									<ul>
										<li><a href="shop-grid.html">Shop Grid</a></li>
										<li><a href="single-product.html">Single Product</a></li>
									</ul>
								</li>
								<li><a href="blog.html">Blog</a>
									<ul>
										<li><a href="blog.html">Blog Page</a></li>
										<li><a href="blog-details.html">Blog Details</a></li>
									</ul>
								</li>
								<li><a href="contact.html">Contact</a></li>
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