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



  <main id="review-management" class="my-store wrapper broad"><!-- 추후 좁은헤더로 class명 변경 필요 -->
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <div class="main-panel">     
      <div class="content">
        <div class="row">
          <div class="col-lg-12">
            <div class="col-lg-12 card">
              <div class="card-header">
                <h2 class="card-title text-center management-title">후기 관리</h2>
              </div>
              <div class="card-body">
                <div class="table-responsive scroll-custom">
                  <table class="table tablesorter table-hover table-custom table-management">
                    <thead>
                      <tr>
                      	<th>
                          	No.
                        </th>
                        <th>
                          	상품명
                        </th>
                        <th>
                          	작성자
                        </th>
                        <th>
                          	작성일자
                        </th>
                        <th>
                          	별점
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr onclick="location.href='review-management-form.do'">
                      	<td>
                          	10
                        </td>
                        <td>
                          	아기토끼 굿노트그림일기 다이어리_베이비핑크_아이패드 굿노트 속지
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          	9
                        </td>
                        <td>
                          	아기토끼 굿노트그림일기 다이어리_베이비핑크_아이패드 굿노트 속지
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          	8
                        </td>
                        <td>
                          	리훈 이야기 다이어리 굿노트 아이패드 속지
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          	7
                        </td>
                        <td>
                          	영이의숲_2023 굿노트 스터디플래너
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          	6
                        </td>
                        <td>
                          	리훈 이야기 다이어리 굿노트 아이패드 속지
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          	5
                        </td>
                        <td>
                          	리훈 이야기 다이어리 굿노트 아이패드 속지
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          	4
                        </td>
                        <td>
                          	리훈 이야기 다이어리 굿노트 아이패드 속지
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          	3
                        </td>
                        <td>
                          	영이의숲_2023 굿노트 스터디플래너
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
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
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                      <tr>
                      	<td>
                          	1
                        </td>
                        <td>
                          	리훈 이야기 다이어리 굿노트 아이패드 속지
                        </td>
                        <td>
                          	이고객
                        </td>
                        <td>
                          2023.06.28
                        </td>
                        <td>
                          	<span class="star">
								★★★★★
								<span style="width: 50%;">★★★★★</span>
							</span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div>
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
            </div>
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


