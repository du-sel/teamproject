

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
        }
        else if(tab=='st-tab'){
            e.preventDefault();
            //$(this).removeClass('stretcLeft');
            $('#co-tab').removeClass();
            $(this).addClass('active').addClass('stretchLeft');
            $('#st-main').show();
            $('#co-main').hide();      
        }
    });
});


function tabActive(){
	let path = $(location).attr('pathname');
	let path_name = path.substr(1, path.indexOf('.')-1);
	if(path_name == 'co-main' || path_name == 'post'){
		$('#co-tab').addClass("active");
		$('#co-tab.active').css('background-color', '#f2f2f6');
	}
	else{
		$('#st-tab').addClass("active");
		$('#st-tab.active').css('background-color', '#fff');
	}
	console.log(path_name);
}

