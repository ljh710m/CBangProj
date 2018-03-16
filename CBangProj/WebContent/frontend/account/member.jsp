<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
<title></title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>"
	rel="stylesheet">

<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>



</head>

<body>
	<div id="accountJoin" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<div class="memberjoin-modal" style="display: block;">
			<div class="memberjoin-modal-bg" onclick="location.href='javascript:accountjoinclose()'" data-dismiss="modal"></div>
			<div class="memberjoin-modal-dialog"
				style="width: 520px; height: 550px; padding-right: 20px; padding-left: 20px;">
				<div class="memberjoin-modal-frame">
					<div class="memberjoin-modal-content">
						<div class="memberjoin-modal-header">
							<i class="fas fa-times" onclick="location.href='javascript:accountjoinclose()'" data-dismiss="modal"
								style="cursor: pointer;font-size: 19px; display: inline-block; position: absolute; top: -27px; right: -25px;" aria-label="팝업 닫기"> </i>
						</div>
						<div class="memberjoin-modal-body">
							<div id="account" class="Account">
								<h1 class="Account-title">회원가입</h1>
								<div class="Account-body">
									<div class="UserSignup">
										<form class="Account-form">
											<div class="Account-form__row">
												<div class="Account-form__cell">
													<label for="name" class="Account-form__label">이름</label>
												</div>
												<div class="Account-form__cell">
													<input type="text" id="name" class="Account-form__input"
														autocomplete="off">
												</div>
											</div>

											<div class="Account-form__row">
												<div class="Account-form__cell">
													<label for="password" class="Account-form__label">비밀번호</label>
												</div>
												<div class="Account-form__cell">
													<input type="password" id="password"
														class="Account-form__input" autocomplete="off">
												</div>
											</div>
											<div class="Account-form__row">
												<div class="Account-form__cell">
													<label for="password_confirm" class="Account-form__label">비밀번호
														확인</label>
												</div>
												<div class="Account-form__cell">
													<input type="password" id="password_confirm"
														class="Account-form__input" autocomplete="off">
												</div>
											</div>
											<div class="Account-form__row" style="height: 82px;">
												<div>
													<div class="Account-form__row">
														<div class="Account-form__cell">
															<label for="phone_1" class="Account-form__label">핸드폰
																번호</label>
														</div>
														<div class="Account-form__cell Account-form__abled">
															<div>
																<select class="Account-form__select">
																	<option value="010">010</option>
																	<option value="011">011</option>
																	<option value="016">016</option>
																	<option value="017">017</option>
																	<option value="018">018</option>
																	<option value="019">019</option>
																</select><span
																	style="display: inline-block; width: 15px; text-align: center;">
																	- </span><input type="text" id="phone_2" maxlength="4"
																	value="" autocomplete="off" class="Account-form__input"><span
																	style="display: inline-block; width: 16px; text-align: center;">
																	- </span><input type="text" id="phone_3" maxlength="4"
																	value="" autocomplete="off" class="Account-form__input">
															</div>
														</div>
														<button class="btn btn-white-blue" type="button">인증번호
															요청</button>
													</div>
													<div class="Account-form__row">
														<div class="Account-form__cell">
															<label class="Account-form__label" style="display: none;">핸드폰
																인증 확인</label>
														</div>
														<div class="Account-form__cell">
															<input type="text" autocomplete="off" value=""
																class="Account-form__input" style="width: 275px;">
															<button class="btn btn-white-blue" type="button">인증번호
																확인</button>
														</div>
													</div>
													<div class="Account-form__row Account-form__row--email">
														<div class="Account-form__cell">
															<label for="email_user" class="Account-form__label">이메일</label>
														</div>
														<div class="Account-form__cell">
															<input type="text" id="email_user" autocomplete="off"
																maxlength="50" class="Account-form__input"
																style="width: 120px;"><span> @ </span><input
																type="text" id="email_host" class="Account-form__input"
																autocomplete="off" value="" style="width: 120px;"><span>
															</span><select id="email_host_select"
																class="Account-form__select"
																style="float: right; width: 120px;">
																<option value="">직접입력</option>
																<option value="naver.com">naver.com</option>
																<option value="daum.net">daum.net</option>
																<option value="hanmail.net">hanmail.net</option>
																<option value="hotmail.com">hotmail.com</option>
																<option value="nate.com">nate.com</option>
																<option value="yahoo.co.kr">yahoo.co.kr</option>
																<option value="paran.com">paran.com</option>
																<option value="empas.com">empas.com</option>
																<option value="dreamwiz.com">dreamwiz.com</option>
																<option value="freechal.com">freechal.com</option>
																<option value="lycos.co.kr">lycos.co.kr</option>
																<option value="korea.com">korea.com</option>
																<option value="gmail.com">gmail.com</option>
																<option value="hanmir.com">hanmir.com</option>
															</select>
														</div>
													</div>
													<div class="Account-form__row Account-form__row--email">
														<div class="Account-form__cell">
															<label for="email_user" class="Account-form__label">이메일 인증</label>
														</div>
														<input type="text" id="email_user" autocomplete="off"
																maxlength="50" class="Account-form__input"
																style="width: 275px;">
														<button class="btn btn-white-blue" type="button">인증번호 요청</button>
															
													</div>
												</div>
											</div>
											<button
												class="Account-form__submit btn btn-blue btn-lg border-radius-large"
												style="font-size:15px; display: block; width: 236px; margin-right: auto; margin-left: auto;">일반
												회원가입</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>

</body>
</html>