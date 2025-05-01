<%@ page import="com.example.jspcommerce.connection.DbCon" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.jspcommerce.models.*" %>
<%@ page import="com.example.jspcommerce.dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }

    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSPCommerce</title>
    <%@include file="includes/head.jsp"%>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>
    <div class="container">
        <div class="card-header my-3">All Products</div>
        <div class="row">
            <%
                if (!products.isEmpty()) {
                    for (Product p : products) {%>
                        <div class="col-md-3 my-3">
                            <div class="card w-100" style="width: 18rem;">
                                <img src="product-images/<%= p.getImage() %>" class="card-img-top" alt="Adidas Mens Shoes">
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getName() %></h5>
                                    <h6 class="price">Price : $<%= p.getPrice() %></h6>
                                    <h6 class="catogory">Category : <%= p.getCategory() %></h6>
                                    <div class="mt-3 d-flex justify-content-between">
                                        <a href="AddToCartServlet?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a>
                                        <a href="#" class="btn btn-primary">Buy Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                  <% }
                } %>
        </div>
    </div>
    <%@include file="includes/footer.jsp"%>
</body>
</html>