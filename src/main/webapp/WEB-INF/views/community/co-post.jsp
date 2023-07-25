<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<div id="main" class="col-lg-7 ml-auto mr-auto" > <!-- style="float: right;" -->
		
			 
		
			<!-- Post -->
			<section class="post"> 
				<div>
					<form id="post-form" action="/community/posts/${post.getPostId()}" method="get">
						<div>
							<div class="header">
								<c:if test="${!empty userinfo.getProfile_img() }">
									<a href="/profiles/${userinfo.getUrl()}" class="author">
										<img src="${userinfo.getProfile_img()}" alt="프로필 이미지" />&nbsp;&nbsp;
										<span class="name author">${userinfo.getName() }</span>
									</a>
								</c:if>
								<c:if test="${empty userinfo.getProfile_img() }">
									<a href="/profiles/${userinfo.getUrl()}" class="author"><img src="" alt="" style="background-color: gray;" />&nbsp;&nbsp;
										<span class="name">${userinfo.getName() }</span>
									</a>
								</c:if>
								<div class="d-flex">
									<c:if test="${post.getId() eq sessionScope.id}">
										<form action="/community/posts/${post.getPostId()}" method="post">
										 	<input type="hidden" name="_method" value="DELETE"/>
											<div class="delete-post" onclick="checkDeletePost(event)">삭제</div>
										</form>
									</c:if>
									
									<span class="published">${p.creDate}</span>
								</div>
								
								<span class="published">${post.getCre_date() }</span>
								
								
							</div>
						</div>
			
						
						<div class="post-content-container row justify-content-center"> <!-- post_img-outer -->
							<div class="img-container"> <!-- post_img -->
								<c:if test="${!empty postIMG.getImg() }">
									<img src="/resources/postimg/${postIMG.getImg() }">
								</c:if>
							</div>
						</div>
						
					
							<div id="post-content" class="collapse-content">
							  <div class="post-content-inner collapsed">
							  	
							   ${post.getContent() }
							  </div>
							</div>
						
						<!-- <script>있던 자리 -->
						</form>
					</div>
					
					<div class="footer">
						<ul class="stats commment_stats">
							<li class="comment-count" onclick="showCommentInput(this)">
								<span class="comment-icon">
									<i class="fa fa-comment"></i>
								</span>
								<span class="comment-count-number">${comments.size()}</span>
							</li>
							<li class="like-count">
								<span class="like-icon">
									<i class="fa fa-thumbs-up"></i>
								</span>
								<span class="like-count-number"></span> <!-- 좋아요 수 -->
							</li>
					
						</ul>
						<div class="comment-section">
							<ul id="comment-list" class="comment-list">
								<c:set var="comments" value="${commentService.getCommentList(post.getPostId()) }"/>							
								<c:forEach var="comment" items="${comments}" varStatus="loop">
                                    
                                        <li>
                                        	<div class="comment-top d-flex justify-content-between align-items-center">
	                                            <div class="comment-name">이름 ${commentService.getUser(comment.getCommentid()).get().getName()}</div> 
	                                            <div class="d-flex">
													<c:if test="${commentService.getUser(comment.getCommentid()).get().getId() eq sessionScope.id}">
														<form id="deleteComment" action="/community/posts/${post.getPostId()}/comments/${comment.getCommentid()" method="post">
														 	<input type="hidden" name="_method" value="DELETE"/>
															<div class="delete-comment" onclick="checkDeleteComment(event)">삭제</div>
														</form>
													</c:if>
													<div class="comment-date">${omment.getCre_date()}</div>
												</div>
	                                        </div>
                                             <div class="comment-content">${comment.getContent()}</div>
                                        </li>
                                    
                                </c:forEach>
                            </ul>
                            
								
							<input type="hidden" id="sessionId" name="id" value="${sessionScope.id}">
							<div class="comment-button" type="button" onclick="return showCommentInput(this)">
								<span class="comment-plus">+</span> 댓글쓰기
							</div>
							<div class="button-row">
						
								<div class="comment-input">
									<form action="/community/posts/${post.getPostId()}/comments" method="post" name="comment" id="insertcomment">
										<input type="hidden" name="postId" value="${post.getPostId() }">
										
										<c:choose>
											<c:when test="${!empty sessionScope.id }">
												<input type="hidden" name="id" value="${sessionScope.id}">
												<input type="text" id="comment-text" name="content" placeholder="댓글을 입력하세요">
									            <button class="submit-button" type="submit" >입력</button> <!-- onclick="addComment()" -->
											</c:when>
											<c:otherwise>
												<div id="comment-text" >로그인이 필요합니다.</div>
											</c:otherwise>
										</c:choose>
									
									</form>
								</div>
								
								
							</div>
							
							
							
							
							
						</div>
					</footer>
					
					
					<!-- <script>있던 자리 -->
				
			</section>
		
		
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
