<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- 
  =========================================
		dash-board template  
  =========================================
   -->     
    
  <!-- Fonts and icons -->
  <!-- <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet"> -->
  
  <!-- Nucleo Icons -->
  <link href="/resources/css/nucleo-icons.css" rel="stylesheet" />
  
  <!-- CSS Files -->
  <link href="/resources/css/black-dashboard.css" rel="stylesheet" />
  
    

<jsp:include page="/WEB-INF/views/common/header.jsp" />



  <main id="inquiry-management-form" class="my-store wrapper broad management-form"><!-- 추후 좁은헤더로 class명 변경 필요 -->
    <div class="sidebar">
      <div class="sidebar-wrapper">
        <div class="logo">
          <a href="javascript:void(0)" class="simple-text logo-normal">
            Brand Name
          </a>
        </div>
        <ul class="nav">
          <li>
            <a href="sales-status.do">
              <i class="tim-icons icon-money-coins"></i>
              <p>판매 현황</p>
            </a>
          </li>
          <li>
            <a href="product-management.do">
              <i class="tim-icons icon-gift-2"></i>
              <p>상품 관리</p>
            </a>
          </li>
          <li>
            <a href="review-management.do">
              <i class="tim-icons icon-pencil"></i>
              <p>후기 관리</p>
            </a>
          </li>
          <li class="active ">
            <a href="inquiry-management.do">
              <i class="tim-icons icon-chat-33"></i>
              <p>문의 관리</p>
            </a>
          </li>
          <li>
            <a href="notice-management.do">
              <i class="tim-icons icon-volume-98"></i>
              <p>공지 관리</p>
            </a>
          </li>
          <li>
            <a href="store-management.do">
              <i class="tim-icons icon-basket-simple"></i>
              <p>스토어 관리</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    
    
    <div class="main-panel">     
      <div class="content">
        <div class="row">
          <div class="col-lg-12">
            <div class="col-lg-12 card">
              <div class="card-header">
                <h2 class="card-title text-center">문의 답변</h2>
              </div>
              <div class="card-body">
                <div class="row">
                	<div class="col-lg-12 d-flex p-info scroll-custom">
                		<img src="/resources/images/men-01.jpg" alt="">
                		<div class="d-flex flex-column justify-content-center p-text-info">
                			<div>
		                		<h6>상품명</h6>
		                		<p>무슨 플래너</p>
		                	</div>
		                	<div>
		                		<h6>작성자</h6>
		                		<p>이고객</p>
		                	</div>
		                	<div>
		                		<h6>작성 일자</h6>
		                		<p>2023.06.28</p>
		                	</div>
                		</div>
                	</div>
                	<div class="col-lg-12">
	                	<div class="management-data">
	                		<h6>문의 제목</h6>
	                		<p>영구 다운로드 가능한가요?</p>
	                	</div>
                		<h6>문의 내용</h6>
                		<p>구매하면 영구 다운로드인가요</p>
                	</div>
                	<form class="col-lg-12" action="inquiry-management.do">
                		<textarea maxlength="300" placeholder="답변 내용 작성"></textarea>
                		<button>답변</button>
                	</form>
                </div>
                <form>
                
                </form>
              </div>
            </div>
          </div>
        </div>

      </div>
      
      

    </div>
  </main>

  

  <script src="/resources/js/my-store.js"></script>
  <script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');
        $navbar = $('.navbar');
        $main_panel = $('.main-panel');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;
        white_color = false;

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();
        
        // sidebar height 지정
        $('.sidebar').css("height", ($('.my-store').innerHeight())+"px");

        $('.fixed-plugin a').click(function(event) {
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });


        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            sidebar_mini_active = false;
            blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
          } else {
            $('body').addClass('sidebar-mini');
            sidebar_mini_active = true;
            blackDashboard.showSidebarMessage('Sidebar mini activated...');
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);
        });
        
        // total 금액
        let sum = 0
        let price = $('.text-center span');
        for(let i=0; i<price.length; i++){
        	sum +=parseInt($(price[i]).text());
        	$(price[i]).text(numberWithCommas(Math.floor($(price[i]).text())));
        }
		countingUp($('#t-revenue'), sum);   
	  });
  	});
  </script>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

   

<!--
=========================================================
* * Black Dashboard - v1.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/black-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)


* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->


