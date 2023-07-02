<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />



<!-- ***** Page Content Starts ***** -->
<main id="inquiry-history" class="my-info broad">
    <section class="section" id="page">
    	<div class="page-title">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>나의 문의 내역</h2>
                    </div>
                </div>
            </div>
        </div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12 table-responsive">
					<form action="" class="inquiry-type">
						<select>
							<option value="" selected>상품문의</option>
							<option value="">고객센터</option>
						</select>
					</form>
		            <table class="text-center table table-bordered table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성일자</th>
								<th>답변 여부</th>
							</tr>
						</thead>
						<tbody>
							<tr onclick="location.href='product-inquiry.do'">
								<td>10</td>
								<td>구성이 어떻게 되나요?-상품문의 form</td>
								<td>2023.06.24</td>
								<td>답변 대기</td>
							</tr>
							<tr onclick="location.href='customer-inquiry.do'">
								<td>9</td>
								<td>구성이 어떻게 되나요?-고객센터 form</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
							<tr onclick="location.href='#'">
								<td>8</td>
								<td>구성이 어떻게 되나요?</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
							<tr onclick="location.href='#'">
								<td>7</td>
								<td>구성이 어떻게 되나요?</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
							<tr onclick="location.href='#'">
								<td>6</td>
								<td>구성이 어떻게 되나요?</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
							<tr onclick="location.href='#'">
								<td>5</td>
								<td>구성이 어떻게 되나요?</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
							<tr onclick="location.href='#'">
								<td>4</td>
								<td>구성이 어떻게 되나요?</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
							<tr onclick="location.href='#'">
								<td>3</td>
								<td>구성이 어떻게 되나요?</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
							<tr onclick="location.href='#'">
								<td>2</td>
								<td>구성이 어떻게 되나요?</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
							<tr onclick="location.href='#'">
								<td>1</td>
								<td>구성이 어떻게 되나요?</td>
								<td>2023.06.24</td>
								<td>답변 완료</td>
							</tr>
						</tbody> 
					</table>
				</div>
				
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



