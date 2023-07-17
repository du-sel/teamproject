<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp" />
      
		
	
<!-- ***** Page Content Starts ***** -->
<main id="creators" class="broad">
	<section class="section">
		<div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <div class="section-heading list-heading">
	                    <h2>크리에이터</h2>
	                    <span>지금 활동 중인 크리에이터들을 만나보세요</span>
	                </div>
	            </div>
	        </div>
	    </div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12 d-flex justify-content-between sort">
					<div>
						<h5>총 ${fn:length(creators)} 명</h5>
					</div>
					<form action="/store/creators" method="get">
						<select name="sort" onchange="this.form.submit();">
							<option value="newest" <c:if test="${sort eq 'newest'}">selected</c:if>>최근가입순</option>
							<option value="popularity" <c:if test="${sort eq 'popularity'}">selected</c:if>>인기순</option>
							<option value="sale" <c:if test="${sort eq 'sale'}">selected</c:if>>판매량순</option>
						</select>
					</form>
				</div>
			
		        <!-- Creator Box Start -->
		        <c:forEach var="c" items="${creators}">
					<div class="col-lg-12 creator-card" onclick="location.href='/profiles/${c.url}'">
						<div class="row">
							<div class="col-lg-12">
								<div class="profile">
									<div class="d-flex">
										<img src="${c.profile_img}" alt="프로필 이미지">
										<h5 class="d-flex flex-column justify-content-center">${c.storeName}</h5>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="rep">
									<h4>대표 상품</h4>
								</div>
							    <div class="down-content d-flex justify-content-start product">
							    	<c:choose>
								    	<c:when test="${!empty signature[c.id]}">	<!-- 대표 상품 있는 경우 --> 
								    		<c:forEach var="item" items="${signature[c.id]}">
								   	   			<a href="/store/products/${item.p_id}"><img src="${item.thumbnail}" alt="대표상품 이미지"></a>
							   	   			</c:forEach>
								    	</c:when>		
								    	<c:otherwise>		<!-- 대표 상품 없는 경우 -->
								    		<div class="d-flex justify-content-center align-items-center empty-item">
								    			<p>크리에이터가 지정한 대표 상품이 없습니다.</p>
								    		</div>
								    	</c:otherwise>
							    	</c:choose>
							    </div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Creator Box End -->      
		            
				<!-- 페이지 번호 -->
				<div class="col-lg-12">
					<div class="pagination">
					    <ul>
					        <li>
					            <a href="#"><</a>
					        </li>
					        <li>
					            <a href="#">1</a>
					        </li>
					        <li class="active">
					            <a href="#">2</a>
					        </li>
					        <li>
					            <a href="#">3</a>
					        </li>
					        <li>
					            <a href="#">4</a>
					        </li>
					        <li>
					            <a href="#">></a>
					        </li>
					    </ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<!-- ***** Page Content Ends ***** -->



  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />





