<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 폼 -->
<link href="<c:url value='/css/account/agree.css'/>" rel="stylesheet">
	<div id="login" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<div class="CBang-modal" style="display: block;">
			<div class="CBang-modal-bg" data-dismiss="modal"></div>
			<div class="CBang-modal-dialog"
				style="width: 355px; height: 470px; padding-right: 15px; padding-left: 15px;">
				<div class="CBang-modal-frame">
					<div class="CBang-modal-content">
						<div class="CBang-modal-header">
							<a class="close"> <i class="fas fa-times" data-dismiss="modal"
								style="cursor: pointer; color: white; font-size: 19px; display: inline-block; position: absolute; top: -27px; right: -25px;"
								aria-label="팝업 닫기"> </i>
							</a>
						</div>
						<div class="CBang-modal-body">
							<div id="account" class="Account">
								<h1 class="Account-title">로그인</h1>
								<div class="Account-body">
									<div class="Login">
										<form class="Account-form">
											<div class="Account-form__row">
												<div class="Account-form__cell">
													<label for="account_email" class="Account-form__label">이메일</label>
												</div>
												<div class="Account-form__cell">
													<input type="text" id="account_email"
														class="Account-form__input">
												</div>
											</div>
											<div class="Account-form__row">
												<div class="Account-form__cell">
													<label for="account_password" class="Account-form__label">비밀번호</label>
												</div>
												<div class="Account-form__cell">
													<input type="password" id="account_password"
														class="Account-form__input" autocomplete="off">
												</div>
											</div>
											<button style="font-size: 17px" type="submit"
												class="Account-form__submit btn btn-red border-radius-large btn-full">로그인</button>
										</form>
										<div class="Login-auth">
											<button class="Login-auth__item btn-no-border btn-no-bg"
												data-toggle="modal" data-target="#findpwd">비밀번호
												찾기</button>
											<button class="Login-auth__item btn-no-border btn-no-bg"
												data-toggle="modal" data-target="#agree">일반 회원가입</button>
	
										</div>
										<div class="Login-sns">
											<button style="text-align: center;"
												class="Login-sns__btn btn-kakao">카카오톡 로그인</button>
											<button style="text-align: center;"
												class="Login-sns__btn btn-facebook">페이스북 로그인</button>
										</div>
										<div class="Login-pro_register">
											<a href="//pro.CBangapp.com/#/terms" target="_blank"> <i
												class="Login-pro_register__icon"></i> <span style="">공인중개사
													회원가입</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>