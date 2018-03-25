(function($) {
	//건물 옵션 등록
	$('button[name=register]').click(function(){		
		if($('#option_name').val() == ""){
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
					bOption("regit",$('#option_name').val(),null);
					customAlert("success","등록이 완료되었습니다.");
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
	
	//건물 옵션 Ajax
	function bOption(mode,name,code){
		$.ajax({
			type:'POST',
			url:'BuildingOption.admin',
			data:
			{
				mode:mode,
				name:name,
				code:code,
				nowPage:7
			},
			dataType:'text',
			success:function(data){				
				var jsonData = JSON.parse(data);
				var pagingText = jsonData.pagingText;
				var totalRecordCount = jsonData.totalRecordCount;
				var nowPage = jsonData.nowPage;
				var pageSize = jsonData.pageSize;				
				var obj = jsonData.list;
				
				$('#Boption').html("");
          		
				for(var i=0; i<obj.length; i++){					
					$('#Boption').append($('<tr/>')
							.append($('<th/>').attr('scope','row').html(totalRecordCount-(((nowPage - 1) * pageSize) + i)))
							.append($('<td/>').html(obj[i].option_code))
							.append($('<td/>').html(obj[i].name))
							.append($('<td/>')
									.append($('<button/>').attr('type','button').addClass("btn btn-outline-success btn-sm").attr('name','edit').attr('style','margin-right:5px;')
											.append($('<i/>').addClass("fa fa-edit")).append("&nbsp;Edit"))									
									.append($('<button/>').attr('type','button').addClass("btn btn-outline-danger btn-sm").attr('name','delete')
											.append($('<i/>').addClass("fa fa-times")).append("&nbsp;Delete"))
							)
					);		
				}
				$('#paging').html(pagingText);
				
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
			        					        		
			        		if(option_name == $(this).val() || $(this).val() == ""){
			        			customAlert("warning","변경될 이름을 입력해주세요.");
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
			        					bOption("edit",new_name,code);			        					
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
					
					var dialog = $('<div/>').attr('title',"옵션 삭제").append($('<p/>').html('정말 삭제하시겠습니까?')).dialog({
						position:{my:"center top", at:"center top", of:window},				
						resizable:false,
						height:"auto",
						width:400,
						modal: true,
						buttons:{
							"확인":function(){					
								bOption("delete",null,code);
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
				
			},
			error:function(){
				customAlert("error","오류 발생");
			}
		});
	}
	
})(jQuery);