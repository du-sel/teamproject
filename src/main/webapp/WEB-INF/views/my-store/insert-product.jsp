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



  <main id="insert-product" class="my-store wrapper broad"><!-- 추후 좁은헤더로 class명 변경 필요 -->
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />     
    
    
    <div class="main-panel">     
      <div class="content">
      	<div class="row justify-content-center page-title">
			<h2>신규 상품 등록</h2>
      	</div>
      
        <div class="row justify-content-center">
          <div class="col-xxl-8 col-xl-10 col-lg-12 info">
            <div class="row">
	           	<label for="product-name"><h5>상품명</h5></label>
	           	<input type="text" name="name" id="product-name" class="form-control" placeholder="상품명을 입력하세요">
            </div>
            <div class="row">
	           	<label for="product-price"><h5>금액</h5></label>
	           	<input type="text" name="name" id="product-price" class="form-control" placeholder="금액을 입력하세요">
            </div>
			<div class="row flex-column">
	           	<h5>할인 여부</h5>
	           	<div class="do-sale">
	           		<label for="yes-sale">할인 적용</label>
	           		<input type="radio" name="do-sale" id="yes-sale" value="yes">
	           		<label for="no-sale">할인 미적용</label>
	           		<input type="radio" name="do-sale" id="no-sale" value="no">
	           	</div>
	           	<div class="sale-info">
	           		<label for="product-sale"><h5>할인 금액</h5></label>
	           		<div class="d-flex">
		          	 	<input type="text" name="sale" id="product-sale" class="form-control" placeholder="할인 금액을 입력하세요">
		           		<p>할인</p>
	           		</div>
	           		<h5>할인 적용가</h5>
	          	 	<input type="text" name="sale" id="product-sale-final" class="form-control" value="" disabled>
	           	</div>
			</div>	 
			
			<div class="row category flex-column">
				<div>
					<h5>디자인 카테고리</h5>
					<label for="cate-design-minimal">미니멀</label>
					<input type="checkbox" id="cate-design-minimal" name="category-design" value="미니멀">
					<label for="cate-design-illust">일러스트</label>
					<input type="checkbox" id="cate-design-illust" name="category-design" value="일러스트">
					<label for="cate-design-photo">포토</label>
					<input type="checkbox" id="cate-design-photo" name="category-design" value="포토">
				</div>
				<div>
					<h5>페이지 카테고리</h5>
					<label for="cate-page-whole">한달 세트</label>
					<input type="checkbox" id="cate-page-whole" name="category-page" value="한달">
					<label for="cate-page-monthly">먼슬리</label>
					<input type="checkbox" id="cate-page-monthly" name="category-design" value="먼슬리">
					<label for="cate-page-weekly">위클리</label>
					<input type="checkbox" id="cate-page-weekly" name="category-design" value="먼슬리">
					<label for="cate-page-habit">해빗트래커</label>
					<input type="checkbox" id="cate-page-habit" name="category-design" value="먼슬리">
					<label for="cate-page-mood">무드트래커</label>
					<input type="checkbox" id="cate-page-mood" name="category-design" value="먼슬리">
					<label for="cate-page-reading">독서트래커</label>
					<input type="checkbox" id="cate-page-reading" name="category-design" value="먼슬리">
					<label for="cate-page-expense">가계부</label>
					<input type="checkbox" id="cate-page-expense" name="category-design" value="먼슬리">
					<label for="cate-page-study">스터디</label>
					<input type="checkbox" id="cate-page-study" name="category-design" value="먼슬리">
					<label for="cate-page-sticker">스티커</label>
					<input type="checkbox" id="cate-page-sticker" name="category-design" value="먼슬리">
				</div>
			</div>
			     
			<div class="row flex-column">
				<h5>썸네일</h5>
				<p>정사각형 사이즈 권장</p>
				<input type="file" accept="image/*" name="thumbnail">
			</div>     	

			<div class="row">
				<h5>상세 정보</h5>
				<textarea id="content" name="content" style="width:100%; height:412px;"></textarea>
			</div>

				
            
          </div>
        </div>
        

      </div>
    </div>
  </main>

  

  <script src="/resources/js/my-store.js"></script>
  
  
  
  <!-- 네이버 스마트에디터 실행 코드 -->
  <script src="resources/smarteditor2_9/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <script>
	$(document).ready(function () {
			
		var oEditors = [];
		function smartEditorIFrame() {
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "content",
				sSkinURI : "resources/smarteditor2_9/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
	      }
		smartEditorIFrame();
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


