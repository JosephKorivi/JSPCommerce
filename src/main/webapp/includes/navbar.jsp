<nav class="navbar navbar-expand-lg bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand text-light" href="index.jsp"><h3 class="mx-2">JSPCommerce</h3></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link active text-light" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" href="cart.jsp">Cart</a>
                </li>
                <%if (auth != null) {%>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="orders.jsp">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="LogoutServlet">Logout</a>
                        </li>
                <%  } else { %>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="login.jsp">Login</a>
                        </li>
                <%  }
                %>
            </ul>
        </div>
    </div>
</nav>