function getParameterValueFromUrl() {
  var url = window.location.href; // 현재 페이지의 URL을 가져옴
  var parts = url.split('/'); // URL을 "/"로 나눔

  // parts 배열에서 마지막 요소(즉, "test6" 부분)를 추출하여 반환
  return parts[parts.length - 1];
}



/*  구독 결제창 띄우기 (실제 결제 X)  */
function testpay(subscribe_id, id, payment, pay_date){
	var IMP = window.IMP; 
	let customer_uid = '3';
	IMP.init('imp41751598'); 
	IMP.request_pay({
		pay_method : 'card', 
		merchant_uid : new Date().getTime(),
		name : '구독1',
		amount : 0, 
		customer_uid :customer_uid, //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
		buyer_email : 'first@mail.com',
		buyer_name : '첫번째',
		buyer_tel : '010-1111-2222'
	}, function(rsp) {
		if ( rsp.success ) {
		 console.log(subscribe_id);
		 console.log(id);
		 console.log(payment);
		 console.log(pay_date);
			var value = getParameterValueFromUrl();
			
			const params = {
				subscribeId:subscribe_id, 
				id:id, 
				//payment:payment, 
				//payDate:pay_date
			}
		
			$.ajax({
				url : "/profile/"+value,
				type : "POST",
				contentType: "application/json;charset=UTF-8",
				dataType : "json",
				data : JSON.stringify(params),
    			async : false,
				success : function(result) {
			
					
					alert("error");
					$('#subModal').modal('hide');	
			     },
				error : function(result) {
					alert('구독을 시작합니다.');
					
					//console.log(status, error);
					$('#subModal').modal('hide');
					 window.location.href = "/profiles/" + value;
					
				}
			});	
								
		} else {
			alert('빌링키 발급 실패');
			$('#subModal').modal('hide');
			}
		});
}
