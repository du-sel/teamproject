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



  <main id="calculate-history" class="my-store wrapper broad"><!-- 추후 좁은헤더로 class명 변경 필요 -->
    <div class="sidebar">
      <div class="sidebar-wrapper">
        <div class="logo">
          <a href="javascript:void(0)" class="simple-text logo-normal">
            Brand Name
          </a>
        </div>
        <ul class="nav">
          <li class="active ">
            <a href="sales-status.do">
              <i class="tim-icons icon-coins"></i>
              <p class="card-content">판매 현황</p>
            </a>
          </li>
          <li>
            <a href="product-management.do">
              <i class="tim-icons icon-pin"></i>
              <p>상품 관리</p>
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
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title font-weight-bold">정산 내역</h4>
                <h5 class="card-title">Total. ￦<span id="t-revenue">0</span></h5>
                
              	<form class="sort">
              		<select>
              			<option selected>2023년</option>
              			<option>2022년</option>
              			<option>2021년</option>
              			<option>2020년</option>
              			<option>2019년</option>
              		</select>
              	</form>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter">
                    <thead>
                      <tr>
           	            <th>
                          	정산 일자
                        </th>
                        <th>
                          	총 금액 
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          2023.06.30
                        </td>
                        <td>
                          	￦<span>50000</span>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          2023.05.31
                        </td>
                        <td>
                          	￦<span>35000</span>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          2023.04.30
                        </td>
                        <td>
                          	￦<span>30000</span>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          2023.03.31
                        </td>
                        <td>
                          	￦<span>9000</span>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          2023.02.28
                        </td>
                        <td>
                          	￦<span>14000</span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
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


