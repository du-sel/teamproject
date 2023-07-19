<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- ***** Page Content Starts ***** -->
<main id="purchase" class="broad">

    <section class="section" id="page">
    	<div class="page-title">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>구매하기</h2>
                    </div>
                </div>
            </div>
        </div>
		<div class="container">
			<div class="row">
				<div>
					<p>안내사항 규정</p>
				</div>
			</div>
		
			<div class="row justify-content-center">
           	 	<!-- Product 정보 Start -->				
				<div class="row justify-content-center">
		          <div class="col-lg-12 info">
		            <div class="card">
		              <div class="card-body">
		                <div class="row">
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
			                        <h4><span class="number">10,000</span>원</h4>
			                    </div>
			                </div>
			             </div>
		              </div>
		            </div>
		          </div>
		        </div>
				<!-- Product 정보 End -->
                      
                
			</div>
		</div>
    </section>
</main>
<!-- ***** Page Content Ends ***** -->


  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


