/**
 * login-modal
 * signup-modal
 * shop-create-modal
 */



function onLoginModal() { $('.modal-content').load("./modal/login-modal.html"); }
function onSignupModal() { $('.modal-content').load("./modal/signup-modal.html"); }
function onShopModal() { $('.modal-content').load("./modal/shop-create-modal.html"); }
function changeSignupModal(){ $('.scroll-to-section').eq(1).click(); } 		// login-modal.html에서 사용

let id_flag = -1;
let pwd_flag = false;
let brand_flag = -1;
let url_flag = -1;
let inputs, parents;

/***** 중복확인 실시간 변경 시에도 동작하도록 *****/
(function() {
	$('.keyup').keyup(function() {
		console.log("11");
		id_flag = -1;
		brand_flag = -1;
		url_flag = -1;
	});
});
// 중복확인 초기화
function chk_reset(flag){
	if(flag == "id"){ id_flag = -1; }
	else if(flag == "brand"){ brand_flag = -1; }
	else if(flag == "url"){ url_flag = -1 }
	
}

// 전화번호 하이픈 추가
function tel_hyphen(target){
	target.value = target.value.replace(/[^0-9]/g, '')
						.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, '');
}

/***** singup-modal.html *****/
// singup-modal.html 유효성 검사 판단
function sign_chk(){    	
	inputs = $('#modal input');
	parents = $('.form-group');
	
	if(id_flag == -1){
		let p = $(parents[0]).children().last();
		
		p.text("중복 확인이 되지않았습니다.");
		p.css('color','#f00');
		return false;
	}else if(id_flag == 0 || !pwd_flag){
		return false;
	}
	
	return true;
}

// 아이디 중복 체크
function id_chk(id_chk){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[0]).children().last();
	
	if($(inputs[0]).val() == id_chk){
		p.text("중복된 아이디입니다.");
		p.css('color','#f00');
		id_flag = 0;
	}else if($(inputs[0]).val() != "" && $(inputs[0]).val() != id_chk){
		p.text("사용 가능한 아이디입니다.");
		p.css('color','#179b81');
		id_flag = 1;
	}else if($(inputs[0]).val() == ""){
		p.text("아이디가 입력되지 않았습니다.");
		p.css('color','#f00');
		id_flag = 0;
	}
}

// 비밀번호 체크 실시간 확인
function pwd_chk(){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[2]).children().last();
	
	if($(inputs[1]).val() == ""){
		p.text("비밀번호를 먼저 입력해주세요.");
		p.css('color','#f00');
	}else if($(inputs[1]).val() != $(inputs[2]).val()){
		p.text("비밀번호가 일치하지 않습니다.");
		p.css('color','#f00');
	}else if($(inputs[1]).val() == $(inputs[2]).val()){
		p.text("비밀번호가 일치합니다.");
		p.css('color','#179b81');
		pwd_flag = true;
	}
}


/***** shop-create-modal.html *****/
//shop-create-modal.html 유효성 검사 판단
function shop_chk(){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	console.log(brand_flag);
	console.log(url_flag);
	
	if(brand_flag == -1 || url_flag == -1){
		let p;
		if(brand_flag == -1){
			p = $(parents[0]).children().last();
			p.text("중복 확인이 되지않았습니다.");
			p.css('color','#f00');
		}
		if(url_flag == -1){
			$(parents[1]).children().last().text("중복 확인이 되지않았습니다.").css('color','#f00');
		}
		return false;
	}else if(brand_flag == 0 || url_flag == 0 || !re_chk("test@email", 2) || !re_chk("010-1111-1111", 3)){
		return false;
	}
	
	return true;
}

// 브랜드 이름 체크
function brand_chk(brand_chk){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[0]).children().last();
	
	if($(inputs[0]).val() == brand_chk){
		p.text("중복된 브랜드 이름입니다.");
		p.css('color','#f00');
		brand_flag = 0;
	}else if($(inputs[0]).val() != "" && $(inputs[0]).val() != brand_chk){
		p.text("사용 가능한 브랜드 이름입니다.");
		p.css('color','#179b81');
		brand_flag = 1;
	}else if($(inputs[0]).val() == ""){
		p.text("브랜드 이름이 입력되지 않았습니다.");
		p.css('color','#f00');
		brand_flag = 0;
	}
}

// url 체크
function url_chk(url_chk){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[1]).children().last();
	
	if($(inputs[2]).val() == url_chk){
		p.text("중복된 URL입니다.");
		p.css('color','#f00');
		url_flag = 0;
	}else if($(inputs[2]).val() != "" && $(inputs[2]).val() != url_chk){
		p.text("사용 가능한 URL입니다.");
		p.css('color','#179b81');
		url_flag = 1;
	}else if($(inputs[2]).val() == ""){
		p.text("URL이 입력되지 않았습니다.");
		p.css('color','#f00');
		url_flag = 0;
	}
}

function re_chk(re_chk, idx){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[idx]).children().last();
	
	if($(inputs[idx+1]).val() != re_chk){
		p.text("사용자 정보와 일치하지않습니다.");
		p.css('color','#f00');
		return false;
	}else if($(inputs[idx+1]).val() == re_chk){
		p.text("");
		return true;
	}
}