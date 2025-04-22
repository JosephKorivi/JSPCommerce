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
    <title>JSPCommerce | Orders</title>
    <%@include file="includes/head.jsp"%>
</head>
<body class="bg-dark text-light">
    <%@include file="includes/navbar.jsp"%>
    <%@include file="includes/footer.jsp"%>
</body>
</html>