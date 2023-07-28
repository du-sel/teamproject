// 장바구니에 담고 이동할 것인지 확인하는 confirm

function goCart(id, p_id) {

/*
	console.log(id);
	console.log(p_id);
	if(id == null || id.length <= 0) {
		alert('로그인이 필요한 메뉴입니다');
		return;
	}
	*/

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

function preventDefaultGoCart(e, id, p_id) {

/*
	if(id == null || id.length <= 0) {
		alert('로그인이 필요한 메뉴입니다');
		return;
	}
	*/

	e.stopPropagation();
	goCart(p_id);
}


function preventDefaultGoCartProfile(e, p_id) {

	e.stopPropagation();
	goCart(p_id);
}





