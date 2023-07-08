

//contact.html 불러오기 
async function fetchHtmlAsText(url) {
    return await (await fetch(url)).text();
};

async function importPage(target) {
    document.querySelector('#' + target).innerHTML = await fetchHtmlAsText(target + '.do');
};
importPage('st-main');




//애니메이션
$(()=>{
	tabActive();
	
    $('#tab div').bind('click',function(e){

        let tab = e.target.getAttribute('id');
          
        if(tab=='co-tab'){
            e.preventDefault();
            //$(this).removeClass('stretchRight');
            $('#st-tab').removeClass();
            $(this).addClass('active').addClass('stretchRight');
            //$('#co-main').show();
            //$('#st-main').hide();
            $('#tab .active').css('background', '#f2f2f6'); 
			$('#st-tab').css('background', '#dce0e3');
        }
        else if(tab=='st-tab'){
            e.preventDefault();
            //$(this).removeClass('stretcLeft');
            $('#co-tab').removeClass();
            $(this).addClass('active').addClass('stretchLeft');
            //$('#st-main').show();
            //$('#co-main').hide();     
            $('#tab .active').css('background', '#fff'); 
            $('#co-tab').css('background', '#dce0e3');
        }
    });
});


function tabActive(){
	let path = $(location).attr('pathname');
	let path_name = path.substr(1, path.indexOf('.')-1);
	if(path_name == 'co-main' || path_name == 'post'){
		$('#co-tab').addClass("active").css('background', '#f2f2f6');
	}
	else if(path_name == 'profile' || path_name.includes('user-')){
		$('#co-tab').addClass("active").css('background', '#fff');
	}
	else{
		$('#st-tab').addClass("active").css('background', '#fff');
	}
}
	
	let state = 'st';

function f(event){
	let id = $(event).attr('id');
	console.log(id);
	
	let path = $(location).attr('pathname');
	let path_name = path.substr(1, path.indexOf('.')-1);
	console.log(path_name);
	
	if(!path_name.match('main')){
		if(id == 'co-tab') {
			$('#community-main').load('co-main.do #co-change');
		}
	}
	
	if(id == 'co-tab') {
		$('#store-main.root').css('height', '100vh');
		$('#community-main.root').css('height', '100%');
	
		$('#store-main').css('right','-100%').css('position', 'absolute').css('visibility', 'hidden');
		$('#community-main').css('left','0%').css('position', 'relative').css('visibility', 'visible');
		//$('#store-main').html("");
		//$('#community-main').load('co-main.do #co-change');
 		$('#community-main').css('background-color', '#f2f2f6');
		//history.pushState('', '', '/co-main.do');
		$('body').css('overflow-x', 'hidden');
		$('#test').css('width', '100%').css('background-color', '#f2f2f6').css('right', '0');
		state = 'co';
	}
	else {
	
		$('#community-main.root').css('height', '100vh');
		$('#store-main.root').css('height', '100%');
		
		$('#community-main').css('left','-100%').css('position', 'absolute').css('visibility', 'hidden');
		$('#store-main').css('right','0%').css('position', 'relative').css('visibility', 'visible');
		//$('#community-main').html("");
		//$('#store-main').load('st-main.do #st-main');
 		$('store-main').css('background-color', '#fff');
		//history.pushState('', '', '/st-main.do');
		$('#test').css('width', '0%').css('left', '0');
		
		state = 'st';
	}
	
	modifyHeaderMenu(state);
//	 addHeaderBackground(state);
}

	function modifyHeaderMenu(state){
		
		// 일단 임시 URI로 시험 적용
		if(state == 'co') {
			$('.store-menu').css('visibility', 'hidden');
			return;
		} else {
			$('.store-menu').css('visibility', 'visible');
			return;
		}
	}

	// 커뮤니티 소속 페이지에 있을 때 헤더 / active탭 배경색 바꾸기 
	function addHeaderBackground(state){
		
		// 일단 임시 URI로 시험 적용
		if(state == 'co') {
			$('header').css('background-color', '#f2f2f6');
			// 탭 active 구현되고 나서 탭 배경색도 추가
			return;
		} else {
			$('header').css('background-color', '#fff');
			return;
		}
	}