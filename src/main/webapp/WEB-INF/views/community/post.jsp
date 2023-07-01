<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<!-- Wrapper -->
			<div id="wrapper" class="col-lg-12">

				<!-- Main -->
					<div id="main" style="margin: 250px auto" class="col-lg-7">

						<!-- Post -->
							<article class="post col-lg-12">
								<div style="border-bottom: solid 1px rgba(160, 160, 160, 0.3); height: 75px;"><!-- <header>였던 것을 <div>로 수정했음, <header>일때 background-header의 영향을 받음 -->
									<div class="meta" style="border-left: 0; padding: 1.5em 0 0 1em;">
										<a href="#" class="author" style="padding-left:0; font-size:20px">
											<img src="/resources/images/avatar.jpg" alt="" style="width: 1.5em"/>
											<span class="name" style="margin-left:10px">Jane Doe</span>
										</a>
										<time class="published" datetime="2015-11-01" style="float: right; margin-top:-7px">November 1, 2015</time>
									</div>
								</div>
								<div style="margin:20px">
									<span class="image featured"><img src="/resources/images/pic02.jpg" alt="" width="100%" style="margin-bottom:20px"/></span>
									<br>
									<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
									<p>Nunc quis dui scelerisque, scelerisque urna ut, dapibus orci. Sed vitae condimentum lectus, ut imperdiet quam. Maecenas in justo ut nulla aliquam sodales vel at ligula. Sed blandit diam odio, sed fringilla lectus molestie sit amet. Praesent eu tortor viverra lorem mattis pulvinar feugiat in turpis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ullamcorper tellus sit amet mattis dignissim. Phasellus ut metus ligula. Curabitur nec leo turpis. Ut gravida purus quis erat pretium, sed pellentesque massa elementum. Fusce vestibulum porta augue, at mattis justo. Integer sed sapien fringilla, dapibus risus id, faucibus ante. Pellentesque mattis nunc sit amet tortor pellentesque, non placerat neque viverra. </p>
								</div>
								<button class="commentList" style="background-color: #e4e4eb; border-radius:5px; font-size:15px; border:0; width=92px; height:30px; text-align: center;">댓글 더보기</button>
								<button style="float: right; background-color: #e4e4eb; border-radius:5px; font-size:15px; border:0; width=92px; height:30px; text-align: center;">♥ 좋아요</button>
								
								<footer style="background-color: #fff; margin-top:0">
									<ul class="actions">
										<!-- <li><button class="comment "><a class="button large">댓글 입력창 (슬라이드 토글 사용) </a></button></li> -->
										<li id="comment_li"><button class="comment" style="background-color: #e4e4eb; border-radius:5px; font-size:15px; border:0; width=92px; height:30px; text-align: center;">댓글 입력창</button></li>
										<li id="comment_li">
											<div class="divcomment"  style="display: none;">
												<textarea id="co-textarea" class="col-12" rows="2" style="display:block; height:59px; resize: none; border: 1px solid #e4e4eb;"></textarea>
											</div>
										</li>									
									
										<ul class>
											<li id="">
												<p>
													<div style="width:50px; display: inline-block;">이름</div>
													<div style="width:200px; display: inline-block;">댓글 내용</div>								
												</p>
												<p>
													<div style="width:50px; display: inline-block;">이름</div>
													<div style="width:200px; display: inline-block;">댓글 내용</div>								
												</p>		
												<div class="ulcommentList" style="display: none;">										
													<p>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</p>
													<p>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</p>
													<p>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</p>
												</div>
												</table>
											</li>									
										</ul>
									</ul>
									
									
								</footer>
							</article>

					</div>
					</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />