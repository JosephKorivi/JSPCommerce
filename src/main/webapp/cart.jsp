<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.jspcommerce.models.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="com.example.jspcommerce.connection.DbCon" %>
<%@ page import="com.example.jspcommerce.dao.ProductDao" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);
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
            <h3>Total Price : $ ${(total > 0) ? dcf.format(total) : 0}</h3>
            <a href="CheckOutServlet" class="mx-3 btn btn-primary">Check Outs</a>
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
            <%
                if (cart_list != null) {
                    for (Cart c : cartProduct) { %>
                        <tr>
                            <td><%= c.getName()%></td>
                            <td><%= c.getCategory()%></td>
                            <td><%= dcf.format(c.getPrice())%>$</td>
                            <td>
                                <form action="OrderNowServlet" method="post" class="d-flex align-items-center gap-2">
                                    <input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
                                    <div class="form-group d-flex align-items-center">
                                        <a href="QuantityIncDecServlet?action=dec&id=<%=c.getId()%>" class="btn btn-sm btn-decre"><i class="fas fa-minus-square"></i></a>
                                        <input type="text" name="quantity" value="<%= c.getQuantity()%>" class="form-control mx-1" readonly style="width: 50px;">
                                        <a href="QuantityIncDecServlet?action=inc&id=<%=c.getId()%>" class="btn btn-sm btn-incre"><i class="fas fa-plus-square"></i></a>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                                </form>
                            </td>
                            <td><a href="RemoveFromCartServlet?id=<%= c.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
                        </tr>
                    <%}
                }
            %>
            </tbody>
        </table>
    </div>
    <%@include file="includes/footer.jsp"%>
</body>
</html>