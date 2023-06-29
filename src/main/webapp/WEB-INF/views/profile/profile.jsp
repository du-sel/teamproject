<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div id="myprofile">
	<div  class="container firstcontainer">
		<!--상단 이미지-->
		<div class="row topimg">
			<div class="col-md-12 topimgdiv" >
				<!-- <img id="img-topimgmodify" src="/resources/images/arrow-bar-up%20(1).svg"> -->
				<p id="img-topimgmodify"> IMAGE UPLOAD </p>
			</div> 
		</div>

		<div class="row  seconddiv">
			<!--프로필 이미지 -->
			<div class="col-md-2 profilediv">
				<div class="profile">
					<img class="profileimgmodify" src="/resources/images/images%20(1).svg" >
				</div>
			</div>

			<div class="offset-md-1 col-md-3 ">
				<div class="nickname">mybulnet123</div>
				<!-- 팔로우 구독 버튼 -->
				<div  id="buttonright">팔로우</div>
				<div  id="buttonright">구독</div>
				<!-- <div class="btn" >마이스튜디오 개설</div>
				<div class="btn" >마이스튜디오 관리</div> -->
			</div>
			
			<!-- SNS 주소 -->
			<div class=" offset-md-3 col-md-3 thriddiv">
				<div class="addressdiv"><a href="https://www.instagram.com/?hl=ko" ><img src="resources/images/twitter.svg">&nbsp;인스타그램주소</a></div>
				<div class="addressdiv"><a href="https://twitter.com/"><img src="resources/images/instagram.svg">&nbsp;트위터주소</a></div>
				<div class="addressdiv"><a><img src="resources/images/facebook.svg">&nbsp;패이스북주소</a></div>
	
			</div>
		</div>	
		
		<!-- <div class="col-md-12 fakerow"></div> -->
		
		<!-- SNS 주소
		<div class="row">
			<div class="offset-md-9 col-md-3">
				<div class="addressdiv"><a href="https://www.instagram.com/?hl=ko" ><img src="resources/images/twitter.svg">&nbsp;인스타그램주소</a></div>
				<div class="addressdiv"><a href="https://twitter.com/"><img src="resources/images/instagram.svg">&nbsp;트위터주소</a></div>
				<div class="addressdiv"><a><img src="resources/images/facebook.svg">&nbsp;패이스북주소</a></div>
			</div>
		</div>
		-->
	</div>
	<br>
	
	<!-- 피드 스튜디오 공지 탭 -->
	<div  class="container shadow-sm p-3 mb-5 ">

		<div style="margin:10px;">
			
			<ul class="nav nav-tabs">
			 	<li class="nav-item navli">
			 		<a class="nav-link active" href="#feed" data-toggle="tab">피드</a>
			 	</li>
			 	<li class="nav-item navli">
			 		<a class="nav-link" href="#studio" data-toggle="tab">스튜디오</a>
			 	</li>
			 	<li class="nav-item navli">
			 		<a class="nav-link" href="#notice" data-toggle="tab">공지</a>
			 	</li>
			 	<!-- 
				<li class="active navli"><a href="#feed" data-toggle="tab" >피드</a></li>
				<li class="navli"><a href="#studio" data-toggle="tab">스튜디오</a></li>
				<li class="navli"><a href="#notice" data-toggle="tab">공지</a></li>
				 -->
			</ul>

			<div class="tab-content">
				<div class="tab-pane fade show active" id="feed">
					<br>
					<div class="writenew">
						<a href="#">글 작성하기</a>
					</div>
					
					<div class="container">
						<div class="offset-md-3 col-md-5">
							<!-- 프로필이미지,닉네임 -->
							<div>
								
								
							</div>
							<!-- 상품이미지,글, 좋아요, 댓글 -->
							<div>

							</div>
						</div>
					</div>
					
				</div>

				<div class="tab-pane fade" id="studio"><br>
					<select name="shop__selector" id="shop__selector">
						<option selected>기본 정렬</option>
						<option>가나다순</option>
						<option>낮은 가격순</option>
						<option>높은 가격순</option>
					</select>
					<div class="container">
					<!-- 
						<div class="row">
							<div class="col-lg-4">
			                    <div class="item">
				                    <a href="product-single.do">
				                        <div class="thumb">
				                            <div class="hover-content">
				                                <ul>
				                                    <li><i class="fa fa-shopping-cart"></i></li>
				                                </ul>
				                            </div>
				                            <img src="/resources/images/men-01.jpg" alt="">
				                        </div>
				                        <div class="down-content">
				                            <h4>Classic Spring</h4>
				                            <span>$120.00</span>
				                            <ul class="stars">
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                            </ul>
				                        </div>
			                        </a>
			                    </div>								
							</div>
							<div class="col-lg-4">
			                    <div class="item">
				                    <a href="product-single.do">
				                        <div class="thumb">
				                            <div class="hover-content">
				                                <ul>
				                                    <li><i class="fa fa-shopping-cart"></i></li>
				                                </ul>
				                            </div>
				                            <img src="/resources/images/men-01.jpg" alt="">
				                        </div>
				                        <div class="down-content">
				                            <h4>Classic Spring</h4>
				                            <span>$120.00</span>
				                            <ul class="stars">
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                            </ul>
				                        </div>
			                        </a>
			                    </div>								
							</div>
							<div class="col-lg-4">
			                    <div class="item">
				                    <a href="product-single.do">
				                        <div class="thumb">
				                            <div class="hover-content">
				                                <ul>
				                                    <li><i class="fa fa-shopping-cart"></i></li>
				                                </ul>
				                            </div>
				                            <img src="/resources/images/men-01.jpg" alt="">
				                        </div>
				                        <div class="down-content">
				                            <h4>Classic Spring</h4>
				                            <span>$120.00</span>
				                            <ul class="stars">
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                                <li><i class="fa fa-star"></i></li>
				                            </ul>
				                        </div>
			                        </a>
			                    </div>								
							</div>
						</div>
					</div>
				</div>
				 -->
			</div>	 
		</div>
		
		
		<div class="tab-pane fade" id="notice">
			공지 페이지
		</div>
	</div>


	<div class=" modal">
		
		<div class="mcontent">
		<p class="modalclose">&times;</p>
				<!-- 코드추가 -->
				<div class="image-upload" id="image-upload">
		            <form method="post" enctype="multipart/form-data">
		                <div class=" button">
		                    <label for="chooseFile">  CLICK HERE!  </label>
		                </div>
		                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
		            </form>
			<br>
		            <div class="fileContainer">
		                <div class="fileInput">
		                    <p>FILE NAME: </p>
		                    <p id="fileName"></p>
		                </div>
		                <div class="buttonContainer">
		                    <div class="submitButton" id="submitButton">SUBMIT</div>
		                </div>
		            </div>
		        </div>
		        <!--  
			<form>
			<p>
				<h4>사진 업로드</h4><br>
				<div class="wrapper">
					<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
					<label for="file2" class="upload-btn">
					<input id="file2" type="file" accept="image/*"/>
					<span>업로드</span>
					</label>
				</div>

			</form> -->
		</div>

	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />