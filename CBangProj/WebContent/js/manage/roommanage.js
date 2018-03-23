(function($) {	
	$('button[name=edit]').click(function(){
    	var edit = $(this).parent().prev();
    	var option_name = edit.text();
    	var input = $('<input/>').addClass('form-control').attr({type:'text',style:'width:150px;padding:0;display:inline'}).val(option_name)
    	.keypress(function (e){
        	if(e.which == 13){
        		if(option_name == $(this).val()){
        			customAlert("error","dfdf");
        			return;
        		}
        		
            	var dialog = $('<div/>').attr('title',"옵션 수정").append($('<p/>').html("수정 전:"+option_name+"<br>수정 후:"+$(this).val())).dialog({
        			position:{my:"center top", at:"center top", of:window},				
        			resizable:false,
        			height:"auto",
        			width:400,
        			modal: true,
        			buttons:{
        				"수정":function(){	
        					deleteId(id);
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
        });
    	edit.html(input).append("&nbsp;").append($('<i/>').addClass('fa fa-edit'));        		
    });
	
	$('button[name=delete]').click(function(){
		var dialog = $('<div/>').attr('title',"옵션 삭제").append($('<p/>').html('정말 삭제하시겠습니까?')).dialog({
			position:{my:"center top", at:"center top", of:window},				
			resizable:false,
			height:"auto",
			width:400,
			modal: true,
			buttons:{
				"확인":function(){					
					deleteId(id);
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
	});
	
	$('button[name=register]').click(function(){		
		if($('#option_name').val() == ""){
			customAlert("error", "등록할 옵션이름을 입력해주세요.");
			return;
		}
		bOption("regit");		
	});
	
	//건물 옵션 Ajax
	function bOption(mode){
		$.ajax({
			type:'POST',
			url:'BuildingOption.admin',
			data:
			{
				mode:mode,
				name:$('#option_name').val()
			},
			dataType:'json',
			success:function(data){				
				custumAlert("success","입력 완료");								
			},
			error:function(){
				customAlert("error","오류 발생");
			}
		});
	}	
	
})(jQuery);