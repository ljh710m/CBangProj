<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
<title>C방으로 찜하자!</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link
	href="<c:url value='/vendor/bootstrap/css/bootstrap-theme.min.css'/>"
	rel="stylesheet">
<!-- Google fonts -->
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">
<!-- Font Awesome font -->
<link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
<link href="<c:url value='/css/main.css'/>" rel="stylesheet">
<link href="<c:url value='/css/footer.css'/>" rel="stylesheet">
<link href="<c:url value='/css/account/pLogin.css'/>" rel="stylesheet">
<link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">
<style>
body, html {
	width: 100%;
	height: 100%;
}
</style>
</head>

<body>
	<!-- Navbar -->
	<jsp:include page="/frontend/template/Navbar.jsp" />
	<form action="<c:url value='/ACCOUNT/PLogin.do' />" method="post">
		<div id="body" class="col-md-8 col-md-offset-2">
			<div>
				<h1>회원가입</h1>
				<p>
					필요서류를 미리 준비해 두시면 빠르게 가입 하실 수 있습니다. <br /> <em>고객센터
						1899-6840/팩스번호 02-554</em>
				</p>
			</div>
			<table class="table table-bordered">
				<colgroup>
					<col style="width: 130px;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">공인중개사 정보 입력</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="title">중개사무소명</th>
						<td><input name="office_name" type="text" style="width: 50%;"
							placeholder="중개사무소명을 입력해주세요." /></td>
					</tr>
					<tr>
						<th class="title">중개등록번호</th>
						<td style="position: relative;"><input type="text"
							name="office_no" placeholder="“-” 가 있을 경우 표함하여 입력해주세요." required
							value="" autocomplete="off" style="margin-right: 10px;">
							<div class="Btn--md Btn--red file-type"
								style="display: inline-block; cursor: pointer; position: relative; z-index: 1;">중개등록증
								첨부</div>
							<div class="SignUpForm--file__wrap">
								<span class="File--name"></span>
								<a>
									<i></i>
								</a>
							</div>
							<div id="html5_1c81njc781ik8c2t541bs714fp3_container"
								class="moxie-shim moxie-shim-html5"
								style="position: absolute; top: 10px; left: 470px; width: 126px; height: 35px; overflow: hidden; z-index: 0;">
								<input id="html5_1c81njc781ik8c2t541bs714fp3" name="real-file1"
									type="file"
									style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;"
									accept="image/png,image/gif,image/jpeg">
							</div></td>
					</tr>
					<tr>
						<th class="title">사업자등록번호</th>
						<td><input name="permit_no1" type="number" min="0" max="999"
							class="number" maxlength="3" required /> <span
							class="input-dash"> - </span> <input type="number" min="0" max="99" name="permit_no2"
							class="number" maxlength="2" required /> <span
							class="input-dash"> - </span> <input type="number" min="0" max="99999" name="permit_no3"
							class="number" maxlength="5" required style="margin-right: 10px;" />
							<button id="certification" type="button" class="Btn--md Btn--red"
								style="min-width: 0px; padding: 0px 10px; margin-right: 10px;">인증</button>
							<button type="button" class="Btn--md Btn--disabled">사업자
								등록증 첨부</button>
							<div class="SignUpForm--file__wrap">
								<span class="File--name2"></span>
							</div></td>
					</tr>
					<tr>
						<th class="title">중개사무소 주소</th>
						<td>
							<div>
								<select name="si-do" class="selectBox" id="si-do" required>
									<option>시/도 선택</option>
									<option value="seoul">서울특별시</option>
									<option value="incheon">인천광역시</option>
									<option value="busan">부산광역시</option>
									<option value="daejeon">대전광역시</option>
									<option value="dae-gu">대구광역시</option>
									<option value="ulsan">울산광역시</option>
									<option value="gwangju">광주광역시</option>
									<option value="gyeonggi">경기도</option>
									<option value="gangwon">강원도</option>
									<option value="jeonnam">전라남도</option>
									<option value="jeonbook">전라북도</option>
									<option value="choongnam">충청남도</option>
									<option value="choongbook">충청북도</option>
									<option value="gyeongnam">경상남도</option>
									<option value="gyeongbook">경상북도</option>
									<option value="jejudo">제주특별자치도</option>
									<option value="jejusi">제주특별자치시</option>
								</select> <select name="goo-goon" class="selectBox" id="goo-goon" required>
									<option>구/군 선택</option>
								</select> <input type="text" name="office_address"
									placeholder="상세주소를 입력해주세요." required autocomplete="off" />
							</div>
						</td>

					</tr>
					<tr>
						<th class="title">중개사대표자명</th>
						<td><input name="represent" type="text" style="width: 60%"
							placeholder="중개사대표자명을 입력해주세요." /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="body2" class="col-md-8 col-md-offset-2">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="2">개인 정보 입력</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="title">프로필</th>
						<td>
							<div class="Profile Profile--register">
								<div class="Profile--img"></div>
								<div class="Profile--img">
									<div class="Profile--upload status"
										style="display: inline-block; cursor: pointer; position: static; z-index: 1;">사진등록</div>
									<div class="moxie-shim moxie-shim-html5" id="file-div"
										style="position: absolute; top: 80px; left: 0px; width: 100px; height: 20px; overflow: hidden; z-index: 0;">
										<input type="file" name="real-file2"
											style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;"
											accept="image/png,image/gif,image/jpeg">
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="title">본인 성명</th>
						<td><input name="name" type="text"
							placeholder="실무자 본인 성명을 입력해주세요." name="name" class="input--name"
							required autocomplete="off" />
							<p style="display: inline-block;">
								<span class="rank">직책/직급</span>
							</p> <input type="text" placeholder="직책/직급" name="jop"
							class="input--position" required autocomplete="off" /> <select>
								<option>권한/자격</option>
								<option>대표공인중개사</option>
								<option>소속공인중개사</option>
								<option>중개보조원</option>
								<option>중개인</option>
						</select></td>
					</tr>
					<tr>
						<th class="title">휴대폰 번호</th>
						<td><select name="phone" class="selectBox Bold" required>
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
						</select> <span class="input--dash">- </span> <input type="number" min="0"
							max="9999" class="number" name="phone" required maxlength="4" />
							<span class="input--dash">- </span> <input type="number" min="0"
							max="9999" class="number" name="phone" required maxlength="4" />
						</td>
					</tr>
					<tr>
						<th class="title">대표전화번호</th>
						<td><select name="office_phone" class="selectBox Bold"
							required>
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>033</option>
								<option>041</option>
								<option>042</option>
								<option>043</option>
								<option>044</option>
								<option>051</option>
								<option>052</option>
								<option>053</option>
								<option>054</option>
								<option>055</option>
								<option>061</option>
								<option>062</option>
								<option>063</option>
								<option>064</option>
								<option>070</option>
								<option>010</option>
						</select> <span class="input--dash"> - </span> <input type="number" min="0"
							max="9999" class="number" name="phone" required maxlength="4" />
							<span class="input--dash"> - </span> <input type="number" min="0"
							max="9999" class="number" name="phone" required maxlength="4" />
						</td>
					</tr>
					<tr>
						<th class="title">이메일 주소</th>
						<td style="padding: 10px;"><input type="text" style="width:138px;"
							class="Email--input" name="email" required autocomplete="off" />
							<span class="input--dash"> @ </span> <select class="select-email">
								<option>이메일 선택</option>
								<option value="직접입력">직접 입력</option>
								<option>naver.com</option>
								<option>hanmail.net</option>
								<option>daum.net</option>
								<option>gmail.com</option>
								<option>nate.com</option>
								<option>icloud.com</option>
								<option>hotmail.com</option>
								<option>korea.com</option>
								<option>empal.com</option>
								<option>dreamwiz.com</option>
								<option>yahoo.com</option>
								<option>ymail.com</option>
								<option>live.com</option>
								<option>aol.com</option>
								<option>msn.com</option>
								<option>me.com</option>
								<option>rocketmail.com</option>
								<option>qq.com</option>
						</select><br /> <!-- 이메일 입력 안했을 때 <small>※이메일을 입력하세요</small> --></td>
					</tr>
					<tr>
						<th class="title">비밀번호</th>
						<td><input type="password"
							placeholder="8자 이상, 문자, 숫자, 특수문자 포함" /></td>
					</tr>
					<tr>
						<th class="title">비밀번호 확인</th>
						<td><input type="password" placeholder="다시 한번 비밀번호를 입력해주세요." /></td>
					</tr>
					<tr>
						<th class="title">회원가입 경로</th>
						<td><select name="path_code">
								<option>가입 경로 선택</option>
								<option>인터넷 광고(검색, 카페, 블로그 등)</option>
								<option>TV광고·옥외광고·포스터 등(오프라인)</option>
								<option>미디어윌 영업대행</option>
								<option>지인 추천 및 기타</option>
						</select></td>
					</tr>
				</tbody>
			</table>
			<div>
				<small>*공인중개사법 제18조 2의 취지에 적합한 표시의무(상호명, 등록관청에 신고된 전화번호,
					소재지, 성명)를 기입하시기 바랍니다. 이에 발생한 문제는 (주)스테이션3 에서 책임을 지지 않습니다.</small>
			</div>
			<div class="joinbutton">
				<button class="joinOk">회원가입 신청</button>
			</div>
		</div>
	</form>

	<!-- Terms -->
	<div class="Terms" style="border-top: 1px solid #d1d1d1;">
		<div class="container">
			<ul class="nav nav-justified Terms-list">
				<li><a class="Terms-item"
					href="<c:url value='/frontend/company/Company.jsp'/>">회사소개</a></li>
				<li><a class="Terms-item" href="#">공인중개사 회원가입</a></li>
				<li><a class="Terms-item" href="#">이용약관</a></li>
				<li><a class="Terms-item Terms-item--policy" href="#">개인정보취급방식</a></li>
				<li><a class="Terms-item" href="#">위치기반약관</a></li>
				<li><a class="Terms-item" href="#">매물관리규정</a></li>
				<li><a class="Terms-item" href="#">자동저장 서비스</a></li>
			</ul>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/frontend/template/Footer.jsp" />

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
	<script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/js/util/alert.js'/>"></script>
	<script src="<c:url value='/js/account/PLogin.js'/>"></script>
	<script>
	
	$('.file-type').click(function() {
		$('input[name="real-file1"]').click();
			if($(this).parent().find('span.File--name').text().length > 0){
					btn_file1.val('');
					$('i').removeClass();
					$('span.File--name').html('');
				}
			
	});
	$('.Profile--upload').click(function(e) {
		$('input[name="real-file2"]').click();
	});

	var btn_file1 = $('input[name="real-file1"]');
	btn_file1.on('change',function(e){
		var fileValue = btn_file1.val().split("\\");
		var fileName = fileValue[fileValue.length-1]; // 파일명
			$('.File--name').css('width',(fileName.length)+'em');
			$('span.File--name').append(fileName);
			if($('i').html() != undefined)
				$('i').addClass('fas fa-window-close');
			
			$('i').click(function(){
				btn_file1.val('');
				$('i').removeClass();
				$('span.File--name').html('');
			});
		});

	
	$('input[name="real-file2"]').on('change',function(){
		readURL(this);
	});
	
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					$('.Profile--img').css('background', 'url(' + e.target.result + ') no-repeat center center');
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>