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
		$('#modelContact').modal('hide');
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
		$('#modelContact').modal('hide');
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
	//모두 동의 후 다음 단계 클릭시 
	$('#nextBtn').click(function(){
		$('#agree').modal('hide');
		//가입경로를 데이터베이스에서 가져옴
		$.ajax({
	        type:"POST",
	        url:"/CBangProj/Account/JoinPath.do",	        
	        dataType : "text",
	        success: function(data){
	        	var list = JSON.parse(data);	        	
	        	$('#join_path_select').html("");
	        	for(var i=0; i<list.length; i++){	        		
	        		$('#join_path_select').append($('<option/>').val(list[i].path_code).html(list[i].path_type));	        		
	        	}
	        	$('#join_path_select').prepend($('<option/>').val("").attr("selected","selected").html("가입 경로 선택"));
	            $('#userSignup').modal();
	        },
	        error: function(error) {
	        	customAlert("error", error);
	        }
	    });
		
	});
	
	/* 일반 회원가입 */
	//회원가입 창에서 이메일 선택시
	$('#email_host_select').change(function(){
		if($(this).val()!=""){
			$('#email_host').val($(this).val()).prop('disabled','disabled');			
		}
		else{
			$('#email_host').val($(this).val()).removeAttr('disabled');
		}
	});
	
	//이메일 인증
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
	
	//유효성 검사
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
	
	// 정규식 - 이메일 유효성 검사
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	$('#join').click(function(){
		var name = $('#name').val();
		var email = $('#email_user').val()+"@"+$('#email_host').val();
		var password = $('#password').val();
		var password_confirm = $('#password_confirm').val();
		var phone = $('#phone_1').val()+"-"+$('#phone_2').val()+"-"+$('#phone_3').val();
		var path_code = $('#join_path_select').val();					
				
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
			//회원 가입 정보 전송
		    $.ajax({
		        type:"POST",
		        url:"/CBangProj/Account/Join.do",
		        data:
		        {
		        	name:name,
		        	email:email,
		        	password:password,
		        	phone:phone,
		        	path_code:path_code
		        },
		        dataType : "text",
		        success: function(result){
		        	if(result == "1"){
		        		$('#userSignup').modal('hide');
		        		$('#modalLogin').modal();
		        		customAlert("success", "회원 가입이 완료되었습니다.");		        		
		        	}
		        	else{
		        		customAlert("error", "서버 오류로 인한 가입실패");
		        	}
		        },
		        error: function(error) {
		        	customAlert("error", error);
		        }
		    });//ajax
		    
		}//else	
		
	});//$('.Account-form__submit').click
	
	/* 로그인 */
	$('#login').click(function(){
		
		//유효성 체크 후 아이디 체크
		if($('#account_email').val()==""){
			customAlert("error", "이메일을 주소를 입력하세요.");		
		}
		else if(!regEmail.test($('#account_email').val())){
			customAlert("error", "이메일을 형식을 확인해주세요.");
		}
		else if($('#account_password').val()==""){
			customAlert("error", "비밀번호를 입력해주세요.");
		}
		else{			
			$.ajax({
		        type:"POST",
		        url:"/CBangProj/Account/Login.do",
		        data: $('#loginForm').serialize(),
		        dataType : "text",
		        success: function(data){
		        	var result = JSON.parse(data);		        	
		        	if(result.notExistEmail){		        		
		        		customAlert("error", "존재하지 않는 이메일입니다.");		        		
		        	}
		        	else if(result.pwdNotMatch){
		        		customAlert("error", "비밀번호가 일치하지 않습니다.");		        		
		        	}
		        	else{
		        		$('#modalLogin').modal('hide');
		        		customAlert("info", "로그인이 완료되었습니다.");
		        		window.location.href = "/CBangProj/index.jsp";
		        	}
		        },
		        error: function(error) {		        	
		        	customAlert("error", error);
		        }
		    });			
		}		
							
	});//$('#login').click
	
	$('.btn-facebook').click(function(){
		window.location.href = '/CBangProj/backend/login.jsp';				
	});
		
});