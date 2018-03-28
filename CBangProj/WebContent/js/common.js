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
	
	/* 이메일 인증 */
	var authNumber="";
	$('#authNumber').click(function(){
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var tomail = $('#email_user').val()+"@"+$('#email_host').val();
		if($('#email_user').val()=="" || $('#email_host').val()==""){
			customAlert("error", "이메일을 입력해 주세요.");			
			return;
		}
		else if(!regEmail.test(tomail)){
			customAlert("error", "이메일 주소가 올바르지 않습니다.");
			return;
		}
		$.ajax({
	        type:"POST",
	        url:"/CBangProj/Mail/GmailSending.do",
	        data : {tomail : $('#email_user').val()+"@"+$('#email_host').val()},
	        dataType : "text",
	        success: function(data){	            
	            authNumber = data;            
	            customAlert("success", "고객님의 이메일 주소로 인증 이메일을 보내드렸습니다.");
	        },
	        error: function(error) {
	        	customAlert("error", error);
	        }
	    });		
	});
	
	var isAuth=false;
	$('#authCheck').click(function(){		
		if($('#authNumber_confirm') == ""){
			customAlert("error", "인증번호를 입력하지 않았습니다.");
			$('#authNumber_confirm').focus();
		}
		else if(authNumber==""){
			customAlert("error", "인증번호를 요청해 주세요.");
		}		
		else if($('#authNumber_confirm').val() != authNumber){
			console.log(authNumber);
			customAlert("error", "인증번호가 올바르지 않습니다.");						
		}
		else{		
			$('#authNumber').prop('disabled','disabled');
			$('#authCheck').prop('disabled','disabled');
			$('#authNumber_confirm').prop('disabled','disabled');
			$('#email_user').prop('disabled','disabled');
			$('#email_host').prop('disabled','disabled');
			customAlert("success", "이메일이 인증되었습니다.");
			isAuth = true;
		}			
	});

	
	/* 유효성 검사 */
	$('#phone_2').on('input', function(){
		if(isNaN($(this).val())){
			$(this).val("");
			customAlert("error", "숫자만 입력하세요.");			
		} 		
	});
	$('#phone_3').on('input', function(){
		if(isNaN($(this).val())){
			$(this).val("");
			customAlert("error", "숫자만 입력하세요.");			
		}
	});	
	
	$('.Account-form__submit').click(function(){
		var name = $('#name').val();
		var email = $('#email_user').val()+"@"+$('#email_host').val();
		var password = $('#password').val();
		var password_confirm = $('#password_confirm').val();
		var phone = $('#phone_1').val()+"-"+$('#phone_2').val()+"-"+$('#phone_3').val();
		var path_code = $('#join_path_select').val();
				
		// 정규식 - 이메일 유효성 검사
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				
		if(name == ""){
			$('#name').focus();
			customAlert("error", "이름을 입력해 주세요.");			
		}
		else if($('#email_user').val() == "" || $('#email_host').val()==""){			
			if($('#email_user').val() == ""){
				$('#email_user').focus();				
			}
			else{
				$('#email_host').focus();
			}		
			customAlert("error", "이메일을 입력해 주세요.");
		}
		else if(!regEmail.test(email)){
			customAlert("error", "영문 소문자,숫자,(-,_,.)만 사용할 수 있습니다. 단(,(.)은 처음과 끝에 사용불가)");						
		}
		else if(password == ""){
			$('#password').focus();
			customAlert("error", "비밀번호를 입력해 주세요.");
		}
		else if(password != password_confirm){
			$('#password_confirm').focus();
			customAlert("error", "비밀번호가 동일하지 않습니다.");
		}
		else if($('#phone_2').val()=="" || $('#phone_3').val()==""){
			if($('#phone_2').val() == ""){
				$('#phone_2').focus();				
			}
			else{
				$('#phone_3').focus();
			}	
			customAlert("error", "핸드폰 번호가 없습니다.");			
		}
		else if(!isAuth){
			customAlert("error", "인증을 하지 않았습니다.");			
		}
		else if(path_code==""){
			customAlert("error", "가입 경로를 선택하지 않았습니다.");
		}
		else{
			//submit code 작성 예정
		}
		
	});
	
		
});