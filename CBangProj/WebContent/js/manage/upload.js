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
			$('#s'+area).html((parseInt($(this).val())*3.3058).toFixed(1));
		}
		else{
			$('#s'+area).html("0.0");
		}
	});	
	
	//전세추가
	$('#addCharter').click(function(){
		$(this).attr('disabled',"disabled");
		
		var wrap = $('<div/>');
		var div = $('<div/>').addClass('transaction-item');
		var span1 = $('<span/>').addClass('tag').html("전세");
		var price = $('<input/>').addClass('form-control').attr({type:'number',min:0,placeholder:'전세',id:'deposit1'});
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
	var count=0;
	$('#addMonth').click(function(){
		//$(this).attr('disabled',"disabled");
		count++;
		var wrap = $('<div/>');
		var div = $('<div/>').addClass('transaction-item');
		var span1 = $('<span/>').addClass('tag').html("월세");
		var price1 = $('<input/>').addClass('form-control').attr({type:'number',placeholder:'보증금',min:0,id:"deposit2"+count});
		var span2 = $('<span/>').addClass('slush').html("/");
		var price2 = $('<input/>').addClass('form-control').attr({type:'number',placeholder:'월세',min:0,id:"month_price"+count});
		var span3 = $('<span/>').html("만원");
		var span4 = $('<span/>').addClass('discription').html("(예 월세 1000만원 / 50만원)");
		var icon = $('<i/>').addClass("fas fa-window-close icon-delete").attr('style',"color:black");
		icon.click(function(){
			//$('#addMonth').prop('disabled',false);
			$(this).parent().parent().remove();
		});
		
		$('#addition').append($(wrap).append($(div).append(span1).append(price1).append(span2).append(price2).append(span3).append(span4).append(icon)));
	});	
		
	/*$('input[type="checkbox"]').click(function(){
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
	});*/
	//관리비
	$('input[type="checkbox"][name=common_charge_ch]').click(function(){
		$('input[type="checkbox"][name="common_charge_ch"]').prop('checked',false);
		$(this).prop('checked',true);
		if($(this).next().html()=="있음"){
			$('input[type="text"][name="common_charge"]').removeAttr('readonly');
		}
		else{
			$('input[type="text"][name="common_charge"]').attr('readonly','readonly').val("");
		}		
	});
	//주차비
	$('input[type="checkbox"][name=parking]').click(function(){
		$('input[type="checkbox"][name="parking"]').prop('checked',false);
		$(this).prop('checked',true);
		if($(this).next().html()=="가능"){
			$('input[type="text"][name="parking_charge"]').removeAttr('readonly');
		}
		else{
			$('input[type="text"][name="parking_charge"]').attr('readonly','readonly').val("");
		}	
	});
	//입주일(즉시 입주,날짜 협의 선택시)
	$('input[type="checkbox"][name=move_date_ch]').click(function(){
		$('input[type="checkbox"][name="move_date_ch"]').prop('checked',false);
		$(this).prop('checked',true);
		$('input[type="text"][name="move_date"]').val($(this).next().html());	
	});
	//엘리베이터
	$('input[type="checkbox"][name=elevator]').click(function(){
		$('input[type="checkbox"][name=elevator]').prop('checked',false);
		$(this).prop('checked',true);				
	});
	//펫
	$('input[type="checkbox"][name=pat]').click(function(){
		$('input[type="checkbox"][name=pat]').prop('checked',false);
		$(this).prop('checked',true);				
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
					if(rotation == 360) rotation = 0;
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
		sel_files.splice($('#'+id).index(), 1);		
		console.log(sel_files);
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
	
	//사진 순서 변경	및 사진 배열 순서 변경
	var start_index;
	var photo_temp;
	$('#sortable').sortable({
		items: ".photo-elem",
		revert: true,
		update: function(event, ui){
			var element_id = ui.item.attr('id');
			var new_position = $(this).sortable('toArray');			
			if(start_index < ui.item.index()-1){
				sel_files.splice(ui.item.index(), 0, photo_temp);
				sel_files.splice(start_index, 1);																				
			}
			else{
				sel_files.splice(ui.item.index()-1, 0, photo_temp);
				sel_files.splice(start_index+1, 1);
			}
			$('.photo-title').remove();			
			$('#'+new_position[0]).append($('<div/>').addClass('photo-title').html('대표사진'));
			console.log(sel_files);
		},
		start: function(event, ui) {
			start_index = ui.item.index()-1;			
			photo_temp = sel_files[start_index];					
	    }
	});
	$("#sortable").disableSelection();
			
	/* 방올리기 버튼 클릭시 유효성 검사 */
	$('#submit').click(function(){
		var roadAddress = $('#roadAddress').val();
		var jibunAddress = $('#jibunAddress').val();
		var sido = $('#sido').val();
		var sigungu = $('#sigungu').val();
		var bname = $('#bname').val();
		var bname1 = $('#bname1').val();
		var detail_addr = $('#addr2').val();
		var lat = $('#lat').val();
		var lng = $('#lng').val();
		var room_type = $('#room_type').val();
		var deposit1 = $('#deposit1').val();
		var deposit2 = [];
		var month_price = [];
		for(var i=0; i<$('[id^=deposit2').length; i++){
			deposit2.push($('[id^=deposit2').eq(i).val());
			month_price.push($('[id^=month_price').eq(i).val());
		}
		
		var short_term = $('#short_term').is(":checked")?"Y":"N";
		var total_floor = $('#total_floor').val();
		var floor = $('#floor').val();
		var total_area = $('#total_area').val();
		var area = $('#area').val();
		var common_charge = $('#common_charge_ch').is(":checked")?$('#common_charge').val():"-";
		var charge_list="";	
		$('input:checkbox[name=chkList1]').each(function(){
			if($(this).is(':checked')){
				if(charge_list==""){
					charge_list = $(this).val();
				}
				else{
					charge_list += ", "+($(this).val());				
				}		
			}
		});
		var parking_charge = $('input:text[name=parking_charge]').val()==""?"불가능":$('input:text[name=parking_charge]').val();
		var heating = $('#heating').val();
		var elevator = $('input:checkbox[name=elevator]:checked').val();
		var pat = $('input:checkbox[name=pat]:checked').val();
		var move_date = $('#move_date').val();
		var room_option="";
		$('input:checkbox[name=chkList2]').each(function(){
			if($(this).is(':checked')){
				if(room_option==""){
					room_option = $(this).val();
				}
				else{
					room_option += ","+($(this).val());				
				}
			}
		});
		var title = $('input:text[name=title]').val();
		var content = $('textarea[name=content]:visible').val();
		var memo = $('textarea[name=memo]:visible').val();
				
		console.log("roadAddress:"+roadAddress);
		console.log("jibunAddress:"+jibunAddress);
		console.log("sido:"+sido);
		console.log("sigungu:"+sigungu);
		console.log("bname:"+bname);
		console.log("bname1:"+bname1);
		console.log("detail_addr"+detail_addr);
		console.log("lat:"+lat);
		console.log("lng:"+lng);
		console.log("room_type:"+room_type);
		console.log("deposit1:"+deposit1);
		console.log("short_term:"+short_term);
		console.log("total_floor:"+total_floor);
		console.log("floor:"+floor);
		console.log("total_area:"+total_area);
		console.log("area:"+area);
		console.log("common_charge:"+common_charge);
		console.log("charge_list:"+charge_list);
		console.log("parking_charge:"+parking_charge);
		console.log("heating:"+heating);
		console.log("elevator:"+elevator);
		console.log("pat:"+pat);
		console.log("move_date:"+move_date);
		console.log("room_option:"+room_option);
		console.log("title:"+title);
		console.log("content:"+content);
		console.log("memo:"+memo);
		console.log(sel_files);
		console.log("deposit2:"+deposit2);
		console.log("month_price:"+month_price);	
		
		/*if(roadAddress=="" && jibunAddress==""){
			customAlert("error", "주소를 입력하세요.");
			return;
		}
		else if(detail_addr==""){
			customAlert("error", "상세 주소를 입력하세요.");
			return;		
		}
		else if(room_type==""){
			customAlert("error", "방 종류를 선택해 주세요.");
			return;
		}
		else if((deposit1=="" || deposit1 == undefined) && month_price.indexOf("")==0){
			customAlert("error", "가격 정보를 입력하세요.");
			return;			
		}
		else if(total_floor==""){
			customAlert("error", "건물 층수를 선택해주세요.");
			return;
		}
		else if(floor==""){
			customAlert("error", "해당 층수를 선택해주세요.");
			return;
		}
		else if(total_area==""){
			customAlert("error", "공급 면적을 입력하세요.");
			return;
		}
		else if(area==""){
			customAlert("error", "전용 면적을 입력하세요.");
			return;
		}
		else if(heating==""){
			customAlert("error", "난장종류를 선택해주세요.");
			return;
		}
		else if(move_date==""){
			customAlert("error", "입주가능일을 입력하세요.");
			return;
		}
		else if(title==""){
			customAlert("error", "제목을 입력하세요.");
			return;
		}
		else if(title==""){
			customAlert("error", "제목을 입력하세요.");
			return;
		}
		else if(content==""){
			customAlert("error", "상세 설명을 입력하세요.");
			return;
		}
		else if(sel_files.length==0){
			customAlert("error", "사진을 등록하세요.");
			return;
		}*/		
		
		var formData = new FormData();
		formData.append("roadAddress",roadAddress);
		formData.append("jibunAddress",jibunAddress);
		formData.append("sido",sido);
		formData.append("sigungu",sigungu);
		formData.append("bname",bname);
		formData.append("bname1",bname1);
		formData.append("detail_addr",detail_addr);
		formData.append("lat",lat);
		formData.append("lng",lng);
		formData.append("deposit1",deposit1);
		formData.append("deposit2",deposit2);
		formData.append("month_price",month_price);
		formData.append("short_term",short_term);
		formData.append("total_floor",total_floor);
		formData.append("floor",floor);
		formData.append("total_area",total_area);
		formData.append("area",area);
		formData.append("common_charge",common_charge);
		formData.append("charge_list",charge_list);
		formData.append("parking_charge",parking_charge);
		formData.append("heating",heating);
		formData.append("elevator",elevator);
		formData.append("pat",pat);
		formData.append("move_date",move_date);
		formData.append("room_option",room_option);
		formData.append("title",title);
		formData.append("content",content);
		formData.append("memo",memo);
				
		console.log(sel_files.length);
		
		for(var i=0; i<sel_files.length;i++){
			console.log(sel_files[i]);
			formData.append("photo", sel_files[i], sel_files[i].name)			
		}		
		
		submitAction(formData);
								
	});
	
	/* 유효성 검사가 끝나면 데이터 전송 */
	function submitAction(formData){
		$.ajax({
			type:'post',
			url:'/CBangProj/Manage/RegisterRoom.do',
			data : formData,
			enctype: 'multipart/form-data',
			processData: false, //data 지정한 개체를 쿼리 문자열로 변환할지 여부를 설정(post방식:false)	
			contentType: false, //서버에 데이터를 보낼 때 사용(header 정보에 포함)
			dataType: 'text',
			success:function(data){
				alert("데이터 전송 성공!!"+data);
			},
			error:function(){
				alert("전송 오류 발생");
			}
		});
	}		
});