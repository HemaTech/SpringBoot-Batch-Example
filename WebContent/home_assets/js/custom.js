(function () {
	"use strict";

	// parallax js
	$('.parallax').parallax();

	// couter up
	$('.counter, .cter').counterUp({
		delay: 10,
		time: 2000
		});

	// video lightning
	$(".btn_play_vd").jqueryVideoLightning({
		autoplay: 1,
		backdrop_color: "#ddd",
		backdrop_opacity: 0.6,
		glow: 20,
		glow_color: "#000"
     });

	// carousel event
	$('.event_cs').bxSlider({
		slideWidth: 370,
		minSlides: 1,
		maxSlides: 2,
		slideMargin:30,
		infiniteLoop: false,
		pager: false,
		moveSlides: 1
		});

	// smooth scroll
	$("html").niceScroll({
		zindex: "99999",
		scrollspeed: 70,
		mousescrollstep: 50,
		cursorwidth: "6px",
		cursorborder: "0",
		cursorcolor: "#d2d2d2",
		cursorborderradius: "0px",
		});

	//isotope
	$('.gallery_content').isotope({
		layoutMode: 'fitRows',
		itemSelector: '.element-item',
		percentPosition: true,
		fitRows: {
			gutter: '.gutter-sizer'
			}
		});

	// carousel_ demo about page
	$('.carousel_').bxSlider({
		slideWidth: 400,
		minSlides: 1,
		maxSlides: 1,
		slideMargin:0,
		infiniteLoop: false,
		pager: true,
		controls: false,
		moveSlides: 1
		});

	//video link
	$(".icon_pl, .pl_grow_video, .vd_event_detail").jqueryVideoLightning({
		autoplay: 1,
		backdrop_color: "#ddd",
		backdrop_opacity: 0.6,
		glow: 20,
		glow_color: "#000"
		});

	// carousel_ blog page
	$('.box_carousel').slick({
		dots: false,
		infinite: true,
		speed: 500,
		slidesToShow: 1,
		slidesToScroll: 1,
		});

	// carousel_ event detail page
	$('.fly_crs').slick({
		dots: true,
		arrows: false,
		infinite: true,
		speed: 300,
		slidesToShow: 1,
		slidesToScroll: 1,
		});

	// gallery on classes page
	$('#carousel').flexslider({
		animation: "slide",
		controlNav: false,
		animationLoop: false,
		slideshow: false,
		itemWidth: 90,
		itemMargin: 10,
		asNavFor: '#slider',
		move: 1,
		});

		$('#slider').flexslider({
		animation: "slide",
		controlNav: false,
		animationLoop: false,
		slideshow: false,
		sync: "#carousel",
		move: 1,
		});

	// menu tabs sidebar blog
	$(".tabs_menu a").on('click', function(event) {
        event.preventDefault();
        $(this).parent().addClass("tab_current");
        $(this).parent().siblings().removeClass("tab_current");
        var tab = $(this).attr("href");
        $(".tab_content").not(tab).css("display", "none");
        $(tab).fadeIn();
    	});

	//accordion
	$(".accordion").smk_Accordion({
		closeAble: true,
		});
	
	// lightbox img
	$('.child_hv .btn_cl, .child_hv .ion-android-search').imageLightbox(
		{
		selector:       'id="imagelightbox"',   // string;
		allowedTypes:   'png|jpg|jpeg|gif',     // string;
		animationSpeed: 300,                    // integer;
		preloadNext:    false,                   // bool;            silently preload the next image
		enableKeyboard: true,                   // bool;            enable keyboard shortcuts (arrows Left/Right and Esc)
		quitOnEnd:      false,                  // bool;            quit after viewing the last image
		quitOnImgClick: false,                  // bool;            quit when the viewed image is clicked
		quitOnDocClick: true,                   // bool;            quit when anything but the viewed image is clicked
		onStart:        false,                  // function/bool;   calls function when the lightbox starts
		onEnd:          false,                  // function/bool;   calls function when the lightbox quits
		onLoadStart:    false,                  // function/bool;   calls function when the image load begins
		onLoadEnd:      false                   // function/bool;   calls function when the image finishes loading
		});

	// hover popup section class
	$(".popup_").hover(function () {
		$(".more_ span").addClass("background_more");
		}, function () {
		$(".more_ span").removeClass("background_more");
		});
	
	// change button + color menu
	$( ".menu-item:has(.set_active)" ).addClass( "asp" );

})(jQuery);