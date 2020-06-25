<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
 

    <!-- Humberger Begin -->

    <!-- Humberger End -->
    	<!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                        <c:forEach var="item" items ="${categorymodel.listResult}">
                        <li><a href="#">${item.name}</a></li>
                        </c:forEach>
                            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="image/smartphone-background.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                	<c:forEach var="item" items ="${categorymodel.listResult}">
                    <div class="col-lg-3">
                    <c:set var="url" value="${item.urlthumbnail}" />
                        <div class="categories__item set-bg" data-setbg="${url}">
                            <h5><a href="#">${item.name}</a></h5>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <c:forEach var="item" items ="${categorymodel.listResult}">
                            <li data-filter=".${item.name}">${item.name}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            	<c:forEach var="category" items ="${itemModel}">	
            		<c:forEach var="item" items ="${category.listResult}">
                		<div class="col-lg-3 col-md-4 col-sm-6 mix ${item.categoryCode}">
                    		<div class="featured__item">
                       			<div class="featured__item__pic set-bg" data-setbg="${item.urlthumbnail}">
                            		<ul class="featured__item__pic__hover">
                                		<li><a href="#"><i class="fa fa-heart"></i></a></li>
                                		<li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                		<security:authorize access = "isAuthenticated()">
                                		<li><a href="/customer/${item.id}"><i class="fa fa-shopping-cart"></i></a></li>
                            			</security:authorize>
                            			
                            			<security:authorize access = "isAnonymous()">
                            			<li><a href="javascript:alert('login to add card');"><i class="fa fa-shopping-cart"></i></a></li>
                            			
                            			</security:authorize>
                            		</ul>
                        		</div>
                        		<div class="featured__item__text">
                            		<h6><a href="/home/shop/${item.id}">${item.name}</a></h6>
                            		<h5>$${item.price}</h5>
                        		</div>
                    		</div>
                		</div>
                	</c:forEach>
              	</c:forEach> 
            </div>
        </div>
    </section>
    <!-- Featured Section End -->
</body>
</html>
