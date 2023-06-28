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



  <main id="product-management" class="my-store wrapper broad"><!-- 추후 좁은헤더로 class명 변경 필요 -->
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
              <i class="tim-icons icon-coins"></i>
              <p>판매 현황</p>
            </a>
          </li>
          <li class="active ">
            <a href="product-management.do">
              <i class="tim-icons icon-pin"></i>
              <p class="card-content">상품 관리</p>
            </a>
          </li>
          <li>
            <a href="review-management.do">
              <i class="tim-icons icon-bell-55"></i>
              <p>후기 관리</p>
            </a>
          </li>
          <li>
            <a href="./notifications.html">
              <i class="tim-icons icon-world"></i>
              <p>공지 관리</p>
            </a>
          </li>
          <li>
            <a href="./user.html">
              <i class="tim-icons icon-single-02"></i>
              <p>스튜디오 관리</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    
    
    <div class="main-panel">     
      <div class="content">
      	<div class="row justify-content-center page-title">
			<h2>신규 상품 등록</h2>
      	</div>
      
        <div class="row justify-content-center">
          <div class="col-xl-10 col-lg-12 info">
            <div class="card">
              <div class="card-body">
                <div class="row">
	                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
	                   <div class="thumb">
	                       <a href="#"><img src="/resources/images/men-01.jpg" alt=""></a>
	                   </div>
	                </div>
	                <div class="col-lg-7 col-md-5 col-sm-4 sm_info">
	                    <div class="down-content d-flex flex-column justify-content-around product-info">
	                        <h4>상품명</h4>
	                        <h4>7,000원</h4>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-3 col-sm-3 d-flex flex-column justify-content-center btn-container">
	                    <div class="d-flex flex-column justify-content-center align-items-center">
		                    <div class="up-del-btn-container d-flex flex-row justify-content-between">
			                    <button type="button" class="update-btn">수정</button>
			                    <button type="button" class="delete-btn">삭제</button>
		                    </div>
		                    <button type="button" class="signature-btn button">대표 상품 등록</button>
	                    </div>
	                </div>
	             </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row justify-content-center">
          <div class="col-xl-10 col-lg-12 info">
            <div class="card">
              <div class="card-body">
                <div class="row">
	                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
	                   <div class="thumb">
	                       <a href="#"><img src="/resources/images/men-01.jpg" alt=""></a>
	                   </div>
	                </div>
	                <div class="col-lg-7 col-md-5 col-sm-4 sm_info">
	                    <div class="down-content d-flex flex-column justify-content-around product-info">
	                        <h4>상품명</h4>
	                        <h4>7,000원</h4>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-3 col-sm-3 d-flex flex-column justify-content-center btn-container">
	                    <div class="d-flex flex-column justify-content-center align-items-center">
		                    <div class="up-del-btn-container d-flex flex-row justify-content-between">
			                    <button type="button" class="update-btn">수정</button>
			                    <button type="button" class="delete-btn">삭제</button>
		                    </div>
		                    <button type="button" class="signature-btn button">대표 상품 등록</button>
	                    </div>
	                </div>
	             </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row justify-content-center">
          <div class="col-xl-10 col-lg-12 info">
            <div class="card">
              <div class="card-body">
                <div class="row">
	                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
	                   <div class="thumb">
	                       <a href="#"><img src="/resources/images/men-01.jpg" alt=""></a>
	                   </div>
	                </div>
	                <div class="col-lg-7 col-md-5 col-sm-4 sm_info">
	                    <div class="down-content d-flex flex-column justify-content-around product-info">
	                        <h4>상품명</h4>
	                        <h4>7,000원</h4>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-3 col-sm-3 d-flex flex-column justify-content-center btn-container">
	                    <div class="d-flex flex-column justify-content-center align-items-center">
		                    <div class="up-del-btn-container d-flex flex-row justify-content-between">
			                    <button type="button" class="update-btn">수정</button>
			                    <button type="button" class="delete-btn">삭제</button>
		                    </div>
		                    <button type="button" class="signature-btn button">대표 상품 등록</button>
	                    </div>
	                </div>
	             </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row justify-content-center">
          <div class="col-xl-10 col-lg-12 info">
            <div class="card">
              <div class="card-body">
                <div class="row">
	                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
	                   <div class="thumb">
	                       <a href="#"><img src="/resources/images/men-01.jpg" alt=""></a>
	                   </div>
	                </div>
	                <div class="col-lg-7 col-md-5 col-sm-4 sm_info">
	                    <div class="down-content d-flex flex-column justify-content-around product-info">
	                        <h4>상품명</h4>
	                        <h4>7,000원</h4>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-3 col-sm-3 d-flex flex-column justify-content-center btn-container">
	                    <div class="d-flex flex-column justify-content-center align-items-center">
		                    <div class="up-del-btn-container d-flex flex-row justify-content-between">
			                    <button type="button" class="update-btn">수정</button>
			                    <button type="button" class="delete-btn">삭제</button>
		                    </div>
		                    <button type="button" class="signature-btn button">대표 상품 등록</button>
	                    </div>
	                </div>
	             </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row justify-content-center">
          <div class="col-xl-10 col-lg-12 info">
            <div class="card">
              <div class="card-body">
                <div class="row">
	                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
	                   <div class="thumb">
	                       <a href="#"><img src="/resources/images/men-01.jpg" alt=""></a>
	                   </div>
	                </div>
	                <div class="col-lg-7 col-md-5 col-sm-4 sm_info">
	                    <div class="down-content d-flex flex-column justify-content-around product-info">
	                        <h4>상품명</h4>
	                        <h4>7,000원</h4>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-3 col-sm-3 d-flex flex-column justify-content-center btn-container">
	                    <div class="d-flex flex-column justify-content-center align-items-center">
		                    <div class="up-del-btn-container d-flex flex-row justify-content-between">
			                    <button type="button" class="update-btn">수정</button>
			                    <button type="button" class="delete-btn">삭제</button>
		                    </div>
		                    <button type="button" class="signature-btn button">대표 상품 등록</button>
	                    </div>
	                </div>
	             </div>
              </div>
            </div>
          </div>
        </div>
        

		<!-- 페이지 번호 -->
        <div class="col-lg-12">
          <div class="pagination">
              <ul>
                  <li>
                      <a href="#"><</a>
                  </li>
                  <li>
                      <a href="#">1</a>
                  </li>
                  <li class="active">
                      <a href="#">2</a>
                  </li>
                  <li>
                      <a href="#">3</a>
                  </li>
                  <li>
                      <a href="#">4</a>
                  </li>
                  <li>
                      <a href="#">></a>
                  </li>
              </ul>
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
        
		countingUp($('#m_revenue'), 3000000);
		countingUp($('#revenue'), 12345678);
		countingUp($('#p_revenue'), 450000);
		
		
		// Window Resize Mobile Menu Fix
	  	$(window).on('resize', function() {
	  		console.log("resize1");
	  		setTimeout(function() {
	  			$('.sidebar').css("height", ($('.my-store').innerHeight())+"px");
	  		}, 10);
	  	});
        
	  });
	   
	  // 숫자 카운팅 함수	  
	  function countingUp(target, count){
		  $({ val : 0 }).animate({ val : count }, {
			  duration: 1500,
			  step: function() {
				  var num = numberWithCommas(Math.floor(this.val));
				  target.text(num);
			  },
			  complete: function() {
				  var num = numberWithCommas(Math.floor(this.val));
				  target.text(num);
			  }
		  });
	  }
	      
	  // 세자리 마다 콤마(,) 넣는 함수
	  function numberWithCommas(x) {
		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  }
  	});
  </script>
  
  
  
  
  

 
<script>
  $(document).ready(function() {
    // Javascript method's body can be found in assets/js/demos.js
    demo.initDashboardPageCharts();

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


