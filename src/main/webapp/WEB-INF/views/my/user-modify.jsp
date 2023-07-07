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
				<form action="#" method="post" onsubmit="return modify_chk('user', 2);">
					<div class="form-group">		<!-- 이름 -->
						<div class="input-group">
							<p>이름</p>
							<input type="text" class="form-control" name="name" value="김회원" placeholder="Name" required oninput="remove(3 ,this);">
						</div>
					</div>
					<div class="form-group">		<!-- 핸드폰번호 -->
						<div class="input-group">
							<p>핸드폰 번호</p>
							<input type="text" class="form-control" name="tel" value="010-1234-5678" placeholder="PhoneNumber" maxlength="13" oninput="tel_hyphen(this);" required>
						</div>
					</div>
					<div class="form-group">		<!-- 프로필 url -->
						<div class="input-group">
							<p>개인 프로필 URL</p>
							<input type="text" class="base-url" value="/store/" disabled>
							<input type="text" class="form-control" name="url" placeholder="ProfileURL" value="test" onkeyup="chk_reset('url')" oninput="remove(3, this)" required>
							<button type="button" class="btn btn-chk" onclick="url_chk('test', false, 2, 'modify')">Check</button>
						</div>
						<p></p>
					</div>
					<div class="form-group">		<!-- sns 링크 -->
						<div class="input-group">
							<p>SNS</p>
		              		<span class="input-group-addon"><i class="fa fa-instagram"></i></span>
							<input type="text" class="form-control" name="instagram" placeholder="Instagram URL" oninput="remove(1, this)">
						</div>
						<div class="input-group">
		              		<span class="input-group-addon"><i class="fa fa-youtube-play"></i></span>
							<input type="text" class="form-control" name="youtube" placeholder="YouTube URL" oninput="remove(1, this)">
						</div>
						<!-- <div class="input-group">
		              		<span class="input-group-addon"><i class="fa fa-twitter"></i></span>
							<input type="text" class="form-control" name="sns" placeholder="Twitter URL" oninput="remove(1, this)">
						</div> -->
					</div>
					
					<div class="form-group">
						<input type="submit" class="btn btn-block btn-lg" value="수정하기">
					</div> 
				</form>
				
				<div class="remove-container">
					<p class="user-remove" onclick="user_remove();">회원탈퇴</p>
				</div>
			</div>
		</div>
    </section>
</main>
<!-- ***** Page Content Ends ***** -->

<script>
	function user_remove(){
		 if (confirm("정말 탈퇴하시겠습니까?")) {
		 	location.replace('st-main.do');
		 }
	}
</script>
 
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

   
