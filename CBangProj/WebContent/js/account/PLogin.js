$('#si-do').change(
	function() {
		$('#goo-goon').find('option').remove();
		if ($(this).val() == 'seoul') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>강남구</option>').append(
				'<option>강서구</option>').append(
				'<option>강동구</option>').append(
				'<option>강북구</option>').append(
				'<option>관악구</option>').append(
				'<option>광진구</option>').append(
				'<option>구로구</option>').append(
				'<option>금천구</option>').append(
				'<option>노원구</option>').append(
				'<option>도봉구</option>').append(
				'<option>동대문구</option>').append(
				'<option>동작구</option>').append(
				'<option>마포구</option>').append(
				'<option>서대문구</option>').append(
				'<option>서초구</option>').append(
				'<option>성동구</option>').append(
				'<option>성북구</option>').append(
				'<option>송파구</option>').append(
				'<option>양천구</option>').append(
				'<option>영등포구</option>').append(
				'<option>용산구</option>').append(
				'<option>은평구</option>').append(
				'<option>종로구</option>').append(
				'<option>중구</option>').append(
				'<option>중랑구</option>');
		} else if ($(this).val() == 'incheon') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>강화군</option>').append(
				'<option>계양구</option>').append(
				'<option>남구</option>').append(
				'<option>남동구</option>').append(
				'<option>동구</option>').append(
				'<option>부평구</option>').append(
				'<option>서구</option>').append(
				'<option>연수구</option>').append(
				'<option>옹진군</option>').append(
				'<option>중구</option>');
		} else if ($(this).val() == 'busan') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>강서구</option>').append(
				'<option>금정구</option>').append(
				'<option>기장군</option>').append(
				'<option>남구</option>').append(
				'<option>동구</option>').append(
				'<option>동래구</option>').append(
				'<option>부산진구</option>').append(
				'<option>북구</option>').append(
				'<option>사상구</option>').append(
				'<option>사하구</option>').append(
				'<option>서구</option>').append(
				'<option>수영구</option>').append(
				'<option>연제구</option>').append(
				'<option>영도구</option>').append(
				'<option>중구</option>').append(
				'<option>해운대구</option>');
		} else if ($(this).val() == 'daejeon') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>대덕구</option>').append(
				'<option>동구</option>').append(
				'<option>서구</option>').append(
				'<option>유성구</option>').append(
				'<option>중구</option>');
		} else if ($(this).val() == 'dae-gu') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>남구</option>').append(
				'<option>달서구</option>').append(
				'<option>달성군</option>').append(
				'<option>동구</option>').append(
				'<option>복구</option>').append(
				'<option>서구</option>').append(
				'<option>수성구</option>').append(
				'<option>중구</option>');
		} else if ($(this).val() == 'ulsan') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>남구</option>').append(
				'<option>동구</option>').append(
				'<option>복구</option>').append(
				'<option>울주군</option>').append(
				'<option>중구</option>');
		} else if ($(this).val() == 'gwangju') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>광산구</option>').append(
				'<option>남구</option>').append(
				'<option>동구</option>').append(
				'<option>복구</option>').append(
				'<option>서구</option>');
		} else if ($(this).val() == 'gyeonggi') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>가평군</option>').append(
				'<option>고양시 덕양구</option>').append(
				'<option>고양시 일산동구</option>').append(
				'<option>고양시 일산서구</option>').append(
				'<option>과천시</option>').append(
				'<option>광명시</option>').append(
				'<option>광주시</option>').append(
				'<option>구리시</option>').append(
				'<option>군포시</option>').append(
				'<option>김포시</option>').append(
				'<option>남양주시</option>').append(
				'<option>동두천시</option>').append(
				'<option>부천시</option>').append(
				'<option>성남시 분당구</option>').append(
				'<option>성남시 수정구</option>').append(
				'<option>성남시 중원구</option>').append(
				'<option>수원시 권선구</option>').append(
				'<option>수원시 영통구</option>').append(
				'<option>수원시 장안구</option>').append(
				'<option>수원시 팔달구</option>').append(
				'<option>안산시 단원구</option>').append(
				'<option>안신시 상록구</option>').append(
				'<option>안성시</option>').append(
				'<option>안양시 동안구</option>').append(
				'<option>안양시 만안구</option>').append(
				'<option>양주시</option>').append(
				'<option>양평시</option>').append(
				'<option>여주시</option>').append(
				'<option>연천시</option>').append(
				'<option>오산시</option>').append(
				'<option>용인시 기흥구</option>').append(
				'<option>용인시 수지구</option>').append(
				'<option>용인시 처인구</option>').append(
				'<option>의왕시</option>').append(
				'<option>의정부시</option>').append(
				'<option>이천시</option>').append(
				'<option>파주시</option>').append(
				'<option>평택시</option>').append(
				'<option>포천시</option>').append(
				'<option>하남시</option>').append(
				'<option>화성시</option>');
		} else if ($(this).val() == 'gangwon') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>강릉시</option>').append(
				'<option>고성군</option>').append(
				'<option>동해시</option>').append(
				'<option>삼척시</option>').append(
				'<option>속초시</option>').append(
				'<option>양구군</option>').append(
				'<option>양양군</option>').append(
				'<option>영월군</option>').append(
				'<option>원주시</option>').append(
				'<option>인제군</option>').append(
				'<option>정성군</option>').append(
				'<option>철원군</option>').append(
				'<option>춘천시</option>').append(
				'<option>태백시</option>').append(
				'<option>평창군</option>').append(
				'<option>홍천군</option>').append(
				'<option>화천군</option>').append(
				'<option>횡성군</option>');
		} else if ($(this).val() == 'jeonnam') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>강진군</option>').append(
				'<option>고흥군</option>').append(
				'<option>곡성군</option>').append(
				'<option>광양시</option>').append(
				'<option>구례군</option>').append(
				'<option>나주시</option>').append(
				'<option>담양군</option>').append(
				'<option>목포시</option>').append(
				'<option>무안군</option>').append(
				'<option>보성군</option>').append(
				'<option>순천시</option>').append(
				'<option>신안군</option>').append(
				'<option>여수시</option>').append(
				'<option>영광군</option>').append(
				'<option>영암군</option>').append(
				'<option>완도군</option>').append(
				'<option>장성군</option>').append(
				'<option>장흥군</option>').append(
				'<option>진도군</option>').append(
				'<option>함평군</option>').append(
				'<option>해남군</option>').append(
				'<option>화순군</option>');
		} else if ($(this).val() == 'jeonbook') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>고창군</option>').append(
				'<option>군산시</option>').append(
				'<option>김제시</option>').append(
				'<option>남원시</option>').append(
				'<option>구례군</option>').append(
				'<option>무주군</option>').append(
				'<option>부안군</option>').append(
				'<option>순창군</option>').append(
				'<option>완주군</option>').append(
				'<option>익산시</option>').append(
				'<option>임실군</option>').append(
				'<option>장수군</option>').append(
				'<option>전주시 덕진구</option>').append(
				'<option>전주시 완산구</option>').append(
				'<option>정읍시</option>').append(
				'<option>진안군</option>');
		} else if ($(this).val() == 'choongnam') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>계룡시</option>').append(
				'<option>공주시</option>').append(
				'<option>금산군</option>').append(
				'<option>논산시</option>').append(
				'<option>당진시</option>').append(
				'<option>보령시</option>').append(
				'<option>부여군</option>').append(
				'<option>서산시</option>').append(
				'<option>서천군</option>').append(
				'<option>아산시</option>').append(
				'<option>예산군</option>').append(
				'<option>천안시 동남구</option>').append(
				'<option>천안시 서북구</option>').append(
				'<option>청양군</option>').append(
				'<option>태안군</option>').append(
				'<option>홍성군</option>');
		} else if ($(this).val() == 'choongbook') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>괴산군</option>').append(
				'<option>단양군</option>').append(
				'<option>보은군</option>').append(
				'<option>영동군</option>').append(
				'<option>옥천군</option>').append(
				'<option>음성군</option>').append(
				'<option>제천시</option>').append(
				'<option>증평군</option>').append(
				'<option>진천군</option>').append(
				'<option>청주시 상당구</option>').append(
				'<option>청주시 서원구</option>').append(
				'<option>청주시 청원구</option>').append(
				'<option>청주시 흥덕구</option>').append(
				'<option>충주시</option>');
		} else if ($(this).val() == 'gyeongnam') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>거제시</option>').append(
				'<option>거창군</option>').append(
				'<option>고성군</option>').append(
				'<option>김해시</option>').append(
				'<option>남해군</option>').append(
				'<option>밀양시</option>').append(
				'<option>사천시</option>').append(
				'<option>산청군</option>').append(
				'<option>양산시</option>').append(
				'<option>의령군</option>').append(
				'<option>진주시</option>').append(
				'<option>창녕군</option>').append(
				'<option>창원시 마산 합포구</option>').append(
				'<option>창원시 마산 회원구</option>').append(
				'<option>창원시 성산구</option>').append(
				'<option>창원시 의창구</option>').append(
				'<option>창원시 진해구</option>').append(
				'<option>통영시</option>').append(
				'<option>하동군</option>').append(
				'<option>함안군</option>').append(
				'<option>함양군</option>').append(
				'<option>합천군</option>');
		} else if ($(this).val() == 'gyeongbook') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>경산시</option>').append(
				'<option>경주시</option>').append(
				'<option>고령군</option>').append(
				'<option>구미시</option>').append(
				'<option>군위군</option>').append(
				'<option>김천시</option>').append(
				'<option>문경시</option>').append(
				'<option>봉화군</option>').append(
				'<option>상주시</option>').append(
				'<option>성주군</option>').append(
				'<option>안동시</option>').append(
				'<option>영덕군</option>').append(
				'<option>영양군</option>').append(
				'<option>영주시</option>').append(
				'<option>영천시</option>').append(
				'<option>예천군</option>').append(
				'<option>울릉군</option>').append(
				'<option>울진군</option>').append(
				'<option>의성군</option>').append(
				'<option>청도군</option>').append(
				'<option>청송군</option>').append(
				'<option>칠곡군</option>').append(
				'<option>포항시 남구</option>').append(
				'<option>포항시 북구</option>');
		} else if ($(this).val() == 'jejudo') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>서귀포시</option>').append(
				'<option>제주시</option>');
		} else if ($(this).val() == 'jejusi') {
			$('#goo-goon').append('<option>구/군 선택</option>')
				.append('<option>세종</option>');
		}
	});
$('.Btn--disabled').click(function(){
	if($(this).hasClass('Btn--disabled')){
		customAlert("error", "사업자 등록증을 첨부하기 전에 인증을 먼저 해야합니다.");
	}
});