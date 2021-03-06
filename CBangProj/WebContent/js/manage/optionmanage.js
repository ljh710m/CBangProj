(function($) {
	/* 
	 * 건물 옵션 
	*/
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
					bOption("regit",$('#option_name').val(),null,1);
					customAlert("success","등록이 완료되었습니다.");
					$('#option_name').val("");
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
	function bOption(mode,name,code,nowPage){
		$.ajax({
			type:'POST',
			url:'BuildingOption.admin',
			data:
			{
				mode:mode,
				name:name,
				code:code,
				nowPage:nowPage
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
				$('#paging li').click(function(){
					var nowPage = $(this).text();
					
					if(nowPage.trim() == "»"){
						nowPage = parseInt($(this).prev().text())+1;
					}
					else if(nowPage.trim() == "«"){
						nowPage = parseInt($(this).next().text())-1;			
					}
					bOption(null,null,null,nowPage,1)		
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
			        					bOption("edit",new_name,code,nowPage);			        					
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
								bOption("delete",null,code,nowPage);
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
        					bOption("edit",new_name,code,nowPage);			        					
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
					bOption("delete",null,code,nowPage);
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
		bOption(null,null,null,nowPage)
	});
	
	/*
	 * 방 종류
	*/
	//방 종류 등록
	$('button[name=registerR]').click(function(){		
		if($('#room_type_name').val() == ""){
			customAlert("error", "등록할 방 종류를 입력해주세요.");
			return;
		}
		var dialog = $('<div/>').attr('title',"방 종류 등록").append($('<p/>').html('등록하시겠습니까?')).dialog({
			position:{my:"center top", at:"center top", of:window},				
			resizable:false,
			height:"auto",
			width:400,
			modal: true,
			buttons:{
				"등록":function(){
					roomType("regit",$('#room_type_name').val(),null,1);
					customAlert("success","등록이 완료되었습니다.");
					$('#room_type_name').val("");
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
	function roomType(mode,room_type,rm_type_code,nowPage){
		$.ajax({
			type:'POST',
			url:'roomtype.admin',
			data:
			{
				mode:mode,
				room_type:room_type,
				rm_type_code:rm_type_code,
				nowPage:nowPage
			},
			dataType:'text',
			success:function(data){				
				var jsonData = JSON.parse(data);
				var pagingText = jsonData.pagingText;
				var totalRecordCount = jsonData.totalRecordCount;
				var nowPage = jsonData.nowPage;
				var pageSize = jsonData.pageSize;				
				var obj = jsonData.list;
				
				$('#roomType').html("");
          		
				for(var i=0; i<obj.length; i++){					
					$('#roomType').append($('<tr/>')
							.append($('<th/>').attr('scope','row').html(totalRecordCount-(((nowPage - 1) * pageSize) + i)))
							.append($('<td/>').html(obj[i].rm_type_code))
							.append($('<td/>').html(obj[i].room_type))
							.append($('<td/>')
									.append($('<button/>').attr('type','button').addClass("btn btn-outline-success btn-sm").attr('name','editR').attr('style','margin-right:5px;')
											.append($('<i/>').addClass("fa fa-edit")).append("&nbsp;Edit"))									
									.append($('<button/>').attr('type','button').addClass("btn btn-outline-danger btn-sm").attr('name','deleteR')
											.append($('<i/>').addClass("fa fa-times")).append("&nbsp;Delete"))
							)
					);
				}
				$('#pagingR').html(pagingText);
				$('#pagingR li').click(function(){
					var nowPage = $(this).text();
					
					if(nowPage.trim() == "»"){
						nowPage = parseInt($(this).prev().text())+1;
					}
					else if(nowPage.trim() == "«"){
						nowPage = parseInt($(this).next().text())-1;			
					}
					roomType(null,null,null,nowPage,1)		
				});
				
				//Edit버튼
				$('button[name=editR]').click(function(){
					var button = $(this);
					button.prop("disabled", true);					
			    	var edit = $(this).parent().prev();
			    	var option_name = edit.text();
			    	var input = $('<input/>').addClass('form-control').attr({type:'text',style:'width:150px;padding:0;display:inline'}).val(option_name)
			    	.keypress(function (e){
			        	if(e.which == 13){
			        		var new_name = $(this).val();
			        		var rm_type_code = $(this).parent().prev().html();
			        		var nowPage = $('#pagingR li.active').text();			        		
			        					        		
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
			        					roomType("edit",new_name,rm_type_code,nowPage);			        					
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
				$('button[name=deleteR]').click(function(){
					var rm_type_code = $(this).parent().prev().prev().html();
					var nowPage = $('#pagingR li.active').text();
					
					var dialog = $('<div/>').attr('title',"옵션 삭제").append($('<p/>').html('정말 삭제하시겠습니까?')).dialog({
						position:{my:"center top", at:"center top", of:window},				
						resizable:false,
						height:"auto",
						width:400,
						modal: true,
						buttons:{
							"확인":function(){					
								roomType("delete",null,rm_type_code,nowPage);
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
	
	//Edit버튼
	$('button[name=editR]').click(function(){
		var button = $(this);
		button.prop("disabled", true);					
    	var edit = $(this).parent().prev();
    	var option_name = edit.text();
    	var input = $('<input/>').addClass('form-control').attr({type:'text',style:'width:150px;padding:0;display:inline'}).val(option_name)
    	.keypress(function (e){
        	if(e.which == 13){
        		var new_name = $(this).val();
        		var rm_type_code = $(this).parent().prev().html();
        		var nowPage = $('#pagingR li.active').text();			        		
        					        		
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
        					roomType("edit",new_name,rm_type_code,nowPage);			        					
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
	$('button[name=deleteR]').click(function(){
		var rm_type_code = $(this).parent().prev().prev().html();
		var nowPage = $('#pagingR li.active').text();
		
		var dialog = $('<div/>').attr('title',"옵션 삭제").append($('<p/>').html('정말 삭제하시겠습니까?')).dialog({
			position:{my:"center top", at:"center top", of:window},				
			resizable:false,
			height:"auto",
			width:400,
			modal: true,
			buttons:{
				"확인":function(){					
					roomType("delete",null,rm_type_code,nowPage);
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
	
	$('#pagingR li').click(function(){
		var nowPage = $(this).text();
		
		if(nowPage.trim() == "»"){
			nowPage = parseInt($(this).prev().text())+1;
		}
		else if(nowPage.trim() == "«"){
			nowPage = parseInt($(this).next().text())-1;			
		}
		roomType(null,null,null,nowPage,1)		
	});
	
	/* 
	 * 매물 옵션 
	*/
	//매물 옵션 등록
	$('button[name=registerRO]').click(function(){		
		if($('#room_option_name').val() == ""){
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
					rOption("regit",$('#room_option_name').val(),null,1);
					customAlert("success","등록이 완료되었습니다.");
					$('#room_option_name').val("");
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
	
	//매물 옵션 Ajax
	function rOption(mode,name,code,nowPage){
		$.ajax({
			type:'POST',
			url:'roomOption.admin',
			data:
			{
				mode:mode,
				name:name,
				code:code,
				nowPage:nowPage
			},
			dataType:'text',
			success:function(data){				
				var jsonData = JSON.parse(data);
				var pagingText = jsonData.pagingText;
				var totalRecordCount = jsonData.totalRecordCount;
				var nowPage = jsonData.nowPage;
				var pageSize = jsonData.pageSize;				
				var obj = jsonData.list;
				
				$('#roomOption').html("");
          		
				for(var i=0; i<obj.length; i++){					
					$('#roomOption').append($('<tr/>')
							.append($('<th/>').attr('scope','row').html(totalRecordCount-(((nowPage - 1) * pageSize) + i)))
							.append($('<td/>').html(obj[i].option_code))
							.append($('<td/>').html(obj[i].name))
							.append($('<td/>')
									.append($('<button/>').attr('type','button').addClass("btn btn-outline-success btn-sm").attr('name','editRO').attr('style','margin-right:5px;')
											.append($('<i/>').addClass("fa fa-edit")).append("&nbsp;Edit"))									
									.append($('<button/>').attr('type','button').addClass("btn btn-outline-danger btn-sm").attr('name','deleteRO')
											.append($('<i/>').addClass("fa fa-times")).append("&nbsp;Delete"))
							)
					);
				}
				$('#pagingRO').html(pagingText);
				$('#pagingRO li').click(function(){
					var nowPage = $(this).text();
					
					if(nowPage.trim() == "»"){
						nowPage = parseInt($(this).prev().text())+1;
					}
					else if(nowPage.trim() == "«"){
						nowPage = parseInt($(this).next().text())-1;			
					}
					rOption(null,null,null,nowPage,1)		
				});
				
				//Edit버튼
				$('button[name=editRO]').click(function(){
					var button = $(this);
					button.prop("disabled", true);					
			    	var edit = $(this).parent().prev();
			    	var option_name = edit.text();
			    	var input = $('<input/>').addClass('form-control').attr({type:'text',style:'width:150px;padding:0;display:inline'}).val(option_name)
			    	.keypress(function (e){
			        	if(e.which == 13){
			        		var new_name = $(this).val();
			        		var code = $(this).parent().prev().html();
			        		var nowPage = $('#pagingRO li.active').text();			        		
			        					        		
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
			        					rOption("edit",new_name,code,nowPage);			        					
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
				$('button[name=deleteRO]').click(function(){
					var code = $(this).parent().prev().prev().html();
					var nowPage = $('#pagingRO li.active').text();
					
					var dialog = $('<div/>').attr('title',"옵션 삭제").append($('<p/>').html('정말 삭제하시겠습니까?')).dialog({
						position:{my:"center top", at:"center top", of:window},				
						resizable:false,
						height:"auto",
						width:400,
						modal: true,
						buttons:{
							"확인":function(){					
								rOption("delete",null,code,nowPage);
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
	
	//Edit버튼
	$('button[name=editRO]').click(function(){
		var button = $(this);
		button.prop("disabled", true);					
    	var edit = $(this).parent().prev();
    	var option_name = edit.text();
    	var input = $('<input/>').addClass('form-control').attr({type:'text',style:'width:150px;padding:0;display:inline'}).val(option_name)
    	.keypress(function (e){
        	if(e.which == 13){
        		var new_name = $(this).val();
        		var code = $(this).parent().prev().html();
        		var nowPage = $('#pagingRO li.active').text();			        		
        					        		
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
        					rOption("edit",new_name,code,nowPage);			        					
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
	$('button[name=deleteRO]').click(function(){
		var code = $(this).parent().prev().prev().html();
		var nowPage = $('#pagingRO li.active').text();
		
		var dialog = $('<div/>').attr('title',"옵션 삭제").append($('<p/>').html('정말 삭제하시겠습니까?')).dialog({
			position:{my:"center top", at:"center top", of:window},				
			resizable:false,
			height:"auto",
			width:400,
			modal: true,
			buttons:{
				"확인":function(){					
					rOption("delete",null,code,nowPage);
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
	
	$('#pagingRO li').click(function(){
		var nowPage = $(this).text();
		
		if(nowPage.trim() == "»"){
			nowPage = parseInt($(this).prev().text())+1;
		}
		else if(nowPage.trim() == "«"){
			nowPage = parseInt($(this).next().text())-1;			
		}
		rOption(null,null,null,nowPage,1)		
	});
	
	//href='#' Jquery 링크 동작 방지 이벤트 무시
	$(document).on('click', 'a[href="#"]', function(e){
	    e.preventDefault();
	});
	
	$('ol li').click(function(){
		var sBOption = $('#Boption').offset().top-120;
		var sRoomType = $('#roomType').offset().top-120;
		var sRoomOption = $('#roomOption').offset().top-120;
		
		switch($(this).index()){
			case 0:
				$('html, body').animate( { scrollTop : sBOption }, 400 );
				break;
			case 1:
				$('html, body').animate( { scrollTop : sRoomType }, 400 );
				break;
			case 2:
				$('html, body').animate( { scrollTop : sRoomOption }, 400 );
				break;		
		}		
		
	});	
		
})(jQuery);