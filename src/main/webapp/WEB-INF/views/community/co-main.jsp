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
		<div id="main" class="col-lg-7 m-auto" > <!-- style="float: right;" -->
			
		<c:if test="${!empty sessionScope.id}">
			<article class="post">
				<form action="/community/posts" method="post" name="post" enctype="multipart/form-data">
					<!-- <input type="hidden" name="_method" value="post"> -->
					<input type="hidden" id="sessionId" name="id" value="${sessionScope.id}">
					<div>
						<div class="header">
							<div class="meta">
								<a href="#" class="author"><img src="/resources/images/춘식이프로필.png" alt="" />&nbsp;&nbsp;
									<span class="name"><div class="author">${sessionScope.user.getName() }</div></span>
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
									<!-- < input type="file" accept="image/*" name="post-img" id="thumbnail" 
											onchange="imgPreview(event);" multiple="multiple" > -->
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
				<div onclick="location.href='/community/posts/${post.getPostId()}'" class="click-post">
					<form action="/community/posts/${post.getPostId()}" method="get">
						<div>
							<div class="title">
								<p>
									<c:choose>
										<c:when test="${!empty postService.getUser(post.getPostId()).get().getProfile_img()}">
											<a href="#" class="author"><img src="/resources/images/${postService.getUser(post.getPostId()).get().getProfile_img()}" alt="" />&nbsp;&nbsp;
												<span class="name"><input type="text" name="id" value="${postService.getUser(post.getPostId()).get().getName() }" readonly="readonly" class="author"></span>
											</a>
										</c:when>
										<c:otherwise>
											<a href="#" class="author"><img src="" alt="" style="background-color: gray;" />&nbsp;&nbsp;
												<span class="name"><input type="text" name="id" value="${postService.getUser(post.getPostId()).get().getName() }" readonly="readonly" class="author"></span>
											</a>
										</c:otherwise>
									</c:choose>
									
								</p>
								<p>
									<input type="text" readonly="readonly" name="cre_date" class="published" value="${post.getCre_date() }">
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
							   ${post.getContent() }
							  </div>
							</div>
						
						<!-- <script>있던 자리 -->
						</form>
					</div>
					
					
			
					
					<footer>
						<ul class="stats commment_stats">
							<li><a class="comment-count">📝<span class="comment-count-number">2</span></a></li> <!-- 댓글 개수 -->
							<li><a class="like-button" ><span class="like-icon">❤️</span><span class="like-count">2</span></a></li> <!-- 좋아요 개수 -->
							<!-- <li><a href="#" class="icon solid fa-heart"><i class="fa fa-heart"></i></a> 2</li> -->
						</ul>
						<div class="comment-section">
							<ul id="comment-list" class="comment-list col-12">
								<c:set var="comments" value="${commentService.getCommentList(post.getPostId()) }"/>							
								<c:forEach var="comment" items="${comments}" varStatus="loop">
                                    <c:if test="${loop.index < 2}">
                                        <li>
                                            <div class="comment-name">이름 ${commentService.getUser(comment.getCommentid()).get().getName()}</div>                                            
                                            <div class="comment-date"><small>날짜 ${fn:substring(comment.getCre_date(),2,10) }</small> </div>
                                             <div class="comment-content"><div class="col-10">내용 ${comment.getContent()}</div></div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            
								
							
							<div class="button-row">
								<c:if test="${post.getId() eq sessionScope.id}">
									<form action="/community/posts/${post.getPostId() }" method="post">										
									 	<input type="hidden" name="_method" value="DELETE"/>
									 	<%-- <input type="hidden" name="postId" value="${post.getPostId() }"/> --%>
										<button type="submit" class="delete-post">삭제하기</button>
									</form>
								</c:if>
								<button class="comment-button" type="button" onclick="return showCommentInput(this)">댓글쓰기</button>
								<c:if test="${comments.size() > 2}">
	                                <button onclick="location.href='/community/posts/${post.getPostId()}'">댓글 더보기</button>
	                            </c:if>
	                            
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
				
			</article>
		</c:forEach>	
		
		
		
			
		<!-- Pagination -->
			<ul id="pagination" class="actions pagination">
				<li><a href="#" class="button large previous">◀</a></li>
				<li><a href="#" class="button large" >1</a></li>
				<li><a href="#" class="button large" >2</a></li>
				<li><a href="#" class="button large" >3</a></li>
				<li><a href="#" class="button large next">▶</a></li>
			</ul>

		</div>
		
		
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