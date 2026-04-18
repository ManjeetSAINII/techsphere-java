<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart &mdash; TechSphere</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<%
String userName = (String) session.getAttribute("username");
String password = (String) session.getAttribute("password");

if (userName == null || password == null) {
    response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
}

String addS = request.getParameter("add");
if (addS != null) {
    int add = Integer.parseInt(addS);
    String uid = request.getParameter("uid");
    String pid = request.getParameter("pid");
    int avail   = Integer.parseInt(request.getParameter("avail"));
    int cartQty = Integer.parseInt(request.getParameter("qty"));
    CartServiceImpl cart = new CartServiceImpl();
    if (add == 1) {
        cartQty += 1;
        if (cartQty <= avail) {
            cart.addProductToCart(uid, pid, 1);
        } else {
            response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
        }
    } else if (add == 0) {
        cart.removeProductFromCart(uid, pid);
    }
}
%>

<jsp:include page="header.jsp" />

<!-- Cart title -->
<div class="cart-title">
	<i class="fa fa-shopping-cart" style="width:auto;height:auto;font-size:12px;margin-right:7px;color:#4f46e5;"></i>
	Shopping Cart
</div>

<div class="container" style="padding-bottom:48px;">
	<div class="cart-wrap">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width:70px;">Image</th>
					<th>Product</th>
					<th>Unit Price</th>
					<th>Qty</th>
					<th style="width:44px;text-align:center;">+</th>
					<th style="width:44px;text-align:center;">&minus;</th>
					<th>Subtotal</th>
				</tr>
			</thead>
			<tbody>

				<%
				CartServiceImpl cart = new CartServiceImpl();
				List<CartBean> cartItems = cart.getAllCartItems(userName);
				double totAmount = 0;

				for (CartBean item : cartItems) {
					String prodId   = item.getProdId();
					int prodQuantity = item.getQuantity();
					ProductBean product = new ProductServiceImpl().getProductDetails(prodId);
					double currAmount = product.getProdPrice() * prodQuantity;
					totAmount += currAmount;

					if (prodQuantity > 0) {
				%>

				<tr>
					<td>
						<img class="cart-img" src="./ShowImage?pid=<%=product.getProdId()%>" alt="<%=product.getProdName()%>">
					</td>
					<td style="font-weight:600;color:#0f172a;"><%=product.getProdName()%></td>
					<td style="color:#4f46e5;font-weight:700;">&#8377;&nbsp;<%=product.getProdPrice()%></td>
					<td>
						<form method="post" action="./UpdateToCart" class="qty-form">
							<input type="number" name="pqty" value="<%=prodQuantity%>" min="0">
							<input type="hidden" name="pid" value="<%=product.getProdId()%>">
							<input type="submit" value="Update">
						</form>
					</td>
					<td style="text-align:center;">
						<a class="cart-icon-btn"
							href="cartDetails.jsp?add=1&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>">
							<i class="fa fa-plus" style="width:auto;height:auto;font-size:13px;"></i>
						</a>
					</td>
					<td style="text-align:center;">
						<a class="cart-icon-btn"
							href="cartDetails.jsp?add=0&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>">
							<i class="fa fa-minus" style="width:auto;height:auto;font-size:13px;"></i>
						</a>
					</td>
					<td style="font-weight:700;">&#8377;&nbsp;<%=currAmount%></td>
				</tr>

				<%
				}
				}
				%>

				<!-- Total row -->
				<tr class="cart-total-row">
					<td colspan="6" style="text-align:right;letter-spacing:0.5px;">
						<i class="fa fa-tag" style="width:auto;height:auto;font-size:13px;margin-right:6px;color:#4f46e5;"></i>
						Total Amount (INR)
					</td>
					<td class="cart-total-amount">&#8377;&nbsp;<%=totAmount%></td>
				</tr>

				<%
				if (totAmount != 0) {
				%>

				<!-- Action row -->
				<tr class="cart-action-row">
					<td colspan="4"></td>
					<td colspan="1">
						<form method="post">
							<button formaction="userHome.jsp" class="btn btn-danger"
								style="border-radius:8px;font-size:12px;padding:7px 14px;">
								<i class="fa fa-times" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Cancel
							</button>
						</form>
					</td>
					<td colspan="2" style="text-align:right;">
						<form method="post">
							<button class="btn btn-primary"
								style="border-radius:8px;font-size:12px;padding:7px 18px;"
								formaction="payment.jsp?amount=<%=totAmount%>">
								<i class="fa fa-credit-card" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Pay &#8377;&nbsp;<%=totAmount%>
							</button>
						</form>
					</td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>
	</div>
</div>

<%@ include file="footer.html"%>

</body>
</html>
