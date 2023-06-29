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



  <main id="notice-management" class="my-store wrapper broad"><!-- 추후 좁은헤더로 class명 변경 필요 -->
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />  
    <div class="main-panel">
      <div class="content">
      	<div class="row justify-content-center listtop">
      		<div class="col-lg-12">				
      			<h2 class="card-title text-center">공지 관리</h2>
			</div>
      	</div>
      
        <div class="row justify-content-center">
          <div class="col-xl-10 col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="row notice-box">
	                <form class="notice col-lg-12" action="">
	                	<textarea maxlength="300" placeholder="공지 작성"></textarea>
	                </form>
	             </div>
               	 <div class="col-lg-12 btn-box">
               	 	 <input type="file" accept="image/*">
               		 <button type="submit">작성</button>
               	 </div>
              </div>
            </div>

            <div class="card">
              <form class="card-body" action='#' method='post'>
                <div class="row notice-box">
	                <div class="notice col-lg-12">
	                	<h6>
	                		안녕하세요. ooo몰입니다!<br>
	                		~~~<br>
	                		~~~~~~~<br>
	                		~~~~~~~~~~~~~~~~~~<br>
	                		~~~~~~~~~~~~~~~~~~~~~~~~~~
	                	</h6>
	                	<div class="d-flex justify-content-start img-box scroll-custom">
		                	<img src="/resources/images/men-01.jpg" alt="">
		                	<img src="/resources/images/men-01.jpg" alt="">
		                	<img src="/resources/images/men-01.jpg" alt="">
	                	</div>
	                </div>
	             </div>
               	 <div class="col-lg-12 btn-box">
               		 <button type="button">삭제</button>
               		 <button type="button" onclick="notice_modify(this);">수정</button>
               	 </div>
              </form>
            </div>
            <div class="card">
              <form class="card-body" action='#' method='post'>
                <div class="row notice-box">
	                <div class="notice col-lg-12">
	                	<h6>
	                		안녕하세요. ooo몰입니다!<br>
	                		~~~<br>
	                		~~~~~~~<br>
	                		~~~~~~~~~~~~~~~~~~<br>
	                		~~~~~~~~~~~~~~~~~~~~~~~~~~
	                	</h6>
	                	<div class="d-flex justify-content-start img-box scroll-custom">
		                	<img src="/resources/images/men-01.jpg" alt="">
		                	<img src="/resources/images/men-01.jpg" alt="">
		                	<img src="/resources/images/men-01.jpg" alt="">
	                	</div>
	                </div>
	             </div>
               	 <div class="col-lg-12 btn-box">
               		 <button type="button">삭제</button>
               		 <button type="button" onclick="notice_modify(this);">수정</button>
               	 </div>
              </form>
            </div>
            <div class="card">
              <form class="card-body" action='#' method='post'>
                <div class="row notice-box">
	                <div class="notice col-lg-12">
	                	<h6>
	                		안녕하세요. ooo몰입니다!<br>
	                		~~~<br>
	                		~~~~~~~<br>
	                		~~~~~~~~~~~~~~~~~~<br>
	                		~~~~~~~~~~~~~~~~~~~~~~~~~~
	                	</h6>
	                	<div class="d-flex justify-content-start img-box scroll-custom">
		                	<img src="/resources/images/men-01.jpg" alt="">
		                	<img src="/resources/images/men-01.jpg" alt="">
		                	<img src="/resources/images/men-01.jpg" alt="">
	                	</div>
	                </div>
	             </div>
               	 <div class="col-lg-12 btn-box">
               		 <button type="button">삭제</button>
               		 <button type="button" onclick="notice_modify(this);">수정</button>
               	 </div>
              </form>
            </div>
            <div class="card">
              <form class="card-body" action='#' method='post'>
                <div class="row notice-box">
	                <div class="notice col-lg-12">
	                	<h6>
	                		안녕하세요. ooo몰입니다!<br>
	                		~~~<br>
	                		~~~~~~~<br>
	                		~~~~~~~~~~~~~~~~~~<br>
	                		~~~~~~~~~~~~~~~~~~~~~~~~~~
	                	</h6>
	                	<div class="d-flex justify-content-start img-box scroll-custom">
		                	<img src="/resources/images/men-01.jpg" alt="">
		                	<img src="/resources/images/men-01.jpg" alt="">
		                	<img src="/resources/images/men-01.jpg" alt="">
	                	</div>
	                </div>
	             </div>
               	 <div class="col-lg-12 btn-box">
               		 <button type="button">삭제</button>
               		 <button type="button" onclick="notice_modify(this);">수정</button>
               	 </div>
              </form>
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
    </div>
  </main>

  

  <script src="/resources/js/my-store.js"></script>
  <script>
  	function notice_modify(event){
  		let notice = $(event).parent().prev().children();
  		let content = $(event).parent().prev().children().children().eq(0);
  		
  		let btn = "<button type='submit'>완료</button>"
  		let form = "<textarea maxlength='300' placeholder='공지 작성'>"+content.html().replace(/\s/gi, '').replace(/(<br>|<br\/>|<br \/>)/gi, '\r\n')+"</textarea>";
  		
  		$(notice).children('h6').remove();
  		$(notice).prepend(form);
  		$(event).after(btn);
  		$(event).remove();
  	}
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


