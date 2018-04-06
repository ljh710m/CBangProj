$(function() {
	//검색메뉴 드랍다운 효과
	var title;
	$('.title').click(function(){
		$('.title').removeClass('active');
		$('.content').addClass('hidden');
		$('.title > i').removeClass('fa-caret-up').addClass('fa-caret-down');		
		
		if(title != this.title){
			//해당 클릭한 제목의 내용 드랍다운
			$(this).addClass('active');
			$(this).children('i').removeClass('fa-caret-down').addClass('fa-caret-up');
			$(this).next().removeClass('hidden');
			//title을 클릭한 제목으로 다시 설정
			title = this.title;			
		}
		else{//title과 같은 제목 클릭시			
			title='';
		}		
	});	
	/*
	$('html').click(function(e) {
		if(!$(e.target).hasClass('title')) {
			console.log("dd");
			$('.title').removeClass('active');
			$('.content').addClass('hidden');
			$('.title > i').removeClass('fa-caret-up').addClass('fa-caret-down');			 
		} 
	});
	*/
	//체크박스 -> 라디오 버튼
	$('input[name^="check"]').click(function(){
		switch($(this).attr('name')){
			case "check1"://매물종류
				$('input[name="check1"]').prop('checked',false);
				$(this).prop('checked',true);
				break;
			case "check2"://거래종류
				$('input[name="check2"]').prop('checked',false);
				$(this).prop('checked',true);
				break;
			case "check3"://방 종류				
				if($('input[name="check3"]:eq(0)').val() !=  $(this).val()){					
					$('input[name="check3"]:eq(0)').prop('checked',false);
					$('[title="방 종류"] > h2 > span > span:eq(1)').html($('input[name="check3"]:checked').length).removeClass('hidden').addClass('badge');					
				}
				else{
					$('input[name="check3"]').prop('checked',false);
					$(this).prop('checked',true);
					$('[title="방 종류"] > h2 > span > span:eq(1)').html("").removeClass('badge').addClass('hidden');
				}
				if($('input[name="check3"]:checked').length==6 || $('input[name="check3"]:checked').length==0){
					$('input[name="check3"]').prop('checked',false);
					$('input[name="check3"]:eq(0)').prop('checked',true);
					$('[title="방 종류"] > h2 > span > span:eq(1)').html("").removeClass('badge').addClass('hidden');
				}
				break;
		}		
	});	
	
	//보증금,전세,월세
	$('.price-item').click(function(){		
		var item = $(this).parent().attr('id');
		
		$(this).parent().children('li').removeClass('active');
		$(this).addClass('active');
		
		var price;
		if($(this).children().html()=="무제한"){
			price = 999999;
		}
		else{
			price = $(this).children().html().replace(",", "").replace(" 만원", "");
		}

		switch(item){
			case "deposit_from":
				$('.input1:eq(0)').val(price);
				$('#deposit__from').html(price+" 만원");			
				break;
			case "deposit_to":
				$('.input2:eq(0)').val(price);
				$('#deposit__to').html(price+" 만원");
				break;
			case "month_from":
				$('.input1:eq(1)').val(price);
				$('#month__from').html(price+" 만원");
				break;
			case "month_to":
				$('.input2:eq(1)').val(price);
				$('#month__to').html(price+" 만원");
				break;
		}
				
		if(parseInt($('.input1:eq(0)').val()) > parseInt($('.input2:eq(0)').val())){
			var price_to = $(this).parent().parent().next().children().children(':eq('+$(this).index()+')');
			var price_from = $(this).parent().parent().prev().children().children(':eq('+$(this).index()+')');
			price_from.parent().children('li').removeClass('active');
			price_from.addClass('active');
			price_to.parent().children('li').removeClass('active');
			price_to.addClass('active');
			$('.input1:eq(0)').val(price);
			$('.input2:eq(0)').val(price);
			$('#deposit__from').html(price+" 만원");
			$('#deposit__to').html(price+" 만원");
		}
		
		if(parseInt($('.input1:eq(1)').val()) > parseInt($('.input2:eq(1)').val())){
			var price_to = $(this).parent().parent().next().children().children(':eq('+$(this).index()+')');
			var price_from = $(this).parent().parent().prev().children().children(':eq('+$(this).index()+')');
			price_from.parent().children('li').removeClass('active');
			price_from.addClass('active');
			price_to.parent().children('li').removeClass('active');
			price_to.addClass('active');
			$('.input1:eq(1)').val(price);
			$('.input2:eq(1)').val(price);
			$('#month__from').html(price+" 만원");
			$('#month__to').html(price+" 만원");
		}
		
	});
	
	$('input[type=number]').on("change",function() {
		var price = $(this).val();
		if(price < 0){
			price = 0;
			$(this).val(0);			
		}
		if(parseInt($('.input1:eq(0)').val()) > parseInt($('.input2:eq(0)').val())){
			$('.input1:eq(0)').val(price);
			$('.input2:eq(0)').val(price);
			$('#deposit__from').html(price+" 만원");
			$('#deposit__to').html(price+" 만원");
			return;
		}
		if(parseInt($('.input1:eq(1)').val()) > parseInt($('.input2:eq(1)').val())){
			$('.input1:eq(1)').val(price);
			$('.input2:eq(1)').val(price);
			$('#month__from').html(price+" 만원");
			$('#month__to').html(price+" 만원");
			return;
		}
		
		switch($(this).index()){
			case 2:				
				$('#deposit__from').html(price+" 만원");
				break;
			case 4:
				$('#deposit__to').html(price+" 만원");
				break;
			case 1:
				$('#month__from').html(price+" 만원");
				break;
			case 3:
				$('#month__to').html(price+" 만원");
				break;
		}		
	});
	
	//추가 옵션
	var flag1, flag2;
	$('input[name^="option"]').click(function(){
		switch($(this).attr('name')){
			case "option1":
				break;
			case "option2":
				if(flag1 != $(this).val()){
					flag1 = $(this).val();
					$('input[name="option2"]').prop('checked',false);
					$(this).prop('checked',true);
					flag1 = $(this).val();
				}
				else{
					flag1 = "";					
				}
				break;
			case "option3":
				if(flag2 != $(this).val()){
					flag2 = $(this).val();
					$('input[name="option3"]').prop('checked',false);
					$(this).prop('checked',true);
					flag2 = $(this).val();
				}
				else{
					flag2 = "";					
				}				
				break;		
		}
		
		$('[title="추가옵션"] > h2 > span > span:eq(1)').html($('input[name^="option"]:checked').length).removeClass('hidden').addClass('badge');
		
		if($('input[name^="option"]:checked').length==0){
			$('[title="추가옵션"] > h2 > span > span:eq(1)').html("").removeClass('badge').addClass('hidden');			
		}
		
	});
	
	
	
});