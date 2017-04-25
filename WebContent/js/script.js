$(document).ready(function() {
	var moretext = "Xem thêm";
	var lesstext = "Rút gọn";

	$(".morelink").click(function() {
		var myElement = document.getElementById("lyriccontent");
		if ($(this).hasClass("less")) {
			$(this).removeClass("less");
			$(this).html(moretext);
			myElement.style.height = "250px";
			$('#lyric').goTo();
		} else {
			$(this).addClass("less");
			$(this).html(lesstext);
			myElement.style.height = "auto";
		}

		return false;
	});
	
	 $.fn.goTo = function() {
	        $('html, body').animate({
	            scrollTop: $(this).offset().top + 'px'
	        }, 'fast');
	        return this; // for chaining...
	    }
});


//Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();
    
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;
    
    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('header').removeClass('nav-down').addClass('nav-up');
    } else {
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
            $('header').removeClass('nav-up').addClass('nav-down');
        }
    }
    
    lastScrollTop = st;
}