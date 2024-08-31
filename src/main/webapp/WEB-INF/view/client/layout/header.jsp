<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
                rel="stylesheet">
            <!-- Navbar start -->
            9<div class="container-fluid fixed-top shadow">
                <div class="container px-0">
                    <nav class="navbar navbar-light bg-white navbar-expand-xl">
                        <a href="/" class="navbar-brand">
                            <h1 class="text-primary display-6">Laptopshop</h1>
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                            <div class="navbar-nav mx-5">
                                <a href="/" class="nav-item nav-link active"
                                    style="font-weight: 700; font-size: 18px;">Trang Chủ</a>
                                <a href="/products" class="nav-item nav-link"
                                    style="font-weight: 700; font-size: large;">Sản Phẩm</a>
                                <a href="" class="nav-item nav-link" style="font-weight: 700; font-size: large;">Liên
                                    hệ</a>
                            </div>
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <div class="d-flex m-3 me-0 mx-auto">
                                    <a href="/cart" class="position-relative me-4 my-auto">
                                        <i class="fa fa-shopping-bag fa-2x"></i>
                                        <span
                                            class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                            style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${sessionScope.sum}</span>
                                    </a>
                                    <div class="dropdown my-auto">
                                        <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                            data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                            <i class="fas fa-user fa-2x"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end p-4" labelledby="dropdownMenuLink">
                                            <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                                <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden; object-fit: cover;"
                                                    src="/img/avatar/${sessionScope.avatar}" />
                                                <div class="text-center my-3">
                                                    <c:out value="${sessionScope.fullName}" />
                                                </div>
                                            </li>
                                            <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                                            <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li>
                                                <form action="/logout" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button class="dropdown-item" href="#">Đăng xuất</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <div class="d-flex m-3 me-0 mx-auto">
                                    <a class="btn" href="/login">Đăng nhập</a>
                                </div>
                            </c:if>

                        </div>
                    </nav>
                </div>
            </div>
            <!-- Navbar End -->