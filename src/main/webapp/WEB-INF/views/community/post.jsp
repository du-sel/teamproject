<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" href="../resources/css/main.css" />
	    <link rel="stylesheet" href="../resources/css/templatemo-hexashop.css">
		

	    <!-- Bootstrap -->
	    <script src="../resources/js/popper.js"></script>
	    <script src="../resources/js/bootstrap.min.js"></script>
	 
	    <!-- Plugins -->
	    <script src="../resources/js/owl-carousel.js"></script>
	    <script src="../resources/js/accordions.js"></script>
	    <script src="../resources/js/datepicker.js"></script>
	    <script src="../resources/js/scrollreveal.min.js"></script>
	    <script src="../resources/js/waypoints.min.js"></script>
	    <script src="../resources/js/jquery.counterup.min.js"></script>
	    <script src="../resources/js/imgfix.min.js"></script> 
	    <script src="../resources/js/slick.js"></script> 
	    <script src="../resources/js/lightbox.js"></script> 
	    <script src="../resources/js/isotope.js"></script> 
	    
	    <!-- Global Init -->
	    <script src="../resources/js/custom.js"></script>
	
		<!-- Modal -->
		<script src="../resources/js/modal.js"></script> 
		
		
		
		<script>			
			$( document ).ready( function() {
				$( 'button.commentList' ).click( function() {
				$( '.ulcommentList' ).slideToggle();
				} );
			} );
		</script>

	</head>
	<body class="single is-preload">
		<!-- Wrapper -->
			<div id="wrapper">


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
					<div id="main" style="margin: 250px">

						<!-- Post -->
							<article class="post">
								<div style="border-bottom: solid 1px rgba(160, 160, 160, 0.3); height: 5em"><!-- <header>였던 것을 <div>로 수정했음, <header>일때 background-header의 영향을 받음 -->
									<div class="meta" style="border-left: 0; padding: 1.5em 0 1.75em 3em; width:670px">
										<a href="#" class="author" style="padding-left:0"><img src="images/avatar.jpg" alt="" style="width: 1.5em"/><span class="name">Jane Doe</span></a>
										<time class="published" datetime="2015-11-01" style="float: right">November 1, 2015</time>
									</div>
								</div>
								<span class="image featured"><img src="images/pic01.jpg" alt="" width="100%"/></span>
								<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
								<p>Nunc quis dui scelerisque, scelerisque urna ut, dapibus orci. Sed vitae condimentum lectus, ut imperdiet quam. Maecenas in justo ut nulla aliquam sodales vel at ligula. Sed blandit diam odio, sed fringilla lectus molestie sit amet. Praesent eu tortor viverra lorem mattis pulvinar feugiat in turpis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ullamcorper tellus sit amet mattis dignissim. Phasellus ut metus ligula. Curabitur nec leo turpis. Ut gravida purus quis erat pretium, sed pellentesque massa elementum. Fusce vestibulum porta augue, at mattis justo. Integer sed sapien fringilla, dapibus risus id, faucibus ante. Pellentesque mattis nunc sit amet tortor pellentesque, non placerat neque viverra. </p>
								<p><!-- 여백 -->
								<button class="commentList">댓글 더보기</button>
								<ul class="stats commment_stats">
										<li><a href="#" class="icon solid fa-heart">좋아요</a> 1</li>
								</ul>
								<footer style="background-color: #fff; margin-top:0">
									<ul class="actions">
										<!-- <li><button class="comment "><a class="button large">댓글 입력창 (슬라이드 토글 사용) </a></button></li> -->
										<li id="comment_li"><button class="comment ">댓글 입력창</button></li>
										<li id="comment_li"><div class="divcomment"  style="display: none;"><input type="text" name="comment"></div></li>									
										<li>댓글 내용</li>
										<li>댓글 내용</li>
										<ul class="ulcommentList" style="display: none;">
											<li>댓글 내용</li>											
											<li>댓글 내용</li>											
											<li>댓글 내용</li>											
											<li>댓글 내용</li>											
											<li>댓글 내용</li>											
										</ul>
									</ul>
									
									
								</footer>
							</article>

					</div>

				<!-- Footer -->
					<section id="footer">
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
							<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</section>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>