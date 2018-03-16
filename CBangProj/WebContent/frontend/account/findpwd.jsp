<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="findpwd" class="modal fade" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true">
	<div class="dabang-modal" style="display: block;">
		<div class="dabang-modal-bg" onclick="location.href='javascript:findpwdclose()'" data-dismiss="modal"></div>
		<div class="dabang-modal-dialog"
			style="width: 370px; height: 280px; padding-right: 15px; padding-left: 15px;">
			<div class="dabang-modal-frame">
				<div class="dabang-modal-content">
					<div class="dabang-modal-header">
						<i class="fas fa-times" onclick="location.href='javascript:findpwdclose()'"  data-dismiss="modal"
								style="cursor: pointer; color: white; font-size: 19px; display: inline-block; position: absolute; top: -27px; right: -25px;"
								aria-label="팝업 닫기"> </i>
					</div>
					<div class="dabang-modal-body">
						<div class="Account" id="account">
							<h1 class="Account-title">비밀번호 찾기</h1>
							<div class="Account-body">
								<div class="ForgotPassword">
									<p class="ForgotPassword-message" style="color: inherit;">가입한
										이메일 정보 입력 후 인증 메일 받기를 클릭하세요!</p>
									<form class="Account-form">
										<div class="Account-form__row">
											<div class="Account-form__cell">
												<label class="Account-form__label" for="pw_email">이메일</label>
											</div>
											<div class="Account-form__cell">
												<input class="Account-form__input" id="pw_email" type="text">
											</div>
										</div>
										<button style="font-size: 15px"
											class="Account-form__submit btn btn-blue btn-lg border-radius-large">인증메일
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

