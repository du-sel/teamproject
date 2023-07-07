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



  <main id="sales-status" class="my-store wrapper broad"><!-- 추후 좁은헤더로 class명 변경 필요 -->
   	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" /> 
    <div class="main-panel">     
      <div class="content">
        <div class="row">
          <div class="col-lg-8">
            <div class="card card-chart">
              <div class="card-header ">
                <div class="row">
                  <div class="col-sm-12 text-left">
                    <h5 class="card-category">월별 판매 수익</h5>
                    <h2 class="card-title">Total. ￦<span id="revenue">0</span></h2>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="chartBig1"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card card-chart m-revenue">
              <div class="card-header">
                <h5 class="card-category">2023년 06월</h5>
                <h3 class="card-title">이번달 수익</h3>
              </div>
              <div class="card-body">
                <div class="chart-area d-flex flex-column justify-content-center revenue scroll-custom">
               		<p class="card-content" style="width: max-content;">￦<span id="m-revenue">0</span></p>
                </div>
                <button type="button" class="cal-history" onclick="javascript:location.href='calculate-history.do';">정산 내역 보러가기<i class="tim-icons icon-double-right"></i></button>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row">
          <div class="col-lg-6 col-md-12">
            <div class="card card-chart bar-chart">
              <div class="card-header">
                <h5 class="card-category">Best5 상품 수익</h5>
                <h2 class="card-title">Total. ￦<span id="p-revenue">0</span></h2>
              </div>
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="CountryChart"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">Best5 상품</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter table-custom">
                    <thead>
                      <tr>
                      	<th>
                          	No.
                        </th>
                        <th>
                          	상품명
                        </th>
                        <th>
                        	 판매수량
                        </th>
                        <th>
                          	판매금액
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                      	<td>
                          1
                        </td>
                        <td>
                          	리훈 이야기 다이어리 굿노트 아이패드 속지
                        </td>
                        <td>
                          8건
                        </td>
                        <td>
                          	￦ 64,000
                        </td>
                      </tr>
                      <tr>
                        <td>
                          2
                        </td>
                        <td>
                          	영이의숲_2023 굿노트 스터디플래너
                        </td>
                        <td>
                          6건
                        </td>
                        <td>
                          	￦ 54,000
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          3
                        </td>
                        <td>
                          	타임라인 디지털 플래너 굿노트 속지 PDF
                        </td>
                        <td>
                          	5건
                        </td>
                        <td>
                          	￦ 45,000
                        </td>
                      </tr>
                      <tr>
                        <td>
                          4
                        </td>
                        <td>
                          	아기토끼 굿노트그림일기 다이어리_베이비핑크_아이패드 굿노트 속지
                        </td>
                        <td>
                          	5건
                        </td>
                        <td>
                          	￦ 45,000
                        </td>
                      </tr>
                      <tr>
                        <td>
                          5
                        </td>
                        <td>
                          	2023 굿노트 스티커북 (673개 스티커 포함)
                        </td>
                        <td>
                          	4건
                        </td>
                        <td>
                          	￦ 36,000
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
  
  
  <!-- Chart JS -->
  <script src="/resources/js/chartjs.min.js"></script>
  <script src="/resources/js/demo.js"></script>
  <script>
    $(document).ready(function() {
      $().ready(function() {
		countingUp($('#m-revenue'), 3000000);
		countingUp($('#revenue'), 12345678);
		countingUp($('#p-revenue'), 450000);
	  });
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


