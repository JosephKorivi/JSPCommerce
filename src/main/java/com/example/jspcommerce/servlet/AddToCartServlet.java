package com.example.jspcommerce.servlet;

import com.example.jspcommerce.models.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "AddToCartServlet", value = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        try (PrintWriter out = response.getWriter()) {
            ArrayList<Cart> cartList = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            Cart cart = new Cart();
            cart.setId(id);
            cart.setQuantity(1);
            HttpSession session = request.getSession();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
            if (cart_list == null) {
                cartList.add(cart);
                session.setAttribute("cart-list", cartList);
                out.println("Session Created and add the list");
            } else {
                cartList = cart_list;
                boolean exist = false;
                for (Cart c : cartList) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<h3 style='color: crimson; text-align='center'>Item Already Exists in the Cart.<a href='cart.jsp'>Go to Cart Page</a></h3>");
                    }
                }
                if (!exist) {
                    cartList.add(cart);
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}