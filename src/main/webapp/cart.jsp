<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.jspcommerce.models.*" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSPCommerce | Cart</title>
    <%@include file="includes/head.jsp"%>
    <style>
        .table {
            vertical-align: middle;
        }
        .btn-incre, .btn-decre {
            box-shadow: none;
            font-size: 25px;
        }
    </style>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>

    <div class="container">
        <div class="d-flex py-3">
            <h3>Total Price : $452</h3>
            <a href="#" class="mx-3 btn btn-primary">Check Outs</a>
        </div>
        <table class="table table-light">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Price</th>
                <th scope="col">Buy Now</th>
                <th scope="col">Cancel</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Women Shoes</td>
                <td>Shoes</td>
                <td>45$</td>
                <td>
                    <form action="" method="post" class="form-inline">
                        <input type="hidden" name="id" value="1" class="form-input">
                        <div class="form-group d-flex justify-content-between">
                            <a href="" class="btn btn-sm btn-decre"><i class="fas fa-minus-square"></i></a>
                            <input type="text" name="quantity" value="1" class="form-control" readonly>
                            <a href="" class="btn btn-sm btn-incre"><i class="fas fa-plus-square"></i></a>
                        </div>
                    </form>
                </td>
                <td><a href="" class="btn btn-sm btn-danger">Remove</a></td>
            </tr>
            </tbody>
        </table>
    </div>
    <%@include file="includes/footer.jsp"%>
</body>
</html>