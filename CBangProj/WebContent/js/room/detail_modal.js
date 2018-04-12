$(function() {
	$('#declaration').click(function(){
		$('#check-div').click(function(){
			if($('.Checkbox--chk').attr('value') == '미동의'){
				$('.Checkbox--chk').attr('value','동의');
				$('.Checkbox--chk i').css('color','#ff7473');
				$('.btn-xl').removeAttr('disabled');
				$('.btn-xl').css({'border':'1px solid #ff7473','background-color':'#ff7473'});
			}
			else{
				$('.Checkbox--chk').attr('value','미동의');
				$('.Checkbox--chk i').css('color','#d1d1d1');
				$('.btn-xl').attr('disabled','true');
			}
		});
		
		$('#add-phone').click(function(){
			if($('.input1.form-control').val().length != 0){
				var phone_no = $('select.form-control').val()+$('.input1.form-control:eq(0)').val()+$('.input1.form-control:eq(1)').val();
				$('#confirm-phone').val(phone_no);
			}
			else{
				customAlert("error", "휴대폰 번호를 입력하세요.");
			}
			if($('#confirm-phone').attr('disabled')){
				customAlert("error", "휴대폰 인증은 한번만 가능합니다.");
			}
		});
		
		$('.btn-ok').click(function(){
			if($('#confirm-phone').val().length != 0){
				$('#confirm-phone').attr('disabled','true');
				$('#confirm-phone').addClass('ok');
			}
			else{
				customAlert("error", "입력버튼을 먼저 눌러주세요.");
			}
		});
		
		$('.btn-xl').click(function(){
			var type = $('input[name="check-input"]:checked').next().html();
			var check_textarea = $('textarea.form-control').val();
			var phone = $('#confirm-phone').val();
			if(check_textarea.length < 1){
				customAlert("error", "허위신고 추가설명을 작성해주세요.");
			}
			else if(phone.length < 3){
				customAlert("error", "휴대폰번호 입력은 필수입니다.");
			}
			else if($('#confirm-phone').hasClass('ok') === false){
				customAlert("error", "입력번호 확인을 먼저 눌러주세요.");
			}
			else{
				if($('input[name="check-input"]:checked').length != 1){
					customAlert("error", "허위매물 신고항목 한가지를 선택하세요.");
				}
				else{
					$.ajax({
						type : 'post',
						url : '/CBangProj/ROOM/declaration.do',
						data : {
							type : type,
							add_info : check_textarea,
							phone : phone,
							room_no : $('#room_no').html()
						},
						dataType : 'text',
						success : function(data){
							customAlert("success", "신고가 접수되었습니다.");
							$('#myModal').modal('hide');
							$('#declaration').attr('disabled','true');
						},
						error : function(error){
							alert(error);
						}
					});
				}
			}
		});
	});
});
