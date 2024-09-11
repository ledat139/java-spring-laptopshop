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
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


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




                        <!-- Laptop Shop -->
                        <div class="container-fluid fruite" style="padding-top: 100px;">
                            <div class="container">
                                <div class="tab-class">
                                    <div>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Sản phẩm

                                                </li>
                                            </ol>
                                        </nav>
                                    </div>

                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane fade show p-0 active">
                                            <div class="row g-4">
                                                <div class="col-12 col-md-4">
                                                    <div class="row g-4">
                                                        <div class="col-12" id="factoryFilter">
                                                            <div class="mb-2"><b>Hãng sản xuất</b></div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="factory-1" value="MSI">
                                                                <label class="form-check-label"
                                                                    for="factory-1">MSI</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="factory-2" value="ASUS">
                                                                <label class="form-check-label"
                                                                    for="factory-2">Asus</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="factory-3" value="LENOVO">
                                                                <label class="form-check-label"
                                                                    for="factory-3">Lenovo</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="factory-6" value="ACER">
                                                                <label class="form-check-label"
                                                                    for="factory-6">Acer</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-12" id="targetFilter">
                                                            <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="target-1" value="Gaming">
                                                                <label class="form-check-label"
                                                                    for="target-1">Gaming</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="target-2" value="Văn phòng">
                                                                <label class="form-check-label" for="target-2">Sinh viên
                                                                    - văn
                                                                    phòng</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="target-3" value="Đồ họa">
                                                                <label class="form-check-label" for="target-3">Đồ
                                                                    họa</label>
                                                            </div>



                                                        </div>
                                                        <div class="col-12" id="priceFilter">
                                                            <div class="mb-2"><b>Mức giá</b></div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="price-3" value="10-15-trieu">
                                                                <label class="form-check-label" for="price-3">Từ 10 - 15
                                                                    triệu</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="price-4" value="15-20-trieu">
                                                                <label class="form-check-label" for="price-4">Từ 15 - 20
                                                                    triệu</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="checkbox"
                                                                    id="price-5" value="tren-20-triệu">
                                                                <label class="form-check-label" for="price-5">Trên 20
                                                                    triệu</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="mb-2"><b>Sắp xếp</b></div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" id="sort-1"
                                                                    value="gia-tang-dan" name="radio-sort">
                                                                <label class="form-check-label" for="sort-1">Giá tăng
                                                                    dần</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" id="sort-2"
                                                                    value="gia-giam-dan" name="radio-sort">
                                                                <label class="form-check-label" for="sort-2">Giá giảm
                                                                    dần</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" id="sort-3"
                                                                    value="gia-nothing" name="radio-sort" checked>
                                                                <label class="form-check-label" for="sort-3">Không sắp
                                                                    xếp</label>
                                                            </div>

                                                        </div>
                                                        <div class="col-12">
                                                            <button id="btnFilter"
                                                                class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4">
                                                                Lọc Sản Phẩm
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-8">
                                                    <div class="row g-4 d-flex text-center">
                                                        <c:if test="${totalPages == 0}">
                                                            <div>Không tìm thấy sản phẩm</div>
                                                        </c:if>
                                                        <c:forEach var="product" items="${products}">
                                                            <div class="col-md-6 col-lg-4 col-xl-4">
                                                                <div class="rounded position-relative fruite-item">
                                                                    <div class="fruite-img">
                                                                        <img src="/img/product/${product.image}"
                                                                            class="w-100 rounded-top" alt="">
                                                                    </div>
                                                                    <div
                                                                        class="p-4 border border-secondary border-top-0 rounded-bottom fruit-content">
                                                                        <h4 style="font-size: 16px;">
                                                                            <a href="/product/${product.id}">
                                                                                ${product.name}</a>
                                                                        </h4>
                                                                        <p style="font-size: 13px;">
                                                                            ${product.shortDesc}</p>
                                                                        <div
                                                                            class="d-flex flex-lg-wrap flex-column justify-content-between">
                                                                            <p style="text-align: center; width: 100%;font-size: 16px;"
                                                                                class="text-dark  fw-bold mb-2">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${product.price}" /> đ
                                                                            </p>
                                                                            <form
                                                                                action="/add-product-to-cart/${product.id}"
                                                                                method="post" class="">
                                                                                <input type="hidden"
                                                                                    name="${_csrf.parameterName}"
                                                                                    value="${_csrf.token}" />
                                                                                <button
                                                                                    class="mx-auto btn border border-secondary rounded-pill px-3 text-primary "><i
                                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                                    Add to cart
                                                                                </button>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <c:if test="${totalPages > 0}">
                                                            <nav aria-label="Page navigation example mb-4">
                                                                <ul class="pagination justify-content-center d-flex">
                                                                    <li class="page-item">
                                                                        <c:if test="${1 == currentPage}">
                                                                            <a class="page-link" onclick="return false"
                                                                                aria-label="Previous">
                                                                                <span aria-hidden="true">&laquo;</span>
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${1 != currentPage}">
                                                                            <a class="page-link"
                                                                                href="/products?page=${currentPage - 1}${queryString}"
                                                                                aria-label="Previous">
                                                                                <span aria-hidden="true">&laquo;</span>
                                                                            </a>
                                                                        </c:if>
                                                                    </li>
                                                                    <c:forEach begin="0" end="${totalPages - 1}"
                                                                        varStatus="loop">
                                                                        <li class="page-item">
                                                                            <a class="${loop.index + 1 eq currentPage ? 'active page-link' : 'page-link'}"
                                                                                href="/products?page=${loop.index + 1}${queryString}">
                                                                                ${loop.index + 1}
                                                                            </a>
                                                                        </li>
                                                                    </c:forEach>

                                                                    <li class="page-item">
                                                                        <c:if test="${totalPages == currentPage}">
                                                                            <a class="page-link" onclick="return false"
                                                                                aria-label="Previous">
                                                                                <span aria-hidden="true">&raquo;</span>
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${totalPages != currentPage}">
                                                                            <a class="page-link"
                                                                                href="/products?page=${currentPage + 1}${queryString}"
                                                                                aria-label="Previous">
                                                                                <span aria-hidden="true">&raquo;</span>
                                                                            </a>
                                                                        </c:if>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



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