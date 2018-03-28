(function ($) {
	$('button[name=register]').click(function(){		
		if($('#path_name').val() == ""){
			customAlert("error", "등록할 가입 경로를 입력해주세요.");
			return;
		}
		var dialog = $('<div/>').attr('title',"경로 등록").append($('<p/>').html('등록하시겠습니까?')).dialog({
			position:{my:"center top", at:"center top", of:window},				
			resizable:false,
			height:"auto",
			width:400,
			modal: true,
			buttons:{
				"등록":function(){					
					privilege("regit",$('#path_name').val(),null,1);					
					customAlert("success","등록이 완료되었습니다.");
					$('#path_name').val("");
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
    	var input = $('<input/>').addClass('form-control').attr({type:'text',style:'width:280px;padding:0;display:inline'}).val(option_name)
    	.keypress(function (e){
        	if(e.which == 13){
        		var new_name = $(this).val();
        		var code = $(this).parent().prev().html();
        		var nowPage = $('#paging li.active').text();			        		
        					        		
        		if(option_name == $(this).val() || $(this).val() == ""){
        			customAlert("warning","변경될 가입경로를 입력해주세요.");
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
		
		var dialog = $('<div/>').attr('title',"경로 삭제").append($('<p/>').html('정말 삭제하시겠습니까?')).dialog({
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
	function privilege(mode,join_type,join_code,nowPage){		
		var form = $('<form/>');
	    form.attr('action', 'joinPath.admin');
	    form.attr('method', 'post');
	    form.appendTo('body');
	    
	    var iMode = $('<input type="hidden" value='+mode+' name="mode">');
	    var iPrivilege_info = $('<input type="hidden" value="'+join_type+'" name="join_type">');
	    var iPrivilege_code = $('<input type="hidden" value='+join_code+' name="join_code">');
	    var iNowPage = $('<input type="hidden" value='+nowPage+' name="nowPage">');	     
	 
	    form.append(iMode).append(iPrivilege_info).append(iPrivilege_code).append(iNowPage);
	    form.submit();			
	}

})(jQuery);