<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.shashi.service.impl.*, com.shashi.service.*"%>
<!DOCTYPE html>
<html>
<head>
<title>TechSphere</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<%
String userType = (String) session.getAttribute("usertype");
String searchTarget = "index.jsp";
if ("customer".equalsIgnoreCase(userType))   searchTarget = "userHome.jsp";
else if ("admin".equalsIgnoreCase(userType)) searchTarget = "adminViewProduct.jsp";
%>

<%-- ===== GUEST NAVBAR ===== --%>
<% if (userType == null) { %>

<nav class="navbar navbar-default navbar-fixed-top ts-navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#tsNav">
        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
      </button>
      <a class="navbar-brand ts-brand" href="index.jsp">&#x26a1; TechSphere</a>
    </div>
    <div class="collapse navbar-collapse" id="tsNav">
      <form class="navbar-form navbar-left ts-searchbar" action="<%=searchTarget%>" method="get">
        <div class="input-group ts-search-group">
          <span class="input-group-addon ts-search-addon"><i class="fa fa-search"></i></span>
          <input type="text" name="search" class="form-control ts-search-input" placeholder="Search mobiles, laptops, TVs&hellip;" required>
          <span class="input-group-btn">
            <button class="btn ts-search-btn" type="submit">Search</button>
          </span>
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right ts-nav-links">
        <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="login.jsp"><i class="fa fa-sign-in"></i> Login</a></li>
        <li class="ts-register-li"><a href="register.jsp"><i class="fa fa-user-plus"></i> Register</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-th-large"></i> Categories <span class="caret"></span>
          </a>
          <ul class="dropdown-menu ts-dropdown">
            <li><a href="index.jsp?type=mobile"><i class="fa fa-mobile"></i>&nbsp; Mobiles</a></li>
            <li><a href="index.jsp?type=tv"><i class="fa fa-television"></i>&nbsp; TVs</a></li>
            <li><a href="index.jsp?type=laptop"><i class="fa fa-laptop"></i>&nbsp; Laptops</a></li>
            <li><a href="index.jsp?type=camera"><i class="fa fa-camera"></i>&nbsp; Cameras</a></li>
            <li><a href="index.jsp?type=speaker"><i class="fa fa-volume-up"></i>&nbsp; Speakers</a></li>
            <li><a href="index.jsp?type=tablet"><i class="fa fa-tablet"></i>&nbsp; Tablets</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<%-- ===== CUSTOMER NAVBAR ===== --%>
<% } else if ("customer".equalsIgnoreCase(userType)) {
   int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username")); %>

<nav class="navbar navbar-default navbar-fixed-top ts-navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#tsNav">
        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
      </button>
      <a class="navbar-brand ts-brand" href="userHome.jsp">&#x26a1; TechSphere</a>
    </div>
    <div class="collapse navbar-collapse" id="tsNav">
      <form class="navbar-form navbar-left ts-searchbar" action="<%=searchTarget%>" method="get">
        <div class="input-group ts-search-group">
          <span class="input-group-addon ts-search-addon"><i class="fa fa-search"></i></span>
          <input type="text" name="search" class="form-control ts-search-input" placeholder="Search products&hellip;" required>
          <span class="input-group-btn">
            <button class="btn ts-search-btn" type="submit">Search</button>
          </span>
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right ts-nav-links">
        <li><a href="userHome.jsp"><i class="fa fa-home"></i> Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-th-large"></i> Categories <span class="caret"></span>
          </a>
          <ul class="dropdown-menu ts-dropdown">
            <li><a href="userHome.jsp?type=mobile"><i class="fa fa-mobile"></i>&nbsp; Mobiles</a></li>
            <li><a href="userHome.jsp?type=tv"><i class="fa fa-television"></i>&nbsp; TVs</a></li>
            <li><a href="userHome.jsp?type=laptop"><i class="fa fa-laptop"></i>&nbsp; Laptops</a></li>
            <li><a href="userHome.jsp?type=camera"><i class="fa fa-camera"></i>&nbsp; Cameras</a></li>
            <li><a href="userHome.jsp?type=speaker"><i class="fa fa-volume-up"></i>&nbsp; Speakers</a></li>
            <li><a href="userHome.jsp?type=tablet"><i class="fa fa-tablet"></i>&nbsp; Tablets</a></li>
          </ul>
        </li>
        <li class="ts-cart-li">
          <a href="cartDetails.jsp" class="ts-cart-link">
            <i class="fa fa-shopping-cart"></i>
            <% if (notf > 0) { %><span class="ts-cart-count"><%=notf%></span><% } %>
            Cart
          </a>
        </li>
        <li><a href="orderDetails.jsp"><i class="fa fa-list-alt"></i> Orders</a></li>
        <li><a href="userProfile.jsp"><i class="fa fa-user-circle-o"></i> Profile</a></li>
        <li class="ts-logout-li"><a href="./LogoutSrv"><i class="fa fa-sign-out"></i> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<%-- ===== ADMIN NAVBAR ===== --%>
<% } else { %>

<nav class="navbar navbar-default navbar-fixed-top ts-navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#tsNav">
        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
      </button>
      <a class="navbar-brand ts-brand" href="adminViewProduct.jsp">
        &#x26a1; TechSphere <span class="ts-admin-pill">ADMIN</span>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="tsNav">
      <form class="navbar-form navbar-left ts-searchbar" action="<%=searchTarget%>" method="get">
        <div class="input-group ts-search-group">
          <span class="input-group-addon ts-search-addon"><i class="fa fa-search"></i></span>
          <input type="text" name="search" class="form-control ts-search-input" placeholder="Search products&hellip;" required>
          <span class="input-group-btn">
            <button class="btn ts-search-btn" type="submit">Search</button>
          </span>
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right ts-nav-links">
        <li><a href="adminViewProduct.jsp"><i class="fa fa-th-large"></i> Products</a></li>
        <li><a href="adminStock.jsp"><i class="fa fa-cubes"></i> Stock</a></li>
        <li><a href="shippedItems.jsp"><i class="fa fa-truck"></i> Shipped</a></li>
        <li><a href="unshippedItems.jsp"><i class="fa fa-clock-o"></i> Orders</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-cog"></i> Manage <span class="caret"></span>
          </a>
          <ul class="dropdown-menu ts-dropdown">
            <li><a href="addProduct.jsp"><i class="fa fa-plus-circle"></i>&nbsp; Add Product</a></li>
            <li><a href="removeProduct.jsp"><i class="fa fa-trash"></i>&nbsp; Remove Product</a></li>
            <li><a href="updateProductById.jsp"><i class="fa fa-edit"></i>&nbsp; Update Product</a></li>
          </ul>
        </li>
        <li class="ts-logout-li"><a href="./LogoutSrv"><i class="fa fa-sign-out"></i> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<% } %>

</body>
</html>
