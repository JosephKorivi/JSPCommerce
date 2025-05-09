<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.example.jspcommerce.models.*" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
//        request.setAttribute("auth", auth);
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSPCommerce | Login</title>
    <%@include file="includes/head.jsp"%>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>
    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center">User Login</div>
            <div class="card-body">
                <form action="./LoginServlet" method="post">
                    <div class="form-group">
                        <label for="Email Address">Email Address</label>
                        <input type="email" class="form-control" name="login-email" placeholder="Enter Your Email" id="Email Address"required>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="login-password" placeholder="Enter Your Password" id="password" required>
                    </div>
                    <br>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@include file="includes/footer.jsp"%>
</body>
</html>