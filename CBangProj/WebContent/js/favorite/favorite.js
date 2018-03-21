$(function(){
	$('#menu').children('li').click(function(){	
		console.log("dfdf");
		var act = ('#menu > li');
		  
		act.removeClass("active");     
		$(this).addClass("active"); 
		//$('#recently)').css("background-color",'#ff8c8c');
		//$('#recently)').css("color",'white');
		
			
	});	
});

