<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp" %>
<!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="img/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <security:authorize access = "isAnonymous()">
                            <div class="header__top__right__auth">
                                <a href="/login"><i class="fa fa-user"></i> Login</a>
                            </div>
                            </security:authorize>
                            <security:authorize access = "isAuthenticated()">
                            <div class="header__top__right__auth">
                                <a href="/logout"><i class="fa fa-user"></i> Logout</a>
                            </div>
                            </security:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="/home">Home</a></li>
                            <li><a href="/home/shop">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="/home/shop">Shop Details</a></li>
                                    <li><a href="/customer/shopcard">Shoping Cart</a></li>
                                    <li><a href="./#">Check Out</a></li>
                                    <li><a href="./#">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./#">Blog</a></li>
                            <li><a href="./#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                <security:authorize access = "isAuthenticated()">
                    <div class="header__cart">
                        <ul>
                            
                            <li><a href="customer/shopcard"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </security:authorize>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
       <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>