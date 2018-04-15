<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 폼 -->
<div class="modal" id="modalLogin">
	<div class="nbang-modal" style="display:block;">
		<div class="nbang-modal-bg"></div>
		<div class="nbang-modal-dialog" style="width: 355px; height: 459px; padding-right: 15px; padding-left: 15px;">
			<div class="nbang-modal-frame">
				<div class="nbang-modal-content">
					<div class="nbang-modal-header">
						<i class="nbang-icon-remove icon-size-2xl fas fa-times" style="cursor:pointer;" aria-label="팝업 닫기"></i>
					</div>
					<div class="nbang-modal-body">
						<div id="account" class="Account">
							<h1 class="Account-title" style="margin-top: 20px">로그인</h1>
							<div class="Account-body">
								<div class="Login">
									<form class="Account-form" id="loginForm" onsubmit="return false;">
										<div class="Account-form__row">
											<div class="Account-form__cell">
												<label for="account_email" class="Account-form__label">이메일</label>
											</div>
											<div class="Account-form__cell">
												<input type="text" id="account_email" class="Account-form__input" name="email">
											</div>
										</div>
										<div class="Account-form__row">
											<div class="Account-form__cell">
												<label for="account_password" class="Account-form__label">비밀번호</label>
											</div>
											<div class="Account-form__cell">
												<input type="password" id="account_password" class="Account-form__input" autocomplete="off" name="password">
											</div>
										</div>
										<button class="Account-form__submit btn-pink btn-lg btn-full" id="login">로그인</button>
									</form>
									<div class="Login-auth">
										<button class="Login-auth__item btn-no-border btn-no-bg">비밀번호 찾기</button>
										<button class="Login-auth__item btn-no-border btn-no-bg">일반 회원가입</button>
									</div>
									<div class="Login-sns">
										<!-- <button class="Login-sns__btn btn-kakao">카카오톡 로그인</button> -->
										<button class="Login-sns__btn btn-facebook">관리자 로그인</button>										
									</div>
									<div class="Login-pro_register">
										<a href="<c:url value='/frontend/account/PLoginTerms.jsp'/>" target="_blank">
											<i class="Login-pro_register__icon"></i>
											<span> 공인중개사 회원가입</span>
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