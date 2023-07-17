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
      
      	<form name="frm" id="frm" action="/store/products" method="post" enctype="multipart/form-data" onsubmit="insert_p_chk(this); return false;">    

	        <div class="row justify-content-center page-content">
	          <div class="col-xxl-8 col-xl-10 col-lg-12 info">
	            <div class="row name-container">
		           	<label for="product-name"><h5 class="must">상품명</h5></label>
		           	<input type="text" name="p_name" id="product-name" class="form-control" placeholder="상품명을 입력하세요">
	            </div>
	            <div class="row file-container">
		           	<label for="file"><h5 class="must">상품 파일 등록</h5></label>
		           	<p class="desc">∙ 실제 구매자들이 다운로드 받을 파일을 등록해주세요</p>
		           	<p class="desc">∙ 파일 용량이 너무 크면 구매자가 다운로드를 하기 어려울 수 있으니 유의해주세요</p>
		           	<p class="desc">∙ 등록하는 콘텐츠가 타인의 저작권 또는 초상권을 침해하지 않도록 유의해주세요</p>
		           	<div class="d-flex align-content-center file-input-container">
			           	<input type="file" name="file_f" id="file" onchange="getFileSize(this)">
			           	<p class="file-size-container desc"></p>
		           	</div>
	            </div>
	            <div class="price-container">
		            <div class="row">
			           	<label for="product-price"><h5 class="must">금액</h5></label>
			           	<div class="form-control-container d-flex">
			           		<span>&#8361;</span>
			           		<input type="text" name="price" id="product-price" class="form-control form-number" placeholder="금액을 입력하세요" onchange="getNumber(this); getSalePrice();" onkeyup="getNumber(this);">
			           	</div>
		            </div>
					<div class="row flex-column">
			           	<h5 class="must">할인 여부</h5>
			           	<div class="do-sale">
			           		<label for="yes-sale">할인 적용</label>
			           		<input type="radio" name="do-sale" id="yes-sale" value="yes">
			           		<label for="no-sale">할인 미적용</label>
			           		<input type="radio" name="do-sale" id="no-sale" value="no" checked>
			           	</div>
					</div>	 
		           	<div class="sale-info">
						<div class="row flex-column">
			           		<label for="product-sale"><h5 class="must">할인 금액</h5></label>
			           		<div class="d-flex align-items-center product-sale-container">
			           			<div class="form-control-container d-flex">
					           		<span>&#8361;</span>
					           		<input type="text" name="sale" id="product-sale" class="form-control form-number" placeholder="할인 금액을 입력하세요" onchange="getNumber(this); getSalePrice();" onkeyup="getNumber(this);">
					           	</div>
				           		<p>할인</p>
			           		</div>
			           	</div>
			           	<div class="row">
			           		<h5>할인 적용가</h5>
			           		<div class="form-control-container d-flex">
				           		<span>&#8361;</span>
				           		<input type="text" name="sale-price" id="product-sale-final" class="form-control form-number" value="" disabled onchange="getNumber(this); getSalePrice(this);" onkeyup="getNumber(this);">
				           	</div>
			           	</div>
		           	</div>
	            </div>
				
				<div class="category-container">
					<div class="category">
						<div class="row flex-column">
							<h5>디자인 카테고리</h5>
							<div class="category-card d-flex flex-row">
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-design-minimal">미니멀</label>
									<input type="checkbox" id="cate-design-minimal" name="category_design" value="미니멀">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-design-illust">일러스트</label>
									<input type="checkbox" id="cate-design-illust" name="category_design" value="일러스트">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-design-photo">포토</label>
									<input type="checkbox" id="cate-design-photo" name="category_design" value="포토">
								</div>
							</div>
						</div>
						<div class="row flex-column">
							<h5>페이지 카테고리</h5>
							<div class="category-card d-flex flex-row">
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-whole">한달 세트</label>
									<input type="checkbox" id="cate-page-whole" name="category_page" value="한달 세트">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-monthly">먼슬리</label>
									<input type="checkbox" id="cate-page-monthly" name="category_page" value="먼슬리">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-weekly">위클리</label>
									<input type="checkbox" id="cate-page-weekly" name="category_page" value="위클리">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-habit">해빗트래커</label>
									<input type="checkbox" id="cate-page-habit" name="category_page" value="해빗트래커">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-mood">무드트래커</label>
									<input type="checkbox" id="cate-page-mood" name="category_page" value="무드트래커">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-reading">독서트래커</label>
									<input type="checkbox" id="cate-page-reading" name="category_page" value="독서트래커">
								</div>		
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-expense">가계부</label>
									<input type="checkbox" id="cate-page-expense" name="category_page" value="가계부">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-study">스터디</label>
									<input type="checkbox" id="cate-page-study" name="category_page" value="스터디">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-sticker">스티커</label>
									<input type="checkbox" id="cate-page-sticker" name="category_page" value="스티커">
								</div>
								<div class="d-flex flex-row category-checkbox">
									<label for="cate-page-etc">그 외</label>
									<input type="checkbox" id="cate-page-etc" name="category_page" value="그 외">
								</div>
							</div>
						</div>
					</div>
				</div>
				     
				<div class="row flex-column">
					<div class="d-flex align-items-center thumb-title">
						<h5>썸네일</h5>
						<p class="must">(정사각형 사이즈 권장)</p>
					</div>
					<div id="thumb-preview" class="thumb-preview">
						<img id="img-modify-white" src="/resources/images/img-modify-white.svg" alt="썸네일 업로드 버튼">
					</div>
					<input type="file" accept="image/*" name="thumbnail_f" id="thumbnail" onchange="imgPreview(this);">
				</div>     	
	
				<div class="row flex-column">
					<h5 class="must">상세 정보</h5>
					<!-- CKEditor 적용 -->
					<textarea id="content" name="content" style="width:100%; height:412px;"></textarea>
				</div>
	
				<div id="insert-btn-container" class="row justify-content-center insert-btn-container">
					<button>상품 등록하기</button>
				</div>
	            
	          </div>
	        </div>
        </form>

      </div>
    </div>
  </main>

  

  <script src="/resources/js/my-store.js"></script>
  
 <script>
 /*
 $(document).on("change", "#combo_value3", function(){
     let comboVal = $('#combo_value3').val();
     console.log("[prop]" + " select value : " + comboVal);
     $("input:radio[name='rad_fruit3'][value='" + comboVal + "']").prop('checked', true);
     console.log("[prop]" + " radio value : " + $("input:radio[name='rad_fruit3']:checked").val());
   });
 }
 */
 </script>
	
	
	
	<!-- CKEditor standard -->
<%--   	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor_re/ckeditor.js"></script>
	<script>
		$(function () {
			CKEDITOR.replace('content', {
				//filebrowserUploadMethod : 'form',
				filebrowserUploadUrl : '${pageContext.request.contextPath}/product-img.do',
				contentsCss: '/resources/css/custom.css'
			});
		});
	</script> --%>
	
	<!-- CKEditor Custom -->
<%--    	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor4_custom/ckeditor.js"></script>
	<script>
		$(function () {
			CKEDITOR.replace('content', {
				filebrowserUploadMethod : 'form',
				filebrowserUploadUrl : '${pageContext.request.contextPath}/product-img.do',
				contentsCss: '/resources/css/custom.css'
			});
		});
	</script> --%>
  	
  	
  	
	<!-- CKEditor Youtube -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor4_y/ckeditor.js"></script>
	<script>
		$(function () {
			CKEDITOR.replace('content', {
				//filebrowserUploadMethod : 'form',
				filebrowserUploadUrl : '${pageContext.request.contextPath}/product-img.do',
				contentsCss: '/resources/css/custom.css'
			});
		});
	</script>
  	
  
  
  <script>

  
	/* 파일 등록 시 용량 표시 */
	function getFileSize(obj) {
		let fileSizeP = document.getElementsByClassName('file-size-container')[0];
		fileSizeP.innerHTML = '';	
		
		if(!($('#file').val() == '') || !($('#file').val() == null)){ 
			console.log($('#file').val());
			let fileSize = (($("#file")[0].files[0].size)/1024/1024).toFixed(2);
			
			fileSizeP.innerHTML = fileSize+ ' MB';	
		} 
	}
  
  
  /* 금액 입력창 */
    function getNumber(obj){
	   var num01;
	   var num02;
	   num01 = obj.value;
	   num02 = num01.replace(/\D/g,""); 
	   num01 = numberWithCommas(num02);
	   obj.value =  num01;
	
	   $('#test').text(num01);
	}
    
    
    function getSalePrice() {
    	let price = document.getElementById('product-price').value.replace(/\D/g,"");
    	let sale = document.getElementById('product-sale').value.replace(/\D/g,"");
    	let saleFinal = price+"-"+sale;
   	
    	let saleFinalInput = document.getElementById('product-sale-final');    	
    	saleFinalInput.value = numberWithCommas(eval(saleFinal));
    }
    
    
    
    $(() => {
    	
    	//할인정보 슬라이드업다운
 		$('.sale-info').hide();		
		let do_sale = document.getElementsByName('do-sale');
		let do_sale_val = null;
		
		$(do_sale).on('change', function() {
			do_sale_val = $("input[name='do-sale']:checked").val();
			$('.sale-info').slideToggle('300');
		});
		

    	
    });
    
    
    
    
    /* 썸네일 미리보기 */
    function imgPreview(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('thumb-preview').style.backgroundImage = "url("+e.target.result+")";
	      document.getElementById('thumb-preview').style.backgroundSize = "cover";
	      document.getElementById('thumb-preview').style.backgroundColor = "transparent";
	      document.getElementById('img-modify-white').style.display = "none";
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  document.getElementById('thumb-preview').style.backgroundImage = "none";
	      document.getElementById('thumb-preview').style.backgroundColor = "#e4e4eb";
	      document.getElementById('img-modify-white').style.display = "block";
	  }
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


