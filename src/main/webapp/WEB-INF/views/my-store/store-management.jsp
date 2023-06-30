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



  <main id="store-management" class="my-store wrapper broad"><!-- 추후 좁은헤더로 class명 변경 필요 -->
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />  
    <div class="main-panel">     
      <div class="content">
        <div class="row">
          <div class="col-xl-10 col-lg-12" ><!-- style="max-width: 1100px; margin: 0 auto;" -->
            <div class="col-lg-12 card">
              <div class="card-header">
                <h2 class="card-title text-center">스토어 관리</h2>
              </div>
              <div class="card-body">
				<form action="#" method="post">
					<div class="row">
			           	<label class="col-lg-12" for="brand-name"><h5>스토어 이름</h5></label>
			           	<input type="text" name="name" id="brand-name" class="form-control col-lg-11 store-input" value="BRAND NAME" placeholder="스토어 이름을 입력하세요.">
		            </div>
		            <div class="row">
			           		<label class="col-lg-12" for="url"><h5>개인 프로필 URL</h5></label>
			           		<div style="padding:0" class="col-lg-11 store-input d-flex justify-content-center">
				           		<input type="text" class="form-control text-center" value="/shop/" disabled style="width: 142px;">
								<input type="text" id="url" class="form-control" name="url" placeholder="ProfileURL" value="test" onkeyup="chk_reset('url')" oninput="remove(3, this)" style="display: inline-block;">
								<button style="margin:0" type="button" class="btn btn-chk" onclick="url_chk('', true, 2)" style="width: 142px;">Check</button>
							</div>
						<p></p>
		            </div>
					
					<div class="row">
			           	<label class="col-lg-12" for="account"><h5>정산 계좌</h5></label>
			           	<div style="padding:0" class="store-input d-flex justify-content-center">
			           	<select class="form-control">
			           		<option>우리은행</option>
			           		<option>국민은행</option>
			           		<option>신한은행</option>
			           	</select>
			           	<input type="text" name="name" id="account" class="form-control col-lg-8" value="1002000000000" placeholder="계좌 번호를 입력하세요.(- 제외)" oninput="remove(3, this)">
		            	</div>
		            </div>
					<div class="form-group">
						<input type="submit" class="btn btn-block btn-lg" value="수정하기">
					</div> 
				</form>
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


