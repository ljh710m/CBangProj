(function($){
	$('.btn-outline-danger').click(function(){
		var deleteRoom = confirm('해당 등록방을 삭제하시겠습니까?');
		var room_no = $(this).parent().parent().find('#room_no').html();
		var location_code = $('input[type="hidden"]').html();
		if(deleteRoom){
			$.ajax({
				url : '/CBangProj/Manage/RoomDelete.do',
				type : 'post',
				data : {
					location_code : location_code,
					mode : 'delete',
					room_no : room_no
				},
				dataType : 'text',
				success : function(data){
					alert('삭제가 완료되었습니다.');
					location.href = 'Declaration.admin';
				},
				error : function(){
					customAlert("error", "해당 등록방이 존재하지 않습니다.");
				}
			});
		}
	});
	
	$('.btn-outline-success').click(function(){
		var room_no = $(this).parent().parent().find('#room_no').html();
		window.open('/CBangProj/Room/Detail.do?roomNo='+room_no,'blank');
	});
	})(jQuery);