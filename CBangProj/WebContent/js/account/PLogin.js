var gooGoonInSeoul = ["강남구","강서구","강동구","강북구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구",
                      "서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
var gooGoonInIncheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","옹진구","중구"];
var gooGoonInBusan = ["강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구",
                      "중구","해운대구"];
var gooGoonInDaejeon = ["대덕구","동구","서구","유성구","중구"]; 
var gooGoonInDaegu = ["남구","달서구","달성군","동구","북구","서구","수성구","중구"];
var gooGoonInUlsan = ["남구","동구","북구","울주군","중구"];  
var gooGoonInGwangju = ["광산구","남구","동구","북구","서구"];
var gooGoonInGyeonggi = ["가평군","고양시 덕양구","고양시 일산동구","고양시 일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시",
                         "동두천시","부천시","성남시 분당구","성남시 수정구","성남시 중원구","수원시 권선구","수원시 영통구","수원시 장안구",
                         "수원시 팔달구","안산시 단원구","안산시 팔달구","안성시","안양시 동안구","안양시 만안구","양주시","양평시","여주시","연천시",
                         "오산시","용인시 기흥구","용인시 수지구","용인시 처인구","의왕시","의정부시","파주시","평택시","포천시","하남시","화성시"];
var gooGoonInGangwon = ["강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군","정성군","철원군","춘천시","태백시",
                        "평창군","홍천군","화천군","횡성군"];
var gooGoonInJeonnam = ["강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군",
                        "영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
var gooGoonInJeonbook = ["고창군","군산시","김제시","남원시","구례군","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시 덕진구",
                         "전주시 완산구","정읍시","진안군"];
var gooGoonInChoongnam = ["계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시 동남구",
                          "천안시 서북구","청양군","태안군","홍성군"];
var gooGoonInChoongbook = ["괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시 상당구","청주시 서원구",
                           "청주시 청원구","청주시 흠덕구","충주시"];
var gooGoonInGyeongnam = ["거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시 마산 합포구",
                          "창원시 마산 회원구","창원시 성산구","창원시 의창구","창원시 진해구","통영시","하동군","함안군","함양군","합천군"];
var gooGoonInGyeongbook = ["경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군",
                           "영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시 남구","포항시 북구"];
var gooGoonInJejudo = ["서귀포시","제주시"];
var gooGoonInJejusi = ["세종"];

	$('#si-do').change(function() {
		$('#goo-goon').find('option').remove();
		if ($(this).val() == 'seoul') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInSeoul) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'incheon') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInIncheon) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'busan') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInIncheon) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'daejeon') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInDaejeon) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'dae-gu') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInDaegu) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'ulsan') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInUlsan) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'gwangju') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGwangju) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'gyeonggi') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGyeonggi) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'gangwon') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGangwon) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'jeonnam') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInJeonnam) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'jeonbook') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInJeonbook) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'choongnam') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInChoongnam) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'choongbook') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInChoongbook) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'gyeongnam') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGyeongnam) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'gyeongbook') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInGyeongbook) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else if ($(this).val() == 'jejudo') {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInJejudo) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		} else {
			$('#goo-goon').append('<option>구/군 선택</option>');
			for (var gG in gooGoonInJejusi) {
				$('#goo-goon').append('<option>' + gG + '</option>');
			}
		}

	});
	
	$('[data-toggle="tooltip"]').tooltip();

	$('.Btn--disabled').click(function() {
		if ($(this).hasClass('Btn--disabled')) {
			customAlert("error", "사업자 등록증을 첨부하기 전에 인증을 먼저 해야합니다.");
		}
	});
	