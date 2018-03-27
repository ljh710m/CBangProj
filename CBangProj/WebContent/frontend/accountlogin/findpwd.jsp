<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal" id="findpwd">
	<div class="nbang-modal" style="display:block;">
		<div class="nbang-modal-bg"></div>
		<div class="nbang-modal-dialog" style="width: 355px; height: 259px; padding-right: 15px; padding-left: 15px;">
			<div class="nbang-modal-frame">
				<div class="nbang-modal-content">
					<div class="nbang-modal-header">
						<i class="nbang-icon-remove icon-size-2xl fas fa-times" style="cursor:pointer;" aria-label="팝업 닫기"></i>
					</div>
					<div class="nbang-modal-body">
						<div id="accountPwd" class="Account">
							<h1 class="Account-title" style="margin-top: 20px">비밀번호 찾기</h1>
							<div class="Account-body">
								<div class="ForgotPassword">
									<p class="ForgotPassword-message" style="color:inherit;">가입한 이메일 정보 입력 후 인증 메일 받기를 클릭하세요!</p>
									<form class="Account-form">
										<div class="Account-form__row">
											<div class="Account-form__cell">
												<label for="pw_email" class="Account-form__label">이메일</label>
											</div>
											<div class="Account-form__cell">
												<input type="text" id="pw_email" class="Account-form__input">
											</div>
										</div>
										<button class="Account-form__submit btn-pink btn-lg">인증메일 받기</button>
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

