<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/common/header.jsp" />


 
		<!-- Wrapper -->
		<div id="wrapper" class="co">
		<main id="co-main" class="broad" style="margin-top: 200px">

			
			<!-- Main -->
				<div id="main" class="col-7 m-auto" style="float: right;">
					
					<!-- input -->
					<div class="post col-12">
						<div class="header"><!-- <header>였던 것을 <div>로 수정했음, <header>일때 background-header의 영향을 받음 -->
							<div class="meta">
								<a href="#" class="author">
									<img src="/resources/images/avatar.jpg" alt=""/>
									<span class="name">Jane Doe</span>
								</a>
							<button class="submitpost submitbutton">등록</button>
							<button class="insertpost">입력</button>
							</div>
						</div>
						<div class="submitpost"> <!-- class divtextarea -->
							<textarea id="co-textarea" class="col-12" rows="2"></textarea>
						</div>
					</div>
					
					<article class="post col-12" style="border-radius: 10px">
								<div  class="header"><!-- <header>였던 것을 <div>로 수정했음, <header>일때 background-header의 영향을 받음 -->
									<div class="meta">
										<a href="#" class="author">
											<img src="/resources/images/avatar.jpg" alt="" />
											<span class="name">Jane Doe</span>
										</a>
										<time class="published" datetime="2015-11-01">November 1, 2015</time>
									</div>
								</div>
								<div class="content">
									<a href="/post.do" class="image featured"><img src="/resources/images/pic02.jpg" alt=""/></a>
									<br>
									<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
									<p>Nunc quis dui scelerisque, scelerisque urna ut, dapibus orci. Sed vitae condimentum lectus, ut imperdiet quam. Maecenas in justo ut nulla aliquam sodales vel at ligula. Sed blandit diam odio, sed fringilla lectus molestie sit amet. Praesent eu tortor viverra lorem mattis pulvinar feugiat in turpis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ullamcorper tellus sit amet mattis dignissim. Phasellus ut metus ligula. Curabitur nec leo turpis. Ut gravida purus quis erat pretium, sed pellentesque massa elementum. Fusce vestibulum porta augue, at mattis justo. Integer sed sapien fringilla, dapibus risus id, faucibus ante. Pellentesque mattis nunc sit amet tortor pellentesque, non placerat neque viverra. </p>
								</div>
		
								
								<div class="footer">
									<div class="col-12 row justify-content-between">
										<button class="comment">댓글 더보기</button>
										<button>♥ 좋아요</button>
									</div>
									<div class="comments actions col-12 m-auto row justify-content-around">
										<!-- <li><button class="comment "><a class="button large">댓글 입력창 (슬라이드 토글 사용) </a></button></li> -->
																			
									
										<ul>
											<li>
												<div class="divcomment divtext">
													<textarea class="col-10" rows="2"></textarea>
													<button class="col-1 ml-auto">등록</button>
												</div>
												<div>
													<div class="divname">이름</div>
													<div class="divcontent">댓글 내용</div>								
												</div>
												<div>
													<div class="divname">이름</div>
													<div class="divcontent">댓글 내용</div>								
												</div>		
												<div class="divcomment" style="display: none;">										
													<div>
														<div class="divname">이름</div>
														<div class="divcontent">댓글 내용</div>								
													</div>
													<div>
														<div class="divname">이름</div>
														<div class="divcontent">댓글 내용</div>								
													</div>
													<div>
														<div class="divname">이름</div>
														<div class="divcontent">댓글 내용</div>								
													</div>
												</div>
												</table>
											</li>									
										</ul>
									</div>
									
									
								</div>
							</article>
					
					
					<article class="post col-12" style="border-radius: 10px">
								<div  class="header" style="border-bottom: solid 1px rgba(160, 160, 160, 0.3); height: 75px;"><!-- <header>였던 것을 <div>로 수정했음, <header>일때 background-header의 영향을 받음 -->
									<div class="meta" style="border-left: 0; padding: 1.5em 0 0 1em;">
										<a href="#" class="author" style="padding-left:0; font-size:20px">
											<img src="/resources/images/avatar.jpg" alt="" style="width: 1.5em"/>
											<span class="name" style="margin-left:10px">Jane Doe</span>
										</a>
										<time class="published" datetime="2015-11-01" style="float: right; margin-top:-7px">November 1, 2015</time>
									</div>
								</div>
								<div style="margin:20px">
									<a href="/post.do" class="image featured"><img src="/resources/images/pic02.jpg" alt="" width="100%" style="margin-bottom:20px"/></a>
									<br>
									<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
									<p>Nunc quis dui scelerisque, scelerisque urna ut, dapibus orci. Sed vitae condimentum lectus, ut imperdiet quam. Maecenas in justo ut nulla aliquam sodales vel at ligula. Sed blandit diam odio, sed fringilla lectus molestie sit amet. Praesent eu tortor viverra lorem mattis pulvinar feugiat in turpis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ullamcorper tellus sit amet mattis dignissim. Phasellus ut metus ligula. Curabitur nec leo turpis. Ut gravida purus quis erat pretium, sed pellentesque massa elementum. Fusce vestibulum porta augue, at mattis justo. Integer sed sapien fringilla, dapibus risus id, faucibus ante. Pellentesque mattis nunc sit amet tortor pellentesque, non placerat neque viverra. </p>
								</div>
		
								
								<div style="background-color: #fff; margin:40px 0;">
									<div class="col-12 row justify-content-between" style="margin-left: 0; margin-bottom:20px">
										<button class="comment" style="line-height: 0; background-color: #e4e4eb; border-radius:5px; font-size:13px; border:0; height:30px; text-align: center; padding:0">댓글 더보기</button>
										<button class="" style="float: right; line-height: 0; background-color: #e4e4eb; border-radius:5px; font-size:13px; border:0; width=92px; height:30px; text-align: center; padding:0">♥ 좋아요</button>
									</div>
									<div class="actions col-12 m-auto row justify-content-around" style=" flex-direction: column;">
										<!-- <li><button class="comment "><a class="button large">댓글 입력창 (슬라이드 토글 사용) </a></button></li> -->
																			
									
										<ul>
											<li>
												<div class="divcomment" style="display: none; margin:0 10px 20px 10px;">
													<textarea id="textarea" class="col-10" rows="2" style="display:inline-block; height:59px; resize: none; border: 1px solid #e4e4eb; padding:0;"></textarea>
													<button class="col-1 ml-auto" style="float: right; line-height: 0; background-color: #e4e4eb; border-radius:5px; font-size:13px; border:0; height:30px; text-align: center; padding:0">등록</button>
												</div>
												<div>
													<div style="width:50px; display: inline-block;">이름</div>
													<div style="width:200px; display: inline-block;">댓글 내용</div>								
												</div>
												<div>
													<div style="width:50px; display: inline-block;">이름</div>
													<div style="width:200px; display: inline-block;">댓글 내용</div>								
												</div>		
												<div class="divcomment" style="display: none;">										
													<div>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</div>
													<div>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</div>
													<div>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</div>
												</div>
												</table>
											</li>									
										</ul>
									</div>
									
									
								</div>
							</article>
							
							
							<article class="post col-12" style="border-radius: 10px">
								<div  class="header" style="border-bottom: solid 1px rgba(160, 160, 160, 0.3); height: 75px;"><!-- <header>였던 것을 <div>로 수정했음, <header>일때 background-header의 영향을 받음 -->
									<div class="meta" style="border-left: 0; padding: 1.5em 0 0 1em;">
										<a href="#" class="author" style="padding-left:0; font-size:20px">
											<img src="/resources/images/avatar.jpg" alt="" style="width: 1.5em"/>
											<span class="name" style="margin-left:10px">Jane Doe</span>
										</a>
										<time class="published" datetime="2015-11-01" style="float: right; margin-top:-7px">November 1, 2015</time>
									</div>
								</div>
								<div style="margin:20px">
									<a href="/post.do" class="image featured"><img src="/resources/images/pic02.jpg" alt="" width="100%" style="margin-bottom:20px"/></a>
									<br>
									<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
									<p>Nunc quis dui scelerisque, scelerisque urna ut, dapibus orci. Sed vitae condimentum lectus, ut imperdiet quam. Maecenas in justo ut nulla aliquam sodales vel at ligula. Sed blandit diam odio, sed fringilla lectus molestie sit amet. Praesent eu tortor viverra lorem mattis pulvinar feugiat in turpis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ullamcorper tellus sit amet mattis dignissim. Phasellus ut metus ligula. Curabitur nec leo turpis. Ut gravida purus quis erat pretium, sed pellentesque massa elementum. Fusce vestibulum porta augue, at mattis justo. Integer sed sapien fringilla, dapibus risus id, faucibus ante. Pellentesque mattis nunc sit amet tortor pellentesque, non placerat neque viverra. </p>
								</div>
		
								
								<div style="background-color: #fff; margin:40px 0;">
									<div class="col-12 row justify-content-between" style="margin-left: 0; margin-bottom:20px">
										<button class="comment" style="line-height: 0; background-color: #e4e4eb; border-radius:5px; font-size:13px; border:0; height:30px; text-align: center; padding:0">댓글 더보기</button>
										<button class="" style="float: right; line-height: 0; background-color: #e4e4eb; border-radius:5px; font-size:13px; border:0; width=92px; height:30px; text-align: center; padding:0">♥ 좋아요</button>
									</div>
									<div class="actions col-12 m-auto row justify-content-around" style=" flex-direction: column;">
										<!-- <li><button class="comment "><a class="button large">댓글 입력창 (슬라이드 토글 사용) </a></button></li> -->
																			
									
										<ul>
											<li>
												<div class="divcomment" style="display: none; margin:0 10px 20px 10px;">
													<textarea id="textarea" class="col-10" rows="2" style="display:inline-block; height:59px; resize: none; border: 1px solid #e4e4eb; padding:0;"></textarea>
													<button class="col-1 ml-auto" style="float: right; line-height: 0; background-color: #e4e4eb; border-radius:5px; font-size:13px; border:0; height:30px; text-align: center; padding:0">등록</button>
												</div>
												<div>
													<div style="width:50px; display: inline-block;">이름</div>
													<div style="width:200px; display: inline-block;">댓글 내용</div>								
												</div>
												<div>
													<div style="width:50px; display: inline-block;">이름</div>
													<div style="width:200px; display: inline-block;">댓글 내용</div>								
												</div>		
												<div class="divcomment" style="display: none;">										
													<div>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</div>
													<div>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</div>
													<div>
														<div style="width:50px; display: inline-block;">이름</div>
														<div style="width:200px; display: inline-block;">댓글 내용</div>								
													</div>
												</div>
												</table>
											</li>									
										</ul>
									</div>
									
									
								</div>
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
			<!-- Sidebar -->
			<section id="sidebar" class="col-2 menu-trigger">
				<section>
					<nav class="sidebar_nav">
						<ul>
							<li class="menu">
								<a class="fa-bars" href="#menu">전체 포스트</a>
							</li>
							<li class="menu">
								<a class="fa-bars" href="#menu">팔로잉 포스트</a>
							</li>
							<li class="menu">
								<a class="fa-bars" href="#menu">판매자 포스트</a>
							</li>
							<li class="menu">
								<a class="fa-bars" href="#menu">댓글 포스트</a>
							</li>
							<li class="menu">
								<a class="fa-bars" href="#menu">좋아요 포스트</a>
							</li>
							<li class="menu sidebar_search">
								<form id="sidebar_search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />&nbsp;&nbsp;&nbsp;
									<button type="submit" value="검색">
								</form>
							</li>
							
						</ul>
					</nav>
				</section>
	
				<!-- Posts List -->
					<section>
						<ul class="posts">
							<li>
								<div>
									<a href="single.html">
										<div class="divimg" id="article_img1"></div>
										<div class="lidiv">saler J</div>
									</a>
								</div>
							</li>
							<li>
								<div>
									<a href="single.html">
										<div class="divimg" id="article_img2"></div>
										<div class="lidiv">saler A</div>
									</a>
								</div>
							</li>
							<li>
								<div>
									<a href="single.html">
										<div class="divimg" id="article_img3"></div>
										<div class="lidiv">saler Q</div>
									</a>
								</div>
							</li>
							<li>
								<div>
									<a href="single.html">
										<div class="divimg" id="article_img4"></div>
										<div class="lidiv">saler K</div>
									</a>
								</div>
							</li>
							<li>
								<div>
									<a href="single.html">
										<div class="divimg" id="article_img5"></div>
										<div class="lidiv">saler I</div>
									</a>
								</div>
							</li>
						</ul>
					</section>
	
				<!-- About -->
					<section class="blurb">
						<h2>About US</h2>
						<p>
							Contect&nbsp;:&nbsp;&nbsp;<a>project@forwin.com</a>
	
						</p>
						
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</section>
	
			</section>	
			


		</main>
		</div>
		

<div id="st-main"></div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />