(function ($) {
	
	"use strict";
	$('.owl-men-item').owlCarousel({
		items:5,
		loop:true,
		dots: true,
		nav: true,
		margin:30,
		  responsive:{
			  0:{
				  items:1
			  },
			  600:{
				  items:2
			  },
			  1000:{
				  items:3
			  }
		 }
	})

	$('.owl-women-item').owlCarousel({
		items:5,
		loop:true,
		dots: true,
		nav: true,
		margin:30,
		  responsive:{
			  0:{
				  items:1
			  },
			  600:{
				  items:2
			  },
			  1000:{
				  items:3
			  }
		 }
	 })

	$('.owl-kid-item').owlCarousel({
		items:5,
		loop:true,
		dots: true,
		nav: true,
		margin:30,
		  responsive:{
			  0:{
				  items:1
			  },
			  600:{
				  items:2
			  },
			  1000:{
				  items:3
			  }
		 }
	 })

	$(window).scroll(function() {
	  var scroll = $(window).scrollTop();
	  var box = $('#top').height();
	  var tab = $('#tab').height();
	  var header = $('header').height();

	 
	  
	  if (scroll > 0) {
		  $("header").addClass("background-header");
		  $("header").css("top", "0px");
		} else {
			// scroll == 0 이면 
			$("header").removeClass("background-header");
			$("header").css("top", tab);

		}	  
	  setTimeout(function() {
			$("main.broad").css("margin-top", $('header').height());
		}, 100);

	});
	

	// Window Resize Mobile Menu Fix
	mobileNav();
	
		console.log("out");	
	// Window Resize Mobile Menu MyMenu
	let menu_flag = false;		// myMenu flag
	myMenu();


	// Scroll animation init
	window.sr = new scrollReveal();
	

	// Menu Dropdown Toggle
	if($('.menu-trigger').length){
		$(".menu-trigger").on('click', function() {	
			$(this).toggleClass('active');
			$('.header-area .nav').slideToggle(200);
		});
	}


	// Menu elevator animation
	$('.scroll-to-section a[href*=\\#]:not([href=\\#])').on('click', function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			if (target.length) {
				var width = $(window).width();
				if(width < 991) {
					$('.menu-trigger').removeClass('active');
					$('.header-area .nav').slideUp(200);	
				}				
				$('html,body').animate({
					scrollTop: (target.offset().top) - 80
				}, 700);
				return false;
			}
		}
	});

//	$(document).ready(function () {
//	    $(document).on("scroll", onScroll);
	    
	    //smoothscroll
//	    $('.scroll-to-section a[href^="#"]').on('click', function (e) {
//	        e.preventDefault();
//	        $(document).off("scroll");
	        
//	        $('.scroll-to-section a').each(function () {
//	            $(this).removeClass('active');
//	        })
//	        $(this).addClass('active');
	      
//	        var target = this.hash,
//	        menu = target;
//	       	var target = $(this.hash);
//	        $('html, body').stop().animate({
//	            scrollTop: (target.offset().top) - 79
//	        }, 500, 'swing', function () {
//	            window.location.hash = target;
//	            $(document).on("scroll", onScroll);
//	        });
//	    });
//	});

	function onScroll(event){
	    var scrollPos = $(document).scrollTop();
	    $('.nav a').each(function () {
	        var currLink = $(this);
	        var refElement = $(currLink.attr("href"));
	        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
	            $('.nav ul li a').removeClass("active");
	            currLink.addClass("active");
	        }
	        else{
	            currLink.removeClass("active");
	        }
	    });
	}


	// Page loading animation
	$(window).on('load', function() {
		if($('.cover').length){
			$('.cover').parallax({
				imageSrc: $('.cover').data('image'),
				zIndex: '1'
			});
		}

		$("#preloader").animate({
			'opacity': '0'
		}, 600, function(){
			setTimeout(function(){
				$("#preloader").css("visibility", "hidden").fadeOut();
			}, 300);
		});
	});
	
	// Window Resize Mobile Menu Fix
	$(window).on('resize', function() {
		myMenu();
		mobileNav();
		console.log("resize");	
		setTimeout(function() {
			$('main.broad').css("margin-top", $('header').height());
		}, 300);
	});


	// Window Resize Mobile Menu Fix
	function mobileNav() {
		var width = $(window).width();
		console.log($(this).find('ul'));
		$('.submenu').on('click', function() {
			if(width < 768) {
				if($(this).find('ul').attr('class') == 'active'){
					$(this).find('ul').removeClass('active');
				}else{
					$(this).find('ul').addClass('active');
				}
			}
		});
	}
	
	// Window Resize Mobile Menu - MyMenu
	function myMenu() {
		var width = $(window).width();
		
		if(width < 768 && !menu_flag) {
			$('#user-menu').children('img').remove();
			$('#user-menu').prepend("<a>마이 메뉴</a>");
			menu_flag = true;
		}else if(width >= 768 && menu_flag){
			$('#user-menu').children('a').remove();
			$('#user-menu').prepend("<img src='/resources/images/baner-right-image-02.jpg' alt='프로필사진' id='profile-image'>");
			menu_flag = false;
		}
	}
	
})(window.jQuery);
