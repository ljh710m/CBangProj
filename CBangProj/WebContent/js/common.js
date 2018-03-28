//Navbar active
$(function() {		
	var active = window.location.pathname;    	
	$(".nav a[href|='" + active + "']").parent().addClass("active");	
});

//ToolTip 실행
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

//로그인 모달 실행
function loginmodal(){
	$('#modalLogin').modal();
}

$(function() {
	//닫기 버튼 클릭
	$('.nbang-icon-remove').click(function(){
		$('#modalLogin').modal('hide');
		$('#findpwd').modal('hide');
		$('#userSignup').modal('hide');
		$('.Checkbox-input').prop("checked", false).prev().css("color","#d1d1d1");
		$('#nextBtn').removeClass("btn-pink").addClass("btn-default").prop('disabled','disabled');
		$('.UserSignup input').val("");
	});
	//모달창 바깥 클릭
	$('.nbang-modal-bg').click(function(){
		$('#modalLogin').modal('hide');
		$('#findpwd').modal('hide');
		$('.Checkbox-input').prop("checked", false).prev().css("color","#d1d1d1");
		$('#nextBtn').removeClass("btn-pink").addClass("btn-default").prop('disabled','disabled');
		$('#userSignup').modal('hide');
	});
	//비밀번호 찾기 클릭
	$('.Login-auth button:eq(0)').click(function(){
		$('#modalLogin').modal('hide');
		$('#findpwd').modal();
	});
	//일반 회원가입 클릭
	$('.Login-auth button:eq(1)').click(function(){		
		$('#modalLogin').modal('hide');
		$('#agree').modal();
	});	
	//약관동의 체크박스 클릭
	$('.Checkbox-input:lt(3)').click(function(){
		//동의 버튼 누른 경우
		if($(this).is(":checked")){
			$(this).prev().css("color","#ff7473");
		}
		else{
			$(this).prev().css("color","#d1d1d1");
		}
		//동의 3개 클릭한 경우
		if($('.Checkbox-input:lt(3):checked').length == 3){
			$('.Checkbox-input:eq(3)').prop("checked", true);
			$('.Checkbox-input:eq(3)').prev().css("color","#ff7473");
			$('#nextBtn').removeClass("btn-default").addClass("btn-pink").removeAttr('disabled');
		}
		else{
			$('.Checkbox-input:eq(3)').prop("checked", false);
			$('.Checkbox-input:eq(3)').prev().css("color","#d1d1d1");
			$('#nextBtn').removeClass("btn-pink").addClass("btn-default").prop('disabled','disabled');
		}
	});
	//모두 동의 버튼 클릭한 경우
	$('.Checkbox-input:eq(3)').click(function(){
		if($(this).is(":checked")){
			$('.Checkbox-input:lt(3)').prop("checked", true);
			$('.Checkbox-input').prev().css("color","#ff7473");
			$('#nextBtn').removeClass("btn-default").addClass("btn-pink").removeAttr('disabled');
		}
		else{
			$('.Checkbox-input:lt(3)').prop("checked", false);
			$('.Checkbox-input').prev().css("color","#d1d1d1");
			$('#nextBtn').removeClass("btn-pink").addClass("btn-default").prop('disabled','disabled');
		}
	});
	//약관 동의에서 취소버튼 클릭한 경우(이전 체크된 값 초기화)
	$('#cancleBtn').click(function(){
		$('.Checkbox-input').prop("checked", false).prev().css("color","#d1d1d1");
		$('#nextBtn').removeClass("btn-pink").addClass("btn-default").prop('disabled','disabled');
	});
	$('#nextBtn').click(function(){
		$('#agree').modal('hide');
		$('#userSignup').modal();		
	});
	//회원가입 창에서 이메일 선택시
	$('#email_host_select').change(function(){
		if($(this).val()!=""){
			$('#email_host').val($(this).val()).prop('disabled','disabled');			
		}
		else{
			$('#email_host').val($(this).val()).removeAttr('disabled');
		}		
	});
	
	$('#authNumber').click(function(){
		$.ajax({
	        type:"POST",
	        url:"/CBangProj/Mail/GmailSending.do",
	        data : {tomail : "aristort@naver.com"},
	        dataType : "text",
	        success: function(e){
	            console.log(e);
	            customAlert("success", "메일 보내기 성공");
	        },
	        error: function(error) {
	        	customAlert("error", error);
	        }  
	    });		
		
	});
		
});