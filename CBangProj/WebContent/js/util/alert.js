//CustomAlert창
//type: success, warning, error
var customAlert = function(type,message){	
	$('.Alert').remove();
	
	var alert = $('<div/>').addClass('Alert');	
	var wrap = $('<div/>').addClass('Alert-message').addClass(type);
	var icon = $('<i/>').addClass('Alert-icon');
	var text = $('<p/>').addClass('Alert-text').html(message);

	$('body').append($(alert).append($(wrap).append(icon).append(text)));
	
	$('.Alert').animate({opacity:'0'},3000);
};