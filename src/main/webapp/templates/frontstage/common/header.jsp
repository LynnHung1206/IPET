<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
</head>

<body>
    <header class="header-area">
        <div class="header-top theme-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-12">
                        <div class="welcome-area">
                            <p>歡迎蒞臨IPET寵物商城</p>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-12">
                        <div class="account-curr-lang-wrap f-right">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bottom transparent-bar">
            <div class="container">
                <div class="row">
                    <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-5">
                        <div class="logo pt-39">
                            <a href="index.html"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/logo/logo.png"></a>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-7 d-none d-lg-block">
                        <div class="main-menu text-center">
                            <nav>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/ipet-front/news/allNews">最新消息</a></li>
                                    <li><a href="shop.jsp">商城</a>
                                        <ul class="submenu">
                                            <li>
                                                <ul>
                                                    <li><a href="category?typeID=1">食品</a></li>
													<li><a href="category?typeID=2">玩具</a></li>
													<li><a href="category?typeID=3">居家用品</a></li>
													<li><a href="category?typeID=4">外出用品</a></li>
													<li><a href="category?typeID=5">美容用品</a></li>
													<li><a href="category?typeID=6">其他雜貨</a></li>
                                                </ul>
                                            </li>
                                    </li>
                                </ul>
                                </li>
                                <li><a href="#">住宿</a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="">住宿環境</a>
                                        </li>
                                        <li>
                                            <a href="shop-page.html">房型參考</a>
                                        </li>
                                        <li>
                                            <a href="shop-list.html">我要預約</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="salon_category.html">美容</a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="blog.html">美容作品</a>
                                        </li>
                                        <li>
                                            <a href="blog-leftsidebar.html">注意事項</a>
                                        </li>
                                        <li>
                                            <a href="blog-details.html">我要預約</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="about-us.html">關於我們</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-8 col-sm-8 col-7">
                        <div class="search-login-cart-wrapper">
                            <div class="header-search same-style">
                                <button class="search-toggle">
                                    <i class="icon-magnifier s-open"></i>
                                    <i class="ti-close s-close"></i>
                                </button>
                                <div class="search-content">
                                    <form action="#">
                                        <input type="text" placeholder="Search">
                                        <button>
                                            <i class="icon-magnifier"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="header-login same-style">
                                <a href="login-register.html"><i class="icon-user icons"></i></a>
                            </div>
                            <div class="header-cart same-style">
                                <button class="icon-cart">
                                    <i class="icon-handbag"></i>
                                    <span class="count-style">0</span>
                                </button>
                                <div class="shopping-cart-content">
<!--                                     <ul> -->
<!--                                         <li class="single-shopping-cart"> -->
<!--                                             <div class="shopping-cart-img"> -->
<%--                                                 <a href="#"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/cart/cart-1.jpg"></a> --%>
<!--                                             </div> -->
<!--                                             <div class="shopping-cart-title"> -->
<!--                                                 <h4><a href="#">Dog Calcium Food </a></h4> -->
<!--                                                 <h6>Qty: 02</h6> -->
<!--                                                 <span>$260.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="shopping-cart-delete"> -->
<!--                                                 <a href="#"><i class="ti-close"></i></a> -->
<!--                                             </div> -->
<!--                                         </li> -->
<!--                                         <li class="single-shopping-cart"> -->
<!--                                             <div class="shopping-cart-img"> -->
<%--                                                 <a href="#"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/cart/cart-2.jpg"></a> --%>
<!--                                             </div> -->
<!--                                             <div class="shopping-cart-title"> -->
<!--                                                 <h4><a href="#">Dog Calcium Food</a></h4> -->
<!--                                                 <h6>Qty: 02</h6> -->
<!--                                                 <span>$260.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="shopping-cart-delete"> -->
<!--                                                 <a href="#"><i class="ti-close"></i></a> -->
<!--                                             </div> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                     <div class="shopping-cart-total"> -->
<!--                                         <h4>Shipping : <span>$20.00</span></h4> -->
<!--                                         <h4>Total : <span class="shop-total">$260.00</span></h4> -->
<!--                                     </div> -->
                                    <div class="shopping-cart-btn">
                                        <a href="cart.jsp">查看購物車</a>
                                        <a href="wishList.jsp">查看我的最愛</a>
                                        <a href="checkout.jsp">結帳去</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    </body>
    </html>