<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- ***** Page Content Starts ***** -->
<main id="purchase" class="broad">

    <section class="section" id="page">
    	<div class="page-title">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>구매하기</h2>
                    </div>
                </div>
            </div>
        </div>
		
		
		
		<div class="container">
			
			<div class="notice-content row justify-content-center">
           		<p class="notice col-lg-10 col-md-12"><i class="fa fa-exclamation-circle"></i>본 상품은 실물 상품이 아닌 디지털 상품으로, 주문 및 결제 후 즉시 다운로드가 가능한 콘텐츠입니다.</p>
           	</div>
			
			<div class="row justify-content-center total-items">
				<div class="col-lg-10 col-md-12">
					<h5> 총 5 개 상품</h5>
				</div>
			</div>
		
			<div class="row justify-content-center">
            <!-- Product Start -->
				<div class="col-lg-10 col-md-12 info item${item.pid }">
					<div class="row justify-content-center">
		                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
		                   <div class="thumb">
		                       <a href="/store/products/${item.pid}">
		                           <img src="/resources/images/men-01.jpg" alt="${item.p_name } 썸네일">
		                       </a>
		                   </div>
		                </div>
		                <div class="col-lg-8 col-md-7 col-sm-6 sm_info">
		                    <div class="down-content d-flex flex-column justify-content-center product-info">
		                   	    <h6>
		                   	    	<a href="/profiles/${item.url }">스토어이름</a>
		                   	    </h6>
		                        <h4>
		                       		<a href="/store/products/${item.pid}">상품명</a>
		                        </h4>
		                        <h4><span class="number">10000</span>원</h4>
		                    </div>
		                </div>
	                </div>
				</div>
				<div class="col-lg-10 col-md-12 info item${item.pid }">
					<div class="row justify-content-center">
		                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
		                   <div class="thumb">
		                       <a href="/store/products/${item.pid}">
		                           <img src="/resources/images/men-01.jpg" alt="${item.p_name } 썸네일">
		                       </a>
		                   </div>
		                </div>
		                <div class="col-lg-8 col-md-7 col-sm-6 sm_info">
		                    <div class="down-content d-flex flex-column justify-content-center product-info">
		                   	    <h6>
		                   	    	<a href="/profiles/${item.url }">스토어이름</a>
		                   	    </h6>
		                        <h4>
		                       		<a href="/store/products/${item.pid}">상품명</a>
		                        </h4>
		                        <h4><span class="number">10000</span>원</h4>
		                    </div>
		                </div>
	                </div>
				</div>
				<div class="col-lg-10 col-md-12 info item${item.pid }">
					<div class="row justify-content-center">
		                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
		                   <div class="thumb">
		                       <a href="/store/products/${item.pid}">
		                           <img src="/resources/images/men-01.jpg" alt="${item.p_name } 썸네일">
		                       </a>
		                   </div>
		                </div>
		                <div class="col-lg-8 col-md-7 col-sm-6 sm_info">
		                    <div class="down-content d-flex flex-column justify-content-center product-info">
		                   	    <h6>
		                   	    	<a href="/profiles/${item.url }">스토어이름</a>
		                   	    </h6>
		                        <h4>
		                       		<a href="/store/products/${item.pid}">상품명</a>
		                        </h4>
		                        <h4><span class="number">10000</span>원</h4>
		                    </div>
		                </div>
	                </div>
				</div>

			<!-- Product End -->
			
			
			
			<!-- Buyer Info Start -->

				<div class="col-lg-10 col-md-12 buyer-info-title">
					<h5>주문자 정보</h5>
				</div>
				<div class="col-lg-9 col-md-12 buyer-info">
		           	<label for="buyer-name"><p class="must">이름</p></label>
		           	<input type="text" name="name" id="buyer-name" class="form-control">
	            </div>
				<div class="col-lg-9 col-md-12 buyer-info">
		           	<label for="buyer-email"><p class="must">이메일</p></label>
		           	<input type="text" name="email" id="buyer-email" class="form-control">
	           	</div>
				<div class="col-lg-9 col-md-12 buyer-info">
		           	<label for="buyer-tel"><p class="must">연락처</p></label>
		           	<input type="text" name="tel" id="buyer-tel" class="form-control">
            	</div>
			
			<!-- Buyer Info End -->
			
			
			<!-- 규정 Start -->
				<div class="row col-lg-10 col-md-12 terms">
					<div>
						<h6>디지털 콘텐츠 취소/환불 규정</h6>
						<ul>
							<li>• 디지털콘텐츠의 특성상 구매 후 취소/환불이 불가능합니다.</li>
							<li>• 구매완료 시점부터 횟수 제한 없이 콘텐츠를 다운받아 사용할 수 있습니다.</li>
							<li>• 제공받은 콘텐츠는 별도로 명시되어 있지 않는 이상 상업적으로 이용할 수 없습니다.</li>
							<li>• 트래커스는 통신판매중개업자로서 제공되는 콘텐츠의 소유권을 비롯한 모든 권한과 책임은 모두 제작하는 크리에이터에게 있습니다.</li>
						</ul>
					</div>
				</div>
				<div class="row col-lg-10 col-md-12 justify-content-center accept-terms-container">
					<input type="checkbox" name="accept-terms" id="accept-terms" class="form-check">
					<label for="accept-terms"><p class="must">트래커스의 취소 및 환불 규정에 동의합니다.</p></label>
				</div>
			<!-- 규정 End -->
                
                
                <!-- 구매창 -->
                <div class="row col-lg-12 payment">
                	<div class="col-lg-8 down-content d-flex flex-column justify-content-center">
                        <h4><span class="total-price-span">총 <span id="total-price" class="number">35000</span>원</span> (<span id="total-amount">5</span>개 상품)</h4>
                    </div>
                    <div class="col-lg-4 d-flex flex-column justify-content-center">
                    	<button class="purchase" type="button" onclick="location.href='/store/purchases/new'">결제하기</button>
                    	<!-- 임시로 링크 걸어둠 (나중에는 체크박스 데이터 넘겨서 가야함) -->
                    </div>
                </div>
                
			</div>
		</div>
    </section>
</main>
<!-- ***** Page Content Ends ***** -->


  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


