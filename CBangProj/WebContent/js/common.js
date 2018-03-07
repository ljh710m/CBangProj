//Navbar active
$(function() {		
	var active = window.location.pathname;    	
	$(".nav a[href|='" + active + "']").parent().addClass("active");  
	
});

//ToolTip 실행
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});