<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard - Product</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#imgFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imgPreview").attr("src", imgURL);
                            $("#imgPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <%@ include file="../layout/header.jsp" %>
                    <div id="layoutSidenav">
                        <%@ include file="../layout/sidebar.jsp" %>
                            <div id="layoutSidenav_content">
                                <main>
                                    <div class="container-fluid px-4">
                                        <h2 class="mt-4">Product Management</h2>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item active"><a href="/admin">Dashboard</a>
                                            </li>
                                            <li class="mx-2"> / <a class="mx-2" href="/admin/product"> Product </a> /
                                            </li>
                                            <li> Create</li>
                                        </ol>
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h3>Create a product</h3>
                                                <hr>
                                                <form:form method="post" action="/admin/product/create"
                                                    modelAttribute="newProduct" class="row"
                                                    enctype="multipart/form-data">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorName">
                                                            <form:errors path="name" class="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Name:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                            path="name" />
                                                        ${errorName}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorPrice">
                                                            <form:errors path="price" class="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label ">Price:</label>
                                                        <form:input type="number"
                                                            class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                            path="price" />
                                                        ${errorPrice}
                                                    </div>
                                                    <div class="mb-3 col-12">
                                                        <c:set var="errorDetailDesc">
                                                            <form:errors path="detailDesc" class="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label ">Detail description:</label>
                                                        <form:textarea
                                                            class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                            path="detailDesc" />
                                                        ${errorDetailDesc}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorShortDesc">
                                                            <form:errors path="shortDesc" class="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Short description:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                                            path="shortDesc" />
                                                        ${errorShortDesc}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorQuantity">
                                                            <form:errors path="quantity" class="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label ">Quantity:</label>
                                                        <form:input type="number"
                                                            class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                            path="quantity" />
                                                        ${errorQuantity}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label ">Factory:</label>
                                                        <form:select class="form-select" path="factory">
                                                            <form:option value="Macbook">Macbook</form:option>
                                                            <form:option value="Acer">Acer</form:option>
                                                            <form:option value="Asus">Asus</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label ">Target:</label>
                                                        <form:select class="form-select" path="target">
                                                            <form:option value="Macbook">Gaming</form:option>
                                                            <form:option value="Acer">Đồ họa</form:option>
                                                            <form:option value="Asus">Văn phòng</form:option>
                                                        </form:select>
                                                    </div>

                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Image:</label>
                                                        <input class="form-control" type="file"
                                                            accept=".png, .jpg, .jpeg" id="imgFile" name="inputFile">
                                                    </div>
                                                    <div class="col-12 mb-3">
                                                        <img style="max-height: 250px; display: none;" src=""
                                                            alt="img preview" id="imgPreview">
                                                    </div>
                                                    <div class="col-12">
                                                        <form:button class="btn btn-primary" type="submit">Create
                                                        </form:button>
                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </main>
                                <%@ include file="../layout/footer.jsp" %>
                            </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
            </body>

            </html>