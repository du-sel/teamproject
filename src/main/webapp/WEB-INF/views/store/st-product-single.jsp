<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />


<!-- ***** Product Area Starts ***** -->
<main id="product" class="broad">
	
    <section class="section">

        
        
        <!-- 상품 썸네일과 가격 -->
        <div class="container">
	        <!-- 화면 왼쪽 위에 목록으로 돌아가기 -->
	        <a href="products.do">목록으로 돌아가기</a>
        
            <div class="row">
                <div class="col-lg-8">
                <div class="left-images">
                    <img src="/resources/images/썸네일.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-4">
                <div class="right-content">
                    <h4>라이언 다이어리</h4>
                    <span class="price">700원</span>
                    <ul class="stars">
                        <li><i class="fa fa-star"></i></li>
                        <li><i class="fa fa-star"></i></li>
                        <li><i class="fa fa-star"></i></li>
                        <li><i class="fa fa-star"></i></li>
                        <li><i class="fa fa-star"></i></li>
                    </ul>
                    <span>라이언 다이어리 입니다.</span>
                    <div class="quote">
                        <i class="fa fa-quote-left"></i><p>세상에 하나뿐인 나만의 라이언 다이어리</p>
                    </div>
                    <div class="quantity-content">
                        <div class="left-content">
                            <h6>구매수량</h6>
                        </div>
                        <div class="right-content">
                            <div class="quantity buttons_added">
                                <input type="button" value="-" class="minus"><input type="number" step="1" min="1" max="" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="" inputmode=""><input type="button" value="+" class="plus">
                            </div>
                        </div>
                    </div>
                    <div class="total">
                        <h4>합계 : 21000원</h4>
                        <br><br><br>
                        <div class="main-border-button"><a href="#">장바구니</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        								<a href="#">구매하기</a></div>
                        <br><br><br><br><br>
                    </div>
                </div>
            </div> 
            </div>
        </div>
        
        <!-- 탭 메뉴 -->
        <ul class="nav nav-tabs justify-content-center" role="tablist">
        <br><br>
  			<li role="presentation" class="active"><a href="#description" aria-controls="description" role="tab" data-toggle="tab">상세정보</a></li>
  			<li role="presentation"><a href="#review" aria-controls="review" role="tab" data-toggle="tab">구매후기</a></li>
  			<li role="presentation"><a href="#inquiry" aria-controls="inquiry" role="tab" data-toggle="tab">상품문의</a></li>
		</ul>

         <!-- 회색 선 -->
         <!-- <hr style = "border-color: grey; margin-top:15px; margin-bottom:20px"> -->

         <!-- 각각의 탭 내용-->
         <!-- 첫번째 탭 (상세정보) -->
         <div class = "tab-content">
           <!-- 상세정보 페이지 이미지 크게 들어갈 공간만 있으면 되므로 img태그만 사용합니다.-->
           <div id = "description" class ="tab-pane active">
	            <br>
	            <img src ="/resources/images/상세1.jpg" alt=""><br><br>
	            <img src ="/resources/images/상세2.jpg" alt=""><br><br>
	            <img src ="/resources/images/상세3.jpg" alt=""><br><br>
	            <img src ="/resources/images/상세4.jpg" alt=""><br><br>
	            <img src ="/resources/images/상세5.jpg" alt=""><br><br>
	            <img src ="/resources/images/상세6.jpg" alt=""><br><br>
	            <img src ="/resources/images/상세7.jpg" alt=""><br><br>
           </div>

          <!-- 두번째 탭 (구매후기) -->
          <div id = 'review'class ='tab-pane'>
            <br>
            <form>
               <label for="user_id">아이디</label><br>
               <input type="text" id="user_id" name="user_id"><br><br>
               <label for="product_name_review">상품명</label><br>
               <input type="text" id= "product_name_review" name="product_name_review" ><br>   
               <br>
               <span style =" margin-right:10px;">별점</span>
               <!-- <ul class="stars" style ="display:inline;">
	                별점을 선택할 수 있도록 i태그와 input태그를 사용합니다. 
	                <li><i class='fa fa-star'></i></li>  
	                <li><i class='fa fa-star'></i></li> 
	                <li><i class='fa fa-star'></i></li> 
	                <li><i class='fa fa-star'></i></li>
	                <li><i class='fa fa-star'></i></li> 
	                <li><input type="radio" name = "rating" value ="5"></li>
               </ul> -->
               <br>
               <select id="star-rating" name="star-rating">
		            <option value="5">★★★★★</option>
		            <option value="4">★★★★</option>
		            <option value="3">★★★</option>
		            <option value="2">★★</option>
		            <option value="1">★</option>
		       </select><br/><br/>
               

              	<!-- 날짜와 후기 내용을 입력받을 textarea태그를 사용합니다.-->
             	<p>구매한 날짜<br/>
             	<!-- 현재날짜에서 몇일전인지 계산하여 placeholder값으로 넣어줍니다.-->
              	<textarea rows ="1" cols ="30"  placeholder="(YYYY-MM-DD)" ></textarea></p>

             	구매후기<br/><textarea rows ="5" cols ="50" placeholder="리뷰를 작성해주세요."> </textarea>
             	
             	<input type="submit" value="작성 완료"/>
            </form>
          </div>


         <!-- 세번째 탭 (상품문의) -->
          <div id = "inquiry" class ="tab-pane">
            <br>
            <form>
               <label for="user_id_inquiry">구매자 아이디:</label><br>
               <!-- 구매자 아이디를 입력받을 input태그입니다.--> 
               <input type="text" id="user_id_inquiry" name="user_id"><br><br>

               <!-- 상품명을 입력받을 input태그입니다.-->
              <label for="product_name_inquiry"> 상품명:</label><br>
              <input type ="text" id= "product_name_inquiry" name="product_name_review" ><br><br>   

             <!-- 문의사항을 입력받기 위해 textarea태그를 사용합니다.-->   
             	
             	상품문의<br><br/><textarea rows ='4' cols = '50'> </textarea>

            </form>
          </div>
        </div>
        
        <!-- 화면 오른쪽 아래에 top▲ 버튼 추가-->
        <!-- <a href="#" style="position: fixed; bottom: 20px; right: 20px; color: white;">
            Top▲
        </a> -->
        
        
        
    </section>





    <!-- sticky -->
   	<div class="sticky">
    	<h6>최근 본 상품</h6>
    	
	    <!-- 최근 본 상품 이미지-->
	    <div id="recent-view">
	        <img src ="/resources/images/최근본상품1.jpg" alt="">
	        <img src ="/resources/images/최근본상품2.jpg" alt="">
	    </div>
		
	    <!-- 장바구니 버튼 -->
    	<button type="button" id="cart-btn">장바구니</button>
	</div>



</main>  
<!-- ***** Product Area Ends ***** -->
    
    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" /> 
    
    