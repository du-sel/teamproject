/**
 * login-modal
 * signup-modal
 * shop-create-modal
 */

function onSigninModal() { $('.modal-content').load("./modal/signin-modal.html"); }
function onSignupModal() { $('.modal-content').load("./modal/signup-modal.html"); }
function onShopModal() { $('.modal-content').load("./modal/shop-create-modal.html"); }
function changeSignupModal(){ $('.scroll-to-section').eq(1).click(); } 		// login-modal.html에서 사용

let email_flag = -1;
let pwd_flag = false;
let brand_flag = -1;
let url_flag = -1;
let inputs, parents;

// 중복확인 초기화
function chk_reset(flag){
	if(flag == "email"){ email_flag = -1; }
	else if(flag == "brand"){ brand_flag = -1; }
	else if(flag == "url"){ url_flag = -1 }
	else{
		email_flag = -1;
		brand_flag = -1;
		url_flag = -1;
	}
	
}

// 전화번호 하이픈 추가
function tel_hyphen(target){
	target.value = target.value.replace(/[^0-9]/g, '')
						.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, '');
}

//url 체크
function url_chk(url, url_chk, idx){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[idx]).children().last();
	
	if(url.length > 0 && $(inputs[idx+1]).val() == url){
		p.text("기존 URL을 사용합니다.").css('color','#179b81');
		url_flag = 1;
	}else if(!url_chk){
		p.text("중복된 URL입니다.").css('color','#f00');
		url_flag = 0;
	}else if($(inputs[idx+1]).val() != "" && url_chk){
		p.text("사용 가능한 URL입니다.").css('color','#179b81');
		url_flag = 1;
	}else if($(inputs[idx+1]).val() == ""){
		p.text("URL이 입력되지 않았습니다.").css('color','#f00');
		url_flag = 0;
	}
}

/***** user-pwd-modify.html *****/
//비밀번호 변경 전 확인
function change_pwd_chk(pwd){
	res = true;
	
	inputs = $('#modify-input-container input:password');
	
	// 기존 비밀번호 체크
	if($(inputs[0]).val() == pwd){
		$(inputs[0]).parent().next().text("");
	}else{
		$(inputs[0]).parent().next().text("비밀번호가 틀렸습니다.").css('color','#f00');
		res = false;
	}
	
	// 신규 비밀번호 체크
	if($(inputs[1]).val() == $(inputs[2]).val()){
		$(inputs[2]).parent().next().text("");
	}else{
		$(inputs[2]).parent().next().text("비밀번호가 일치하지않습니다.").css('color','#f00');
		res = false;
	}
	
	return res;
}

/***** singup-modal.html *****/
// singup-modal.html 유효성 검사 판단
function sign_chk(){    	
	inputs = $('#modal input');
	parents = $('.form-group');
	
	if(email_flag == -1 || url_flag == -1){
		let p;
		if(email_flag == -1){ p = $(parents[0]).children().last(); }
		else if(url_flag == -1){ p = $(parents[4]).children().last(); }

		p.text("중복 확인이 되지않았습니다.").css('color','#f00');
		return false;
	}else if(email_flag == 0 || !pwd_flag || url_flag == 0){
		return false;
	}
	
	return true;
}

// 이메일 중복 체크(?)
function email_chk(email_chk){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[0]).children().last();
	let email = $(inputs[0]).val();
	
	if(!email.match("@")){
		p.text("이메일 형식에 맞지 않습니다.").css('color','#f00');
		email_flag = 0;
	}else if(email == email_chk){
		p.text("중복된 이메일입니다.").css('color','#f00');
		email_flag = 0;
	}else if(email != "" && email != email_chk){
		p.text("사용 가능한 이메일입니다.").css('color','#179b81');
		email_flag = 1;
	}else if(email == ""){
		p.text("이메일이 입력되지 않았습니다.").css('color','#f00');
		email_flag = 0;
	}
}

// 비밀번호 체크 실시간 확인
function pwd_chk(){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[2]).children().last();
	let pwd = $(inputs[1]).val();
	let pwd_chk = $(inputs[2]).val()
	
	if(pwd == ""){
		p.text("비밀번호를 먼저 입력해주세요.").css('color','#f00');
	}else if(pwd != pwd_chk){
		p.text("비밀번호가 일치하지 않습니다.").css('color','#f00');
	}else if(pwd == pwd_chk){
		p.text("비밀번호가 일치합니다.").css('color','#179b81');
		pwd_flag = true;
	}
}


/***** shop-create-modal.html *****/
//shop-create-modal.html 유효성 검사 판단
function shop_chk(){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let email = re_chk("admin@naver.com", 2);
	let tel = re_chk("010-1111-1111", 3);
	
	if(brand_flag == -1 || url_flag == -1){
		let p;
		if(brand_flag == -1){ p = $(parents[0]).children().last(); }
		else if(url_flag == -1){ p = $(parents[1]).children().last(); }
		
		p.text("중복 확인이 되지않았습니다.").css('color','#f00');
		return false;
	}else if(brand_flag == 0 || url_flag == 0 || !email || !tel){
		return false;
	}
	
	return true;
}

// 브랜드 이름 체크
function brand_chk(brand_chk){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[0]).children().last();
	let brand = $(inputs[0]).val();
	
	if(brand == brand_chk){
		p.text("중복된 브랜드 이름입니다.").css('color','#f00');
		brand_flag = 0;
	}else if(brand != "" && brand != brand_chk){
		p.text("사용 가능한 브랜드 이름입니다.").css('color','#179b81');
		brand_flag = 1;
	}else if(brand == ""){
		p.text("브랜드 이름이 입력되지 않았습니다.").css('color','#f00');
		brand_flag = 0;
	}
}


function re_chk(value, idx){
	inputs = $('#modal input');
	parents = $('.form-group');
	
	let p = $(parents[idx]).children().last();
	
	if($(inputs[idx+1]).val() != value){
		p.text("사용자 정보와 일치하지않습니다.").css('color','#f00');
		return false;
	}else if($(inputs[idx+1]).val() == value){
		p.text("");
		return true;
	}
}