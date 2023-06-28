/**
 * 
 */

$(document).ready(function() {
	$().ready(function() {
		// Window Resize Mobile Menu Fix - my-story
	  	$(window).on('resize', function() {
	  		console.log("resize1");
	  		setTimeout(function() {
	  			$('.sidebar').css("height", ($('.my-store').innerHeight())+"px");
	  		}, 10);
	  	});
	});
});
 
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