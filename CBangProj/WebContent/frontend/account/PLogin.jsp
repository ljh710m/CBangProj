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
<link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
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
	<form onsubmit="return false;" method="post" id="allform" enctype="multipart/form-data">
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
							name="office_no" placeholder="“-” 가 있을 경우 표함하여 입력해주세요."
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
						<td><input id="permit_no1" type="number" min="0" max="999" name="permit_no1"
							class="number" maxlength="3" /> <span
							class="input-dash"> - </span> <input type="number" min="0" max="99" id="permit_no2" name="permit_no2"
							class="number" maxlength="2" /> <span
							class="input-dash"> - </span> <input type="number" min="0" max="99999" id="permit_no3" name="permit_no3"
							class="number" maxlength="5" style="margin-right: 10px;" />
							<button name="certification" id="certification" type="button" class="Btn--md Btn--red"
								style="min-width: 0px; padding: 0px 10px; margin-right: 10px;">인증</button>
							<button id="btn_permit" type="button" class="Btn--md Btn--disabled" disabled="disabled">사업자
								등록증 첨부</button>
								<div class="permitName_div">
								<span class="permit_name"></span>
							</div>
							<div class="permit_div">
								<input type="file" name="permit_file" disabled="disabled"/>
							</div>
							</td>
					</tr>
					<tr>
						<th class="title">중개사무소 주소</th>
						<td>
							<div>
								<select name="si-do" class="selectBox" id="si-do">
									<option>시/도 선택</option>
									<option value="서울특별시">서울특별시</option>
									<option value="인천광역시">인천광역시</option>
									<option value="부산광역시">부산광역시</option>
									<option value="대전광역시">대전광역시</option>
									<option value="대구광역시">대구광역시</option>
									<option value="울산광역시">울산광역시</option>
									<option value="광주광역시">광주광역시</option>
									<option value="경기도">경기도</option>
									<option value="강원도">강원도</option>
									<option value="전라남도">전라남도</option>
									<option value="전라북도">전라북도</option>
									<option value="충청남도">충청남도</option>
									<option value="충청북도">충청북도</option>
									<option value="경상남도">경상남도</option>
									<option value="경상북도">경상북도</option>
									<option value="제주특별자치도">제주특별자치도</option>
									<option value="제주특별자치시">제주특별자치시</option>
								</select> <select name="goo-goon" class="selectBox" id="goo-goon">
									<option>구/군 선택</option>
								</select> <input type="text" name="office_address"
									placeholder="상세주소를 입력해주세요." autocomplete="off" />
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
							autocomplete="off" />
							<p style="display: inline-block;">
								<span class="rank">직책/직급</span>
							</p> <input type="text" placeholder="직책/직급" name="job"
							class="input--position" autocomplete="off" />
							 <select name="authority">
								<option value="">권한/자격</option>
								<option value="대표공인중개사">대표공인중개사</option>
								<option value="소속공인중개사">소속공인중개사</option>
								<option value="중개보조원">중개보조원</option>
								<option value="중개인">중개인</option>
						</select></td>
					</tr>
					<tr>
						<th class="title">휴대폰 번호</th>
						<td><select name="phone" class="selectBox Bold">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
						</select> <span class="input--dash">- </span> <input type="number" min="0"
							max="9999" class="number" name="mphone" maxlength="4" />
							<span class="input--dash">- </span> <input type="number" min="0"
							max="9999" class="number" name="lphone" maxlength="4" />
						</td>
					</tr>
					<tr>
						<th class="title">대표전화번호</th>
						<td><select name="office-phone" class="selectBox Bold">
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">070</option>
								<option value="010">010</option>
						</select> <span class="input--dash"> - </span> <input type="number" min="0"
							max="9999" class="number" name="office-mphone" maxlength="4" />
							<span class="input--dash"> - </span> <input type="number" min="0"
							max="9999" class="number" name="office-lphone" maxlength="4" />
						</td>
					</tr>
					<tr>
						<th class="title">이메일 주소</th>
						<td style="padding: 10px;"><input type="text" style="width:138px;"
							class="Email--input" name="email1" autocomplete="off" />
							<span class="input--dash"> @ </span>
							<input name="email2" type="text" disabled style="width:138px;height:35px;border: 1px solid #e7e7e7;" />
							 <select class="select-email" name="select-email">
								<option>이메일 선택</option>
								<option value="직접입력">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="haqnmail.com">hanmail.net</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="icloud.com">icloud.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="empal.com">empal.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="yahho.com">yahoo.com</option>
								<option value="ymail.com">ymail.com</option>
								<option value="live.com">live.com</option>
								<option value="aol.com">aol.com</option>
								<option value="msn.com">msn.com</option>
								<option value="me.com">me.com</option>
								<option value="rocketmail.com">rocketmail.com</option>
								<option value="qq.com">qq.com</option>
						</select><br /> <!-- 이메일 입력 안했을 때 <small>※이메일을 입력하세요</small> --></td>
					</tr>
					<tr>
						<th class="title">비밀번호</th>
						<td><input type="password" name="password1"
							placeholder="8자 이상, 문자, 숫자, 특수문자 포함" /></td>
					</tr>
					<tr>
						<th class="title">비밀번호 확인</th>
						<td><input type="password" name="password2" placeholder="다시 한번 비밀번호를 입력해주세요." /></td>
					</tr>
					<tr>
						<th class="title">회원가입 경로</th>
						<td><select name="path_code">
								<option>가입 경로 선택</option>
						<c:if test="${not empty path_code }">
						<c:forEach items="${path_code }" var="path">
								<option value="${path.path_code }">${path.path_type }</option>
						</c:forEach>
						</c:if>
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
		var fileName = fileValue[fileValue.length-1].split(".")[0]; // 파일명
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
					$('.Profile--img').css({'background':'url(' + e.target.result + ') no-repeat center center','background-size':'100px 100px'});
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>