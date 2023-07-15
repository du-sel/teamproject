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



  <main id="subscribe-management" class="my-store wrapper broad"><!-- 추후 좁은헤더로 class명 변경 필요 -->
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />  
    <div class="main-panel">     
      <div class="content">
        <div class="row">
          <div class="col-xl-10 col-lg-12">
            <div class="col-lg-12 card">
              <div class="card-header">
                <h2 class="card-title text-center management-title">구독 상품 관리</h2>
              </div>
              <div class="card-body">
				<div>
					<div class="store-form subscribe-form">
			           	<label for="subscribe"><h5>구독 활성화 여부</h5></label>
			           	<div class="do-subscribe">
			           		<label for="yes-subscribe">활성화</label>
			           		<input type="radio" name="subscribe" id="yes-subscribe" value="true" <c:if test="${!empty subscribe}">checked</c:if>>
			           		<label for="no-subscribe">비활성화</label>
			           		<input type="radio" name="subscribe" id="no-subscribe" value="false" <c:if test="${empty subscribe}">checked</c:if> <c:if test="${!empty subscribe}">disabled</c:if>>
			           	</div>	 
			           	
			           	<div class="subscribe-info">
			           		<form action="/store/subscribes" method="post" enctype="multipart/form-data">
				           		<div class="row flex-column">
					           		<label for="subscribe-content"><h5>구독 내용</h5></label>
					           		<div class="form-control-container d-flex subscribe">
					           			<textarea name="content" id="subscribe-content" class="form-control store-input" maxlength="300" placeholder="구독 내용 작성" required>${subscribe.content}</textarea>
						           	</div>
					           	</div>
					           	<div class="row flex-column">
					           		<label for="subscribe-price"><h5>구독 가격</h5></label>
					           		<div class="form-control-container d-flex subscribe">
						           		<span>&#8361;</span>
						           		<input type="text" name="price" id="subscribe-price" class="form-control store-input" value="${subscribe.price}" placeholder="구독 가격을 입력하세요." oninput="remove(4, this); " required>
						           	</div>
					           	</div>
					           	<div class="row flex-column">
					           		<label><h5>구독 상품</h5></label>
					           		<p>.zip파일로 올려라 안내</p>
									<input type="file" accept=".zip" name="mfile">
					           	</div>
								<input type="submit" class="main-btn management-btn" value="등록">
							</form>
							<form action="/store/subscribes" method="post" onsubmit="return subscribe_remove();">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" class="main-btn management-btn" value="구독 상품 삭제">
							</form>
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

  <script>
	$(() => {

		//구독정보 슬라이드업다운		
		if($('#yes-subscribe').attr('checked') == 'checked'){
			$('.subscribe-info').show();
		}else{
			$('.subscribe-info').hide();
		}
		
		$('#no-subscribe').on('click', function() {
			$('.subscribe-info').slideUp('300');
		});
		$('#yes-subscribe').on('click', function() {
			$('.subscribe-info').slideDown('300');
		});
	});
	
	function comma(event){
		$('#subscribe-price').val(numberWithCommas($(event).val()));
	}
	
	function subscribe_remove(){
		return confirm('정말 구독 상품을 삭제 하시겠습니까?');
	}
	
  </script>
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


