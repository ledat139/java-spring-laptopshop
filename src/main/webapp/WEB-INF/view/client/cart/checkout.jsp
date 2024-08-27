<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Laptop Shop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>
                    <!-- Spinner  -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>


                    <!-- Navbar  -->
                    <%@ include file="../layout/header.jsp" %>


                        <!-- Cart Page Start -->
                        <div class="container-fluid py-5 mt-4">
                            <div class="container py-5">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Thông tin thanh toán
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Sản phẩm</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Giá cả</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="cartDetail" items="${cartDetails}">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="/img/product/${cartDetail.product.image}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <a target="_blank"
                                                                href="/product/${cartDetail.product.id}">${cartDetail.product.name}</a>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price}" />
                                                            đ
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 60px;">
                                                            <p class="m-auto">${cartDetail.quantity}</p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price * cartDetail.quantity}" />
                                                            đ
                                                        </p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <c:if test="${priceTotal != 0}">
                                    <form:form action="/place-order" method="post" modelAttribute="cart">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="row g-4 mt-1">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <h4 class="mt-2">Thông tin người nhận</h4>
                                                    <div class="form-group mt-3">
                                                        <label>Họ tên:</label>
                                                        <input class="form-control mt-1" type="text" name="recieverName"/>
                                                    </div>
                                                    <div class="form-group mt-3">
                                                        <label>Địa chỉ:</label>
                                                        <input class="form-control mt-1" type="text" name="recieverAddress"/>
                                                    </div>
                                                    <div class="form-group mt-3">
                                                        <label>Số điện thoại:</label>
                                                        <input class="form-control mt-1" type="text" name="recieverPhone"/>
                                                    </div>
                                                    <div class="mt-4"><i class="fa-solid fa-arrow-left m-2"
                                                            style="color: #0d367d;"></i><a href="/cart">Quay lại giỏ
                                                            hàng</a></div>

                                                </div>
                                            </div>
                                            <div class=" col-sm-7 col-md-7 col-lg-7 col-xl-6">
                                                <div class="bg-light rounded">
                                                    <div class="p-4">
                                                        <h3 class="mb-4">Thông tin đơn hàng
                                                        </h3>
                                                        <div class="d-flex justify-content-between mb-4">
                                                            <h5 class="mb-0 me-4">Tạm tính</h5>
                                                            <p class="mb-0" data-total-price="${priceTotal}">
                                                                <fmt:formatNumber type="number" value="${priceTotal}" />
                                                                đ
                                                            </p>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                            <div class="">
                                                                <p class="mb-0">0 đ</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                        <h5 class="mb-0 ps-4 me-4">Tổng cộng</h5>
                                                        <p class="mb-0 pe-4" data-total-price="${priceTotal}">
                                                            <fmt:formatNumber type="number" value="${priceTotal}" />
                                                            đ
                                                        </p>
                                                    </div>
                                                    <button
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                                        type="button">Xác nhận
                                                        thanh toán
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </c:if>
                            </div>
                        </div>
                        <!-- Cart Page End -->





                        <!-- Footer  -->
                        <%@ include file="../layout/footer.jsp" %>



                            <!-- Back to Top -->
                            <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                                    class="fa fa-arrow-up"></i></a>


                            <!-- JavaScript Libraries -->
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                            <script
                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                            <script src="/client/lib/easing/easing.min.js"></script>
                            <script src="/client/lib/waypoints/waypoints.min.js"></script>
                            <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                            <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                            <!-- Template Javascript -->
                            <script src="/client/js/main.js"></script>
                </body>

                </html>