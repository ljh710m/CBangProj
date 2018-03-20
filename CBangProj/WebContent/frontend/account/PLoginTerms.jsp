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

<!-- Custom styles for this template -->
<link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
<link href="<c:url value='/css/main.css'/>" rel="stylesheet">
<link href="<c:url value='/css/footer.css'/>" rel="stylesheet">
<link href="<c:url value='/css/account/login.css'/>" rel="stylesheet">
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
	<div id="body" class="col-md-6 col-md-offset-3">
		<h2>약관 동의하기</h2>
		<small>약관 동의 후 공인중개사 회원가입이 가능합니다.</small>
		<div class="row">
			<h5>모든 약관에 동의 합니다.</h5>
			<div class="allagree">
				<div class="agreebutton-all">
					모두 동의<span class="glyphicon glyphicon-ok"></span>
				</div>
			</div>
		</div>
		<div class="row termsOne">
			<h5><span class="necessary">[필수]</span>C방 서비스 이용약관 동의</h5>
			<div class="options">
				<div class="details">
					자세히<span class="glyphicon glyphicon-menu-down"></span>
				</div>
				<div class="agree">
					<div class="agreebutton">
						동의<span class="glyphicon glyphicon-ok"></span>
					</div>
				</div>
			</div>
			<textarea rows="10" disabled>
				<jsp:include page="pLoginTerms/TermsOne.jsp" />
			</textarea>
		</div>
		<div class="row termsTwo">
			<h5><span class="necessary">[필수]</span>중개사 매물 등록 서비스 이용 약관 동의</h5>
			<div class="options">
				<div class="details">
					자세히<span class="glyphicon glyphicon-menu-down"></span>
				</div>
				<div class="agree">
					<div class="agreebutton">
						동의<span class="glyphicon glyphicon-ok"></span>
					</div>
				</div>
			</div>
			<textarea rows="10" disabled>
				<jsp:include page="pLoginTerms/TermsTwo.jsp" />
			</textarea>
		</div>
		<div class="row termsThree">
			<h5><span class="necessary">[필수]</span>개인정보 수집 및 이용에 대한 동의</h5>
			<div class="options">
				<div class="details">
					자세히<span class="glyphicon glyphicon-menu-down"></span>
				</div>
				<div class="agree">
					<div class="agreebutton">
						동의<span class="glyphicon glyphicon-ok"></span>
					</div>
				</div>
			</div>
			<textarea rows="10" disabled>
				<jsp:include page="pLoginTerms/TermsThree.jsp" />
			</textarea>
		</div>
		<div class="row termsFour">
			<h5><span class="necessary">[필수]</span> 자동저장 서비스 이용 동의</h5>
			<div class="options">
				<div class="details">
					자세히<span class="glyphicon glyphicon-menu-down"></span>
				</div>
				<div class="agree">
					<div class="agreebutton">
						동의<span class="glyphicon glyphicon-ok"></span>
					</div>
				</div>
			</div>
			<textarea rows="10" disabled>
				<jsp:include page="pLoginTerms/TermsFour.jsp" />
			</textarea>
		</div>
		<div class="row termsFive">
			<h5><span class="necessary">[필수]</span> 위치기반서비스 이용 동의</h5>
			<div class="options">
				<div class="details">
					자세히<span class="glyphicon glyphicon-menu-down"></span>
				</div>
				<div class="agree">
					<div class="agreebutton">
						동의<span class="glyphicon glyphicon-ok"></span>
					</div>
				</div>
			</div>
			<textarea rows="10" disabled>
				<jsp:include page="pLoginTerms/TermsFive.jsp" />
			</textarea>
		</div>
		<div class="row termsSix">
			<h5><span class="necessary">[필수]</span> 매물 관리 규정에 대한 동의</h5>
			<div class="options">
				<div class="details">
					자세히<span class="glyphicon glyphicon-menu-down"></span>
				</div>
				<div class="agree">
					<div class="agreebutton">
						동의<span class="glyphicon glyphicon-ok"></span>
					</div>
				</div>
			</div>
			<textarea rows="10" disabled>  
				<jsp:include page="pLoginTerms/TermsSix.jsp" />
			</textarea>
		</div>
		<div class="row termsSeven">
			<h5>[선택] 이벤트 및 혜택 알림 수신동의 (이메일, SMS)</h5>
			<div class="options">
				<div class="agree">
					<div class="agreebutton-choice">
						동의<span class="glyphicon glyphicon-ok"></span>
					</div>
				</div>
			</div>
		</div>
		<div class="buttonDiv">
			<button class="buttonCancel">취소</button>
			<button class="buttonNext">다음</button>
		</div>
	</div>

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
	<script src="<c:url value='/js/account/PLoginTerms.js'/>"></script>
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		
	</script>
</body>
</html>