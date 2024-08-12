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
                <title>Detail - Product</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                            <li>Detail</li>
                                        </ol>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Product detail with ID: ${id}</h3>
                                                </div>
                                                <hr>
                                                <div class="card" style="width: 60%;">
                                                    <div class="list-group list-group-flush">
                                                        <img style=" object-fit: cover;"
                                                            src="/img/product/${product.image}" alt="">
                                                    </div>
                                                    <div class="card-header">
                                                        Product information
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${product.id}</li>
                                                        <li class="list-group-item">Name: ${product.name}</li>
                                                        <li class="list-group-item">Price: ${product.price}</li>
                                                        <li class="list-group-item">Detail description:
                                                            ${product.detailDesc}</li>
                                                        <li class="list-group-item">Short description:
                                                            ${product.shortDesc}</li>
                                                        <li class="list-group-item">Quantity: ${product.quantity}</li>
                                                        <li class="list-group-item">Factory: ${product.factory}</li>
                                                        <li class="list-group-item">Target: ${product.target}</li>
                                                    </ul>
                                                </div>
                                                <a href="/admin/product" class="btn btn-success mt-3">Back</a>
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