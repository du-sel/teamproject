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
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />  
    <div class="main-panel">     
      <div class="content">
      	<div class="row justify-content-center listtop">
      		<div class="col-xl-10 col-lg-12 d-flex justify-content-between align-items-center">
				<div>
					<h5>총 상품 개수</h5>
				</div>
				<button type="button" onclick="location.href='/store/products/new'">신규 상품 등록</button>
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


