<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <%@ include file="../layout/header.jsp" %>
                        <div id="layoutSidenav">
                            <%@ include file="../layout/sidebar.jsp" %>
                                <div id="layoutSidenav_content">
                                    <main>
                                        <div class="container-fluid px-4">
                                            <h1 class="mt-4">Order Management</h1>
                                            <ol class="breadcrumb mb-4">
                                                <li class="breadcrumb-item active"><a href="/admin">Dashboard</a> /
                                                    Order
                                                </li>
                                            </ol>

                                            <div class="row">
                                                <div class="col-12">
                                                    <h5>Order detail with id: ${order.id}</h5>
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Sản phẩm</th>
                                                                <th>Tên</th>
                                                                <th>Giá cả</th>
                                                                <th>Số lượng</th>
                                                                <th>Thành tiền</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="orderDetail" items="${orderDetails}">
                                                                <tr>
                                                                    <th>
                                                                        <div class="d-flex align-items-center">
                                                                            <img src="/img/product/${orderDetail.product.image}"
                                                                                class="img-fluid me-5 rounded-circle"
                                                                                style="width: 80px; height: 80px;"
                                                                                alt="">
                                                                        </div>
                                                                    </th>
                                                                    <td class="align-middle">
                                                                        <a href="/product/${orderDetail.product.id}"
                                                                            target="_blank">${orderDetail.product.name}</a>
                                                                    </td>
                                                                    <td class="align-middle">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${orderDetail.price}" /> đ
                                                                    </td>
                                                                    <td class="align-middle">${orderDetail.quantity}
                                                                    </td>
                                                                    <td class="align-middle">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${orderDetail.price * orderDetail.quantity}" />
                                                                        đ
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>



                                            <div class="card col-5 ms-auto mt-3 mb-3">
                                                <div class="card-header h5">
                                                    Thông tin người nhận
                                                </div>
                                                <div class="card-body">
                                                    <p class="">Tên người nhận: ${order.receiverName} </p>
                                                    <p class="">Địa chỉ người nhận: ${order.receiverAddress}</p>
                                                    <p class="">Sđt người nhận: ${order.receiverPhone}</p>
                                                    <p class="">Tổng thanh toán:
                                                        <fmt:formatNumber type="number" value="${order.totalPrice}" />
                                                        đ
                                                    </p>
                                                    <form:form action="/admin/order/update/${order.id}" method="post">
                                                        <div class="mb-3 d-flex align-items-center">
                                                            <div>Tình trạng đơn hàng:</div>
                                                            <div class="ms-2">
                                                                <select class="form-select"
                                                                    aria-label="Default select example" name="status">
                                                                    <option selected>${order.status}</option>
                                                                    <option value="PENDING">Đang xử lý</option>
                                                                    <option value="SHIPPING">Đang vận chuyển</option>
                                                                    <option value="COMPLETE">Hoàn thành</option>
                                                                    <option value="CANCEL">Hủy</option>
                                                                </select>
                                                            </div>
                                                        </div>


                                                        <a href="/admin/order" class="btn btn-success">Back</a>
                                                        <button class="btn btn-warning">Update</button>
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