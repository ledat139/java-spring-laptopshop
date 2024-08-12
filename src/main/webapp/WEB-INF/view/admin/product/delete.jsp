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
                <title>Dashboard - Order</title>
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
                                            <li>Delete</li>
                                        </ol>
                                        <div class="row">
                                            <div class="col-12">
                                                <h3>Delete product with ID: ${id}</h3>
                                                <hr>
                                                <div class="alert alert-danger">
                                                    Are you sure to delete this product ?
                                                </div>
                                                <form:form method="post" action="/admin/product/delete"
                                                    modelAttribute="product">
                                                    <div class="mb-3" style="display: none">
                                                        <label class="form-label">Id</label>
                                                        <form:input type="text" class="form-control" path="id"
                                                            value="${id}" />
                                                    </div>
                                                    <button class="btn btn-danger">Confirm</button>
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