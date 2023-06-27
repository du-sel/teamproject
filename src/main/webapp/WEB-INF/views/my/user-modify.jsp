<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />


<!-- ***** Page Content Starts ***** -->
<main id="user-modify" class="my-info user-modify broad">
    <section class="section">
    	<div class="page-title">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>회원정보 수정</h2>
                    </div>
                </div>
            </div>
        </div>
		<div class="container">
			<div id="modify-input-container" class="d-flex flex-column">
				<form action="#" method="post">
					<div class="form-group">		<!-- 이름(닉네임) -->
						<div class="input-group">
							<p>이름</p>
							<input type="text" class="form-control" name="name" value="김회원" placeholder="Name" required oninput="remove(3 ,this);">
						</div>
					</div>
					<div class="form-group">		<!-- 이메일 -->
						<div class="input-group">
							<p>이메일</p>
							<input type="email" class="form-control" name="email" value="customer@naver.com" placeholder="UserEmail" required oninput="remove(2 ,this);">
						</div>
					</div>
					<div class="form-group">		<!-- 핸드폰번호 -->
						<div class="input-group">
							<p>전화번호</p>
							<input type="text" class="form-control" name="tel" value="010-1234-5678" placeholder="PhoneNumber" maxlength="13" oninput="tel_hyphen(this);" required>
						</div>
					</div>
					
					<div class="form-group">
						<input type="submit" class="btn btn-block btn-lg" value="수정하기">
					</div> 
				</form>
			</div>
		</div>
    </section>
</main>
<!-- ***** Page Content Ends ***** -->


 
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

   
