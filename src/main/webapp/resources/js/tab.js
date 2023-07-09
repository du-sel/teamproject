

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
            $('#co-main').show();
            $('#st-main').hide();
            $('#tab .active').css('background', '#f2f2f6'); 
			$('#st-tab').css('background', '#dce0e3');
        
          	tabActive();
        }
        else if(tab=='st-tab'){
            e.preventDefault();
            //$(this).removeClass('stretcLeft');
            $('#co-tab').removeClass();
            $(this).addClass('active').addClass('stretchLeft');
            $('#st-main').show();
            $('#co-main').hide();  
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

