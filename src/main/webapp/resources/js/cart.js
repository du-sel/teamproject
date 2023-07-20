// 장바구니에 담고 이동할 것인지 확인하는 confirm

function goCart(p_id) {

	$.ajax({
		type: "post",
		url: "/store/carts/"+p_id,
		datatype: 'text',
		success: function() {
			if(confirm("상품이 장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?")) {
				location.href="/store/carts";
				// 장바구니로 이동
			} 
		},
		error: function() {
			alert('오류 발생');
		}

	})
}

function preventDefaultGoCart(e, p_id) {

	e.stopPropagation();
	goCart(p_id);
}





