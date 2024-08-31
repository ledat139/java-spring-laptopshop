<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <div class="container-fluid py-5 mb-5 hero-header">
                <div class="container py-5">
                    <div class="row g-5 align-items-center">
                        <div class="col-md-12 col-lg-7 ">
                            <h4 class="mb-3 text-secondary mt-5">100% Sản Phẩm Chính Hãng</h4>
                            <h4 class="mb-5 display-3 text-primary">Hàng cao cấp<br />provip</h4>
                        </div>
                        <div class="col-md-12 col-lg-5 mt-5">
                            <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                                <div class="carousel-inner mt-5" role="listbox">
                                    <div class="carousel-item active rounded">
                                        <img src="/client/img/laptop1.jpg" style="object-fit: cover;"
                                            class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    </div>
                                    <div class="carousel-item rounded">
                                        <img src="/client/img/laptop2.jpg" class="img-fluid w-100 h-100 rounded"
                                            alt="Second slide">
                                    </div>
                                    <div class="carousel-item rounded">
                                        <img src="/client/img/laptop3.jpg" class="img-fluid w-100 h-100 rounded"
                                            alt="Second slide">
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                                    data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                                    data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hero End -->