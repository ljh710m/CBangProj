<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="findpwd" class="modal fade" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true">
	<div class="pwd-modal" style="display: block;">
		<div class="pwd-modal-bg" onclick="location.href='javascript:findpwdclose()'" data-dismiss="modal"></div>
		<div class="pwd-modal-dialog"
			style="width: 370px; height: 280px; padding-right: 15px; padding-left: 15px;">
			<div class="pwd-modal-frame">
				<div class="pwd-modal-content">
					<div class="pwd-modal-header">
						<i class="fas fa-times" onclick="location.href='javascript:findpwdclose()'"  data-dismiss="modal"
								style="cursor: pointer; color: white; font-size: 19px; display: inline-block; position: absolute; top: -27px; right: -25px;"
								aria-label="팝업 닫기"> </i>
					</div>
					<div class="pwd-modal-body">
						<div class="Accountpwd" id="account">
							<h1 class="Accountpwd-title">비밀번호 찾기</h1>
							<div class="Accountpwd-body">
								<div class="ForgotPassword">
									<p class="ForgotPassword-message" style="color: inherit;">가입한
										이메일 정보 입력 후 인증 메일 받기를 클릭하세요!</p>
									<form class="Accountpwd-form">
										<div class="Accountpwd-form__row">
											<div class="Accountpwd-form__cell">
												<label class="Accountpwd-form__label" for="pw_email">이메일</label>
											</div>
											<div class="Accountpwd-form__cell">
												<input class="Accountpwd-form__input" id="pw_email" type="text">
											</div>
										</div>
										<button style="font-size: 15px"
											class="Accountpwd-form__submit btn-login btn-pink btn-lg border-radius-large">인증메일
											받기</button>
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
</div>

