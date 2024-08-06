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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
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
                                        <h2 class="mt-4">User Management</h2>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item active"><a href="/admin">Dashboard</a> / User
                                            </li>
                                        </ol>
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h3>Create a user</h3>
                                                <hr>
                                                <form:form method="post" action="/admin/user/create"
                                                    modelAttribute="newUser" class="row" enctype="multipart/form-data">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorEmail">
                                                            <form:errors path="email" class="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Email:</label>
                                                        <form:input type="email"
                                                            class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                            path="email" />
                                                        ${errorEmail}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label ">Phone number:</label>
                                                        <form:input type="text" class="form-control" path="phone" />
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorPassword">
                                                            <form:errors path="password" class="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Password:</label>
                                                        <form:input type="password"
                                                            class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                            path="password" />
                                                        ${errorPassword}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorFullName">
                                                            <form:errors path="fullName" class="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Full name:</label>
                                                        <form:input type="text"
                                                            class="form-control  ${not empty errorFullName ? 'is-invalid' : ''}"
                                                            path="fullName" />
                                                        ${errorFullName}
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Address:</label>
                                                        <form:input type="text" class="form-control" path="address" />
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Role:</label>
                                                        <form:select class="form-select" path="role.name">
                                                            <form:option value="ADMIN">ADMIN</form:option>
                                                            <form:option value="USER">USER</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Avatar:</label>
                                                        <input class="form-control" type="file"
                                                            accept=".png, .jpg, .jpeg" id="avatarFile" name="inputFile">
                                                    </div>
                                                    <div class="col-12 mb-3">
                                                        <img style="max-height: 250px; display: none;" src=""
                                                            alt="avatar preview" id="avatarPreview">
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