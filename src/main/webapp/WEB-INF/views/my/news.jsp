<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />



<!-- ***** Page Content Starts ***** -->
<main id="news" class="my-info broad">

    <section class="section" id="page">
    	<div class="page-title">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>내 소식</h2>
                    </div>
                </div>
            </div>
        </div>
		<div class="container">
			<div class="row justify-content-center">
            	<!-- 소식 Start -->
				<div class="col-lg-12 news-container" onclick="location.href='#'">
					<div class="news d-flex justify-content-start" >
						<div class="d-flex justify-content-center">
                  			<img src="/resources/images/men-01.jpg" alt="" class="profile-img">
                  			<div class="d-flex flex-column justify-content-center">
                  				<h6>OOO님이 회원님의 피드에 댓글을 남겼습니다.</h6>
                  			</div>
                  		</div>
	           		</div>
				</div>
				<!-- 소식 End -->
				
				<div class="col-lg-12 news-container check" onclick="location.href='#'">
					<div class="news d-flex justify-content-start" >
                  		<div class="d-flex justify-content-center">
                  			<img src="/resources/images/men-01.jpg" alt="" class="profile-img">
                  			<div class="d-flex flex-column justify-content-center">
                  				<h6>OOO님이 회원님의 피드를 좋아합니다.</h6>
                  			</div>
                  		</div>
	           		</div>
				</div>
				<div class="col-lg-12 news-container" onclick="location.href='#'">
					<div class="news d-flex justify-content-start">
                  		<div class="d-flex justify-content-center">
                  			<img src="/resources/images/men-01.jpg" alt="" class="profile-img">
                  			<div class="d-flex flex-column justify-content-center">
                  				<h6>OOO님이 '작품 이름' 판매를 시작하였습니다.</h6>
                  			</div>
                  		</div>
	           		</div>
				</div>
				<div class="col-lg-12 news-container check" onclick="location.href='#'">
					<div class="news d-flex justify-content-start" >
                  		<div class="d-flex justify-content-center">
                  			<img src="/resources/images/men-01.jpg" alt="" class="profile-img">
                  			<div class="d-flex flex-column justify-content-center">
                  				<h6>OOO님이 회원님의 피드에 댓글을 남겼습니다.</h6>
                  			</div>
                  		</div>
	           		</div>
				</div>
				<div class="col-lg-12 news-container check" onclick="location.href='#'">
					<div class="news d-flex justify-content-start" >
                  		<div class="d-flex justify-content-center">
                  			<img src="/resources/images/men-01.jpg" alt="" class="profile-img">
                  			<div class="d-flex flex-column justify-content-center">
                  				<h6>OOO님이 회원님의 피드를 좋아합니다.</h6>
                  			</div>
                  		</div>
	           		</div>
				</div>
				<div class="col-lg-12 news-container check" onclick="location.href='#'">
					<div class="news d-flex justify-content-start" >
                  		<div class="d-flex justify-content-center">
                  			<img src="/resources/images/men-01.jpg" alt="" class="profile-img">
                  			<div class="d-flex flex-column justify-content-center">
                  				<h6>OOO님이 회원님의 피드를 좋아합니다.</h6>
                  			</div>
                  		</div>
	           		</div>
				</div>
                
			</div>
		</div>
    </section>
</main>

<!-- ***** Page Content Ends ***** -->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />

   
