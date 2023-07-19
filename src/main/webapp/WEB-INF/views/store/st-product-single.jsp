<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 아임포트 (결제 API) -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>

// p_id 컨트롤러로 넘겨주기
function goPurchase() {

	let pidList = new Array();
	let path = window.location.pathname;
	p_id = path.substring(path.indexOf("/products")+10);
	console.log(path)
	
	pidList.push(p_id);
    
    
    let newFrm = document.createElement('form');
    newFrm.setAttribute('action', '/store/purchases/new');
    
    let hidden = document.createElement('input');
    hidden.setAttribute('type', 'hidden');
    hidden.setAttribute('name', 'pidList');
    hidden.setAttribute('value', pidList);
    newFrm.appendChild(hidden);
    
    let main = document.getElementsByTagName('main')[0];
    main.appendChild(newFrm);

    newFrm.submit();
	
}


	
	//IMP.init('imp41250534');


function requestPay() {

	//let pathname = window.location.pathname;
	//let p_id = pathname.substring(pathname.indexOf("products")+9)
	//console.log(p_id);
	let p_id = '${product.pid}';
	
	let merchant_uid = p_id+"-"+'${user.id}'+"-"+new Date().getTime()+Math.random().toString(36).substring(2, 12);
	console.log(merchant_uid);
	
	var IMP = window.IMP;
    IMP.init('imp41250534'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
    IMP.request_pay({
    pg: "html5_inicis.INIpayTest",
    pay_method: "card",
    merchant_uid : merchant_uid,
    name : '${product.p_name}',	// 나중에는 상품정보 불러와서 사용
    amount : ${product.price-product.sale},
    buyer_email : '${user.email}',
    buyer_name : '${user.name}',
    buyer_tel : '${user.tel}',
  }, function (rsp) { // callback
      if (rsp.success) {
        alert("상품을 구매하셨습니다!");
      } else {
        alert(rsp.error_msg);
      }
  });
}

/*
function monthlyPay() {
	
	var IMP = window.IMP;
	  IMP.init('imp41250534');
	  
	IMP.request_pay({
		pg: 'kakaopay',
		pay_method : 'card', // 기능 없음.
		merchant_uid: new Date().getTime(), // 상점에서 관리하는 주문 번호
		name : '정기결제1',
		amount : 0, // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.
		customer_uid : '4', // 필수 입력
 		buyer_email : 'iamport@siot.do',
		buyer_name : '아임포트',
		buyer_tel : '02-1234-1234' 
	}, function(rsp) {
		if ( rsp.success ) {
			alert('빌링키 발급 성공');
			
			$.ajax({
				url:'/purchaseAgain', //결제 상태를 확인하고 스케줄러를 호출하는 부분
				type : 'POST',
				data:{
					"customer_uid" : '3',
					"price" : 120, 
					"merchant_uid" : new Date().getTime()
				},
				success:function(result) {
					alert('다음 결제 예약');
				}
			});
			
		} else {
			alert('빌링키 발급 실패');
		}
	});

}
*/



function kakaopay(){
	var IMP = window.IMP; // 생략가능
	let customer_uid = '3';
	IMP.init('imp41751598'); 
	IMP.request_pay({
		pay_method : 'card', // 결제창 호출단계에서의 pay_method는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
		merchant_uid : new Date().getTime(),
		name : '구독1',
		amount : 130, 
		customer_uid :customer_uid, //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
		buyer_email : 'first@mail.com',
		buyer_name : '첫번째',
		buyer_tel : '010-1111-2222'
	}, function(rsp) {
		if ( rsp.success ) {
			
			$.ajax({
				url:'/subscribe/1', //DB에 구독정보 등록하는 부분..
				type: 'POST',
				data:{
					//package_id : $('#package_id').val(),
					//customer_id : $('#customer_id').val()
				},
				success:function(result) {
					alert('정기결제 등록'+result);
				}
			});
			
			/*
		    //alert($('#customer_id').val());
			$.ajax({
				url:'/payment1', //결제 상태를 확인하고 스케줄러를 호출하는 부분
				type : 'POST',
				data:{
					"customer_uid" : customer_uid,
					"price" :120, 
					"merchant_uid" : new Date().getTime()
				},
				success:function(result) {
					alert('다음 결제 예약');
				}
			});
			*/
		} else {
			alert('빌링키 발급 실패');
			}
		});
}	

</script>




<!-- ***** Product Area Starts ***** -->
<main id="product" class="broad">
	
    <section class="section">

        <br><br><br>
        <!-- 화면 왼쪽 위에 목록으로 돌아가기 -->
	    <div class="back">
	    <a href="products.do"><span class="fa fa-angle-double-left"></span> 목록으로 돌아가기</a>
	    </div>
	    <br><br><br>
        
        <!-- 상품 썸네일과 가격 -->
        <div class="container">
	        
            <div class="row">
                <div class="col-lg-7">
	                <div class="left-images">
	                    <img src="${product.thumbnail }" alt="상품 썸네일">
	                </div>
	            </div>
	            <div class="col-lg-5">
	                <div class="right-content">
	                	<div class="info-content">                	
		                    <h4>${product.p_name }</h4>
		                    <span class="creator"><a href="/profiles/${product.url }">${product.store_name }</a></span>
		                    <ul class="stars">
		                        <li><i class="fa fa-star"></i></li>
		                        <li><i class="fa fa-star"></i></li>
		                        <li><i class="fa fa-star"></i></li>
		                        <li><i class="fa fa-star"></i></li>
		                        <li><i class="fa fa-star"></i></li>
		                    </ul>
	                	</div>
	                	<div class="notice-content">
	                		<p class="notice"><i class="fa fa-exclamation-circle"></i>본 상품은 실물 상품이 아닌 디지털 상품으로, 주문 및 결제 후 즉시 다운로드가 가능한 콘텐츠입니다.</p>
	                	</div>
	                    <div class="price-content">
	                    	<div class="d-flex">
		                        <div class="price">
		                            <h4>가격 : <span>${product.price }</span>원</h4>
		                        </div>
		                        <c:if test="${product.sale > 0 }">
			                        <div class="sale-price">  
			                        	<h5>→ <span>${product.sale}</span>원 할인</h5>
			                        </div>
		                        </c:if>
	                    	</div>
	                    	<div class="final-price">
		                        <h4>구매가 : <span>${product.price-product.sale}</span>원</h4>
	                    	</div>
	                    </div>
	                    <div class="buy-content">                        
	                        <div class="d-flex justify-content-center">
	                        	<form:form name="cart" id="cart" action="/store/carts/${product.pid }" method="post">
   									<button>장바구니</button>
   								</form:form>
   								
   								<button onclick="goPurchase()">바로 구매</button> 								
	      					</div>
	                    </div>
	                </div>
	            </div> 
            </div>
        </div>
        <br><br><br>
        <!-- 탭 메뉴 -->
        <ul id="tab-tab" class="nav nav-tabs justify-content-center" role="tablist">
        <br><br>
  			<li role="presentation" class="active"><a href="#description" aria-controls="description" role="tab" data-toggle="tab">상세정보</a></li>
  			<li role="presentation"><a href="#review" aria-controls="review" role="tab" data-toggle="tab">구매후기</a></li>
  			<li role="presentation"><a href="#inquiry" aria-controls="inquiry" role="tab" data-toggle="tab">상품문의</a></li>
		</ul>
		<br><br>
         <!-- 회색 선 -->
         <!-- <hr style = "border-color: grey; margin-top:15px; margin-bottom:20px"> -->

         <!-- 각각의 탭 내용-->
         <!-- 첫번째 탭 (상세정보) -->
         <div class = "tab-content">
           <!-- 상세정보 페이지 이미지 크게 들어갈 공간만 있으면 되므로 img태그만 사용합니다.-->
           <div id = "description" class ="tab-pane active">
            
	            <c:choose>
					<c:when test="${fn:length(product.content) > 0}">
							${product.content}
					</c:when>
			
					<c:otherwise>
							<h5>등록된 상세 정보가 없습니다</h5>
					</c:otherwise>			
				</c:choose>
	            
           </div>

          <!-- 두번째 탭 (구매후기) -->
          <div id = "review" class ="tab-pane">
            <br><br>
			<div class="speech-bubble">
				<table>
				  <tr>
				    <td>
				      <div class="profile">
				        <img src="/resources/images/프로필1.png" alt="프로필 이미지" class="profile-image">
				      </div>
				      <div class="user-info">
				        <div class="rating">
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				        </div>
				        <p class="user-id">mathl*** &nbsp;| &nbsp; 23.03.27</p>
				        <p class="product-name">상품명 : 춘식이 다이어리</p>
				      </div>
				    </td>
				  </tr>
				  <tr>
				    <td colspan="2">
				      <div class="review-content" style="text-align: left;">
				        <p>춘식이 다이어리 대박 귀여워요ㅠㅠ 스터디플래너로 쓰고 싶어서 일부러 만년다이어리로 주문한건데 마음에 쏙 들어요.. 매일 뭐할지 적는 위클리 부분도 있어서 유용하게 쓸 수 있을것같아요!! 한장도 버릴 구석이 없는 다이어리예요~~~</p>
				      </div>
				    </td>
				  </tr>
				</table>
			</div>
			<br><br>
			
			<br><br>
			<div class="speech-bubble">
				<table>
				  <tr>
				    <td>
				      <div class="profile">
				        <img src="/resources/images/프로필2.png" alt="프로필 이미지" class="profile-image">
				      </div>
				      <div class="user-info">
				        <div class="rating">
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				        </div>
				        <p class="user-id">chick*** &nbsp;| &nbsp; 23.01.01</p>
				        <p class="product-name">상품명 : 춘식이 다이어리</p>
				      </div>
				    </td>
				  </tr>
				  <tr>
				    <td colspan="2">
				      <div class="review-content" style="text-align: left;">
				        <p>춘식이 다이어리는 사랑이쥬!♥</p>
				      </div>
				    </td>
				  </tr>
				</table>
			</div>
			<br><br>
			
			<br><br>
			<div class="speech-bubble">
				<table>
				  <tr>
				    <td>
				      <div class="profile">
				        <img src="/resources/images/프로필3.png" alt="프로필 이미지" class="profile-image">
				      </div>
				      <div class="user-info">
				        <div class="rating">
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				        </div>
				        <p class="user-id">yello*** &nbsp;| &nbsp; 22.12.27</p>
				        <p class="product-name">상품명 : 춘식이 다이어리</p>
				      </div>
				    </td>
				  </tr>
				  <tr>
				    <td colspan="2">
				      <div class="review-content" style="text-align: left;">
				        <p>내년부터는 작심삼일하고 싶지 않아서 샀습니다. 매번 연말마다 내년엔 잘해봐야지 마음만 먹고 실천을 못해서 자괴감이 들었는데 이렇게나 귀여운 다이어리라면 내년엔 정말로 가능하지 않을까 기대하고 있습니다. 내년엔 진짜 제대로 실천할 수 있게 도와줘 춘식아!!</p>
				      </div>
				    </td>
				  </tr>
				</table>
			</div>
			<br><br>
			
			<br><br>
			<div class="speech-bubble">
				<table>
				  <tr>
				    <td>
				      <div class="profile">
				        <img src="/resources/images/프로필4.png" alt="프로필 이미지" class="profile-image">
				      </div>
				      <div class="user-info">
				        <div class="rating">
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				        </div>
				        <p class="user-id">heart*** &nbsp;| &nbsp; 22.11.11</p>
				        <p class="product-name">상품명 : 춘식이 다이어리</p>
				      </div>
				    </td>
				  </tr>
				  <tr>
				    <td colspan="2">
				      <div class="review-content" style="text-align: left;">
				        <p>빼빼로데이라고 친구한테 선물해주려고 샀어요 제가 다이어리 쓰는 거 부러워하던 친구라 유용하게 잘 썼으면 좋겠네요ㅎ</p>
				      </div>
				    </td>
				  </tr>
				</table>
			</div>
			<br><br>
			
			<br><br>
			<div class="speech-bubble">
				<table>
				  <tr>
				    <td>
				      <div class="profile">
				        <img src="/resources/images/프로필5.png" alt="프로필 이미지" class="profile-image">
				      </div>
				      <div class="user-info">
				        <div class="rating">
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				        </div>
				        <p class="user-id">pretty*** &nbsp;| &nbsp; 22.10.01</p>
				        <p class="product-name">상품명 : 춘식이 다이어리</p>
				      </div>
				    </td>
				  </tr>
				  <tr>
				    <td colspan="2">
				      <div class="review-content" style="text-align: left;">
				        <p>좋아요ㅎㅎㅎㅎㅎ</p>
				      </div>
				    </td>
				  </tr>
				</table>
			</div>
			<br><br>
			
			<br><br>
			<div class="speech-bubble">
				<table>
				  <tr>
				    <td>
				      <div class="profile">
				        <img src="/resources/images/프로필6.png" alt="프로필 이미지" class="profile-image">
				      </div>
				      <div class="user-info">
				        <div class="rating">
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				        </div>
				        <p class="user-id">prefe*** &nbsp;| &nbsp; 22.07.07</p>
				        <p class="product-name">상품명 : 춘식이 다이어리</p>
				      </div>
				    </td>
				  </tr>
				  <tr>
				    <td colspan="2">
				      <div class="review-content" style="text-align: left;">
				        <p>어렸을 때 일기 쓴거 말고는 다이어리 한번도 안 써봤는데 이건 너무 귀여워서 도저히 안 살 수 없어 질렀습니다!!ㅋㅋㅋ 잘 쓸게욧!</p>
				      </div>
				    </td>
				  </tr>
				</table>
			</div>
			<br><br>
			
			<br><br>
			<div class="speech-bubble">
				<table>
				  <tr>
				    <td>
				      <div class="profile">
				        <img src="/resources/images/프로필7.png" alt="프로필 이미지" class="profile-image">
				      </div>
				      <div class="user-info">
				        <div class="rating">
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				          <i class="fa fa-star"></i>
				        </div>
				        <p class="user-id">nonam*** &nbsp;| &nbsp; 22.06.26</p>
				        <p class="product-name">상품명 : 춘식이 다이어리</p>
				      </div>
				    </td>
				  </tr>
				  <tr>
				    <td colspan="2">
				      <div class="review-content" style="text-align: left;">
				        <p>문의할 때마다 매번 친절하게 응대해 주셔서 정말 정말 감사합니다 판매자님.<br>하시는 일 모두 잘 되기를 기원합니다.</p>
				      </div>
				    </td>
				  </tr>
				</table>
			</div>
          </div>

         <!-- 세번째 탭 (상품문의) -->
          <div id = "inquiry" class ="tab-pane">
           	<div class="inquiry-btn-container">
           		<button type="button" class="inquiry-btn">문의하기</button>
           	</div>
             
			
            <table id="myTable" class="my-custom-table">
			  <tr>
			    <th>답변 여부</th>
			    <th>제목</th>
			    <th>작성자</th>
			    <th>작성일</th>
			  </tr>
			  <tr onclick="toggleRow(1)">
			    <td>답변 대기</td>
			    <td>비밀글입니다. 🔒</td>
			    <td>pinkl***</td>
			    <td>23.01.10</td>
			  </tr>
			  <tr onclick="toggleRow(2)" class="has-answer">
			    <td>답변 완료</td>
			    <td>춘식이 다이어리 언제 재입고 되나요ㅜㅜ</td>
			    <td>dms77***</td>
			    <td>23.01.06</td>
			  </tr>
			  <tr id="hiddenRow2" class="hidden-row" style="display: none;">
			    <td></td>
			    <td>2023 춘식이 다이어리는 단종되었습니다</td>
			    <td>판매자</td>
			    <td>23.01.07</td>
			  </tr>
			  <tr onclick="toggleRow(3)" class="has-answer">
			    <td>답변 완료</td>
			    <td>펜도 같이 들어있나요?</td>
			    <td>ghfds***</td>
			    <td>22.12.26</td>
			  </tr>
			  <tr id="hiddenRow3" class="hidden-row" style="display: none;">
			    <td></td>
			    <td>펜은 별도로 구매하셔야 합니다</td>
			    <td>판매자</td>
			    <td>22.12.27</td>
			  </tr>
			  <tr onclick="toggleRow(4)" class="has-answer">
			    <td>답변 완료</td>
			    <td>다이어리 속지를 다른 걸로 변경 가능한가요?</td>
			    <td>asdcf***</td>
			    <td>22.10.03</td>
			  </tr>
			  <tr id="hiddenRow4" class="hidden-row" style="display: none;">
			    <td></td>
			    <td>다이어리 속지 변경이 불가한 상품입니다</td>
			    <td>판매자</td>
			    <td>22.10.04</td>
			  </tr>
			  <tr onclick="toggleRow(5)" class="has-answer">
			    <td>답변 완료</td>
			    <td>춘식이 스티커도 들어있나요?</td>
			    <td>stick***</td>
			    <td>22.09.15</td>
			  </tr>
			  <tr id="hiddenRow5" class="hidden-row" style="display: none;">
			    <td></td>
			    <td>스티커는 별도로 구매하셔야 합니다</td>
			    <td>판매자</td>
			    <td>22.09.16</td>
			  </tr>  
			</table>
			<br><br><br>
			


           
          </div>          
        </div>
        
        <!-- 화면 오른쪽 아래에 top▲ 버튼 추가-->
        <!-- <a href="#" style="position: fixed; bottom: 20px; right: 20px; color: white;">
            Top▲
        </a> -->
        
    </section>

    <!-- sticky -->
   	<!-- <div class="sticky">
    	<h6>최근 본 상품</h6>
    	<br>
	    최근 본 상품 이미지
	    <div id="recent-view">
	        <img src ="/resources/images/최근본상품1.jpg" alt="">
	        <img src ="/resources/images/최근본상품2.jpg" alt="">
	    </div>
	    장바구니 버튼
    	<button type="button" id="cart-btn" onclick="redirectToPage()">장바구니</button>
    	장바구니 버튼 누르면 장바구니 페이지로 이동하기
    	<script type="text/javascript">
    	function redirectToPage() {
    		  window.location.href = "cart.do";
    		}
    	</script>
	</div> -->

</main>  




<!-- ***** Product Area Ends ***** -->
    


	<script>
	
	
		$(() => {
			/* 가격 세자리마다 콤마 넣어주기 */
			let price = $('.price span').text();
			let sale_price = $('.sale-price span').text();
			let final_price = $('.final-price span').text();
			
			$('.price span').text(numberWithCommas(price));
			$('.sale-price span').text(numberWithCommas(sale_price));
			$('.final-price span').text(numberWithCommas(final_price));			
			
		
			/* 할인이 있을 경우 원래 가격에 취소선 처리 */
			if(${product.sale} > 0) {
				let price = $('.price').addClass('discount');
			}
		
	
		});
	
	</script>



			<!-- 문의 테이블 행 숨겼다 나타내기 -->
			<script>
			  function toggleRow(rowNumber) {
			    var hiddenRow = document.getElementById("hiddenRow" + rowNumber);
			    if (hiddenRow.style.display === "none") {
			      hiddenRow.style.display = "table-row";
			    } else {
			      hiddenRow.style.display = "none";
			    }
			  }
			</script> 
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" /> 
    
    