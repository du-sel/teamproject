<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Trackers</title>
    <!-- <link rel="stylesheet" href="/resources/css/Intro.css"> -->
    
    <!-- profile page -->
	<link rel="stylesheet" href="/resources/css/profile.css" >

	<!-- FONT -->
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/resources/css/font-awesome.css">

    <link rel="stylesheet" href="/resources/css/custom.css">

    <link rel="stylesheet" href="/resources/css/owl-carousel.css">
    

    <!-- <link rel="stylesheet" href="/resources/css/lightbox.css"> -->
    
    <link rel="stylesheet" href="/resources/css/modal.css"><!-- modal -->

    <link rel="stylesheet" href="/resources/css/animations.css"><!-- tab animation -->
    <link rel="stylesheet" href="/resources/css/community.css" />

	<!-- 검색창 JS -->
    <script src="/resources/js/search.js"></script>

    <!-- jQuery -->
    <script src="/resources/js/jquery-2.1.0.min.js"></script>
     

    <!-- tab JS -->
    <script src="/resources/js/tab.js"></script>

    <!-- intro -->
    <script src="/resources/js/intro.js"></script>

    
    </head>
    
    
    <body class="is-preload">
		<!-- ***** Preloader Start ***** -->
 		<div id="preloader">
	        <div class="jumper">
	            <div></div>
	            <div></div>
	            <div></div>
	        </div>
	    </div>
	    <!-- ***** Preloader End ***** -->
	    
	    
	    <div id="body-back-color"></div>
	    
	    
		<!-- ***** Tab Start ***** -->
	    <div id="tab">
			<div id="co-tab">커뮤니티</div>
			<!-- onclick="location.href='co-main.do'" -->
	        <div id="st-tab">스토어</div>
	        <!-- onclick="location.href='st-main.do'" -->
		</div>
		<!-- ***** Tab End ***** -->
	    
	    
	    
	    <!-- ***** Header Area Start ***** -->
	    <header class="header-area header-sticky">
    		<div id="header-back-color"></div>
	        <div class="container-xl">
	            <div class="row header-row">
	                <div class="col-12">
	                    <nav class="main-nav">
	                        <!-- ***** Menu Start ***** -->
	                        <div class="nav  scroll-y-custom">
	                            <div class="store-menu">
		                            <div class="submenu">
		                                <a>상품</a>
		                                <ul>
		                                	<li class="category">페이지 별</li>
		                                    <li><a href="/store/products">한달 세트</a></li>
		                                    <li><a href="products.html">먼슬리</a></li>
		                                    <li><a href="single-product.html">위클리</a></li>
		                                    <li><a href="contact.html">해빗트래커</a></li>
		                                    <li><a href="contact.html">무드트래커</a></li>
		                                    <li><a href="contact.html">독서트래커</a></li>
		                                    <li><a href="contact.html">가계부</a></li>
		                                    <li><a href="contact.html">스터디</a></li>
		                                    <li><a href="contact.html">스티커</a></li>
		                                    <li><a href="contact.html">그 외</a></li>
		                                    <li class="category">디자인 별</li>
		                                    <li><a href="about.html">미니멀</a></li>
		                                    <li><a href="products.html">일러스트</a></li>
		                                    <li><a href="single-product.html">포토</a></li>
		                                </ul>
	                            	</div>
		    	                    <div>
		                                <a href="/store/creators?page=0&sort=creDate">크리에이터</a>
		                            </div>
								</div>
	                            <!-- ***** Logo Start ***** -->
		                        <div id="logo_container">
	                                <a href="/store/main" class="logo">
	                                    <img src="/resources/images/trackers-navy.svg">
	                                </a>
	                            </div>
	                            <!-- ***** Logo End ***** -->
								<div>

									<div class="search-container">
										<div class="search-icon-container d-flex align-items-center" onclick="showSearchInput();">
											<i class="fa fa-search" aria-hidden="true"></i>
										</div>
										<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />		<!-- 현재 위치 uri -->
										<form name="search" action="
											<c:if test="${path ne '/store/creators'}">
												<c:set var="path" value="/store/products"/>
											</c:if>
											${path}" class="search-input-container">
											<input type="hidden" name="page" value="0">
											<input type="hidden" name="sort" value="${sort}">
											<input type="text" name="keyword">
											<button class="search-btn">검색</button>
										</form>
									</div>
									<c:choose>
										<c:when test="${!empty sessionScope.id}"> <!-- if와 동일 -->
											<div id="user-menu" class="scroll-to-section submenu">
			                          			<img src="/resources/images/baner-right-image-02.jpg" alt="프로필사진" id="profile-image">
			                          			<ul>
				                                    <li><a href="cart.do">장바구니</a></li>
				                                    <li><a href="news.do">내 소식</a></li>
				                                    <li><a href="/store/purchases">구매 내역</a></li>
				                                    <li><a href="inquiry-history.do">문의 내역</a></li>
				                                    <li><a href="/users?path=info">회원정보 변경</a></li>
				                                    <li><a href="/users?path=pwd">비밀번호 변경</a></li>
				                                    <li><a href="/users/logout">로그아웃</a></li>
				                                </ul>
			                          		</div>
			                          		<div class="scroll-to-section"><a href="/profiles">마이프로필</a></div>
										</c:when>
										<c:otherwise> 
											<div class="scroll-to-section" onclick="onSigninModal()"><a href="#" data-toggle="modal" data-target="#modal">로그인</a></div>
	                          				<div class="scroll-to-section" onclick="onSignupModal()"><a href="#" data-toggle="modal" data-target="#modal">회원가입</a></div>
	                          			</c:otherwise>
									</c:choose>
	                            </div>
	                        </div> 	       
							
							<div class="nav-mobile">
								<!-- <div class="logo-mobile-container">
	                                <a href="st-main.do" class="logo">
	                                    <img src="/resources/images/trackers-mobile.svg">
	                                </a>
	                            </div> -->
								<a class='menu-trigger'>
		                            <span>Menu</span>
		                        </a>
							</div>                  
	                        <!-- ***** Menu End ***** -->
	                	</nav>
	                </div>
	            </div>
	        </div>
	    </header>
	    <!-- ***** Header Area End ***** -->
	
	    <!-- ***** Modal Start ***** -->
		<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-container" role="document" >
	      <div class="modal-content">
				</div>
	     </div>
	  	</div>
		<!-- ***** Modal End ***** -->
    
    

    
    