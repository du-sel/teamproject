<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
<jsp:include page="/WEB-INF/views/common/header.jsp" />

  <main id="insert-review" class="my-info broad my-info-form">
  	
    <section class="section" id="page">
    	<div class="page-title">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>후기 작성</h2>
                    </div>
                </div>
            </div>
        </div>
		<div class="container">
			<div class="row justify-content-center">
				<a href="/store/purchases?page=0" class="back">&lt; 구매 내역</a>
				<div class="col-lg-12 d-flex p-info scroll-custom">
               		<img src="/resources/images/men-01.jpg" alt="">
               		<div class="d-flex flex-column justify-content-center p-text-info">
               			<div>
	                		<h6>상품명</h6>
	                		<p>무슨 플래너</p>
	                	</div>
	                	<div>
	                		<h6>크리에이터</h6>
	                		<p>김판매</p>
	                	</div>
	                	<div>
	                		<h6>작성 일자</h6>
	                		<p>2023.06.28</p>
	                	</div>
               		</div>
               	</div>
               	<form class="col-lg-12 form-data" action="">
                	<div class="sub-title">
                		<h6>별점</h6>
                		<span class="star">
							★★★★★
							<span>★★★★★</span>
							<input type="range" name="score" oninput="score(this);" value="1" step="1" min="0" max="10">
						</span>
                	</div>
                	<div>
               			<h6>후기</h6>
               			<textarea name="review" maxlength="300" placeholder="후기 내용을 입력하세요." required></textarea>
	               		<input class="form-btn" type="submit" value="작성">
               		</div>
               	</form>
               	<div class="col-lg-12">
               		<h6 class="answer">크리에이터 답변</h6>
               		<p>답변 일자: <span>2023.07.02</span></p>
               		<p>구매해주셔서 감사합니다!</p>
               	</div>
			</div>
		</div>
    </section>
  </main>

  <script>
		// score
		function score(event){
		    $('.star span').css('width', $(event).val() * 10+'%');
		}
  </script>
  <script src="/resources/js/my-store.js"></script>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
