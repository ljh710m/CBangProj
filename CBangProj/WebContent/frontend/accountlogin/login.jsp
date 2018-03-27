<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 폼 -->
	<div id="modalLogin" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<div class="DBang-modal" style="display: block;">
			<div class="DBang-modal-bg" data-dismiss="modal"></div>
			<div class="DBang-modal-dialog"
				style="width: 355px; height: 460px; padding-right: 15px; padding-left: 15px;">
				<div class="DBang-modal-frame">
					<div class="DBang-modal-content">
						<div class="DBang-modal-header">
							<a class="close"> <i class="fas fa-times modal-icon" data-dismiss="modal"
								style="cursor: pointer; color: white; font-size: 19px; display: inline-block; position: absolute; top: -27px; right: -25px;"
								aria-label="팝업 닫기"> </i>
							</a>
						</div>
						<div class="DBang-modal-body">
							<div id="modalAccount" class="modalmodalAccount">
								<h1 style="margin: 0" class="modalmodalAccount-title">로그인</h1>
								<div class="modalAccount-body">
									<div class="modalLogin">
										<form class="modalAccount-form">
											<div class="modalAccount-form__row">
												<div class="modalAccount-form__cell">
													<label for="modalAccount_email" class="modalAccount-form__label">이메일</label>
												</div>
												<div class="modalAccount-form__cell">
													<input type="text" id="modalAccount_email"
														class="modalAccount-form__input">
												</div>
											</div>
											<div class="modalAccount-form__row">
												<div class="modalAccount-form__cell">
													<label for="modalAccount_password" class="modalAccount-form__label">비밀번호</label>
												</div>
												<div class="modalAccount-form__cell">
													<input type="password" id="modalAccount_password"
														class="modalAccount-form__input" autocomplete="off">
												</div>
											</div>
											<button style="font-size: 17px" type="submit"
												class="modalAccount-form__submit btn-login btn-red border-radius-large btn-full">로그인</button>
										</form>
										<div class="modalLogin-auth">
											<button class="modalLogin-auth__item btn-no-border btn-no-bg"
												data-toggle="modal" data-target="#findpwd">비밀번호
												찾기</button>
											<button class="modalLogin-auth__item btn-no-border btn-no-bg"
												data-toggle="modal" data-target="#agree">일반 회원가입</button>
	
										</div>
										<div class="modalLogin-sns">
											<button style="text-align: center;"
												class="modalLogin-sns__btn btn-kakao">카카오톡 로그인</button>
											<button style="text-align: center;"
												class="modalLogin-sns__btn btn-facebook">페이스북 로그인</button>
										</div>
										<div class="modalLogin-pro_register">
											<a href="//pro.DBangapp.com/#/terms" target="_blank"> <i
												class="modalLogin-pro_register__icon"></i> <span style="">공인중개사
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