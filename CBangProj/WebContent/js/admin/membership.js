(function($){
        $('.tdtd').click(function(){
        	console.log('gd');
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
				$('.modal-office_no').html(memberIdx);
				$('.modal-email').html(memberEmail);
				$('.modal-name').html(memberName);
				$('.modal-phone').html(memberPhone);
				$('.modal-path_type').html(memberPath_type);
				$('.modal-path_code').html(memberPath_code);
				$('.modal-join_date').html(memberJoin_date);
				$('.modal-job').html(memberJob);
				$('.modal-office_phone').html(memberOffice_phone);
				$('.modal-permit_no').html(memberPermit_no);
				$('.modal-represent').html(memberRepresent);
				$('.modal-address').html(memberAddress);
				console.log(memberIdx);
				console.log(memberEmail);
				console.log(memberName);
				console.log(memberPhone);
				console.log(memberPath_type);
				console.log(memberPath_code);
				console.log(memberJoin_date);
				console.log(memberJob);
				console.log(memberOffice_phone);
				console.log(memberPermit_no);
				console.log(memberRepresent);
				console.log(memberAddress);
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