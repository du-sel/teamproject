<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script src="/resources/js/community-toggle.js"></script>
<script>



/*  날짜 변환 함수  */
function convertDate(milliSecond) {
	let data = new Date(milliSecond);
	
	let year = data.getFullYear();
	let month = data.getMonth() + 1;
	let date = data.getDate();
	
	let result = year + '-' +
		(month < 10 ? '0'+month : month) + '-' +
		(date < 10 ? '0'+date : date);
		
	return result;
}


/* 탭 - 피드 선택하면 피드 정보 가져오기    */
function getUserPostList(page) {
	
	let pathname = window.location.pathname;
	let url = pathname.substring(pathname.indexOf("profiles")+9);
	if(url.indexOf("/") > 0) {	
		url = url.substring(0, url.indexOf("/"));
	}
	
	$.ajax({
		type: 'get',
		url: '/profiles/'+url+'/posts',
		contentType: "application/text; charset=UTF-8",
		datatype: 'json',
		data: {
			page: page,
		},
		success: function(data) {					
			
			// JSON 객체별로 쪼개기
			let JSONdata = JSON.parse(data);
			let list = JSON.parse(JSONdata.list);	// 포스트 리스트
			let paging = JSON.parse(JSONdata.paging);
			let imgs = JSON.parse(JSONdata.imgs);
			let comments = JSON.parse(JSONdata.comments);
			// 안에있는 리스트도 따로 해줘야하나...
			
			
			let postArr = list.content;
			
			let box = document.getElementById("post-box");
			let parent = box.parentElement;
			let pagination = document.getElementById('feed-pagination-container');
			
			$(box).hide();
			$(pagination).hide();

			
			if(postArr.length > 0) {
				$('.new-box').remove();
				$('.new-li').remove();				

				for(let i = 0; i < postArr.length; i++) {
					let post = postArr[i];
					
					let newBox = document.createElement('section');
					newBox.innerHTML = box.innerHTML;
					newBox.classList.add('post');
					newBox.classList.add('new-box');
					
					// 전체 onclick 부여
					let post_onclick = $(newBox).find('.post-onclick');
					$(post_onclick).on('click', function() {
						 location.href='/community/posts/'+post.postId;
					});
					
					let profile_img = $(newBox).find('.author img');
					profile_img.attr('src', post.profile_img)
					
					let name = $(newBox).find('.author.name');
					name.text(post.name);
					
					let delFrm = $(newBox).find('.delFrm');
					delFrm.attr('action', '/community/posts/'+post.postId);
					$(delFrm).hide();
					
					// 로그인된 id가 같을 때만 삭제버튼 띄워주기
					let current_id = '${sessionScope.user.id}';
					if(current_id == post.id) {
						$(delFrm).show();
					} else {						
						$(delFrm).hide();
					}
					
					let published = $(newBox).find('.published');
					published.text(convertDate(post.creDate));
					
					
					// 이미지가 있을 경우에만 띄워주기
					let img_container = $(newBox).find('.img-container');
					img_container.hide();
					
					let imgList;
					for(let key in imgs) {
						if(key == post.postId) {
							imgList = imgs[key];
						}
					}
					
					if(imgList != null && imgList.length > 0) {
						let img_card = $(img_container).find('#card');
						img_card.hide();
						
						if(imgList.length == 1) {
							img_container.addClass('one');
						}
						else if(imgList.length == 2) {
							img_container.addClass('two');
						}
						else if(imgList.length == 3) {
							img_container.addClass('three');
						}
						else if(imgList.length == 4) {
							img_container.addClass('four');
						}
						
						for(let j = 0; j < imgList.length; j++) {
							let img = imgList[j];
							
							let newCard = document.createElement('div');
							newCard.innerHTML = img_card.html();
							newCard.classList.add('img-card');
							
							let inner_img = $(newCard).find('img');
							inner_img.attr('src', img.img);
							$(inner_img).on('click', function() {
								showImageModal(event, img.img);
							});
							
							img_container.append(newCard);
						}
						
						img_container.show();
						img_container.css('display', 'grid');
					}
					

					// 본문
					let content = $(newBox).find('.post-content-inner');
					content.text(post.content);
					
					
					// 좋아요 버튼 onclick
					let t_count_container = $(newBox).find('.like-count');
					$(t_count_container).on('click', function() {
					    console.log("LIKE");
					    var likeCount = parseInt($(this).parent().find(".like-count-number").text().trim());
					    likeCount++;
					    $(this).parent().find(".like-count-number").text(likeCount);
				    });
					
					
					// 댓글 개수에 따라 onclick 다르게 부여
					let c_count_container = $(newBox).find('.comment-count');
					let c_count = post.c_count;
					
					if(c_count > 3) {
						$(c_count_container).on('click', function() {
							location.href='/community/posts/'+post.postId;
						});
					} else {
						$(c_count_container).on('click', function() {
							showCommentInput(this);
						});
					}
					
					$(newBox).find('.comment-count-number').text(post.c_count);
					$(newBox).find('.like-count-number').text(post.t_count);
					
					
					
					// 댓글 표시
					
					let comment_container = $(newBox).find('.comment-list');
					let comment_button = $(newBox).find('.comment-button');
					comment_container.hide();
					comment_button.hide();
					
					let commentList;
					for(let key in comments) {
						if(key == post.postId) {
							commentList = comments[key];
						}
					}
					
					
					if(commentList != null && commentList.length > 0) {
						
						let comment_li = $(comment_container).find('#li');
						comment_li.hide();
						
						for(let j = 0; j < commentList.length; j++) {
							let comment = commentList[j];
							console.log('comment index: '+j);
							console.log(comment);
							
							let newLi = document.createElement('li');
							newLi.innerHTML = comment_li.html();
							//newLi.classList.add('img-card');
							
							$(newLi).find('.comment-name').text(comment.name);
							$(newLi).find('.comment-date').text(convertDate(comment.creDate));
							$(newLi).find('.comment-content').text(comment.content);
							
							
							// 로그인된 id가 같을 때만 삭제버튼 띄워주기
							let delCommentFrm = $(newLi).find('.deleteComment');
							delCommentFrm.attr('action', '');
							// 나중에 action 추가
							$(delCommentFrm).hide();
					
							let current_id = '${sessionScope.user.id}';
							if(current_id == comment.id) {
								$(delCommentFrm).show();
							} else {						
								$(delCommentFrm).hide();
							}
							
							
							comment_container.append(newLi);
						}
						
						comment_container.show();
						comment_button.show();
					}
					
					
					
					// 댓글 입력창 (댓글 존재 여부와 상관없이 필요)
					let insertcomment = $(newBox).find('#insertcomment');
					insertcomment.attr('action', '/community/posts/'+(post.postId)+'/comments');
					
					let comment_hidden_postId = $(newBox).find('.comment-postId');
					comment_hidden_postId.val(post.postId);
					
					// 댓글 입력창 - 로그인 된 경우에만 띄워줌
					let comment_login = $(newBox).find('.comment-login');
					let comment_logout = $(newBox).find('.comment-logout');
					
					if(current_id != null && current_id.length > 0) {
						comment_login.show();
						comment_login.css('display', 'flex');
						comment_login.css('width', '100%');
						comment_logout.hide();
					} else {
						comment_login.hide();
						comment_logout.show();
					}	

					
					parent.insertBefore(newBox, pagination);
				}

				
							
				// 페이징 처리	
				
				if(list.totalPages > 1) {
					
					console.log(list);
					$(pagination).show();
					console.log("NUMBER");
					console.log(list.number);
					
					let ul = document.querySelector('.feed-pagination ul');
					let page = document.querySelector('.feed-pagination #page');
					let prev = document.querySelector('.feed-pagination #prev');
					let next = document.querySelector('.feed-pagination #next');
					
					if(list.number-1 >= 0) {
						$(prev).show();
						$(prev).on('click', function() {
							getUserPostList((list.number-1));
						});
					} else {
						$(prev).hide();
					}
					
					if(list.number+1 < list.totalPages) {
						$(next).show();
						$(next).on('click', function() {
							getUserPostList((list.number+1));
						});
					} else {
						$(next).hide();
					}

					
					for(let p = paging.startPage; p <= paging.endPage; p++) {
						let newPage = document.createElement('a');
						let newPageLi = document.createElement('li');
						newPageLi.classList.add('new-li');
						if(p == paging.nowPage) {
							newPageLi.classList.add('active');
						}

						$(newPage).on('click', function() {
							getUserPostList(p-1);
						});
						
						$(newPage).text(p);
						
						newPageLi.appendChild(newPage);
						ul.insertBefore(newPageLi, next.parentElement);
					}
				}
				
				
			} else {
				
				// 작성한 포스트가 없는 경우
				let noItem = document.createElement('div');
				noItem.innerHTML = '<h5>작성한 포스트가 없습니다</h5>';
				parent.appendChild(noItem);
			}
			
			
	
			$("#feed").addClass("active").addClass("show");
			$("#store").removeClass("active").removeClass("show");
			$("#notice").removeClass("active").removeClass("show");
			
		},
		error: function(message) { }
		
	})
	
} 





/* 탭 - 스토어 선택하면 스토어 정보 가져오기 */
function getCreatorProductList(page, sort) {

	let pathname = window.location.pathname;
	let url = pathname.substring(pathname.indexOf("profiles")+9);
	if(url.indexOf("/") > 0) {	
		url = url.substring(0, url.indexOf("/"));
		console.log(url);
	}
	
	// sort 값 구해서 넣어주기
	let sortSelect = document.getElementsByName('sortSelect')[0];
	console.log(sortSelect);
	console.log(sortSelect.options[0]);
	sort = sortSelect.options[sortSelect.selectedIndex].value;
	console.log(sort);
	
	
	$.ajax({
		type: 'get',
		url: '/profiles/'+url+'/products',
		contentType: "application/text; charset=UTF-8",
		datatype: 'json',
		data: {
			page: page,
			sort: sort
		},
		success: function(data) {					
			
			// JSON 객체별로 쪼개기
			let JSONdata = JSON.parse(data);
			let list = JSON.parse(JSONdata.list);	// 상품 리스트
			let paging = JSON.parse(JSONdata.paging);
			console.log(paging);
			
			
			let productArr = list.content;
			//console.log(productArr.length);
			
			let box = document.getElementById("product-box");
			let parent = box.parentElement;
			let pagination = document.getElementById('store-pagination-container');
			
			$(box).hide();
			$(pagination).hide();

			
			if(productArr.length > 0) {
				$('.new-box').remove();
				$('.new-li').remove();				

				for(let i = 0; i < productArr.length; i++) {
					let product = productArr[i];
					
					let newBox = document.createElement('div');
					newBox.innerHTML = box.innerHTML;
					newBox.classList.add('col-lg-4');
					newBox.classList.add('new-box');
					
					let item = $(newBox).find('.item');
					item.on('click', function(){
						location.href='/store/products/'+product.pid;
					});
					
					let cart = $(newBox).find('.hover-content li');
					cart.on('click', function() {
						preventDefaultGoCart(event, product.pid)
					});
					
					let thumbnail = $(newBox).find('img');
					thumbnail.attr('src', product.thumbnail)
					
					let p_name = $(newBox).find('.p_name');
					p_name.text(product.pname);
					
					$(newBox).find('.cost').text(numberWithCommas(product.price)+'원');
					$(newBox).find('.price').text(numberWithCommas(product.salePrice)+'원');
					
					if(product.sale <= 0) {
						$(newBox).find('.cost').hide();
					} 
					
					$(newBox).find('.star span').css('width', product.rating);

					parent.insertBefore(newBox, pagination);
				}

				
							
				// 페이징 처리		
				if(list.totalPages > 1) {
					
					$(pagination).show();
					
					let ul = document.querySelector('.store-pagination ul');
					let page = document.querySelector('.store-pagination #page');
					let prev = document.querySelector('.store-pagination #prev');
					let next = document.querySelector('.store-pagination #next');
					
					if(list.number-1 >= 0) {
						$(prev).show();
						$(prev).on('click', function() {
							getCreatorProductList((list.number-1), paging.sort);
						});
					} else {
						$(prev).hide();
					}
					
					if(list.number+1 < list.totalPages) {
						$(next).show();
						$(next).on('click', function() {
							getCreatorProductList((list.number+1), paging.sort);
						});
					} else {
						$(next).hide();
					}

					
					for(let p = paging.startPage; p <= paging.endPage; p++) {
						let newPage = document.createElement('a');
						let newPageLi = document.createElement('li');
						newPageLi.classList.add('new-li');
						if(p == paging.nowPage) {
							newPageLi.classList.add('active');
						}

						$(newPage).on('click', function() {
							getCreatorProductList(p-1, paging.sort);
						});
						
						$(newPage).text(p);
						
						newPageLi.appendChild(newPage);
						ul.insertBefore(newPageLi, next.parentElement);
					}
				}
				
				
			} else {
				
				// 판매자 등록은 되어있는데 상품은 없는 경우
				let noItem = document.createElement('div');
				noItem.innerHTML = '<h5>등록된 상품이 없습니다</h5>';
				parent.appendChild(noItem);
			}
			
			
	
			$("#store").addClass("active").addClass("show");
			$("#feed").removeClass("active").removeClass("show");
			$("#notice").removeClass("active").removeClass("show");
			
		},
		error: function(message) { }
		
	})
}
	
$(()=> {
	
	getUserPostList(0);
	
});




</script>

<main id="myprofile">
	<div  class="container firstcontainer">
	<!-- 
	<c:if test="${!empty sessionScope.id}">
	</c:if>
	 -->
		<!--상단 이미지-->
		<div class="row img">
			<div class="col-md-12 topimgdiv" <c:if test="${sessionScope.user.id == profile.id}">id="my-topimgdiv"</c:if>>
				<img src="${profile.bg_img}">
	        </div> 
	    </div>

		<div class="row  seconddiv">
			<div class="col-md-2 col-lg-1 profilediv">
				<div class="profile" id="profile">
					<img <c:if test="${sessionScope.user.id == profile.id}">id="my-profileimg"</c:if> class="profileimgmodify" src="${profile.profile_img}" >
				</div>
			</div> 
			
			<div class="col-md-4 offset-md-1 col-lg-4">
				<div class="nickname">${profile.getName()} </div>
				<div class="count">
					팔로워  &nbsp;${count}명&nbsp;&nbsp;|&nbsp;&nbsp;구독 &nbsp;${subcount}명
				</div>
				<br>
			<!-- SNS 주소 -->
			<c:choose>
			    <c:when test="${empty profile.youtube && empty profile.instagram }">
			        <!-- No YouTube and Instagram, no images -->
			        <div class="addressdiv"><a href="https://youtube.com/@${profile.youtube}">&nbsp;${profile.youtube}</a></div>
			        <div class="addressdiv"><a href="https://www.instagram.com/${profile.instagram}">&nbsp;${profile.instagram}</a></div>
			    </c:when>
			    <c:otherwise>
			        <c:choose>
			            <c:when test="${empty profile.youtube}">
			                <!-- Instagram has value, display Instagram image -->
			                <c:choose>
			                	<c:when test="${empty profile.instagram}">
			                		<div class="addressdiv"><a class="icons" href="https://youtube.com/@${profile.youtube}">&nbsp;${profile.youtube}</a></div>
			                		<div class="addressdiv"><a href="https://www.instagram.com/${profile.instagram}">&nbsp;${profile.instagram}</a></div>
			                	</c:when>
			                	<c:otherwise>
			                		<div class="addressdiv"><img class="icons" src="/resources/images/instagram.svg"><a href="https://www.instagram.com/${profile.instagram}">&nbsp;${profile.instagram}</a></div>
			                		<div class="addressdiv"><a href="https://youtube.com/@${profile.youtube}">&nbsp;${profile.youtube}</a></div>
			                	</c:otherwise>
			                </c:choose>
			            </c:when>
			            <c:otherwise>
			            	<c:choose>
			            		<c:when test="${!empty profile.instagram}">
			            			<div class="addressdiv"><img class="icons"  src="/resources/images/youtube.svg"><a href="https://youtube.com/@${profile.youtube}">&nbsp;${profile.youtube}</a></div>
			                		<div class="addressdiv"><img class="icons"  src="/resources/images/instagram.svg"><a href="https://www.instagram.com/${profile.instagram}">&nbsp;${profile.instagram}</a></div>
			            		</c:when>
			            		<c:otherwise>
			            			<div class="addressdiv"><img class="icons"  src="/resources/images/youtube.svg"><a href="https://youtube.com/@${profile.youtube}">&nbsp;${profile.youtube}</a></div>
			                		<div class="addressdiv"><a href="https://www.instagram.com/${profile.instagram}">&nbsp;${profile.instagram}</a></div>	
			            		</c:otherwise>
			            	</c:choose>
			            </c:otherwise>
			        </c:choose>
			    </c:otherwise>
			</c:choose>
	

			</div>
			

			<c:choose>
			    <c:when test="${!empty sessionScope.user.id}">
			        <div class="offset-md-1 col-md-4 offset-lg-2 col-lg-4 thriddiv">
			            <c:choose>
			                <c:when test="${sessionScope.user.url != profile.url}"> <!-- 로그인해서 남의 프로필에 들어왔을 때 -->
			                	<c:choose>
			                		<c:when test="${checks.getId() eq sessionScope.user.id && checkf.getFrom_id() eq sessionScope.user.id && checkf.getTo_id() eq profile.id}">

	                						<button class="btn offbtn"  data-toggle="modal" data-target="#ExampleModalCenter" >팔로우 중</button>
	                						<button class="btn offbtn" data-toggle="modal" data-target="#exampleModalCenter" >구독 중</button>
				                	</c:when>
				                	
				                	<c:when test="${checkf.getFrom_id() eq sessionScope.user.id && checkf.getTo_id() eq profile.id && checks.getId() ne sessionScope.user.id}">
								
				                		<button class="btn offbtn"  data-toggle="modal" data-target="#ExampleModalCenter">팔로우 중</button>
<<<<<<< HEAD
				                		<c:if test="${!empty getMembership }">
			                				<button id="buttonright" class="btn"data-toggle="modal" data-target="#subModal">구독 </button>
				                		</c:if>
=======
								<c:if test="${!empty getMembership }">
				                			<button id="buttonright" class="btn"data-toggle="modal" data-target="#subModal">구독 </button>
								</c:if>
>>>>>>> branch 'main' of https://github.com/du-sel/teamproject.git
				                	</c:when>
				                	
				                	<c:when test="${checkf.getFrom_id() ne sessionScope.user.id && checkf.getTo_id() ne profile.id && checks.getId() eq sessionScope.user.id}">
				                		<form action="/profiles/${profile.url}" method="post">
				                			<button id="buttonright" class="btn" onclick="startf()">팔로우</button>
				                		</form>
				                		<button class="btn offbtn"  data-toggle="modal" data-target="#ExampleModalCenter"  style=" display: none;">팔로우 중</button>
				                		<button class="btn offbtn" data-toggle="modal" data-target="#exampleModalCenter" >구독 중</button>
				                	</c:when>
				                	
				                	<c:otherwise>
				                		<form action="/profiles/${profile.url}" method="post">
				                			<button id="buttonright" class="btn" onclick="startf()">팔로우</button>
				                		</form>
				                		<button class="btn offbtn" id="changef" data-toggle="modal" data-target="#ExampleModalCenter"  style=" display: none;">팔로우 중</button>
<<<<<<< HEAD
				                		<c:if test="${!empty getMembership }">
				           					<button id="buttonright" class="btn" data-toggle="modal" data-target="#subModal">구독</button>
			           					</c:if>
=======
								<c:if test="${!empty getMembership }">
				           				<button id="buttonright" class="btn" data-toggle="modal" data-target="#subModal">구독</button>
								</c:if>
>>>>>>> branch 'main' of https://github.com/du-sel/teamproject.git
							 		</c:otherwise>
						 		</c:choose>
				                		
			                </c:when>
			                <c:otherwise>
			                	<c:if test="${getCreator.getId() eq sessionScope.user.id}">
			                		<div id="buttonright" class="longtext"><a href="/store/sales">마이스토어 관리</a></div>
			                	</c:if>
			                	<c:if test="${getCreator.getId() ne sessionScope.user.id}">
			                		<div id="buttonright" onclick="onStoreModal()" class="longtext"><a href="#" data-toggle="modal" data-target="#store-modal">마이스토어 개설</a></div>
			                	</c:if>	
			                </c:otherwise>
			            </c:choose>
			        </div>
			    </c:when>
		    	
			    <c:otherwise>
			        <div class="offset-md-1 col-md-4 offset-lg-2 col-lg-4 thriddiv">
			            <button id="buttonright" class="btn" onclick="showLoginAlert()">팔로우</button>
<<<<<<< HEAD
			            <c:if test="${!empty getMembership }">
			            	<button id="buttonright" class="btn" data-toggle="modal" data-target=".bd-example-modal-lg" >구독</button>
			            </c:if>
			            
=======
				<c:if test="${!empty getMembership }">	
			            <button id="buttonright" class="btn" data-toggle="modal" data-target=".bd-example-modal-lg" >구독</button>
				</c:if>
>>>>>>> branch 'main' of https://github.com/du-sel/teamproject.git
			        </div>
			    </c:otherwise>
			 </c:choose>   

			

		</div>	
		<script>
		    function showLoginAlert() {
		        alert("로그인이 필요합니다");
		        /* var link = 'store/main';		        
		        location.href=link; */

		    }
		    
		</script>
	<br>

	<!-- 탭 -->
	<div class="container tabcontainer shadow-sm p-3 mb-5 ">

		<div style="margin:10px;">
			
			<ul class="nav nav-tabs" >
			 	<li class="nav-item navli" id="li" >
			 		<a class="nav-link active" onclick="getUserPostList(0)" data-toggle="tab" id="feedtabbgcolor" >피드</a>
			 	</li>
			 	<li class="nav-item navli" id="li">
			 		<div class="nav-link" onclick="getCreatorProductList(0, 'creDate')" data-toggle="tab">스토어</div>
			 	</li>
			 	<li class="nav-item navli" id="li">
			 		<a class="nav-link" href="#notice" data-toggle="tab">공지</a>
			 	</li>
			</ul>

				<!-- post 탭 -->
 				<div class="tab-pane fade show active co" id="feed">
					<br>

					<div class="feed-listtop">
						<c:if test="${sessionScope.user.url == profile.url}">
							<div id="feed-insert-btn" class="writenew1">
								<a href="/community/posts?page=0&type=all">새 글 작성</a>
							</div>
						</c:if>

					</div>				
					<div id="co-main" >

						<div id="main" class="col-sm-12 col-md-12 col-lg-12">
						<!-- post -->
							<section class="post" id="post-box"> 
								<div class="post-onclick">
									<div class="header">
										<a class="author">
										    <img alt="프로필 이미지" />
								    		<span class="name author"></span>
										</a>
										<div class="d-flex">
											<form class="delFrm" method="post">
											 	<input type="hidden" name="_method" value="DELETE"/>
												<div class="delete-post" onclick="checkDeletePost(event)">삭제</div>
											</form>
											<span class="published"></span>

										</div>
									</div>
							    	
							    	<div class="post-content-container row justify-content-center">

									    	<div class="img-container col-12">
												<div class="img-card" id="card">
									    			<img alt="포스트 이미지" data-toggle="modal" data-target="#image-modal">
									    		</div>
							   	   			</div>

									
										<div id="post-content" class="collapse-content">
											<div class="post-content-inner collapsed">
												${p.content}
											</div>
										</div>
							    	</div>
							    </div>

								<div class="footer">
									<ul class="stats commment_stats">
										<li class="comment-count"><span class="comment-icon"><i class="fa fa-comment"></i></span><span class="comment-count-number"></span></li>
										<li class="like-count"><span class="like-icon"><i class="fa fa-thumbs-up"></i></span><span class="like-count-number"></span></li>
									</ul>
 									<div class="comment-section">
										<ul id="comment-list" class="comment-list">
							   	   			<li id="li">
							   	   				<div class="comment-top d-flex justify-content-between align-items-center">
													<div class="comment-name"></div>
													<div class="d-flex">
														<form id="deleteComment" class="deleteComment" action="" method="post">
														 	<input type="hidden" name="_method" value="DELETE"/>
															<div class="delete-comment" onclick="checkDeleteComment(event)">삭제</div>
														</form>
														<div class="comment-date"></div>
													</div>
							   	   				</div>
												<div class="comment-content"></div>
											</li>
										</ul>
										<div class="comment-button" type="button" onclick="showCommentInput(this)"><span class="comment-plus">+</span> 댓글쓰기</div>
									    	
    									<div class="button-row">
											<div class="comment-input">
												<form method="post" name="comment" id="insertcomment">
													<input type="hidden" name="postId" class="comment-postId"/>
													<div class="comment-login">		<!-- 로그인 o --> 
												    		<input type="hidden" name="id">
															<input type="text" id="comment-text" name="content" class="form-control" placeholder="댓글을 입력하세요">
												            <button class="submit-button" id="submit-button" type="submit" ><i class="fa fa-paper-plane"></i></button>
												    </div>		
											    	<div class="comment-logout">	<!-- 로그인 x -->
											    		<div id="comment-text" >로그인이 필요합니다.</div>
											    	</div>
												</form>
											</div>	
										</div> 
									</div> 
								</div>
							</section>
							
							
							
							<div class="col-lg-12" id="feed-pagination-container" class="pagination-container">
			                    <div class="feed-pagination pagination">
			                        <ul>
							    		<li>
								            <a id="prev">&lt;</a>
								        </li>
							    		<li>
							           		<a id="next">&gt;</a>
							        	</li>
								    </ul>
			                    </div>
			                </div>			
						
						</div> 
					</div> 
						
					
				</div>
					 
				
				<!-- 스토어 탭 -->
				<div class="tab-pane fade" id="store"><br>
					<div class="row col-lg-12 justify-content-between">
						<select name="sortSelect" onchange="getCreatorProductList(0, 'creDate');" class="form-control-sm">
							<option value="creDate">최신순</option>
							<option value="popularity">인기순</option>
							<option value="highprice">높은가격순</option>
							<option value="lowprice">낮은가격순</option>
						</select>

						<c:if test="${sessionScope.user.url == profile.url}">
							<div class="writenew line">
								<a href="/store/products/management">상품 관리</a>
							</div>	
						</c:if>				

					
					</div>
					<br>
					
					<div id="products">
					
						<div class="row">	               
						 
							<!-- Product Card Start -->	
		            		<div class="col-lg-4" id="product-box">
			                    <div class="item">
			                        <div class="thumb">
			                            <div class="hover-content">
			                                <ul>
			                                    <li><i class="fa fa-shopping-cart"></i></li>
			                                </ul>
			                            </div>
			                            <img alt="상품 썸네일">
			                        </div>
			                        <div class="down-content">
			                            <h4 class="p_name"></h4>
			                            <c:if test="${i.sale != 0}"><span class="cost">원</span></c:if>
			                            <span class="price">원</span>
			                            <ul class="stars">
			                                <span class="star">
												★★★★★
												<span>★★★★★</span>
												<input type="range" value="1" step="1" min="0" max="10">
											</span>
			                            </ul>
			                        </div>
			                    </div>
			                </div>
			                <!-- Product Card End -->
			                
			                <div class="col-lg-12" id="store-pagination-container" class="pagination-container">
			                    <div class="store-pagination pagination">
			                        <ul>
							    		<li>
								            <a id="prev">&lt;</a>
								        </li>
							    		<li>
							           		<a id="next">&gt;</a>
							        	</li>
								    </ul>
			                    </div>
			                </div>
						</div>
					</div>
				</div>
		
			<!-- 공지 탭 -->
			<div class="tab-pane fade" id="notice">

				<div class="container">
								<br>

				<!-- 	<div class="row">
						<div class="col-offset-sm-9 col-sm-3 col-offset-md-10 col-md-2 col-offset-lg-10 col-lg-2" id="noticemanage"><a href="notice-management.do">공지 관리</a></div>
					</div>	 -->
					<div class="row">
						<div class="col-12" style="margin-bottom:15px;">
							<c:if test="${sessionScope.user.url == profile.url}">
								<div class="writenew1">
									<a href="/profiles/url/notice">공지 관리</a>
								</div>
							</c:if>
						</div>	
						<br>
						<div class="col-sm-12 col-md-12 col-xl-12 col-lg-12">
				            <div class="card carddiv">
				              <form class="card-body" action='#' method='post'>
				                <div class="row notice-box">
					                <div class="notice col-lg-12">
					                	<div>
					                		<p class="card-description">
												안녕하세요,기쁘게도 8월 초에 새로운 온라인 상품 판매 서비스를  출시할 예정입니다! <br>
												이를 앞두고 여러분과 소중한 정보를 공유하고자 합니다.<br>
												새로운 캐릭터 템플릿과 넓은 범위의 다양한 디자인 템플릿 pdf 상품을 공개합니다.<br> 
												풍부한 제품 선택지를 제공하여 다양한 관심사와 요구에 부응할 수 있도록 노력하겠습니다. <br>
												안녕하세요,기쁘게도 8월 초에 새로운 온라인 상품 판매 서비스를  출시할 예정입니다! <br>
												이를 앞두고 여러분과 소중한 정보를 공유하고자 합니다.<br>
												새로운 캐릭터 템플릿과 넓은 범위의 다양한 디자인 템플릿 pdf 상품을 공개합니다.<br> 
												풍부한 제품 선택지를 제공하여 다양한 관심사와 요구에 부응할 수 있도록 노력하겠습니다. <br>
												안녕하세요,기쁘게도 8월 초에 새로운 온라인 상품 판매 서비스를  출시할 예정입니다! <br>
												이를 앞두고 여러분과 소중한 정보를 공유하고자 합니다.<br>
												새로운 캐릭터 템플릿과 넓은 범위의 다양한 디자인 템플릿 pdf 상품을 공개합니다.<br> 
												풍부한 제품 선택지를 제공하여 다양한 관심사와 요구에 부응할 수 있도록 노력하겠습니다. <br>
												안녕하세요,기쁘게도 8월 초에 새로운 온라인 상품 판매 서비스를  출시할 예정입니다! <br>
												이를 앞두고 여러분과 소중한 정보를 공유하고자 합니다.<br>
												새로운 캐릭터 템플릿과 넓은 범위의 다양한 디자인 템플릿 pdf 상품을 공개합니다.<br> 
												풍부한 제품 선택지를 제공하여 다양한 관심사와 요구에 부응할 수 있도록 노력하겠습니다. <br>
											</p>
						                	<input type="checkbox" class="card-content__more-btn">				                	
					                	</div>
										<br>
					                	<div class="d-flex justify-content-start img-box scroll-custom">
						                	<div class="d-flex studioimgdiv"><img id="studioimg" src="/resources/images/춘식이스프링다이어리.jpg" alt=""></div>
						                	<div class="d-flex studioimgdiv"><img id="studioimg" src="/resources/images/춘식이스프링다이어리1.jpg" alt=""></div>
						                	<div class="d-flex studioimgdiv"><img id="studioimg"  src="/resources/images/춘식이스프링다이어리2.jpg" alt=""></div>
						                	<div class="d-flex studioimgdiv"><img id="studioimg" src="/resources/images/춘식이스프링다이어리2.jpg" alt=""></div>
					                	</div>
					                </div>
					             </div>
								</form>				
							</div>
						</div>
					</div>
				</div>
			</div>

			
			</div>	
		</div>
	</div>
	
	<!-- ***** StoreCreate Modal Start ***** -->
	<div class="modal fade" id="store-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-container" role="document" >
			<div class="modal-content">
			</div>
		</div>
  	</div>
	<!-- ***** StoreCreate Modal End ***** -->
	
	
	<!-- 멤버십 모달 -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button> -->

			<div class="modal fade bd-example-modal-lg " tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="subModal">
			  <div class="modal-dialog modal-lg fixed-bottom">
			    <div class="modal-content Membershipdiv" >
			      <form action="" method="post">
				      <br>
				      	<h5 class="membershipSub">멤버십 구독</h5>
				      <br>
				      <div class="Subdiv">
						<div class="s s1"></div>
						<div class="s "><strong class="s2">${getMembership.price} 원</strong>/월</div>
						<div class="s s3">${getMembership.content}</div>
				      </div>
				      <br>
				      <div class="Subjoin">
				      	<c:if test="${empty sessionScope.user.id}">
				      		<h6><input type="button" value="멤버십 가입하기" class="subjoin" onclick="showLoginAlertSub()"></h6>
				      	</c:if>
				      	<c:if test="${!empty sessionScope.user.id}">
				      		<h6><input type="submit" value="멤버십 가입하기" class="subjoin" onclick="joinmembership()"></h6>
				      	</c:if>
				      </div>
			      </form>
			    </div>
			  </div>
			</div>


	
	<!-- 이미지 업로드 모달  -->
		<div class="modal" id="modal">
			
			<form class="mcontent" action="/users/profile-img" method="post" enctype="multipart/form-data">
				<p class="modalclose">&times;</p>
					<div class="image-upload" id="image-upload">
			            <div class="fileContainer">
			                <input type="hidden" name="_method" value="PUT"/>
			            	<input id="folder" type="hidden" name="folder" value=""/>
			                <div class="fileInput">
			                    <p>FILE NAME: </p>
			                    <p id="fileName"></p>
			                </div>
			                <div class="buttonContainer button">
			                    <label class="submitButton" for="chooseFile">업로드</label>
			                </div>
			                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" required>
			            </div>
			        </div>
			        <!-- <div class="image-show" id="image-show"></div> -->
			        <div class="uploadbtn">
			        	<input type="submit" value="프로필 사진 수정" id="uploadbtn">
			        </div>
		
			</form>
	
		</div>
		
		<!-- 구독 취소 모달  -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         <!--  <span aria-hidden="true">&times;</span> -->
		        </button>
		      </div>
		      <div class="modal-body">
		      
		        ${profile.getName()} 구독을 취소하시겠습니까? 
		     
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>		        
		       	<form action="/profiles/${profile.url}" method="post">
		       		<input type="hidden" name="_method" value="delete">
		       		<input type="hidden" name="type" value="unSub">
		        	<input type="submit" class="btn cancel" value="구독취소">
				</form>		        
		      </div>
		    </div>
		  </div>
		</div>

	
		<div class="modal fade" id="ExampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <!-- <span aria-hidden="true">&times;</span> -->
		        </button>
		      </div>
		      <div class="modal-body">
		
		        ${profile.getName()} 팔로우를 취소하시겠습니까? 
		
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>		        
		        <form action="/profiles/${profile.url}" method="post" >
		        	<input type="hidden" name="_method" value="delete">
		        	<input type="hidden" name="type" value="unFollow"> 
		        	<input type="submit" class="btn cancel" value="팔로우 취소">
	        	</form>
		      </div>
		    </div>
		  </div>
		</div>		


<input type="hidden" id="sessionId" name="id" value="${user_id}">
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
