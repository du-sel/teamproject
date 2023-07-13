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
          <div class="col-xl-10 col-lg-12">
            <div class="col-lg-12 card">
              <div class="card-header">
                <h2 class="card-title text-center management-title">스토어 관리</h2>
              </div>
              <div class="card-body">
				<form action="#" method="post" onsubmit="return modify_chk('store', 1);">
					<div class="store-form">
			           	<label for="store-name"><h5>스토어 이름</h5></label>
						<div class="store-input d-flex justify-content-center row">
			           		<div class="col-sm-9 d-flex">
				           		<input type="text" name="store_name" id="store-name" class="form-control validation-input store-input" value="test" placeholder="스토어 이름을 입력하세요." onkeyup="chk_reset('store')" required>
							</div>
							<button type="button" class="management-btn sub-btn col-sm-3" onclick="store_chk('test', true,'store')">Check</button>
						</div>
						<p></p>
		            </div>
		            <div class="store-form">
		           		<label for="url"><h5>개인 프로필 URL</h5></label>
		           		<div class="store-input d-flex justify-content-center row">
			           		<div class="col-sm-9 d-flex">
				           		<input type="text" class="form-control text-center store-base-url" value="/store/" disabled>
								<input type="text" id="url" class="form-control validation-input" name="url" placeholder="프로필 URL을 입력하세요." value="" onkeyup="chk_reset('url')" oninput="remove(3, this)" required>
							</div>
							<button type="button" class="management-btn sub-btn col-sm-3" onclick="url_chk('test', 1, 'store')">Check</button>
						</div>
						<p></p>
		            </div>
					<div class="store-form">
			           	<label for="account"><h5>정산 계좌</h5></label>
			           	<div class="store-input d-flex justify-content-center">
				           	<select class="form-control" name="bank">
				           		<option selected>우리은행</option>
				           		<option>국민은행</option>
				           		<option>신한은행</option>
				           	</select>
				           	<input type="text" name="account" id="account" class="form-control" value="1002000000000" placeholder="계좌 번호를 입력하세요.(- 제외)" oninput="remove(4, this)" required>
		            	</div>
		            </div>
		            
		            <!-- 구독 -->
					<div class="store-form subscribe-form">
			           	<label for="subscribe"><h5>구독 활성화 여부</h5></label>
			           	<div class="do-subscribe">
			           		<label for="yes-subscribe">활성화</label>
			           		<input type="radio" name="do_subscribe" id="yes-subscribe" value="yes">
			           		<label for="no-subscribe">비활성화</label>
			           		<input type="radio" name="do_subscribe" id="no-subscribe" value="no" checked>
			           	</div>	 
			           	<div class="subscribe-info">
			           		<div class="row flex-column">
				           		<label for="subscribe-content"><h5>구독 내용</h5></label>
				           		<div class="form-control-container d-flex subscribe">
				           			<textarea name="subscribe" id="subscribe-content" class="form-control store-input" maxlength="300" placeholder="구독 내용 작성"></textarea>
					           	</div>
				           	</div>
				           	<div class="row flex-column">
				           		<label for="subscribe-price"><h5>구독 가격</h5></label>
				           		<div class="form-control-container d-flex subscribe">
					           		<span>&#8361;</span>
					           		<input type="text" name="subscribe_price" id="subscribe-price" class="form-control store-input" value="" placeholder="구독 가격을 입력하세요." oninput="remove(4, this); comma(this);">
					           	</div>
				           	</div>
			            </div>
					</div>
					
		            <div class="store-form">
						<input type="submit" class="main-btn management-btn" value="수정">
					</div>
				</form>
				
				<div class="remove-container">
					<p class="store-remove" onclick="store_remove();">스토어 닫기</p>
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
	  	
		//할인정보 슬라이드업다운
		$('.subscribe-info').hide();		
			let do_sub = document.getElementsByName('do_subscribe');
			let do_sub_val = null;
			
			$(do_sub).on('change', function() {
				do_sub_val = $("input[name='do_subscribe']:checked").val();
				$('.subscribe-info').slideToggle('300');
			});
	});
  
	function store_remove(){
		if (confirm("정말 스토어를 닫으시겠습니까?")) {
			location.replace('profile.do');
		}
	}
	
	function comma(event){
		$('#subscribe-price').val(numberWithCommas($(event).val()));
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


