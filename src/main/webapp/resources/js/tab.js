

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


