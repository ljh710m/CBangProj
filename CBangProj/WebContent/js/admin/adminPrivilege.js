(function ($) {
	$('button[name=register]').click(function(){		
		if($('#privilege_name').val() == ""){
			customAlert("error", "등록할 옵션이름을 입력해주세요.");
			return;
		}
		var dialog = $('<div/>').attr('title',"옵션 등록").append($('<p/>').html('등록하시겠습니까?')).dialog({
			position:{my:"center top", at:"center top", of:window},				
			resizable:false,
			height:"auto",
			width:400,
			modal: true,
			buttons:{
				"등록":function(){					
					privilege("regit",$('#privilege_name').val(),null,1);					
					customAlert("success","등록이 완료되었습니다.");
					$('#privilege_name').val("");
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
	
	//Edit버튼
	$('button[name=edit]').click(function(){
		var button = $(this);
		button.prop("disabled", true);					
    	var edit = $(this).parent().prev();
    	var option_name = edit.text();
    	var input = $('<input/>').addClass('form-control').attr({type:'text',style:'width:150px;padding:0;display:inline'}).val(option_name)
    	.keypress(function (e){
        	if(e.which == 13){
        		var new_name = $(this).val();
        		var code = $(this).parent().prev().html();
        		var nowPage = $('#paging li.active').text();			        		
        					        		
        		if(option_name == $(this).val() || $(this).val() == ""){
        			customAlert("warning","변경될 권한을 입력해주세요.");
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
        					privilege("edit",new_name,code,nowPage);        					
        					customAlert("success","수정되었습니다.");
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
    	edit.html(input).append("&nbsp;").append($('<i/>').addClass('fa fa-times').attr('style','cursor:pointer;').click(function(){edit.html(option_name); button.prop("disabled", false)}));        		
    });
	
	//Delete 버튼
	$('button[name=delete]').click(function(){
		var code = $(this).parent().prev().prev().html();
		var nowPage = $('#paging li.active').text();
		
		var dialog = $('<div/>').attr('title',"옵션 삭제").append($('<p/>').html('정말 삭제하시겠습니까?')).dialog({
			position:{my:"center top", at:"center top", of:window},				
			resizable:false,
			height:"auto",
			width:400,
			modal: true,
			buttons:{
				"확인":function(){					
					privilege("delete",null,code,nowPage);
					customAlert("success","삭제되었습니다.");
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
	
	$('#paging li').click(function(){
		var nowPage = $(this).text();
		
		if(nowPage.trim() == "»"){
			nowPage = parseInt($(this).prev().text())+1;
		}
		else if(nowPage.trim() == "«"){
			nowPage = parseInt($(this).next().text())-1;			
		}
		privilege(null,null,null,nowPage,1)		
	});
	
	//관리자 권한  Ajax
	function privilege(mode,privilege_info,privilege_code,nowPage){
		console.log(privilege_info);
		var form = $('<form/>');
	    form.attr('action', 'adminPrivilege.admin');
	    form.attr('method', 'post');
	    form.appendTo('body');
	    
	    var iMode = $('<input type="hidden" value='+mode+' name="mode">');
	    var iPrivilege_info = $('<input type="hidden" value="'+privilege_info+'" name="privilege_info">');
	    var iPrivilege_code = $('<input type="hidden" value='+privilege_code+' name="privilege_code">');
	    var iNowPage = $('<input type="hidden" value='+nowPage+' name="nowPage">');	     
	 
	    form.append(iMode).append(iPrivilege_info).append(iPrivilege_code).append(iNowPage);
	    form.submit();
	
		/*$.ajax({
			type:'POST',
			url:'adminPrivilege.admin',
			data:
			{
				mode:mode,
				privilege_info:privilege_info,
				privilege_code:privilege_code,
				nowPage:nowPage
			},
			success:function(){
				location.reload();								
			},
			error:function(){
				customAlert("error","오류 발생");
			}
		});*/
	}

})(jQuery);