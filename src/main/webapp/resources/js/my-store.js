/**
 * my-store 관련 js
 */

$(document).ready(function() {
	$().ready(function() {
		$sidebar = $('.sidebar');
        $navbar = $('.navbar');
        $main_panel = $('.main-panel');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;
        white_color = false;

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();
        
        // sidebar height 지정
        $('.sidebar').css("height", ($('.my-store').innerHeight())+"px");

        $('.fixed-plugin a').click(function(event) {
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });


        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            sidebar_mini_active = false;
            blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
          } else {
            $('body').addClass('sidebar-mini');
            sidebar_mini_active = true;
            blackDashboard.showSidebarMessage('Sidebar mini activated...');
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);
        });
        
		// 사이드바  크기 조절
	  	$(window).on('resize', function() {
	  		setTimeout(function() {
	  			$('.sidebar').css("height", ($('.my-store').innerHeight())+"px");
	  		}, 10);
	  	});
	  	
	  	addActive();		// 사이드바 위치 표시
	});
});

// 사이드바 현재 위치 표시 함수
function addActive(){
	let path = $(location).attr('pathname');				
	let href = $('.sidebar .sidebar-wrapper .nav li a');
	
	for(let i=0; i<href.length; i++){
		let url = $(href[i]).attr('href');
		if(path.includes(url.substr(0, url.indexOf('.')))){
			$(href[i]).parent().addClass('active');
			break;
		}
	}
}

 
// 숫자 카운팅 함수	  
function countingUp(target, count){
	$({ val : 0 }).animate({ val : count }, {
		duration: 1500,
		step: function() {
			var num = numberWithCommas(Math.floor(this.val));
			target.text(num);
		},
		complete: function() {
			var num = numberWithCommas(Math.floor(this.val));
			target.text(num);
		}
	});
}
      
// 세자리 마다 콤마(,) 넣는 함수
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}