<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
 
		<!-- Wrapper -->
			<main id="co-main" class="broad">


				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
									<li>
										<a href="#">
											<h3>Lorem ipsum</h3>
											<p>Feugiat tempus veroeros dolor</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Dolor sit amet</h3>
											<p>Sed vitae justo condimentum</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Feugiat veroeros</h3>
											<p>Phasellus sed ultricies mi congue</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Etiam sed consequat</h3>
											<p>Porta lectus amet ultricies</p>
										</a>
									</li>
								</ul>
							</section>

						<!-- Actions -->
							<section>
								<ul class="actions stacked">
									<li><a href="#" class="button large fit">Log In</a></li>
								</ul>
							</section>

					</section>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<p>
											<a href="#" class="author"><img src="/resources/images/avatar.jpg" alt="" />&nbsp;&nbsp;<span class="name">Jane Doe</span></a>
										</p>
										<p>
											<time class="published" datetime="2015-11-01">November 1, 2015</time>
										</p>
										
									</div>
								</header>
								<div class="post_img"><img src="/resources/images/pic01.jpg" alt="" /></div>
								<div class="post_img"><img src="/resources/images/pic01.jpg" alt="" /></div>				
								
								<!-- <a href="single.html" class="image featured"><img src="/resources/images/pic01.jpg" alt="" /></a> -->
								<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
								<ul class="stats commment_stats">
										<li><a href="#">댓글 보기</a></li>
										<li><a href="#" class="icon solid fa-heart"><i class="fa-solid fa-heart"></i>좋아요</a> 1</li>
										
								</ul>
								<footer >
									<ul class="actions">
										<!-- <li><button class="comment "><a class="button large">댓글 입력창 (슬라이드 토글 사용) </a></button></li> -->
										<li id="comment_li"><button class="comment ">댓글 입력창</button></li>
										<li id="comment_li"><div class="divcomment"><input type="text" name="comment"></div></li>
									</ul>
							</footer>
							</article>

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="single.html">Ultricies sed magna euismod enim vitae gravida</a></h2>
										<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-10-25">October 25, 2015</time>
										<a href="#" class="author"><span class="name">Jane Doe</span><img src="/resources/images/avatar.jpg" alt="" /></a>
									</div>
								</header>
								<a href="single.html" class="image featured"><img src="/resources/images/pic02.jpg" alt="" /></a>
								<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper.</p>
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

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="single.html">Euismod et accumsan</a></h2>
										<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-10-22">October 22, 2015</time>
										<a href="#" class="author"><span class="name">Jane Doe</span><img src="/resources/images/avatar.jpg" alt="" /></a>
									</div>
								</header>
								<a href="single.html" class="image featured"><img src="/resources/images/pic03.jpg" alt="" /></a>
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

				<!-- Sidebar -->
					<section id="sidebar">
						<section>
							<nav class="sidebar_nav">
								<ul>
									<li class="menu" >
										<a class="fa-bars" href="#menu">Menu</a>
									</li>
									<li class="sidebar_search" >
										<a class="fa-search" href="">Search</a>
										<form id="sidebar_search" method="get" action="#">
											<input type="text" name="query" placeholder="Search" />
										</form>
									</li>
									
								</ul>
							</nav>
						</section>

						<!-- Posts List -->
							<section>
								<ul class="posts">
									<li>
										<article>
											<header>
												<h3><a href="single.html">saler J</a></h3>
												<time class="published" datetime="2015-1-20">October 20, 2015</time>
											</header>
											<a href="single.html" class="image"><div id="article_img1"></div></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="single.html">saler A</a></h3>
												<p>update <em style="color:blueviolet">new</em></p>
											</header>
											<a href="single.html" class="image"><div id="article_img2"></div></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="single.html">saler Q</a></h3>
												<p>update <em style="color:blueviolet">new</em></p>
												
											</header>
											<a href="single.html" class="image"><div id="article_img3"></div></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="single.html">saler K</a></h3>
												<time class="published" datetime="2015-10-08">October 8, 2015</time>
											</header>
											<a href="single.html" class="image"><div id="article_img4"></div></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="single.html">saler I</a></h3>
												<time class="published" datetime="2015-10-06">October 7, 2015</time>
											</header>
											<a href="single.html" class="image"><div id="article_img5"></div></a>
										</article>
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

<div id="st-main"></div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />