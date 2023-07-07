<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
<jsp:include page="/WEB-INF/views/common/header.jsp" />

  <main id="product-inquiry" class="my-info broad my-info-form">
  	
    <section class="section" id="page">
    	<div class="page-title">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>상품 문의하기</h2>
                    </div>
                </div>
            </div>
        </div>
		<div class="container">
			<div class="row justify-content-center">
				<a href="product-single.do" class="back">&lt; 상품 상세보기</a>
				<div class="col-lg-12 d-flex p-info scroll-custom">
               		<img src="/resources/images/썸네일.jpg" alt="">
               		<div class="d-flex flex-column justify-content-center p-text-info">
               			<div>
	                		<h6>상품명</h6>
	                		<p>춘식이 다이어리</p>
	                	</div>
	                	<div>
	                		<h6>크리에이터</h6>
	                		<p>춘식이폼미쳤다</p>
	                	</div>
               		</div>
               	</div>
               	<form class="col-lg-12 form-data">
               		<div class="sub-title">
	               		<h6>문의 제목</h6>
	               		<input type="text" name="title">
	               	</div>
	               	<div>
	               		<h6>문의 내용</h6>
	               		<textarea name="inquiry_answer" maxlength="300" placeholder="문의 내용 작성" required></textarea>	
               		</div>
               		<input class="management-btn insert-btn" type="submit" value="문의">
               	</form>
			</div>
		</div>
    </section>
  </main>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

