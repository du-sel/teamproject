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
		<div id="main" class="col-lg-7 co-post-margin" > <!-- style="float: right;" -->

			 
		<!-- Post -->
		<article class="post">  <!-- onclick="window.location.href = 'post.do';" -->

			<div>
				<div class="title">
					<p>
						<c:if test="${!empty userinfo.getProfile_img()}">
							<a href="#" class="author"><img src="/resources/images/${userinfo.getProfile_img()}" alt="" />&nbsp;&nbsp;
								<span class="name"><input type="text" name="id" value="${userinfo.getName()}" readonly="readonly" class="author"></span>
							</a>
						</c:if>
						<c:if test="${empty userinfo.getProfile_img()}">
							<a href="#" class="author"><img src="" alt="" style="background-color: gray;" />&nbsp;&nbsp;
								<span class="name"><input type="text" name="id" value="${userinfo.getName()}" readonly="readonly" class="author"></span>
							</a>
						</c:if>
					</p>
					<p>
						<input type="text" readonly="readonly" name="cre_date" class="published" value="${post.getCre_date()}">
					</p>
				</div>
			</div>


			<div class="post_img-outer">
				<div class="post_img">
					<img src="/resources/images/춘식이웹툰1.png" alt="" />
				</div>
			</div>
			
			
			<div id="post-content" class="collapse-content">
			  <div class="post-content-inner collapsed">
			   ${post.getContent()}
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
						<div class="comment-section">
							<ul id="comment-list" class="comment-list" style="display: none;">
								<c:forEach var="comment" items="${comments }">
									<li><div>이름 ${commentService.getUser(comment.getComment_id()) }</div>내용 ${comment.getContent()}<div>날짜 ${comment.getCre_date() }</div></li>
								</c:forEach>
							</ul>
							<div class="button-row">
								<button class="comment-button" type="button" onclick="showCommentInput(this)">댓글쓰기</button>
								<div class="comment-input">
									<form action="/community/posts/${post.getPostId()}/comments" method="post" name="comment">
										<c:if test="${!empty sessionScope.id }">
											<input type="hidden" name="id" value="${sessionScope.id}">
											<input type="text" id="comment-text" name="content" placeholder="댓글을 입력하세요">
								            <button class="submit-button" type="button" onclick="addComment()">입력</button>
								        </c:if>
								        <c:if test="${empty sessionScope.id }">
								        	<input type="text" id="comment-text" placeholder="로그인이 필요합니다." readonly="readonly">
								        </c:if>
									</form>
								</div>
							</div>
						</div>
					</footer>
					
			
			
		</article>
		
	

		</div>
		
		
	</main>
</div>
<script src="/resources/js/community-toggle.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />