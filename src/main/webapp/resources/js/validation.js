/**
 * signin-modal
 * signup-modal
 * store-create-modal
 * user-modify
 * store-management
 */

function onSigninModal() { $('.modal-content').load("/signin-modal"); }
function onSignupModal() { $('.modal-content').load("/signup-modal"); }
function onStoreModal() { $('#store-modal .modal-content').load("store-create-modal.do"); }
function changeSignupModal(){ $('.scroll-to-section').eq(1).click(); } 		// signin-modal.jsp에서 사용


let email_flag = -1;
let pwd_flag = false;
let store_flag = -1;
let url_flag = -1;
let inputs, parents;
let pwd_chk_str = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;

// 로그인
function login(){
	if($('email').val() == '') {
		alert("아이디를 작성입력해주세요.");
		$('email').focus();
		return false;
	}else if($('password').val() == '') {
		alert("비밀번호를 작성입력해주세요.");
		$('password').focus()
		return false;
	}
	
	$('#path').val($(location).attr('pathname'));	
	return true;
}

// 중복확인 초기화
function chk_reset(flag){
	if(flag == "email"){ email_flag = -1; }
	else if(flag == "store"){ store_flag = -1; }
	else if(flag == "url"){ url_flag = -1; }
	else if(flag == "pwd"){ pwd_flag = false; }
	else{
		email_flag = -1;
		store_flag = -1;
		url_flag = -1;
		pwd_flag = false;
	}
	
}

//공백, 특수문자 제거 + 숫자입력
function remove(type, target){
	let reg;
	
	if(type==1){	// 공백 제거
		reg = /[ ]/gim;
	}else if(type==2){	// 공백 및 특수문자 제거(@,.제외)
		reg = /[`~!#$%^&*()_|+\-=?;:'",<>\{\}\[\]\\\/ ]/gim;
	}else if(type==3){	// 공백 및 특수문자 제거
		reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
	}
	else if(type==4){	// 숫자만 입력 가능
		reg = /[^0-9]/gim;
	}
	target.value = target.value.replace(reg, '');
}

// 전화번호 하이픈 추가
function tel_hyphen(target){
	target.value = target.value.replace(/[^0-9]/g, '')
						.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, '');
}

//url 체크
function url_chk(old_url, idx, path){			// 기존 url(수정 시 사용), 중복된 url인지(후에 db로, true가 중복), input 위치, 함수 사용 페이지
	
	// 함수 부른 페이지 구별해 요소 가져옴
	if(path == 'store'){
		inputs = $('#store-management .validation-input');
		parents = $('.store-form');
	}else if(path == 'modify'){
		inputs = $('#modify-input-container .form-control');
		parents = $('.form-group');
	}else{
		inputs = $('#modal .form-control');
		parents = $('.form-group');
	}
	
	let url = $(inputs[idx]).val();
	let url_chk;
	let p = $(parents[idx]).children().last();
	console.log(url);
	console.log($(inputs[idx]));
	if(url == ""){
		p.text("URL이 입력되지 않았습니다.").css('color','#e97d7d');
		url_flag = 0;
		return;
	}else if((old_url.length > 0) && (url == old_url)){
		console.log("뭐야");
		p.text("기존 URL을 사용합니다.").css('color','#586579');
		url_flag = 1;
		return;
	}
	
	$.ajax({
		url: "/validation/url", 			//통신할 url
		type: "GET",						//통신할 메소드 타입
		data: {url : url},	//전송할 데이터
		dataType: "json",
		async: false,						// 실행 결과 기다리지 않고 다음 코드 읽을 것인지
		success : function(result) { 		// 매개변수에 통신성공시 데이터 저장
			if(result) url_chk = true;		// url 존재
			else url_chk = false;			// url 존재 x (사용 가능)
		},
		error : function (status, error) {	//통신 실패
			console.log('통신실패');
			console.log(status, error);
		}
	});	
	console.log("??");
	if(url_chk){
		p.text("중복된 URL입니다.").css('color','#e97d7d');
		url_flag = 0;
	}else if(url != "" && !url_chk){
		p.text("사용 가능한 URL입니다.").css('color','#586579');
		url_flag = 1;
	} 
}

//비밀번호 유효성 검사
function pwd_validation(id, target){
	inputs = $('#'+id+' .form-control');
	parents = $('.form-group');
	
	let p = $(parents[1]).children().last();
	let pwd = $(inputs[1]).val();
	
	target.value = target.value.replace(/[ ]/gim, '');
	
	if(!pwd_chk_str.test(pwd)){
		p.text("비밀번호는 8~15자리이고 문자/숫자/특수문자를 포함해야 합니다.").css('color','#e97d7d');
	}else{
		p.text("");		
	}
	
	
	
	
}

//이메일 중복 체크
function email_chk(){
	inputs = $('#modal .form-control');
	parents = $('.form-group');
	
	let p = $(parents[0]).children().last();
	let email = $(inputs[0]).val();
	let email_chk;
	let email_chk_str = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	if(email == ""){
		p.text("이메일이 입력되지 않았습니다.").css('color','#e97d7d');
		email_flag = 0;
		return;
	}else if(!email_chk_str.test(email)){
		console.log($(inputs[1]));
		p.text("이메일 형식에 맞지 않습니다.").css('color','#e97d7d');
		email_flag = 0;
		return;
	}
	
	$.ajax({
		url: "/validation/email", 			//통신할 url
		type: "GET",						//통신할 메소드 타입
		data: {email : email},	//전송할 데이터
		dataType: "json",
		async: false,						// 실행 결과 기다리지 않고 다음 코드 읽을 것인지
		success : function(result) { 		// 매개변수에 통신성공시 데이터 저장
			if(result) email_chk = true;	// 이메일 존재
			else email_chk = false;			// 이메일 존재 x (사용 가능)
		},
		error : function (status, error) {	//통신 실패
			console.log('통신실패');
			console.log(status, error);
		}
	});	 
	
 	if(email_chk){
		p.text("중복된 이메일입니다.").css('color','#e97d7d');
		email_flag = 0;
	}else if(email != "" && !email_chk){
		p.text("사용 가능한 이메일입니다.").css('color','#586579');
		email_flag = 1;
	}
}

/***** user-pwd-modify.jsp *****/
//비밀번호 변경 전 확인
function change_pwd_chk(){
	old_res = false;
	new_res = false;
	
	inputs = $('#modify-input-container input:password');
	
	
	// 기존 비밀번호 체크
	var password = $(inputs[0]).val();
	console.log("입력:"+password);
	$.ajax({
		url: "/validation/pwd", 			//통신할 url
		type: "GET",						//통신할 메소드 타입
		data: {old_password : password},	//전송할 데이터
		dataType: "json",
		async: false,						// 실행 결과 기다리지 않고 다음 코드 읽을 것인지
		success : function(result) { 		// 매개변수에 통신성공시 데이터 저장
		 	if(result){
		 		$(inputs[0]).parent().next().text("");
		 		old_res = true;		 		
		 	}else{
		 		$(inputs[0]).parent().next().text("비밀번호가 틀렸습니다.").css('color','#e97d7d');
		 	}
		},
		error : function (status, error) {	//통신 실패
			console.log('통신실패');
			console.log(status, error);
		}
	});	 
	
	// 신규 비밀번호 체크
	if(pwd_chk_str.test($(inputs[1]).val())){	// 비밀번호 형식에 맞아야함
		if($(inputs[1]).val() == $(inputs[2]).val()){
			$(inputs[2]).parent().next().text("");
			new_res = true;
		}else{
			$(inputs[2]).parent().next().text("비밀번호가 일치하지않습니다.").css('color','#e97d7d');
		}
	}
	
	console.log("old: "+old_res);
	console.log("new: "+new_res);
	console.log("on: "+(old_res && new_res));
	
	return (old_res && new_res);	//비동기가 늦어서 그냥 넘어가버림
}

/***** singup-modal.jsp *****/
// singup-modal.jsp 유효성 검사 판단
function sign_chk(){    	
	inputs = $('#modal .form-control');
	parents = $('.form-group');
	
	if(email_flag == -1 || url_flag == -1){
		let p;
		if(email_flag == -1){ p = $(parents[0]).children().last(); }
		else if(url_flag == -1){ p = $(parents[5]).children().last(); }

		p.text("중복 확인이 되지않았습니다.").css('color','#e97d7d');
		return false;
	}else if(email_flag == 0 || !pwd_flag || url_flag == 0){
		return false;
	}
	
	$('#path').val($(location).attr('pathname'));
	return true;
}

// 비밀번호 체크 실시간 확인
function pwd_chk(){
	inputs = $('#modal .form-control');
	parents = $('.form-group');
	
	let p = $(parents[2]).children().last();
	let pwd = $(inputs[1]).val();
	let pwd_chk = $(inputs[2]).val();

	if(pwd_chk == ""){
		p.text("");
		pwd_flag = false;
	}
	else if(!pwd_chk_str.test(pwd)){
		p.text("비밀번호 형식에 맞지 않습니다.").css('color','#e97d7d');
		pwd_flag = false;
	}else{
		if(pwd != pwd_chk){
			p.text("비밀번호가 일치하지 않습니다.").css('color','#e97d7d');
			pwd_flag = false;
		}else if(pwd == pwd_chk){
			p.text("비밀번호가 일치합니다.").css('color','#586579');
			pwd_flag = true;
		}
	}
}


/***** store-create-modal.jsp *****/
//store-create-modal.jsp 유효성 검사 판단
function store_create_chk(){
	inputs = $('#modal .form-control');
	parents = $('.form-group');
	
	let email = re_chk("admin@naver.com", 2);
	let tel = re_chk("010-1111-1111", 3);
	
	if(store_flag == -1 || url_flag == -1){
		let p;
		if(store_flag == -1){ p = $(parents[0]).children().last(); }
		else if(url_flag == -1){ p = $(parents[1]).children().last(); }
		
		p.text("중복 확인이 되지않았습니다.").css('color','#e97d7d');
		return false;
	}else if(store_flag == 0 || url_flag == 0 || !email || !tel){
		return false;
	}
	
	return true;
}

// 스토어 이름 체크
function store_chk(old_store, store_chk, path){				// 기존 store 이름, store 이름 존재 여부, 페이지 path
	if(path == 'store'){
		inputs = $('#store-management .form-control');
		parents = $('.store-form');
	}else{
		inputs = $('#modal .form-control');
		parents = $('.form-group');
	}
	
	let p = $(parents[0]).children().last();
	let store = $(inputs[0]).val();
	
	if(store.length > 0 && store == old_store){
		p.text("기존 스토어 이름을 사용합니다.").css('color','#586579');
		store_flag = 1;
	}else if(store_chk){
		p.text("중복된 스토어 이름입니다.").css('color','#e97d7d');
		store_flag = 0;
	}else if(store != "" && !store_chk){
		p.text("사용 가능한 스토어 이름입니다.").css('color','#586579');
		store_flag = 1;
	}else if(store == ""){
		p.text("스토어 이름이 입력되지 않았습니다.").css('color','#e97d7d');
		store_flag = 0;
	}
}


function re_chk(value, idx){
	inputs = $('#modal .form-control');
	parents = $('.form-group');
	
	let p = $(parents[idx]).children().last();
	
	if($(inputs[idx+1]).val() != value){
		p.text("사용자 정보와 일치하지않습니다.").css('color','#e97d7d');
		return false;
	}else if($(inputs[idx+1]).val() == value){
		p.text("");
		return true;
	}
}


/***** user-modify.jsp, store-management.jsp *****/
//user-modify.jsp, store-management.jsp 유효성 검사 판단
function modify_chk(path, idx){    		// 함수 사용 페이지, input 위치
	if(path == 'store'){
		parents = $('.store-form');
		
		if(store_flag == -1){
			let p = $(parents[idx-1]).children().last();
	
			p.text("중복 확인이 되지않았습니다.").css('color','#e97d7d');
			return false;
		}
	}else{
		parents = $('.form-group');
	}
	
	
	if(url_flag == -1){
		let p = $(parents[idx]).children().last();

		p.text("중복 확인이 되지않았습니다.").css('color','#e97d7d');
		return false;
	}else if(url_flag == 0 || store_flag == 0){
		return false;
	}
	
	return true;
}



/***** insert-product 상품등록 필수값 체크 *****/
function insert_p_chk(frm) {

	if($('#product-name').val() == '' || $('#product-name').val() == null){ 
		alert("상품명을 입력해주세요.");
		$('#product-name').focus();
		return false;
	} 
	else if($('#file').val() == '' || $('#file').val() == null){ 
		alert("상품 파일을 등록해주세요.");
		$('#file').focus();
		return false;
	} 
	else if($('#product-price').val() == '' || $('#product-price').val() == null){ 
		alert("금액을 입력해주세요.");
		$('#product-price').focus();
		return false;
	} 
	else if($("input[name='do-sale']:checked").val() == 'yes' && ($('#product-sale').val() == '' || $('#product-sale').val() == null)){ 
		alert("할인 금액을 입력해주세요.");
		$('#product-sale').focus();
		return false;
	} 
	else if($('#thumbnail').val() == '' || $('#thumbnail').val() == null){ 
		alert("썸네일을 등록해주세요.");
		$('#thumbnail').focus();
		return false;
	} 
	/*
	else if($('#content').val() == '' || $('#content').val() == null){ 
		alert("상세 정보를 등록해주세요.");
		$('#content').focus();
		return false;
	} 
	*/
	
	
	frm.submit();
	
}
