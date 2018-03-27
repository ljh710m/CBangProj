//Navbar active
$(function() {		
	var active = window.location.pathname;    	
	$(".nav a[href|='" + active + "']").parent().addClass("active");  
	
});

//ToolTip 실행
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

/*Login UI 화면 쿼리*/

function loginmodal(){
	$('#modalLogin').modal();
}

function findpwdclose(){
	$('#modalLogin').modal('hide');
}

$(".agreecheck").click(function(){
	/*$('.checked').prop('checked',false);*/
	if($(this).is(".agreecheck:checked")) $(this).prev().css("color","#ff7473");
	else $(this).prev().css("color","#d1d1d1");
	
	if($(this).val()=="allcheck"){
		if($(this).is(":checked")){
			$('.btn-login-next').removeAttr('disabled');

			$(".agreecheck").each(function(index) {
				$(this).prop("checked", true);
				$(this).prev().css("color","#ff7473");
			})
		}
		else{
			$('.btn-login-next').attr('disabled',"disabled");
			$(".agreecheck").each(function(index) {
				$(this).prop("checked", false);
				$(this).prev().css("color", "#d1d1d1");
			})
		}
	}

	else{//나머지 셋 중 하나 찍었을 때
		if($(".agreecheck:lt(3):checked").length==3){
			$(".agreecheck:last").prop("checked", true);
			$('.btn-login-next').removeAttr('disabled');
			$(".agreecheck:last").prev().css("color", "#ff7473");
		}
		else{
			$(".agreecheck:last").prop("checked", false);
			$(".agreecheck:last").prev().css("color", "#d1d1d1");
			$('.btn-login-next').attr('disabled',"disabled");
		}
		
	
	}
});

$(".btn-login-next").click(function(){
	if($('#accountJoin').modal()){
		$(".agreecheck").each(function(index) {
			$(this).prop("checked", false);
			$('.btn-login-next').attr('disabled',"disabled");
			$(this).prev().css("color", "#d1d1d1");
		})
	}
});
$(".btn-login").click(function(){
	if($('#agree').modal()){
		$(".agreecheck").each(function(index) {
			$(this).prop("checked", false);
			$('.btn-login-next').attr('disabled',"disabled");
			$(this).prev().css("color", "#d1d1d1");
		})
	}
});



