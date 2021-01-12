<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-hocvien"/>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- login area start -->
    <div class="login-area">
        <div class="container ">
            <div class="login-box ptb--100">
                <form id="login-form" action="j_spring_security_check" method="post">
                    <div class="login-form-head">
                        <h4>ĐĂNG NHẬP</h4>
                        <p>Chào bạn, Đăng nhập và trải nghiệm website</p>
                    </div>
                    <div class="login-form-body">
                    	<!-- alert -->
                    	<div class="form-gp">
                    		<c:if test="${param.incorrectAccount != null}">
								<div class="alert alert-danger">	
										Username hoặc password không đúng
								</div>
							</c:if>
							<c:if test="${param.accessDenied != null}">
								<div class="alert alert-danger">	
										Bạn không có quyền truy cập
								</div>
							</c:if>
							<c:if test="${param.sessionTimeout != null}">
								<div class="alert alert-danger">	
										Phiên đăng nhập đã hết
								</div>
							</c:if>
							<c:if test="${param.noLogin != null}">
								<div class="alert alert-danger">	
										Bạn chưa đăng nhập, hãy đăng nhập để mua hàng
								</div>
							</c:if>
						</div>
                    	<!-- alert end -->
                        <div class="form-gp">
                            <label for="username">Tài khoản</label>
                            <input type="text" name="j_username" id="username">
                            <i class="ti-user"></i>
                            <div class="text-danger"></div>
                        </div>
                        <div class="form-gp">
                            <label for="password">Mật khẩu</label>
                            <input type="password" name="j_password" id="password">
                            <i class="ti-lock"></i>
                            <div class="text-danger"></div>
                        </div>
                        <div class="submit-btn-area">
                            <button class="mb-5" id="form_submit" type="submit">Đăng nhập<i class="ti-arrow-right"></i></button>
                            <a class="btn btn-info" href="<c:url value='/trang-chu'/>">Trang chủ</a>
                        </div>
                        <div class="form-footer text-center mt-5">
                            <p class="text-muted">Bạn chưa có tài khoản?<a href="<c:url value='/dang-ky'/> ">ĐĂNG KÝ</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- login area end -->
</body>
</html>
