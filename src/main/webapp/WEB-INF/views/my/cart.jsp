<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
      


<!-- ***** Page Content Starts ***** -->
<main id="cart" class="my-info broad">
    <section class="section" id="page">
    	<div class="page-title">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>장바구니</h2>
                    </div>
                </div>
            </div>
        </div>
		<div class="container">
			<div>
				<h5> 총 ${fn:length(cartlist) } 개 상품</h5>
			</div>
		
			<form action="" method="post" class="row justify-content-center">
            <!-- Product Start -->
            	<c:forEach var="item" items="${cartlist}">
					<div class="col-lg-12 info">
						<div class="row justify-content-center">
							<div class="form-check d-flex flex-column justify-content-center">
								<div>
									<label class="form-check-label">
										<input class="form-check-input" type="checkbox" value="${item.p_id}" name="pick" checked>
										<span class="form-check-sign">
											<span class="check"></span>
										</span>
									</label>
								</div>
			                </div>
			                <div class="col-lg-3 col-md-4 col-sm-5 sm_info">
			                   <div class="thumb">
			                       <a href="/store/products/${item.p_id}">
			                           <img src="${item.thumbnail}" alt="${item.p_name } 썸네일">
			                       </a>
			                   </div>
			                </div>
			                <div class="col-lg-8 col-md-7 col-sm-6 sm_info">
			                    <div class="down-content d-flex flex-column justify-content-center product-info">
			                   	    <h6>
			                   	    	<a href="#">${item.store_name }</a>
			                   	    </h6>
			                        <h4>
			                       		<a href="/store/products/${item.p_id}">${item.p_name }</a>
			                        </h4>
			                        <h4>${item.price-item.sale }원</h4>
			                    </div>
			                </div>
			                <div class="d-flex flex-column justify-content-center">
			                    <i class="fa fa-times"></i>
			                </div>
		                </div>
					</div>
            	</c:forEach>
			<!-- Product End -->
                
                
                <!-- 구매창 -->
                <div class="row col-lg-12 payment">
                	<div class="col-lg-8 down-content d-flex flex-column justify-content-center">
                        <h4>총 <span>35,000원</span> (5개 상품)</h4>
                    </div>
                    <div class="col-lg-4 d-flex flex-column justify-content-center">
                    	<button class="purchase">결제하기</button>
                    </div>
                </div>
                
                <!-- 페이지 번호 -->
                <!-- <div class="col-lg-12">
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
                </div> -->
			</form>
		</div>
    </section>
</main>
<!-- ***** Page Content Ends ***** -->
 


  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
