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


		$('.agreebutton').click(function(e) {
			if(e.currentTarget.id == "allbutton"){
				if ($(this).css('backgroundColor') == 'rgb(193, 191, 191)') {
					$('.agreebutton').css({
						'backgroundColor' : '#c91f3b',
						'color' : 'white'
					});
				} else {
					$('.agreebutton').css({
						'backgroundColor' : 'rgb(193, 191, 191)',
						'color' : '#969595'
					});
				}
			}
			else{
				if ($(this).css('backgroundColor') == 'rgb(193, 191, 191)') {
					$(this).css({
						'backgroundColor' : '#c91f3b',
						'color' : 'white'
					});
				} else {
					$(this).css({
						'backgroundColor' : 'rgb(193, 191, 191)',
						'color' : '#969595'
					});
				}
				console.log();
				/* if($(this).checked().length() != 7)
						$('#allbutton').css({'backgroundColor':'rgb(193, 191, 191)','color':'#969595'});
				else
					$('#allbutton').css({'backgroundColor':'#c91f3b','color':'white'}); */
			}
		});