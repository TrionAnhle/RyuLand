<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- Left Panel -->

    <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="index.html"><img src="<c:url value='/template/admin/assets/images/icon/logo.png'/> " alt="logo"></a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li>
                                <a href="<c:url value='/quan-tri/trang-chu'/> "><i class="fa fa-bar-chart"></i><span>Thống kê</span></a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-archive"></i><span>Sản phẩm</span></a>
                                <ul class="collapse">
                                    <li><a href="<c:url value='/quan-tri/san-pham/danh-sach'/>">Danh sách</a></li>
                                    <li><a href="<c:url value='/quan-tri/the-loai'/>">Thể loại</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="<c:url value='/quan-tri/don-hang/danh-sach'/> "><i class="ti-clipboard"></i><span>Đơn hàng</span></a>
                            </li>
                            <li>
                                <a href="<c:url value='/quan-tri/nguoi-dung/danh-sach'/> "><i class="fa fa-group"></i><span>Người dùng</span></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>