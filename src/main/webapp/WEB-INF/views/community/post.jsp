<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <link href="/resources/css/community.css" rel="stylesheet" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<!-- Wrapper -->
			<div id="wrapper" class="co col-lg-12">

				<!-- Main -->
					<div id="main" class="col-lg-7">

						<!-- Post -->
							<article class="post col-lg-12">
								<div class="header"><!-- <header>였던 것을 <div>로 수정했음, <header>일때 background-header의 영향을 받음 -->
									<div class="meta">
										<a href="#" class="author">
											<img src="/resources/images/avatar.jpg" alt=""/>
											<span class="name">Jane Doe</span>
										</a>
										<time class="published" datetime="2015-11-01">November 1, 2015</time>
									</div>
								</div>
								<div class="content">
									<span class="image featured"><img src="/resources/images/pic02.jpg" alt=""/></span>
									<br>
									<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
									<p>Nunc quis dui scelerisque, scelerisque urna ut, dapibus orci. Sed vitae condimentum lectus, ut imperdiet quam. Maecenas in justo ut nulla aliquam sodales vel at ligula. Sed blandit diam odio, sed fringilla lectus molestie sit amet. Praesent eu tortor viverra lorem mattis pulvinar feugiat in turpis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ullamcorper tellus sit amet mattis dignissim. Phasellus ut metus ligula. Curabitur nec leo turpis. Ut gravida purus quis erat pretium, sed pellentesque massa elementum. Fusce vestibulum porta augue, at mattis justo. Integer sed sapien fringilla, dapibus risus id, faucibus ante. Pellentesque mattis nunc sit amet tortor pellentesque, non placerat neque viverra. </p>
								</div>
								<button class="commentList">댓글 더보기</button>
								<button class="like">♥ 좋아요</button>
								
								<div class="footer">
									<ul class="actions">
										<!-- <li><button class="comment "><a class="button large">댓글 입력창 (슬라이드 토글 사용) </a></button></li> -->
										<li id="comment_li"><button class="comment"">댓글 입력창</button></li>
										<li id="comment_li">
											<div class="divcomment">
												<textarea id="co-textarea" class="col-12" rows="2"></textarea>
											</div>
										</li>									
									
										<ul class>
											<li id="">
												<p>
													<div class="divname">이름</div>
													<div class="divcontent">댓글 내용</div>								
												</p>
												<p>
													<div class="divname">이름</div>
													<div class="divcontent">댓글 내용</div>								
												</p>		
												<div class="ulcommentList">										
													<p>
														<div class="divname">이름</div>
														<div class="divcontent">댓글 내용</div>								
													</p>
													<p>
														<div class="divname">이름</div>
														<div class="divcontent">댓글 내용</div>								
													</p>
													<p>
														<div class="divname">이름</div>
														<div class="divcontent">댓글 내용</div>								
													</p>
												</div>
												</table>
											</li>									
										</ul>
									</ul>
									
									
								</div>
							</article>

					</div>
					</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />