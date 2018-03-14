$(function() {	
	//달력
	$('#move_date').datepicker({		
		closeText : '닫기',
	    prevText : '이전달',
	    nextText : '다음달',
	    currentText : '오늘',
		monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	    dayNames : ["일", "월", "화", "수", "목", "금", "토"],
	    dayNamesShort:["일", "월", "화", "수", "목", "금", "토"],
	    dayNamesMin : ["일", "월", "화", "수", "목", "금", "토"],	    
	    dateFormat : 'yy-mm-dd',
	    minDate: 0,
	    showMonthAfterYear : true,
	    yearSuffix : '년',
	    showButtonPanel: true
	});
	$('#calendar').click(function(){		
		$('#move_date').datepicker("show");	
	});	
	
	//평수 -> 면적 계산
	$('input[name$=area]').on("input",function(){				
		var area = $(this).attr('name');
		if($(this).val()!=""){
			$('#'+area).html((parseInt($(this).val())*3.3058).toFixed(1));
		}
		else{
			$('#'+area).html("0.0");
		}
	});	
	
	//전세추가
	$('#addCharter').click(function(){
		$(this).attr('disabled',"disabled");
		
		var wrap = $('<div/>');
		var div = $('<div/>').addClass('transaction-item');
		var span1 = $('<span/>').addClass('tag').html("전세");
		var price = $('<input/>').addClass('form-control').attr({type:'number',placeholder:'전세'});
		var span2 = $('<span/>').html("만원");
		var span3 = $('<span/>').addClass('discription').html("(예 전세 2,000 만원)");
		var icon = $('<i/>').addClass("fas fa-window-close icon-delete").attr({style:"color:black",id:"delCharter"});
		icon.click(function(){
			$('#addCharter').prop('disabled',false);
			$(this).parent().parent().remove();
		});
		
		$('#addition').append($(wrap).append($(div).append(span1).append(price).append(span2).append(span3).append(icon)));						
	});
	
	//월세추가
	$('#addMonth').click(function(){
		//$(this).attr('disabled',"disabled");
		
		var wrap = $('<div/>');		
		var div = $('<div/>').addClass('transaction-item');
		var span1 = $('<span/>').addClass('tag').html("월세");
		var price1 = $('<input/>').addClass('form-control').attr({type:'number',placeholder:'보증금'});
		var span2 = $('<span/>').addClass('slush').html("/");
		var price2 = $('<input/>').addClass('form-control').attr({type:'number',placeholder:'월세'});
		var span3 = $('<span/>').html("만원");
		var span4 = $('<span/>').addClass('discription').html("(예 월세 1000만원 / 50만원)");
		var icon = $('<i/>').addClass("fas fa-window-close icon-delete").attr('style',"color:black");
		icon.click(function(){
			//$('#addMonth').prop('disabled',false);
			$(this).parent().parent().remove();
		});
		
		$('#addition').append($(wrap).append($(div).append(span1).append(price1).append(span2).append(price2).append(span3).append(span4).append(icon)));
	});	
	
	
	$('input[type="checkbox"]').click(function(){
		var name = $(this).attr('name');
		
		//옵션 선택이 아닐시
		if(name.indexOf("chkList")==-1 && name.indexOf("short")==-1){
			$('input[type="checkbox"][name="'+name+'"]').prop('checked',false);
			$(this).prop('checked',true);
						
			switch(name){			
				case "common_charge_ch"://관리비
					if($(this).next().html()=="있음"){
						$('input[type="text"][name="common_charge"]').removeAttr('readonly');
					}
					else{
						$('input[type="text"][name="common_charge"]').attr('readonly','readonly').val("");
					}				
					break;			
				case "parking"://주차비
					if($(this).next().html()=="가능"){
						$('input[type="text"][name="parking_charge"]').removeAttr('readonly');
					}
					else{
						$('input[type="text"][name="parking_charge"]').attr('readonly','readonly').val("");
					}
					break;
				case "move_date_ch"://입주일(즉시 입주,날짜 협의 선택시)
					$('input[type="text"][name="move_date"]').val($(this).next().html());
					break;
			}
		}
	});
	
	//해당 층수를 건물 층수보다 높게 선택못하도록 방지
	$('select[name=floor]').change(function(){
		var total_floor = $('select[name=total_floor]').val();
		var floor = $(this).val();
		
		if(parseInt(floor) > parseInt(total_floor)){
			$(this).val('');
			customAlert("error","해당 층수는 건물 층수보다 클 수 없습니다.");
		}		
	});
	
	//입주일(날짜 선택시)
	$('#move_date').change(function(){
		var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;		
		if(pattern.test($(this).val())){			
			$('input[type="checkbox"][name="move_date_ch"]').prop('checked',false);
		}
	});	
	//숫자만 입력하도록 체크
	$('input[type="text"][name$=charge]').on("input",function(){
		var pattern = /[^0-9]/g;	
		if(pattern.test($(this).val())){
			customAlert("error","숫자만 입력해 주세요.");
			$(this).val("");
		}
	});
	//상세설명 글자수
	//제목]
	$('.detail-wrap input').on('input',function(){		
		$(this).next().children().eq(0).html($(this).val().length);		
	});
	//내용]
	$('.detail-wrap textarea:eq(0)').on('input',function(){		
		$(this).next().children().eq(0).html($(this).val().length);		
	});
	
	//사진 업로드
	$('.photo-wrap button').click(function(){
		$('.photo-wrap button').removeClass('active');
		$(this).addClass('active');
		
		if($(this).parent().attr('class')=="general"){
			$('.photo-guide-wrap').removeClass('hidden');
			$('.pano-wrap').addClass('hidden');			
		}
		else{
			$('.pano-wrap').removeClass('hidden');
			$('.photo-guide-wrap').addClass('hidden');
		}		
	});
	//일반 사진 등록 버튼으로 업로드 실행
	$('#fileupload-btn').click(function(){
		$('#photo').click();						
	});
	//사진 썸네일
	var sel_files = [];
	var index = 0;
	var photo_count = 0;
	$('#photo').change(function(e){
		$('#files').children().first().removeClass('discription').addClass('upload-btn-wrap');
		$('#files p').addClass('hidden');
		$('#photo_container').addClass('hidden');
		$('#fileupload-btn').removeClass().addClass('btn-upload');
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){				
				if(photo_count >= 15 ){
					sel_files.splice(15,sel_files.length-15);			
					return customAlert("error","사진은 15장을 초과할 수 없습니다.");
				}				
				
				var photo_elem = $('<div/>').addClass('photo-elem').attr('id',index);
				if(index==0) var title = $('<div/>').addClass('photo-title').html('대표사진');
				var close = $('<div/>').addClass('close').click(function(){
					var id = $(this).parent().attr('id');					
					var dialog = $('<div/>').attr('title',"사진 삭제").append($('<p/>').html('삭제하시겠습니까?')).dialog({
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
					
				var progress = $('<div/>').addClass('progress').attr('style','display:none;width:154px;');
				var rotation = 0;
				var rotate = $('<div/>').addClass('rotate').click(function(){
					rotation += 90;					
					$(this).next().css({'-webkit-transform' : 'rotate('+ rotation +'deg)',
		                 			    '-moz-transform' : 'rotate('+ rotation +'deg)',
		                 			    '-ms-transform' : 'rotate('+ rotation +'deg)',
		                 			    'transform' : 'rotate('+ rotation +'deg)'});															
				});
				var icon = $('<i/>').addClass('fas fa-redo-alt cbang-icon');
				var photo = $('<div/>').addClass('photo').attr('style','background-image:url('+e.target.result+')');
				
				$('#fileupload-btn').before(photo_elem.append(title).append(close).append(progress).append(rotate.append(icon)).append(photo));
				index++;
				photo_count++;
			}
			reader.readAsDataURL(f);
		});		
		
	});
	//아이디를 받아서 삭제처리 및 체크
	var deleteId = function(id){
		if($('.photo-elem:first').attr('id')==id){			
			$('.photo-elem:first').next().append($('<div/>').addClass('photo-title').html('대표사진'));			
		}
		$('#'+id).remove();
		sel_files.splice(id, 1);		
		photo_count--;
		//사진을 모두 삭제했을 때 원래모양으로 복귀
		if($('.photo-elem').length==0){
			index = 0;
			$('.photo-title').remove();
			$('#files').children().first().removeClass('upload-btn-wrap').addClass('discription');
			$('#files p').removeClass('hidden');
			$('#photo_container').removeClass('hidden');
			$('#fileupload-btn').removeClass().addClass('btn btn-blue btn-md');			
		}		
	};
	
	//사진 순서 변경
	$('#sortable').sortable({
		items: ".photo-elem",
		revert: true,
		update: function(event, ui){
			var element_id = ui.item.attr('id');
			var new_position = $(this).sortable('toArray');			
			
			$('.photo-title').remove();
			$('#'+new_position[0]).append($('<div/>').addClass('photo-title').html('대표사진'));			
		}
	});	
	$("#sortable").disableSelection();
});