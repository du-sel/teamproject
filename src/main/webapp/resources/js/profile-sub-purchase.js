/*  구독 결제창 띄우기 (실제 결제 X)  */
function testpay(){
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
			
			// DB에 구독 정보 추가하는 로직 필요

			
			alert('구독을 시작합니다.');

		} else {
			alert('빌링키 발급 실패');
			}
		});
}
