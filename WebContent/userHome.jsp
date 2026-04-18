<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.shashi.service.impl.*,com.shashi.service.*,com.shashi.beans.*,java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>TECH SPHERE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
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
ProductServiceImpl prodDao = new ProductServiceImpl();
List<ProductBean> products = new ArrayList<ProductBean>();
String search  = request.getParameter("search");
String type    = request.getParameter("type");
String message = "All Products";
if (search != null) {
    products = prodDao.searchAllProducts(search);
    message = "Results for &ldquo;" + search + "&rdquo;";
} else if (type != null) {
    products = prodDao.getAllProductsByType(type);
    message = type.substring(0,1).toUpperCase() + type.substring(1) + "s";
} else {
    products = prodDao.getAllProducts();
}
if (products.isEmpty()) {
    message = "No results &mdash; showing all products";
    products = prodDao.getAllProducts();
}
%>

<jsp:include page="header.jsp" />

<!-- ====== SWIPER BANNER ====== -->
<div class="swiper hero-swiper">
    <div class="swiper-wrapper">
        <!-- Slide 1 -->
        <div class="swiper-slide hero-slide" style="background: linear-gradient(135deg, #7c3aed 0%, #9333ea 45%, #ec4899 100%);">
            <div class="hero-content">
                <span class="hero-tag">🆕 NEW ARRIVALS</span>
                <h2 class="hero-title">Latest Smartphones</h2>
                <p class="hero-desc">iPhone 13, Pixel 6a & more</p>
                <a href="userHome.jsp?type=mobile" class="hero-btn">Shop Mobiles →</a>
            </div>
            <div class="hero-image">📱</div>
        </div>
        <!-- Slide 2 -->
        <div class="swiper-slide hero-slide" style="background: linear-gradient(135deg, #0ea5e9 0%, #3b82f6 45%, #8b5cf6 100%);">
            <div class="hero-content">
                <span class="hero-tag">💻 WORK & PLAY</span>
                <h2 class="hero-title">Powerful Laptops</h2>
                <p class="hero-desc">Intel & Ryzen from ₹30,000</p>
                <a href="userHome.jsp?type=laptop" class="hero-btn">Shop Laptops →</a>
            </div>
            <div class="hero-image">💻</div>
        </div>
        <!-- Slide 3 -->
        <div class="swiper-slide hero-slide" style="background: linear-gradient(135deg, #f97316 0%, #ef4444 45%, #db2777 100%);">
            <div class="hero-content">
                <span class="hero-tag">📺 ENTERTAINMENT</span>
                <h2 class="hero-title">4K Smart TVs</h2>
                <p class="hero-desc">Android & QLED from ₹12,000</p>
                <a href="userHome.jsp?type=tv" class="hero-btn">Shop TVs →</a>
            </div>
            <div class="hero-image">📺</div>
        </div>
    </div>
    <div class="swiper-pagination"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>
<!-- ====== END BANNER ====== -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
const heroSwiper = new Swiper('.hero-swiper', {
    loop: true,
    autoplay: { delay: 5000, disableOnInteraction: false },
    pagination: { el: '.swiper-pagination', clickable: true },
    navigation: { nextEl: '.swiper-button-next', prevEl: '.swiper-button-prev' },
    speed: 800,
    effect: 'slide'
});
</script>

<!-- ====== 3-COLUMN LAYOUT ====== -->
<div class="container-fluid ts-layout">
    <div class="row">

        <!-- LEFT SIDEBAR -->
        <div class="col-md-2 hidden-sm hidden-xs">
            <div class="ts-widget">
                <div class="ts-widget-head">Browse</div>
                <a href="userHome.jsp" class="ts-cat-link"><span class="ts-emoji">&#128722;</span> All Products</a>
                <a href="userHome.jsp?type=mobile" class="ts-cat-link"><span class="ts-emoji">&#128241;</span> Mobiles</a>
                <a href="userHome.jsp?type=laptop" class="ts-cat-link"><span class="ts-emoji">&#128187;</span> Laptops</a>
                <a href="userHome.jsp?type=tv" class="ts-cat-link"><span class="ts-emoji">&#128250;</span> Smart TVs</a>
                <a href="userHome.jsp?type=camera" class="ts-cat-link"><span class="ts-emoji">&#128247;</span> Cameras</a>
                <a href="userHome.jsp?type=speaker" class="ts-cat-link"><span class="ts-emoji">&#128266;</span> Speakers</a>
                <a href="userHome.jsp?type=tablet" class="ts-cat-link"><span class="ts-emoji">&#128203;</span> Tablets</a>
            </div>
        </div>

        <!-- PRODUCTS GRID -->
        <div class="col-md-8 col-sm-12 col-xs-12">
            <div class="page-label"><%=message%></div>
            <div class="row text-center">
                <%
                for (ProductBean product : products) {
                    int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
                    String desc = product.getProdInfo();
                    desc = desc.substring(0, Math.min(desc.length(), 90));
                %>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <div class="prod-img-area">
                            <img src="./ShowImage?pid=<%=product.getProdId()%>" alt="<%=product.getProdName()%>">
                        </div>
                        <div class="prod-body">
                            <p class="productname"><%=product.getProdName()%></p>
                            <p class="productinfo"><%=desc%>&hellip;</p>
                            <p class="price"><span class="price-symbol">&#8377;</span><%=product.getProdPrice()%></p>
                            <div class="prod-actions">
                                <% if (cartQty == 0) { %>
                                <form method="post">
                                    <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1" class="btn btn-success">
                                        <i class="fa fa-cart-plus"></i> Add
                                    </button>
                                    <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1" class="btn btn-primary">
                                        <i class="fa fa-bolt"></i> Buy Now
                                    </button>
                                </form>
                                <% } else { %>
                                <form method="post">
                                    <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0" class="btn btn-danger">
                                        <i class="fa fa-trash"></i> Remove
                                    </button>
                                    <button type="submit" formaction="cartDetails.jsp" class="btn btn-success">
                                        <i class="fa fa-check"></i> Checkout
                                    </button>
                                </form>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>

        <!-- RIGHT SIDEBAR -->
        <div class="col-md-2 hidden-sm hidden-xs">
            <div class="ts-widget">
                <div class="ts-widget-head ts-deals-head">&#128293; Hot Deals</div>
                <div class="ts-deal-item">
                    <div class="ts-deal-name">MOTOROLA G32</div>
                    <div class="ts-deal-price">&#8377;11,999</div>
                    <div class="ts-deal-tag">&#9650; Best Seller</div>
                </div>
                <div class="ts-deal-item">
                    <div class="ts-deal-name">Infinix Y1 Smart TV</div>
                    <div class="ts-deal-price">&#8377;8,499</div>
                    <div class="ts-deal-tag">&#9830; Budget Pick</div>
                </div>
                <div class="ts-deal-item">
                    <div class="ts-deal-name">REDMI Note 12 Pro</div>
                    <div class="ts-deal-price">&#8377;24,999</div>
                    <div class="ts-deal-tag">&#11088; Top Rated</div>
                </div>
                <div class="ts-deal-item">
                    <div class="ts-deal-name">HP Core i5 Laptop</div>
                    <div class="ts-deal-price">&#8377;40,990</div>
                    <div class="ts-deal-tag">&#128293; Trending</div>
                </div>
            </div>
            <div class="ts-widget" style="margin-top:12px;">
                <div class="ts-widget-head">Why TechSphere?</div>
                <div class="ts-trust-item"><span class="ts-trust-icon">&#128274;</span> Secure Payments</div>
                <div class="ts-trust-item"><span class="ts-trust-icon">&#128666;</span> Fast Delivery</div>
                <div class="ts-trust-item"><span class="ts-trust-icon">&#128257;</span> Easy Returns</div>
                <div class="ts-trust-item"><span class="ts-trust-icon">&#127919;</span> 1-Year Warranty</div>
                <div class="ts-trust-item"><span class="ts-trust-icon">&#128222;</span> 24/7 Support</div>
            </div>
        </div>

    </div>
</div>
<!-- ====== END LAYOUT ====== -->

<%@ include file="footer.html"%>
</body>
</html>
