$(function() {
	$('[data-toggle="tooltip"]').tooltip();

	var gooGoonInSeoul = [ "강남구", "강서구", "강동구", "강북구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구",
		"서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
	var gooGoonInIncheon = [ "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "옹진구", "중구" ];
	var gooGoonInBusan = [ "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
		"중구", "해운대구" ];
	var gooGoonInDaejeon = [ "대덕구", "동구", "서구", "유성구", "중구" ];
	var gooGoonInDaegu = [ "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구" ];
	var gooGoonInUlsan = [ "남구", "동구", "북구", "울주군", "중구" ];
	var gooGoonInGwangju = [ "광산구", "남구", "동구", "북구", "서구" ];
	var gooGoonInGyeonggi = [ "가평군", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시",
		"동두천시", "부천시", "성남시 분당구", "성남시 수정구", "성남시 중원구", "수원시 권선구", "수원시 영통구", "수원시 장안구",
		"수원시 팔달구", "안산시 단원구", "안산시 팔달구", "안성시", "안양시 동안구", "안양시 만안구", "양주시", "양평시", "여주시", "연천시",
		"오산시", "용인시 기흥구", "용인시 수지구", "용인시 처인구", "의왕시", "의정부시", "파주시", "평택시", "포천시", "하남시", "화성시" ];
	var gooGoonInGangwon = [ "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정성군", "철원군", "춘천시", "태백시",
		"평창군", "홍천군", "화천군", "횡성군" ];
	var gooGoonInJeonnam = [ "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군",
		"영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ];
	var gooGoonInJeonbook = [ "고창군", "군산시", "김제시", "남원시", "구례군", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시 덕진구",
		"전주시 완산구", "정읍시", "진안군" ];
	var gooGoonInChoongnam = [ "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시 동남구",
		"천안시 서북구", "청양군", "태안군", "홍성군" ];
	var gooGoonInChoongbook = [ "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청주시 상당구", "청주시 서원구",
		"청주시 청원구", "청주시 흠덕구", "충주시" ];
	var gooGoonInGyeongnam = [ "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원시 마산 합포구",
		"창원시 마산 회원구", "창원시 성산구", "창원시 의창구", "창원시 진해구", "통영시", "하동군", "함안군", "함양군", "합천군" ];
	var gooGoonInGyeongbook = [ "경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군",
		"영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시 남구", "포항시 북구" ];
	var gooGoonInJejudo = [ "서귀포시", "제주시" ];
	var gooGoonInJejusi = [ "세종" ];

	$('#si-do').change(function() {
		$('#goo-goon').find('option').remove();
		if ($(this).val() == '서울특별시') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInSeoul) {
				$('#goo-goon').append('<option>' + gooGoonInSeoul[gG] + '</option>');
			}
		} else if ($(this).val() == '인천광역시') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInIncheon) {
				$('#goo-goon').append('<option>' + gooGoonInIncheon[gG] + '</option>');
			}
		} else if ($(this).val() == '부산광역시') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInIncheon) {
				$('#goo-goon').append('<option>' + gooGoonInIncheon[gG] + '</option>');
			}
		} else if ($(this).val() == '대전광역시') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInDaejeon) {
				$('#goo-goon').append('<option>' + gooGoonInDaejeon[gG] + '</option>');
			}
		} else if ($(this).val() == '대구광역시') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInDaegu) {
				$('#goo-goon').append('<option>' + gooGoonInDaegu[gG] + '</option>');
			}
		} else if ($(this).val() == '울산광역시') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInUlsan) {
				$('#goo-goon').append('<option>' + gooGoonInUlsan[gG] + '</option>');
			}
		} else if ($(this).val() == '광주광역시') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGwangju) {
				$('#goo-goon').append('<option>' + gooGoonInGwangju[gG] + '</option>');
			}
		} else if ($(this).val() == '경기도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGyeonggi) {
				$('#goo-goon').append('<option>' + gooGoonInGyeonggi[gG] + '</option>');
			}
		} else if ($(this).val() == '강원도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGangwon) {
				$('#goo-goon').append('<option>' + gooGoonInGangwon[gG] + '</option>');
			}
		} else if ($(this).val() == '전라남도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInJeonnam) {
				$('#goo-goon').append('<option>' + gooGoonInJeonnam[gG] + '</option>');
			}
		} else if ($(this).val() == '전라북도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInJeonbook) {
				$('#goo-goon').append('<option>' + gooGoonInJeonbook[gG] + '</option>');
			}
		} else if ($(this).val() == '충청남도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInChoongnam) {
				$('#goo-goon').append('<option>' + gooGoonInChoongnam[gG] + '</option>');
			}
		} else if ($(this).val() == '충청북도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInChoongbook) {
				$('#goo-goon').append('<option>' + gooGoonInChoongbook[gG] + '</option>');
			}
		} else if ($(this).val() == '경상남도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGyeongnam) {
				$('#goo-goon').append('<option>' + gooGoonInGyeongnam[gG] + '</option>');
			}
		} else if ($(this).val() == '경상북도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGyeongbook) {
				$('#goo-goon').append('<option>' + gooGoonInGyeongbook[gG] + '</option>');
			}
		} else if ($(this).val() == '제주도') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInJejudo) {
				$('#goo-goon').append('<option>' + gooGoonInJejudo[gG] + '</option>');
			}
		} else {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInJejusi) {
				$('#goo-goon').append('<option>' + gooGoonInJejusi[gG] + '</option>');
			}
		}

	});

	$('.Btn--disabled').click(function() {
		console.log($(this));
		/*if ($(this).attr) {
			customAlert("error", "사업자 등록증을 첨부하기 전에 인증을 먼저 해야합니다.");
		}
		else {
			console.log('gd');
		}*/
	});
	
	$('input[type="number"]').on('input', function(e) {
		var inputNumber = parseInt($(this).val());
		if (inputNumber > parseInt($(this).attr('max'))) {
			$(this).val($(this).val().slice(0, $(this).attr('max').length));
		}
	});
	
	$('[name="select-email"]').change(function(){
		if($(this).val()!="직접입력"){
			$('[name="email2"]').val($(this).val()).prop('disabled','disabled');			
		}
		else{
			$('[name="email2"]').removeAttr('disabled');
		}
	});
	
	var joinMember = function(){
		var office_name = $('[name="office_name"]').val();
		var office_no = $('[name="office_no"]').val();
		var permit_no = $('[name="permit_no1"]').val()+"-"+$('[name="permit_no2"]').val()+"-"+$('[name="permit_no3"]').val();
		var address = $('[name="si-do"]').val()+" "+$('[name="goo-goon"]').val()+" "+$('[name="office_address"]').val();
		var represent = $('[name="represent"]').val();
		var profile_photo = $('[name="real-file2"]').val();
		var name = $('[name="name"]').val();
		var job = $('[name="job"]').val()+"("+$('[name="authority"]').val()+")";
		var phone = $('[name="phone"]').val()+"-"+$('[name="mphone"]').val()+"-"+$('[name="lphone"]').val();
		var office_phone = $('[name="office-phone"]').val()+"-"+$('[name="office-mphone"]').val()+"-"+$('[name="office-lphone"]').val();
		var email = $('[name="email1"]').val()+"@"+$('[name="email2"]').val();
		var password = $('[name="password1"]').val();
		var path_code = $('[name="path_code"]').val();
		var office_photo = $('[name="real-file1"]').val();
		var permit_photo = $('[name="permit_file"]').val();
		
		var formData = new FormData();
		formData.append("office_name", office_name);
		formData.append("office_no", office_no);
		formData.append("permit_no", permit_no);
		formData.append("address", address);
		formData.append("represent", represent);
		formData.append("profile_photo", profile_photo);
		formData.append("name", name);
		formData.append("job", job);
		formData.append("phone", phone);
		formData.append("office_phone", office_phone);
		formData.append("email", email);
		formData.append("password", password);
		formData.append("path_code", path_code);
		formData.append("office_photo", office_photo);
		formData.append("permit_photo", permit_photo);
		
		$.ajax({
			type : "POST",
			contentType: false,
			processData: false,
			url : "/CBangProj/ACCOUNT/Join.do",
			data : formData,
			dataType : "text",
			success : function(data){
				location.href = '/CBangProj/index.jsp';
			},
			error : function(){console.log('joinMember에러');}
		});
	};
	
	$('.joinOk').click(function(){
		$.ajax({
			type : "POST",
			url : "/CBangProj/ACCOUNT/match.do",
			data : {
				mode : "pass",
				password1 : $('[name="password1"]').val(),
				password2 : $('[name="password2"]').val()
			},
			dataType : "text",
			success : function(data){
				var result = JSON.parse(data);
				
				if(result.pwdNotMatch){
					joinMember();
				}
				else {
					customAlert("error", "비밀번호가 일치하지 않습니다.");
					$('[name="password1"]').focus();
				}					
			},
			error : function(){
				console.log('joinOk ajax에러');
			}
		});
	});
	
	$('[name="certification"]').click(function(){
		$.ajax({
			type : "POST",
			url : "/CBangProj/ACCOUNT/match.do",
			data : {
				mode : "permit",
				permit_no : $('#permit_no1').val()+"-"+$('#permit_no2').val()+"-"+$('#permit_no3').val()
				},
			dataType : "text",
			success : function(data){
				var result = JSON.parse(data);
				if(result.permitNotMatch) {
					customAlert("success","인증이 완료되었습니다.");
					$('.Btn--disabled').prop('disabled', false).css({'background-color':'#c91f3b','color':'white','cursor':'pointer'});
					$('.permit_div').append('<input type="file" name="permit_file" />');
					$('[name="permit_file"]').change(function(){
						var fileValue = $('[name="permit_file"]').val().split("\\");
						var fileName = fileValue[fileValue.length-1];
						$('.permit_name').html(fileName);
					});
				}
				else{
					customAlert("error", "사업자 등록번호가 잘못되었거나 없은 사업자 등록번호입니다.");
				}
			},
			error : function(error) {
				customAlert("error", "에러남");
			}
			});
		});
	
	$('#btn_permit').click(function(e){
		customAlert('error','사업자 등록증을 첨부하기전에 인증을 먼저 해야합니다.');
	});
	
});