<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script>


/* 탭 - 스토어 클릭하면 스토어 정보 가져오기 */
function getCreatorProductList() {

	let pathname = window.location.pathname;
	console.log(pathname);
	let url = pathname.substring(pathname.indexOf("profiles")+9);
	console.log(url);
	if(url.indexOf("/") > 0) {	
		url = url.substring(0, url.indexOf("/"));
		console.log(url);
	}
	
	$.ajax({
		type: 'get',
		url: '/profiles/'+url+'/products',
		contentType: "application/json",
		datatype: 'json',
		data: {
			page: 0,
			sort: 'creDate'
		},
		success: function(data) {					
			
			// JSON 객체별로 쪼개기
			let productArr = data.content;
			console.log(productArr.length);
			
			let box = document.getElementById("product-box");
			let parent = box.parentElement;

			if(productArr.length > 1) {
				console.log('yes');
				for(let i = 1; i < productArr.length; i++) {
					let product = productArr[i];
					
					let newBox = document.createElement('div');
					newBox.innerHTML = box.innerHTML;
					newBox.classList.add('col-lg-4');
					
					let p_name = $(newBox).find('.p_name');
					p_name.text(product.pname);
					
					parent.appendChild(newBox);
				}
				
			} else {
				// 첫번째것만 찍어주기
				
				
			}
			

			
			
			
			
			$("#store").addClass("active").addClass("show");
			$("#feed").removeClass("active").removeClass("show");
			$("#notice").removeClass("active").removeClass("show");
			
		},
		error: function(message) { }
		
	})
	
	
}


</script>



<main id="myprofile">
	<div  class="container firstcontainer">
	<!-- 
	<c:if test="${!empty sessionScope.id}">
	</c:if>
	 -->
		<!--상단 이미지-->
		<div class="row topimg">
			<c:choose>
			    <c:when test="${!empty sessionScope.user.id}" > 
					<div class="col-md-12 topimgdiv">
						<img id="img-topimgmodify" src="">
						<!-- <p id="img-topimgmodify"> IMAGE UPLOAD </p> -->
					</div> 
				</c:when>
				<c:otherwise>
					<div class="col-md-12 topimgdiv">
						<img src="">
					</div>
				
				</c:otherwise>
			</c:choose>
		</div>

		<div class="row  seconddiv">
			<c:choose>
			    <c:when test="${!empty sessionScope.user.id}" >  <!-- 자신의 프로필 일 때와  -->
					<div class="col-md-2 col-lg-1 profilediv">
						<div class="profile" id="profile">
							<img class="profileimgmodify" src="/resources/images/사람실루엣.jpg" >
						</div>
					</div>			      
			    </c:when>
			    <c:otherwise> <!-- 아닐 때 -->
					<div class="col-md-2 col-lg-1 profilediv">
						<div class="profile" id="profile">
							<!-- <img  id="Img" src="/resources/images/사람실루엣.jpg" > -->

							<img id="profileimgmodify" src="/resources/images/사람실루엣.jpg" >
						</div>
					</div>
			    </c:otherwise>
			</c:choose>

			
			<div class="col-md-4 offset-md-1 col-lg-4">
				<div class="nickname">${profile.name}</div>
				<div class="count">
					팔로워  &nbsp;${count}명&nbsp;&nbsp;|&nbsp;&nbsp;구독 &nbsp;명
				</div>
				<br>
			<!-- SNS 주소 -->
				<div class="addressdiv"><img src="/resources/images/instagram.svg"><a href="https://www.instagram.com/${profile.instagram}">&nbsp;${profile.instagram}</a></div>
				<div class="addressdiv"><img src="/resources/images/youtube.svg"><a href="https://youtube.com/${profile.youtube}">&nbsp;${profile.youtube}</a></div>
				

			</div>
			
 			<!-- 
			<c:choose>
			    <c:when test="${!empty sessionScope.user.id}" > 
					<div class=" offset-md-1 col-md-3 offset-lg-2 col-lg-4 thriddiv">
					<c:choose>
						<c:when test=" ">
				   			<div id="buttonright" onclick="onStoreModal()" class="longtext"><a href="#" data-toggle="modal" data-target="#store-modal">마이스토어 개설</a></div>
				   		</c:when>
				   		<c:when test="${sessionScope.user.url == id.url }">
							<div id="buttonright" class="longtext"><a href="store/sales-status">마이스토어 관리</a></div>
						</c:when>
					</c:choose>
					</div>				
				</c:when>
				<c:when test="${!empty sessionScope.user.id}">
					<div class=" offset-md-1 col-md-3 offset-lg-2 col-lg-4 thriddiv">	
					<c:otherwise>					 
						<button id="buttonright" class="btn" onclick="showLoginAlert()">팔로우</button>
						<button id="buttonright" class="btn" data-toggle="modal" data-target=".bd-example-modal-lg">구독</button>
					</c:otherwise>
					<c:when test="${!empty follow.getFrom_id()} ">
						<button id="buttonright" class="btn">팔로우 중 </button>
						<button id="buttonright" class="btn" data-toggle="modal" data-target=".bd-example-modal-lg">구독 중</button>
					</c:when>
							
					</div>	
				</c:when>
				<c:when test="${empty sessionScope.user.id}">
					<div class=" offset-md-1 col-md-3 offset-lg-2 col-lg-4 thriddiv">					 
						<button id="buttonright" class="btn" onclick="showLoginAlert()">팔로우</button>
						<button id="buttonright" class="btn" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="showLoginAlert()">구독</button>
					</div>	
				</c:when>

			</c:choose>
			-->
			<c:choose>
			    <c:when test="${!empty sessionScope.user.id}">
			        <div class="offset-md-1 col-md-4 offset-lg-2 col-lg-4 thriddiv">
			            <c:choose>
			                <c:when test="${sessionScope.user.url == id.url}">
			                	<c:choose>
				                	<c:when test=" ">
				                		<div id="buttonright" onclick="onStoreModal()" class="longtext"><a href="#" data-toggle="modal" data-target="#store-modal">마이스토어 개설</a></div>
				                	</c:when>
				                	<c:otherwise>
				                		<div id="buttonright" class="longtext"><a href="store/sales-status">마이스토어 관리</a></div>
				                	</c:otherwise>
			                	</c:choose>
			                </c:when>
			                <c:otherwise>
				                <c:choose>
				                	<c:when test="">
				                		 <button id="buttonright" class="btn"  onclick="showLoginAlert()">팔로우</button>
				           				 <button id="buttonright" class="btn"  onclick="showLoginAlert()">구독</button>
				                	</c:when>
				                	<c:otherwise>
					        			<button class="btn offbtn" data-toggle="modal" data-target="#exampleModalCenter">구독 중</button>
					        			<button class="btn offbtn"  data-toggle="modal" data-target="#ExampleModalCenter">팔로우 중</button>
							 		</c:otherwise>
						 		</c:choose>
			                </c:otherwise>
			                
			            </c:choose>
			        </div>
			    </c:when>
		    	
			    <c:otherwise>
			        <div class="offset-md-1 col-md-4 offset-lg-2 col-lg-4 thriddiv">
			            <button id="buttonright" class="btn" onclick="showLoginAlert()">팔로우</button>
			            <button id="buttonright" class="btn" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="showLoginAlert()">구독</button>
			        </div>
			    </c:otherwise>
			 </c:choose>   

			

		</div>	
		<script>
		    function showLoginAlert() {
		        alert("로그인이 필요합니다");
		        var link = '/community/posts';		        
		        location.href=link;

		    }
		    
		</script>
	<br>

	<!-- 탭 -->
	<div  class="container tabcontainer shadow-sm p-3 mb-5 ">

		<div style="margin:10px;">
			
			<ul class="nav nav-tabs" >
			 	<li class="nav-item navli" id="li" >
			 		<a class="nav-link active" href="#feed" data-toggle="tab" id="feedtabbgcolor" >피드</a>
			 	</li>
			 	<li class="nav-item navli" id="li">
			 		<div class="nav-link" onclick="getCreatorProductList()" data-toggle="tab">스토어</div>
			 	</li>
			 	<li class="nav-item navli" id="li">
			 		<a class="nav-link" href="#notice" data-toggle="tab">공지</a>
			 	</li>
			</ul>

				<!-- post 탭 -->
				<div class="tab-pane fade show active" id="feed">
					<br>
					<div class="col-md-12">
						<div class="writenew1">
							<a href="co-main.do">글 작성하기</a>
						</div>
					</div>				
					<br><br><br>
					<div id="co-main" >
							<div id="main" class="col-sm-12 col-md-12 col-lg-12">
							<!-- post 부분 -->
							
									<article class="post">  <!-- onclick="window.location.href = 'post.do';" -->
										<div>
											<div class="title">
												<p>
													<a href="#" class="author"><img src="/resources/images/춘식이프로필.png" alt="" />&nbsp;&nbsp;<span class="name">춘식이폼미쳤다</span></a>
												</p>
												<p>
													<time class="published" datetime="2023-07-07">July 7, 2023</time>
												</p>
											</div>
										</div>
							
							
										<div class="post_img-outer" onclick="location.href='post.do'">
											<div class="post_img">
												<img src="/resources/images/춘식이웹툰1.png" alt="" />
											</div>
										</div>
										
										
										<div id="post-content" class="collapse-content">
										  <div class="post-content-inner collapsed">
										    안녕하세요 춘식이폼미쳤다 입니다.<br>
										    이번에 새로운 다이어리를 출시했는데요.<br>
										    춘식이와 함께 게으른 나 자신을 다잡을 수 있도록 아주 빡세게 귀여운 다이어리를 제작해 보았습니다ㅋㅋㅋ<br>
										    관심 있으신 분들은 제 스토어에 방문하셔서 구매하실 수 있도록 상품을 등록 해놓았으니 많은 사랑 부탁드립니다.<br>
										    날이 많이 덥습니다. 우리 밥은 맛나게 먹더라도 배부르게 더위까지는 먹지 않도록 온열질환 주의하자구요!<br>
										    저는 요즘 더위를 먹었는지 몹시 피곤하고 몸이 축축 처지네요ㅠㅠㅠ 그래서 당분간 휴식을 좀 취할까 고민 중입니다.<br>
										    오래 걸리진 않을 테니까 너무 섭섭해하지 마시고 저 기다리는 동안 도도도 춘식이 보면서 행복한 춘식이 생활해요 우리♥<br>
										    아! 구독과 좋아요는 사랑입니다~ 힛 >.~
										  </div>
										</div>
										
										<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
							
							
							  
										<script>
										  $(document).ready(function() {
										    var contentHeight = $('.post-content-inner').height();
										    var lineHeight = parseFloat($('.post-content-inner').css('line-height'));
										    var maxHeight = 5 * lineHeight;
										    
										    if (contentHeight > maxHeight) {
										      $('.post-content-inner').addClass('collapsed');
										      $('.post-content-inner').css('max-height', maxHeight + 'px');
										      $('.post-content-inner').after('<span class="expand-button">더보기</span>');
										      
										      $('.expand-button').click(function() {
										        $('.post-content-inner').removeClass('collapsed');
										        $('.post-content-inner').css('max-height', 'none');
										        $(this).hide();
										      });
										    }
										  });
										</script>
							
										
										<footer>
											<ul class="stats commment_stats">
												<li><a class="comment-count" href="#" onclick="showCommentInput(this)">📝<span class="comment-count-number">2</span></a></li> <!-- 댓글 개수 -->
												<li><a class="like-button"   href="#"><span class="like-icon">❤️</span><span class="like-count">2</span></a></li> <!-- 좋아요 개수 -->
												<!-- <li><a href="#" class="icon solid fa-heart"><i class="fa fa-heart"></i></a> 2</li> -->
											</ul>
											<!-- <ul class="actions">
												<li id="comment_li"><button class="comment ">댓글 쓰기</button></li>
												<li id="comment_li"><div class="divcomment"><input type="text" name="comment"></div></li>
											</ul> -->
											<div class="comment-section">
											<ul id="comment-list" class="comment-list" style="display: none;">
											    <li>춘식이 다이어리 너무 기대됩니당!!</li>
											    <li>춘식이폼미쳤다님 항상 제품 잘 보고 있습니다. 건강하세요</li>
											</ul>
											<div class="button-row">
										        <button class="comment-button" onclick="showCommentInput(this)">댓글쓰기</button> <!-- 댓글쓰기 버튼 -->
										        <div class="comment-input" style="display: none;">
										            <!-- 댓글 입력 부분 -->
										            <input type="text" id="comment-text" name="comment" placeholder="댓글을 입력하세요">
										            <button class="submit-button" onclick="addComment()">입력</button>
										        </div>
										    </div>
										    </div>
										</footer>
										
										<script>
										  $(document).ready(function() {
										    // 댓글 개수 이모티콘 클릭 이벤트
										    $(".comment-count").click(function() {
										      $(this).parent().siblings(".button-row").find(".comment-input").toggle();
										    });
										    // 좋아요 버튼 클릭 이벤트
										    $(".like-button").click(function() {
										      var likeCount = parseInt($(this).find(".like-count").text().trim());
										      likeCount++;
										      $(this).find(".like-count").text(likeCount);
										    });
										  });
										  /* 댓글 input창 보여주기 */
										  function showCommentInput(elem) {
										    const commentInput = $(elem).closest("footer").find(".comment-input");
										    commentInput.toggle();
										  }
										  /* 댓글 추가 */
										  function addComment() {
										    const commentText = $("#comment-text").val();
										    if (commentText.trim() !== "") {
										      const commentItem = $("<li>").text(commentText);
										      $("#comment-list").append(commentItem);
										      $("#comment-text").val("");
										    // 댓글 개수 증가
										    const commentCount = $(".comment-count-number");
										    let count = parseInt(commentCount.text().trim());
										    count++;
										    commentCount.text(count);
											}
										  }
										</script>
									</article>
									<article class="post">  <!-- onclick="window.location.href = 'post.do';" -->
										<div>
											<div class="title">
												<p>
													<a href="#" class="author"><img src="/resources/images/춘식이프로필.png" alt="" />&nbsp;&nbsp;<span class="name">춘식이폼미쳤다</span></a>
												</p>
												<p>
													<time class="published" datetime="2023-07-07">July 7, 2023</time>
												</p>
											</div>
										</div>
							
							
										<div class="post_img-outer" onclick="location.href='post.do'">
											<div class="post_img">
												<img src="/resources/images/춘식이웹툰1.png" alt="" />
											</div>
										</div>
										
										
										<div id="post-content" class="collapse-content">
										  <div class="post-content-inner collapsed">
										    안녕하세요 춘식이폼미쳤다 입니다.<br>
										    이번에 새로운 다이어리를 출시했는데요.<br>
										    춘식이와 함께 게으른 나 자신을 다잡을 수 있도록 아주 빡세게 귀여운 다이어리를 제작해 보았습니다ㅋㅋㅋ<br>
										    관심 있으신 분들은 제 스토어에 방문하셔서 구매하실 수 있도록 상품을 등록 해놓았으니 많은 사랑 부탁드립니다.<br>
										    날이 많이 덥습니다. 우리 밥은 맛나게 먹더라도 배부르게 더위까지는 먹지 않도록 온열질환 주의하자구요!<br>
										    저는 요즘 더위를 먹었는지 몹시 피곤하고 몸이 축축 처지네요ㅠㅠㅠ 그래서 당분간 휴식을 좀 취할까 고민 중입니다.<br>
										    오래 걸리진 않을 테니까 너무 섭섭해하지 마시고 저 기다리는 동안 도도도 춘식이 보면서 행복한 춘식이 생활해요 우리♥<br>
										    아! 구독과 좋아요는 사랑입니다~ 힛 >.~
										  </div>
										</div>
										
										<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
							
							
							  
										<script>
										  $(document).ready(function() {
										    var contentHeight = $('.post-content-inner').height();
										    var lineHeight = parseFloat($('.post-content-inner').css('line-height'));
										    var maxHeight = 5 * lineHeight;
										    
										    if (contentHeight > maxHeight) {
										      $('.post-content-inner').addClass('collapsed');
										      $('.post-content-inner').css('max-height', maxHeight + 'px');
										      $('.post-content-inner').after('<span class="expand-button">더보기</span>');
										      
										      $('.expand-button').click(function() {
										        $('.post-content-inner').removeClass('collapsed');
										        $('.post-content-inner').css('max-height', 'none');
										        $(this).hide();
										      });
										    }
										  });
										</script>
							
										
										<footer>
											<ul class="stats commment_stats">
												<li><a class="comment-count" href="#" onclick="showCommentInput(this)">📝<span class="comment-count-number">2</span></a></li> <!-- 댓글 개수 -->
												<li><a class="like-button"   href="#"><span class="like-icon">❤️</span><span class="like-count">2</span></a></li> <!-- 좋아요 개수 -->
												<!-- <li><a href="#" class="icon solid fa-heart"><i class="fa fa-heart"></i></a> 2</li> -->
											</ul>
											<!-- <ul class="actions">
												<li id="comment_li"><button class="comment ">댓글 쓰기</button></li>
												<li id="comment_li"><div class="divcomment"><input type="text" name="comment"></div></li>
											</ul> -->
											<div class="comment-section">
											<ul id="comment-list" class="comment-list" style="display: none;">
											    <li>춘식이 다이어리 너무 기대됩니당!!</li>
											    <li>춘식이폼미쳤다님 항상 제품 잘 보고 있습니다. 건강하세요</li>
											</ul>
											<div class="button-row">
										        <button class="comment-button" onclick="showCommentInput(this)">댓글쓰기</button> <!-- 댓글쓰기 버튼 -->
										        <div class="comment-input" style="display: none;">
										            <!-- 댓글 입력 부분 -->
										            <input type="text" id="comment-text" name="comment" placeholder="댓글을 입력하세요">
										            <button class="submit-button" onclick="addComment()">입력</button>
										        </div>
										    </div>
										    </div>
										</footer>
										
										<script>
										  $(document).ready(function() {
										    // 댓글 개수 이모티콘 클릭 이벤트
										    $(".comment-count").click(function() {
										      $(this).parent().siblings(".button-row").find(".comment-input").toggle();
										    });
										    // 좋아요 버튼 클릭 이벤트
										    $(".like-button").click(function() {
										      var likeCount = parseInt($(this).find(".like-count").text().trim());
										      likeCount++;
										      $(this).find(".like-count").text(likeCount);
										    });
										  });
										  /* 댓글 input창 보여주기 */
										  function showCommentInput(elem) {
										    const commentInput = $(elem).closest("footer").find(".comment-input");
										    commentInput.toggle();
										  }
										  /* 댓글 추가 */
										  function addComment() {
										    const commentText = $("#comment-text").val();
										    if (commentText.trim() !== "") {
										      const commentItem = $("<li>").text(commentText);
										      $("#comment-list").append(commentItem);
										      $("#comment-text").val("");
										    // 댓글 개수 증가
										    const commentCount = $(".comment-count-number");
										    let count = parseInt(commentCount.text().trim());
										    count++;
										    commentCount.text(count);
											}
										  }
										</script>
									</article>
								
								</div> <!-- div col -->
							</div> <!-- co-main 끝 -->
							
						
					</div>
					
				
				<!-- 스토어 탭 -->
				<div class="tab-pane fade" id="store"><br>
					<div style="height:50px;">
						<!-- <select class="line" name="shop__selector" id="shop__selector">
							<option selected>기본 정렬</option>
							<option>가나다순</option>
							<option>낮은 가격순</option>
							<option>높은 가격순</option>
						</select> -->
						<form action="/store/products" method="get" id="shop__selector">
							<input type="hidden" name="page" value="0">
							<select name="sort" onchange="this.form.submit();">
								<option value="creDate" <c:if test="${sort eq 'creDate'}">selected</c:if>>최신순</option>
								<option value="popularity" <c:if test="${sort eq 'popularity'}">selected</c:if>>인기순</option>
								<option value="highprice" <c:if test="${sort eq 'highprice'}">selected</c:if>>높은가격순</option>
								<option value="lowprice" <c:if test="${sort eq 'lowprice'}">selected</c:if>>낮은가격순</option>
							</select>
							<input type="hidden" name="category" value="${category}">
							<c:if test="${!empty keyword || keyword ne '' }">
								<input type="hidden" name="keyword" value="${keyword}">
							</c:if>
						</form>
					
						<div class="writenew line">
							<a href="product-management.do">상품 관리</a>
						</div>					
					
					</div>
					<br>
					
					<div id="products">
					
						<div class="row">	                
							<!-- Product Card Start -->	
		            		<div class="col-lg-4" id="product-box">
			                    <div class="item" onclick="location.href='/store/products/${i.pid}'">
			                        <div class="thumb">
			                            <div class="hover-content">
			                                <ul>
			                                    <li onclick="preventDefaultGoCart(event, ${i.pid})"><i class="fa fa-shopping-cart"></i></li>
			                                </ul>
			                            </div>
			                            <img alt="상품 썸네일">
			                        </div>
			                        <div class="down-content">
			                            <h4 class="p_name"></h4>
			                            <c:if test="${i.sale != 0}"><span class="cost"> <fmt:formatNumber value="${i.price}" pattern="#,###" />원</span></c:if>
			                            <span class="price"> <fmt:formatNumber value="" pattern="#,###" />원</span>
			                            <ul class="stars">
			                                <span class="star">
												★★★★★
												<span style="width: ${i.rating}%;">★★★★★</span>
												<input type="range" value="1" step="1" min="0" max="10">
											</span>
			                            </ul>
			                        </div>
			                    </div>
			                </div>
			                <!-- Product Card End -->
						</div>
					</div>
				</div>
		
			<!-- 공지 탭 -->
			<div class="tab-pane fade" id="notice">

				<div class="container">
								<br>

				<!-- 	<div class="row">
						<div class="col-offset-sm-9 col-sm-3 col-offset-md-10 col-md-2 col-offset-lg-10 col-lg-2" id="noticemanage"><a href="notice-management.do">공지 관리</a></div>
					</div>	 -->
					<div class="row">
						<div class="col-12" style="margin-bottom:15px;">
							<div class="writenew1">
								<a href="co-main.do">공지관리</a>
							</div>
						</div>	
						<br>
						<div class="col-sm-12 col-md-12 col-xl-12 col-lg-12">
				            <div class="card carddiv">
				              <form class="card-body" action='#' method='post'>
				                <div class="row notice-box">
					                <div class="notice col-lg-12">
					                	<div>
					                		<p class="card-description">
												안녕하세요,기쁘게도 8월 초에 새로운 온라인 상품 판매 서비스를  출시할 예정입니다! <br>
												이를 앞두고 여러분과 소중한 정보를 공유하고자 합니다.<br>
												새로운 캐릭터 템플릿과 넓은 범위의 다양한 디자인 템플릿 pdf 상품을 공개합니다.<br> 
												풍부한 제품 선택지를 제공하여 다양한 관심사와 요구에 부응할 수 있도록 노력하겠습니다. <br>
												안녕하세요,기쁘게도 8월 초에 새로운 온라인 상품 판매 서비스를  출시할 예정입니다! <br>
												이를 앞두고 여러분과 소중한 정보를 공유하고자 합니다.<br>
												새로운 캐릭터 템플릿과 넓은 범위의 다양한 디자인 템플릿 pdf 상품을 공개합니다.<br> 
												풍부한 제품 선택지를 제공하여 다양한 관심사와 요구에 부응할 수 있도록 노력하겠습니다. <br>
												안녕하세요,기쁘게도 8월 초에 새로운 온라인 상품 판매 서비스를  출시할 예정입니다! <br>
												이를 앞두고 여러분과 소중한 정보를 공유하고자 합니다.<br>
												새로운 캐릭터 템플릿과 넓은 범위의 다양한 디자인 템플릿 pdf 상품을 공개합니다.<br> 
												풍부한 제품 선택지를 제공하여 다양한 관심사와 요구에 부응할 수 있도록 노력하겠습니다. <br>
												안녕하세요,기쁘게도 8월 초에 새로운 온라인 상품 판매 서비스를  출시할 예정입니다! <br>
												이를 앞두고 여러분과 소중한 정보를 공유하고자 합니다.<br>
												새로운 캐릭터 템플릿과 넓은 범위의 다양한 디자인 템플릿 pdf 상품을 공개합니다.<br> 
												풍부한 제품 선택지를 제공하여 다양한 관심사와 요구에 부응할 수 있도록 노력하겠습니다. <br>
											</p>
						                	<input type="checkbox" class="card-content__more-btn">				                	
					                	</div>
										<br>
					                	<div class="d-flex justify-content-start img-box scroll-custom">
						                	<div class="d-flex studioimgdiv"><img id="studioimg" src="/resources/images/춘식이스프링다이어리.jpg" alt=""></div>
						                	<div class="d-flex studioimgdiv"><img id="studioimg" src="/resources/images/춘식이스프링다이어리1.jpg" alt=""></div>
						                	<div class="d-flex studioimgdiv"><img id="studioimg"  src="/resources/images/춘식이스프링다이어리2.jpg" alt=""></div>
						                	<div class="d-flex studioimgdiv"><img id="studioimg" src="/resources/images/춘식이스프링다이어리2.jpg" alt=""></div>
					                	</div>
					                </div>
					             </div>
								</form>				
							</div>
						</div>
					</div>
				</div>
			</div>

			
			</div>	
		</div>
	</div>
	
	<!-- ***** StoreCreate Modal Start ***** -->
	<div class="modal fade" id="store-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-container" role="document" >
			<div class="modal-content">
			</div>
		</div>
  	</div>
	<!-- ***** StoreCreate Modal End ***** -->
	
	<!-- 멤버십 모달 -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button> -->
	<div class="modal fade bd-example-modal-lg " tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg fixed-bottom">
	    <div class="modal-content Membershipdiv" >
	      <form action="">
		      <br>
		      	<h5 class="membershipSub">멤버십 구독</h5>
		      <br>
		      <div class="Subdiv">
				<div class="s s1">춘식이 폼 미쳤다</div>
				<div class="s "><strong class="s2">9,000원</strong>/월</div>
				<div class="s s3">특별 아트웍 제공 및 선공개 템플릿</div>
		      </div>
		      <br>
		      <div class="Subjoin">
		      	<h6><input type="submit" value="멤버십 가입하기" class="subjoin"></h6>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>

	
	<!-- 이미지 업로드 모달  -->
		<div class="modal" id="modal">
			
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
			                    <div class="submitButton" id="submitButton">미리보기</div>
			                </div>  
			            </div>
			            
			        </div>
			        <div class="image-show" id="image-show">
			               
			        </div>
			        <div class="uploadbtn">
			        	<input type="button" value="사진 업로드" id="uploadbtn">
			        </div>
		
			</div>
	
		</div>
		
		<!-- 구독 취소 모달  -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         <!--  <span aria-hidden="true">&times;</span> -->
		        </button>
		      </div>
		      <div class="modal-body">
		        ${profile.name} 구독을 취소하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn cancel">구독 취소</button>
		      </div>
		    </div>
		  </div>
		</div>

		<div class="modal fade" id="ExampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <!-- <span aria-hidden="true">&times;</span> -->
		        </button>
		      </div>
		      <div class="modal-body">
		        ${profile.name} 팔로우을 취소하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn cancel">팔로우 취소</button>
		      </div>
		    </div>
		  </div>
		</div>		

</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />