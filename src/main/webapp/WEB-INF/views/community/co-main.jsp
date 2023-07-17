<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/common/header.jsp" />


<!-- Wrapper -->
<div id="wrapper container" class="co">
	<main id="co-main" class="row" style="margin-top: 200px">
	
		<!-- Sidebar -->
		<section id="sidebar" class="col-lg-3">
			<nav class="navbar navbar-expand-md navbar-absolute navbar-transparent">
				 <div class="navbar-wrapper">
					<div class="navbar-toggle d-inline">
						<button type="button" class="navbar-toggler">
							<i class="fa fa-quote-left"></i>
						</button>
					</div>
				</div>
			</nav>
		
			<div class="sidebar-wrapper scroll-y-custom">
				<section class="sidebar-post-list">
					<nav class="sidebar-nav">
						<ul>
							<li class="menu active">
								<a href="#menu">통합 피드</a>
							</li>
							<li class="menu">
								<a href="#menu">팔로잉 피드</a>
							</li>
							<li class="menu">
								<a  href="#menu">크리에이터 피드</a>
							</li>
							<li class="menu">
								<a href="#menu">내가 댓글 남긴 포스트</a>
							</li>
							<li class="menu">
								<a href="#menu">내가 좋아요한 포스트</a>
							</li>
						</ul>
						<form id="sidebar-search" class="d-flex justify-content-start" method="get" action="#">
							<div class="d-flex justify-content-between">
								<input class="form-control" type="text" name="co_keyword" placeholder="Search" />
								<div class="d-flex flex-column justify-content-center">
									<label for="co-search"><i class="fa fa-search" aria-hidden="true"></i></label>
									<input id="co-search" type="submit" value="검색">
	                  			</div>
	                  		</div>
		           		</form>
					</nav> 
				</section>
	 
				<!-- Posts List -->
				<section>
					<ul class="posts">
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler J</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler A</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler Q</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler K</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler I</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler J</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler A</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler Q</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler K</p>
	                  			</div>
							</div>
						</li>
						<li class="d-flex justify-content-start">
							<div class="divlist d-flex justify-content-between" onclick="location.href='#'">
								<div class="divimg" id="article_img1"></div>
								<div class="d-flex flex-column justify-content-center">
	                  				<p class="lidiv">saler I</p>
	                  			</div>
							</div>
						</li>
					</ul>
				</section>
			</div>
		</section>
		
		<!-- Main -->
		<div id="main" class="col-lg-7 m-auto" > <!-- style="float: right;" -->
			
		<c:if test="${!empty sessionScope.id}">
			<article class="post">  <!-- onclick="window.location.href = 'post.do';" -->
				<form action="/community/posts" method="post" name="post" enctype="multipart/form-data">
					<!-- <input type="hidden" name="_method" value="post"> -->
					<input type="hidden" name="id" value="${sessionScope.id}">
					<div>
						<div class="header">
							<div class="meta">
								<a href="#" class="author"><img src="/resources/images/춘식이프로필.png" alt="" />&nbsp;&nbsp;
									<span class="name"><div class="author">${sessionScope.name }</div></span>
								</a>
								<button class="insertpost inserticon" type="button"><img alt="" src="/resources/images/icon-insertpost.png"></button>
							</div> 
						</div>
					</div>
	
				
				   <div class="col-12">
				   		
							<div class="submitpost col-12">
								<textarea id="co-textarea" name="content" class="col-11" rows="2"></textarea>
								<input type="text" name="p_id" id="p_id" placeholder="태그 입력">
								<div class="row flex-column">
									<div class="d-flex align-items-center thumb-title inputphoto">
										<h6>사진&nbsp;<small>최대 4개까지 업로드 가능</small></h6>
										<p></p>
									</div>
									<div id="thumb-preview" class="thumb-preview"></div>
									<input type="file" accept="image/*" name="img" id="thumbnail" 
											onchange="imgPreview(event);" multiple="multiple">
								</div>
								<button class="submiticon" type="button" onclick="checkPhotoCount()"><img alt="" src="/resources/images/icon-submit.png"></button>
							</div>
						</div>
					</form>
				</article>
			</c:if>	
			<c:if test="${empty sessionScope.id}">
				<article class="post">  <!-- onclick="window.location.href = 'post.do';" -->
					<form action="" method="post" name="post">
						<div>
							<div class="header">
								<div class="meta">
									<div class="author">
										<p name="id"class="author">포스트 작성은 로그인이 필요합니다</p>
									</div>
									<button class="insertpost inserticon" type="button"><img alt="" src="/resources/images/icon-insertpost.png"></button>
								</div>
							</div>
						</div>
	
					</form>
				</article>
			</c:if>
			
			
			
			
		<c:forEach var="post" items="${postList }">
			<!-- Post -->
			<article class="post">  <!-- onclick="window.location.href = 'post.do';" -->
				<form action="/community/posts/${post.getPostId()}" method="get">
				<input type="hidden" name="postId">
					<div>
						<div class="title">
							<p>
								<c:if test="${!empty users.getUsers(post.getPostId()).getProfile_img() }">
									<a href="#" class="author"><img src="/resources/images/${users.getUsers(post.getPostId()).getProfile_img()}" alt="" />&nbsp;&nbsp;
										<span class="name"><input type="text" name="id" value="${users.getUsers(post.getPostId()).getName() }" readonly="readonly" class="author"></span>
									</a>
								</c:if>
								<c:if test="${empty users.getUsers(post.getPostId()).getProfile_img() }">
									<a href="#" class="author"><img src="" alt="" style="background-color: gray;" />&nbsp;&nbsp;
										<span class="name"><input type="text" name="id" value="${users.getUsers(post.getPostId()).getName() }" readonly="readonly" class="author"></span>
									</a>
								</c:if>
							</p>
							<p>
								<input type="text" readonly="readonly" name="cre_date" class="published" value="${post.getCre_date() }">
							</p>
						</div>
					</div>
		
		
					<div class="post_img-outer" onclick="location.href='/community/posts/${post.getPostId()}'">
						<div class="post_img">
							<img src="/resources/images/춘식이웹툰1.png" alt="" />
						</div>
					</div>
					
				
						<div id="post-content" class="collapse-content">
						  <div class="post-content-inner collapsed">
						   ${post.getContent() }
						  </div>
						</div>
					
					<!-- <script>있던 자리 -->
					
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
					        <button class="comment-button" type="button" onclick="showCommentInput(this)">댓글쓰기</button> <!-- 댓글쓰기 버튼 -->
					        <div class="comment-input" style="display: none;">
					            <!-- 댓글 입력 부분 -->
					            <input type="text" id="comment-text" name="comment" placeholder="댓글을 입력하세요">
					            <button class="submit-button" type="button" onclick="addComment()">입력</button>
					        </div>
					    </div>
					    </div>
					</footer>
					
					<!-- <script>있던 자리 -->
	
				</form>
			</article>
		</c:forEach>	
		
		
		<!-- Post -->
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
			
			
		</article>
		
		
		
		
		<!-- Post -->
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
			
		</article>
	

		<!-- Post -->
			<article class="post" onclick="window.location.href = 'post.do';">
				<div>
					<div class="title">
						<h2><a href="#">Ultricies sed magna euismod enim vitae gravida</a></h2>
						<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>

					</div>
					<div class="meta">
						<time class="published" datetime="2023-07-06">July 6, 2023</time>
						<a href="#" class="author"><span class="name">춘식이폼미쳤다</span><img src="/resources/images/춘식이프로필.png" alt="" /></a>
					</div>
				</div>
				<a href="#" class="image featured"><img src="/resources/images/춘식이웹툰2.png" alt="" /></a>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper.</p>
				<footer>

					<ul class="actions">
						<li><a href="#" class="button large">Continue Reading</a></li>
					</ul>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">28</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer>
			</article>

		<!-- Post -->
			<article class="post">
								<div>
									<div class="title">
										<h2><a href="single.html">Euismod et accumsan</a></h2>
										<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>

									</div>
									<div class="meta">
										<time class="published" datetime="2023-07-05">July 5, 2023</time>
										<a href="#" class="author"><span class="name">춘식이폼미쳤다</span><img src="/resources/images/춘식이프로필.png" alt="" /></a>
									</div>
								</div>
								<a href="single.html" class="image featured"><img src="/resources/images/춘식이웹툰3.png" alt="" /></a>
								<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla. Cras vehicula tellus eu ligula viverra, ac fringilla turpis suscipit. Quisque vestibulum rhoncus ligula.</p>
								<footer>
									<ul class="actions">
										<li><a href="single.html" class="button large">Continue Reading</a></li>
									</ul>
									<ul class="stats">
										<li><a href="#">General</a></li>
										<li><a href="#" class="icon solid fa-heart">28</a></li>
										<li><a href="#" class="icon solid fa-comment">128</a></li>
									</ul>
								</footer>
							</article>
			
		<!-- Pagination -->
			<ul id="pagination" class="actions pagination">
				<li><a href="#" class="button large previous">◀</a></li>
				<li><a href="#" class="button large" >1</a></li>
				<li><a href="#" class="button large" >2</a></li>
				<li><a href="#" class="button large" >3</a></li>
				<li><a href="#" class="button large next">▶</a></li>
			</ul>

		</div>
		
		<!-- About -->
		<!-- <section class="blurb">
			<h2>About US</h2>
			<p>
				Contect&nbsp;:&nbsp;&nbsp;<a>project@forwin.com</a>

			</p>
			
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</section> -->
	</main>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/community-toggle.js"></script>
<script>
	
	

	$(() => {
    	// body 컬러 임시
 		$('body').css('background-color', '#f2f2f6');
    	
    	// 모바일 화면 사이드 바
    	$("#sidebar .navbar button").on('click', function(){
    		let clazz = $('.sidebar-wrapper').attr('class');
    		if(!clazz.includes('open')) {
    			$('.sidebar-wrapper').addClass('open');
    			$('#sidebar').addClass('open');
    		}
    		else {
    			$('.sidebar-wrapper').removeClass('open');
    			$('#sidebar').removeClass('open');
    		}
    	});
	});
	
	
	
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />