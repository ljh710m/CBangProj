// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
	
  $('.page-scroll a').on('click', function(event) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: $($anchor.attr('href')).offset().top
    }, 1500, 'easeInOutExpo');
    event.preventDefault();
  });
  
  $("form[name='familysite']").on("submit", function(){
    var url = $("select",this).val();
    window.open(url);
    return false;
  });

  $(".select-text").on("click", function(e){
   e.stopPropagation();
   if($(".list").css('display') == 'none'){
    $(this).children('.btn-select').addClass('on');
    $(".list").fadeIn("fast");
  }else{
    $(".list").fadeOut("fast");
    $(this).children('.btn-select').removeClass('on');
  }
})

  $('body').on('click', function(e){
    if($(".list").css('display') == 'block'){
      $(".list").fadeOut("fast");
      $(".select-text").children('.btn-select').removeClass('on');
    }
  }) 
});

function initialize() {
  var myLatlng = new google.maps.LatLng(37.47861, 126.8786259);
  var mapOptions = {
    zoom: 17,
    center: myLatlng,
    draggable: document.body.clientWidth < 600 ? false : true,
    scrollwheel : false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title: "KOSMO"
  });
  var contentString = '<p class="map-heading">KOSMO</p>';
  var infowindow = new google.maps.InfoWindow(
  {
    content : contentString,
    maxWidth: 300
  }
  );
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map, marker);
  });
}

new WOW().init();

//jQuery for FlexSlider
jQuery(document).ready(function ($) {
	$('#home-slider').flexslider({
    pauseOnHover: false,
  	slideshow: true,                //Boolean: Animate slider automatically
  	slideshowSpeed: 3000,           //Integer: Set the speed of the slideshow cycling, in milliseconds
  	animationSpeed: 600,
  	animation: "fade",              //String: Select your animation type, "fade" or "slide"
  	easing: "swing",               //{NEW} String: Determines the easing method used in jQuery transitions. jQuery easing plugin is supported!
  	direction: "horizontal",
  	controlNav: true,               //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
  	useCSS: true,                   //{NEW} Boolean: Slider will use CSS3 transitions if available
  	touch: true,
  	directionNav: false
  });
});

jQuery(document).ready(function ($) {
	$('.testimonial').flexslider({
    pauseOnHover: true,
  	slideshow: false,                //Boolean: Animate slider automatically
  	slideshowSpeed: 5000,           //Integer: Set the speed of the slideshow cycling, in milliseconds
  	animationSpeed: 1300,
  	animation: "slide",              //String: Select your animation type, "fade" or "slide"
  	easing: "swing",               //{NEW} String: Determines the easing method used in jQuery transitions. jQuery easing plugin is supported!
  	direction: "horizontal",
  	controlNav: true,               //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
  	useCSS: true,                   //{NEW} Boolean: Slider will use CSS3 transitions if available
  	touch: true,
  	directionNav: false
  });
});


