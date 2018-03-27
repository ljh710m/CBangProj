(function($){
        $('.viewModal').click(function(){
        	var memberIdx = $(this).parent().parent().find('td:eq(0)').html();
        	var memberEmail = $(this).parent().parent().find('td:eq(1)').html();
        	var memberName = $(this).parent().parent().find('td:eq(2)').html();
        	var memberPhone = $(this).parent().parent().find('td:eq(3)').html();
        	var memberPath_type = $(this).parent().parent().find('td:eq(4)').html();
        	var memberPath_code = $(this).parent().parent().find('td:eq(5)').html();
        	var memberJoin_date = $(this).parent().parent().find('td:eq(6)').html();
        	var memberJob = $(this).parent().parent().find('td:eq(7)').html();
			var memberOffice_phone = $(this).parent().parent().find('td:eq(8)').html();
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
            });
	})(jQuery);