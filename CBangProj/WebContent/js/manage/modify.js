$(function() {
	$('textarea').change(function() {
		$(this).next().prop('disabled',false);
	});	
});


//메모 수정
function memoModify(room_no){
	var memo = $('#'+room_no).val();
	if(memo != ''){	
		$.ajax({
			type:'post',
			url:'/CBangProj/Manage/RoomMemo.do',
			data : 
			{
				room_no : room_no,
				memo : memo
			},
			dataType: 'text',
			success:function(data){
				if(data == "Y"){
					customAlert("info", "["+room_no+"]비공개 메모 등록이 완료되었습니다.");
					$('#'+room_no).next().prop('disabled',true);
				}
			},
			error:function(){
				customAlert("메모 수정 오류");
			}
		});
	}
};

//거래완료
function complete(room_no){
	var dialog = $('<div/>').attr('title',"거래 완료, 매물번호["+room_no+"]").append($('<p/>').html('완료 처리 하시겠습니까?')).dialog({
		position:{my:"center top+100", at:"center top", of:window},				
		resizable:false,
		height:"auto",
		width:400,
		modal: true,
		buttons:{
			"확인":function(){
				$.ajax({
					type:'post',
					url:'/CBangProj/Manage/RoomComplete.do',
					data : 
					{
						room_no : room_no						
					},
					dataType: 'text',
					success:function(data){
						if(data == "Y"){
							customAlert("info", "["+room_no+"] 거래 완료 처리 되었습니다.");
							location.reload();
						}
					},
					error:function(){
						customAlert("거래 완료 처리 오류");
					}
				});
				$(this).dialog("close");
			},
			"취소":function(){
				$(this).dialog("close");								
			}
		},
		open: function() { 
            $(".ui-dialog-titlebar-close", $(this).parent()).hide(); 
		}				
	});		
}

//삭제
function deleteRoom(room_no){
	var dialog = $('<div/>').attr('title',"매물 삭제, 매물번호["+room_no+"]").append($('<p/>').html('삭제 처리 하시겠습니까?')).dialog({
		position:{my:"center top+100", at:"center top", of:window},				
		resizable:false,
		height:"auto",
		width:400,
		modal: true,
		buttons:{
			"확인":function(){
				/*$.ajax({
					type:'post',
					url:'/CBangProj/Manage/RoomDelete.do',
					data : 
					{
						room_no : room_no						
					},
					dataType: 'text',
					success:function(data){
						if(data == "Y"){
							customAlert("info", "["+room_no+"] 삭제 처리 되었습니다.");
							location.reload();
						}
					},
					error:function(){
						customAlert("삭제 처리 오류");
					}
				});*/
				$(this).dialog("close");
			},
			"취소":function(){
				$(this).dialog("close");								
			}
		},
		open: function() { 
            $(".ui-dialog-titlebar-close", $(this).parent()).hide(); 
		}				
	});		
}


