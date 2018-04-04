function showHide(index){
			if($('textarea:eq(' + index + ')').css('display') != 'none'){
				$('.details:eq(' + index + ') span').removeClass('glyphicon-menu-down');
				$('.details:eq(' + index + ') span').addClass('glyphicon-menu-up');
				//$('textarea:eq(1) span').attr('class','glyphicon glyphicon-menu-up');
				$('textarea:eq(' + index + ')').hide();
				
			}
			else {
				$('.details:eq(' + index + ') span').removeClass('glyphicon-menu-up');
				$('.details:eq(' + index + ') span').addClass('glyphicon-menu-down');
				$('textarea:eq(' + index + ')').show();
			}
		}		

		$('.details:eq(0)').click(function(){ showHide(0); });
		$('.details:eq(1)').click(function(){ showHide(1); });
		$('.details:eq(2)').click(function(){ showHide(2); });
		$('.details:eq(3)').click(function(){ showHide(3); });
		$('.details:eq(4)').click(function(){ showHide(4); });
		$('.details:eq(5)').click(function(){ showHide(5); });
		
		var btnAll = $('.agreebutton-all');
		var btnAgree = $('.agreebutton');
		var btnChoice = $('.agreebutton-choice');
		
		btnAll.click(function() {
			$(this).toggleClass('active');
			if($(this).hasClass('active')){
				btnAgree.addClass('active');
				btnChoice.addClass('active');
			}
			else{
				btnAgree.removeClass('active');
				btnChoice.removeClass('active');
			}
		});
		
		btnAgree.click(function() {
			$(this).toggleClass('active');
			if($('.agreebutton.active').length == 6){
				btnAll.addClass('active');
			}
			else
				btnAll.removeClass('active');
		});
		
		btnChoice.click(function(){
			$(this).toggleClass('active');
		});
		
		$('.buttonCancel').click(function(){
			var cancel_confirm = confirm('회원가입을 취소하시겠습니까?');
			if(cancel_confirm){
				location.href='/CBangProj/frontend/search/map.jsp';			
			}
				
		});
		
		$('.buttonNext').click(function(){
			if(btnAll.hasClass('active') && 
					btnAgree.hasClass('active')){
				location.href = '/CBangProj/ACCOUNT/PLoginTerms.do';
			}
			else
				customAlert("error", "모든 필수 약관을 동의해주세요.");
		});