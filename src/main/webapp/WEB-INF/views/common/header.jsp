<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Trackers</title>
    
    <!-- 내가 작성 -->
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

    <!-- jQuery -->
    <script src="/resources/js/jquery-2.1.0.min.js"></script>
    
    <!-- tab JS -->
    <script src="/resources/js/tab.js"></script>

<!--탭 부분 -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

       
    <script>
		$( document ).ready( function() {
			$( 'button.comment' ).click( function() {
			$( '.divcomment' ).slideToggle();
			} );
		} );
	</script>
    
    
    
    

    
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
	    
	    
	    
		<!-- ***** Tab Start ***** -->
	    <div id="tab">
			<div id="co-tab" ></div>
			<!-- onclick="location.href='co-main.do'" -->
	        <div id="st-tab" class="active"></div>
	         <!-- onclick="location.href='st-main.do'" -->
		</div>
		<!-- ***** Tab End ***** -->
	    
	    
	    
	    <!-- ***** Header Area Start ***** -->
	    <header class="header-area header-sticky">
	        <div class="container-xl">
	            <div class="row header-row">
	                <div class="col-12">
	                    <nav class="main-nav">
	                        <!-- ***** Menu Start ***** -->
	                        <div class="nav">
	                            <div>
		                            <div class="submenu">
		                                <a href="products.do">상품</a>
		                                <ul>
		                                    <li><a href="about.html">About Us</a></li>
		                                    <li><a href="products.html">Products</a></li>
		                                    <li><a href="single-product.html">Single Product</a></li>
		                                    <li><a href="contact.html">Contact Us</a></li>
		                                </ul>
	                            	</div>
		    	                    <div>
		                                <a href="creators.do">크리에이터</a>
		                            </div>
								</div>
	                            <!-- ***** Logo Start ***** -->
		                        <div id="logo_container">
	                                <a href="st-main.do" class="logo">
	                                    <img src="/resources/images/trackers-navy.svg">
	                                </a>
	                            </div>
	                            <!-- ***** Logo End ***** -->
								<div>
	                           		<!-- <div class="scroll-to-section" onclick="onSigninModal()"><a href="#" data-toggle="modal" data-target="#modal">로그인</a></div>
	                          		<div class="scroll-to-section" onclick="onSignupModal()"><a href="#" data-toggle="modal" data-target="#modal">회원가입</a></div> -->
	                          		<div id="user-menu" class="scroll-to-section submenu">
	                          			<img src="/resources/images/baner-right-image-02.jpg" alt="프로필사진" id="profile-image">
	                          			<ul>
		                                    <li><a href="cart.do">장바구니</a></li>
		                                    <li><a href="news.do">내 소식</a></li>
		                                    <li><a href="purchase-history.do">구매 내역</a></li>
		                                    <li><a href="inquiry-history.do">문의 내역</a></li>
		                                    <li><a href="user-modify.do">회원정보 변경</a></li>
		                                    <li><a href="user-pwd-modify.do">비밀번호 변경</a></li>
		                                    <li><a href="logout.do">로그아웃</a></li>
		                                </ul>
	                          		</div>
	                          		<div class="scroll-to-section" onclick="onShopModal()"><a href="#" data-toggle="modal" data-target="#modal">마이프로필</a></div>
	                            </div>
	                        </div> 	       
							
							<div class="nav-mobile">
								<div class="logo-mobile-container">
	                                <a href="st-main.do" class="logo">
	                                    <img src="/resources/images/trackers-mobile.svg">
	                                </a>
	                            </div>
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
    
    

    
    