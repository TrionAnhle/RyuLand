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
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Shop</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Shop</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
          <!-- Start Shop Page -->
        <section class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-12">
        				<div class="row">
        					<div class="col-lg-12">
								<div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
									<div class="shop__list nav justify-content-center" role="tablist">
			                            <a class="nav-item nav-link active" data-toggle="tab" href="#nav-grid" role="tab"><i class="fa fa-th"></i></a>
			                            
			                        </div>
			                        <h2>DANH SÁCH SẢN PHẨM</h2>
		                        </div>
        					</div>
        				</div>
        				<div class="tab__container">
	        				<div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">
	        					<div class="row">
	        						<!-- Start Single Product -->
	        						<c:forEach var="i" items="${model.listResult}">
		        					<div class="col-lg-4 col-md-4 col-sm-6 col-12">
			        					<div class="product">
			        						<div class="product__thumb">
			        							<a class="first__img" onclick="openProductModal(${i.id})">
			        								<img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" style="width:250px;height:365px;" alt="product image">
			        							</a>
			        							<a class="second__img animation1" onclick="openProductModal(${i.id})">
			        								<img src="${pageContext.servletContext.contextPath}/upload/${i.pathImage}" style="width:250px;height:365px;" alt="product image">
			        							</a>
			        							<c:if test="${i.discount >0 }">
				        							<div class="new__box">
				        								<span class="new-label">- ${i.discount}%</span>
				        							</div>
			        							</c:if>
			        							<ul class="prize position__right__bottom d-flex">
			        								<c:if test="${i.discount < 100}">
														<li class="numberformat">${(i.price-i.price*(i.discount/100))/10}</li>
													</c:if>
													<c:if test="${i.discount >= 100}">
														<li>0</li>
													</c:if>
													<li class="old_prize numberformat">${i.price}</li>
			        							</ul>
			      
			        						</div>
			        						<div class="product__content">
			        							<h4 align="center"><a><strong>${i.name}</strong></a></h4>

			        						</div>
			        					</div>
		        					</div>
		        					</c:forEach>
		        					<!-- End Single Product -->
	        					</div>
	        				</div>
	        				
        				</div>
        			</div>
        		</div>
        	</div>
        </section>
        <!-- End Shop Page -->
</body>
</html>