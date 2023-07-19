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
		<div id="main" class="col-lg-7" > <!-- style="float: right;" -->
			
		<c:if test="${!empty sessionScope.id}">
			<article class="post">  <!-- onclick="window.location.href = 'post.do';" -->
				<form action="/community/posts" method="post" name="post">
					<!-- <input type="hidden" name="_method" value="post"> -->
					<input type="hidden" name="id" value="${sessionScope.id}">
					<div>
						<div class="header">
							<div class="meta">
								<a href="#" class="author"><img src="${user.getProfile_img() }" alt="" />&nbsp;&nbsp;
									<span class="name"><div class="author">${user.getName() }</div></span>
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
									<input type="file" accept="image/*" name="post_img" id="thumbnail" 
											onchange="imgPreview(event);" multiple="multiple" enctype="multipart/form-data">
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
			
			
			
			<c:forEach var="post" items="${postList}">
			<!-- Post -->
			<article class="post">
				<%-- <a href="/community/posts/${post.getPost_id()}"> --%>
					<div class="author-section d-flex justify-content-between">
						<a href="javascript:void(0);" class="author">
							<img src="/resources/images/춘식이프로필.png" alt="프로필사진" />&nbsp;&nbsp;
							<span class="name"><input type="text" name="id" value="글쓴이 이름" readonly="readonly" class="author"></span>
						</a>
						<div class="published">${post.getCre_date()}</div>
					</div>
					<div class="post-content-container" onclick="goToPostDetail('${post.getPostId()}')">
						<div class="post-img-section">
							<div class="post_img"> <!-- style="overflow: hidden;" -->
								<img src="/resources/images/춘식이웹툰1.png" alt="프로필사진" />
							</div>
						</div>
						<div id="post-content" class="collapse-content">
							<img alt="" src="${postIMG.getPost_img()}">
							<div class="post-content-inner collapsed">
								${post.getContent()}
							</div>
						</div>
					</div>	
					<!-- <script>있던 자리 -->
					<div class="footer">
						<ul class="stats commment_stats">
							<li><a class="comment-count" href="javascript:void(0);">📝<span class="comment-count-number">2</span></a></li> <!-- 댓글 개수 -->
							<li><a class="like-button"   href="javascript:void(0);"><span class="like-icon">❤️</span><span class="like-count">2</span></a></li> <!-- 좋아요 개수 -->
							<!-- <li><a href="#" class="icon solid fa-heart"><i class="fa fa-heart"></i></a> 2</li> -->
						</ul>
						<!-- <ul class="actions">
							<li id="comment_li"><button class="comment ">댓글 쓰기</button></li>
							<li id="comment_li"><div class="divcomment"><input type="text" name="comment"></div></li>
						</ul> -->
						<div class="comment-section">
							<ul id="comment-list" class="comment-list" style="display: none;">
								<c:forEach var="comment" items="${commentList}">
								    <li>${comment.getContent() }</li>
								</c:forEach>
							</ul>
							<div class="button-row">
						        <button class="comment-button" type="button" onclick="showCommentInput(this)">댓글쓰기</button> <!-- 댓글쓰기 버튼 -->
						        <div class="comment-input" style="display: none; max-width: 800px;">
						            <!-- 댓글 입력 부분 -->
						            <form action="/community/posts/${post.getPostId()}/comments" method="post">
							            <input type="text" id="comment-text" name="content" placeholder="댓글을 입력하세요">
							            <button class="submit-button" type="submit" >입력</button> <!-- onclick="addComment()" -->
							        </form>
						        </div>
						    </div>
					    </div>
					</div>
					<!-- <script>있던 자리 -->
			</article>
		</c:forEach>
			
		
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
<script>
function goToPostDetail(postId) {
	  if (postId) {
	    window.location.href = "/community/posts/" + postId;
	  } else {
	    console.error("Invalid postId: " + postId);
	  }
	}

</script>
<script>
  $(document).ready(function() {
    $('.comment-count').on('click', function(event) {
      event.preventDefault();
      // 여기에 댓글 버튼을 클릭했을 때의 동작을 추가.
      // 예: 댓글 목록을 펼치거나 숨기는 등의 동작
    });
  });
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />