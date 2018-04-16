(function($){
	
$('.tdtd').click(function(){
		
		var memberIdx = $(this).parent().parent().find('td:eq(0)').html();
		var memberEmail = $(this).parent().parent().find('td:eq(1)').html();
		var memberName = $(this).parent().parent().find('td:eq(2)').html();
		var memberPhone = $(this).parent().parent().find('td:eq(3)').html();
		var memberOffice_phone = $(this).parent().parent().find('td:eq(4)').html();
		var memberPath_type = $(this).parent().parent().find('td:eq(5)').html();
		var memberPath_code = $(this).parent().parent().find('td:eq(6)').html();
		var memberJoin_date = $(this).parent().parent().find('td:eq(7)').html();
		var memberJob = $(this).parent().parent().find('td:eq(8)').html();
		var memberPermit_no = $(this).parent().parent().find('td:eq(9)').html();
		var memberRepresent = $(this).parent().parent().find('td:eq(10)').html();
		var memberAddress = $(this).parent().parent().find('td:eq(11)').html();
		var memberProfile_photo = $(this).parent().parent().find('td:eq(12)').html();
		$.ajax({
    		type : 'POST',
    		url : 'membership.admin?mode=detail&office_no='+memberIdx,
    		data :{
    			mode : 'detail',
    			office_no : memberIdx
    		},
    		dataType : 'text',
    		/*contentType: false,
    		processData: false,*/
    		success : function(date){
    			var member = JSON.parse(date);
    			$('.modal-office_no').html(member.office_no);
    			$('.modal-email').html(member.email);
    			$('.modal-name').html(member.name);
    			$('.modal-phone').html(member.phone);
    			$('.modal-path_type').html(member.path_type);
    			$('.modal-path_code').html(member.path_code);
    			$('.modal-join_date').html(member.join_date);
    			$('.modal-job').html(member.job);
    			$('.modal-office_phone').html(member.office_phone);
    			$('.modal-permit_no').html(member.permit_no);
    			$('.modal-represent').html(member.represent);
    			$('.modal-address').html(member.address);
    			$('div.modal-profile_photo').css({'background-image':'url("/CBangProj/ProfileUpload/'+member.profile_photo+'")',
    											'background-size':'cover'});
    			$('button.btn-rock').click(function(){
    				var rockConfirm = confirm('휴먼계정으로 설정하시겠습니까?'); 
    	    		if(rockConfirm){
    	    			$.ajax({
    	    				type : 'POST',
    	    	    		url : 'membership.admin?mode=rock&name='+member.name+'&office_no='+member.office_no,
    	    	    		data :{
    	    	    			mode : 'rock',
    	    	    			name : member.name,
    	    	    			office_no : member.office_no
    	    	    		},
    	    	    		dataType : 'text',
    	    	    		contentType: false,
    	    	    		/*processData: false,*/
    	    	    		success : function(data){
    	    	    			var rock = JSON.parse(date);
    	    	    			alert(data.name+'님이 휴먼계정으로 잠금되었습니다.');
    	    	    		},
    	    	    		error : function(){}
    	    			});
    	    		}
    	    	});
    		},
    		error : function(request, status, error) {
    			console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
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
    		privilege(null,null,null,nowPage);		
    	});
        
      //관리자 권한  Ajax
    	function privilege(mode,privilege_info,privilege_code,nowPage){
    		var form = $('<form/>');
    	    form.attr('action', 'membership.admin');
    	    form.attr('method', 'post');
    	    form.appendTo('body');
    	    
    	    var iNowPage = $('<input type="hidden" value='+nowPage+' name="nowPage">');	     
    	 
    	    form.append(iNowPage);
    	    form.submit();
    	}
        
	})(jQuery);