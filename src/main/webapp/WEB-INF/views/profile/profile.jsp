<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container firstcontainer">
		<!--상단 이미지-->
		<div class="row topimg">
			<div class=" col-md-12 topimgdiv" >
				<img id="img-topimgmodify" src="/resources/images/arrow-bar-up%20(1).svg">
			</div>
		</div>

		<div class="row seconddiv">
			<!--프로필 이미지 -->
			<div class="col-md-2 profilediv">
				<div class="profile">
					<img class="profileimgmodify" src="/resources/images/images%20(1).svg" >
				</div>
			</div>

			<div class=" col-md-2 nickname">닉네임123</div>
			
			<!-- 팔로우 구독 버튼 -->
			<div class="col-md-offset-5 col-md-2">
				<div class="btn" >팔로우</div>
				<div class="btn" >구독</div>
				<div class="btn" >마이스튜디오 개설</div>
				<div class="btn" >마이스튜디오 관리</div>
	
			</div>
		</div>	
		
		<div class="col-md-12 fakerow"></div>
		
		<!--SNS 주소-->
		<div class="row">
			<div class="col-md-offset-9 col-md-3">
				<div class="addressdiv"><a href="https://www.instagram.com/?hl=ko" ><img src="resources/images/twitter.svg">&nbsp;인스타그램주소</a></div>
				<div class="addressdiv"><a href="https://twitter.com/"><img src="resources/images/instagram.svg">&nbsp;트위터주소</a></div>
				<div class="addressdiv"><a><img src="resources/images/facebook.svg">&nbsp;패이스북주소</a></div>
			</div>
		</div>
		
	</div>
	<br>
	
	<!-- 피드 스튜디오 공지 탭 -->
	<div class="container secondcontainer">

		<div style="margin:10px;">
			
			<ul class="nav nav-tabs">
				<li class="active"><a href="#feed" data-toggle="tab">피드</a></li>
				<li><a href="#studio" data-toggle="tab">스튜디오</a></li>
				<li><a href="#notice" data-toggle="tab">공지</a></li>
			</ul>

			<div class="tab-content">

				<div class="tab-pane fade in active" id="feed">
					<br>
					<div class="writenew">
						<a >글 작성하기</a>
					</div>
					
					<div class="container">
						<div class="col-md-offset-3 col-md-5">
							<!-- 프로필이미지,닉네임 -->
							<div>
								<img class="profile">
								
							</div>
							<!-- 상품이미지,글, 좋아요, 댓글 -->
							<div>

							</div>
						</div>
					</div>
					
				</div>

				<div class="tab-pane fade" id="studio"><br>
					<select name="shop__selector" id="shop__selector">
						<option>기본 정렬</option>
						<option>가나다순</option>
						<option>낮은 가격순</option>
						<option>높은 가격순</option>
					</select>
				</div>

				<div class="tab-pane fade" id="notice">
					공지 페이지
				</div>
				
			</div>
		</div>
	</div>


	<div class="modal">
		<span class="modalclose">&times;</span> 
		<div class="modal-content">
			<form>
				<h4>수정하기</h4>
				<div class="wrapper">
					<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
					<label for="file2" class="upload-btn">
					<input id="file2" type="file" accept="image/*"/>
					<span>업로드</span>
					</label>
				</div>
			<!-- 
				<br>
				닉네임: <input type="text" name="nickname"> -->
			</form>
		</div>

	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />






