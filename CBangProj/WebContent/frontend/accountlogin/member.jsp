<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal" id="userSignup">
	<div class="nbang-modal" style="display:block;">
		<div class="nbang-modal-bg"></div>
		<div class="nbang-modal-dialog" style="width: 520px; height: 510px; padding-right: 20px; padding-left: 20px;">
			<div class="nbang-modal-frame">
				<div class="nbang-modal-content">
					<div class="nbang-modal-header">
						<i class="nbang-icon-remove icon-size-2xl fas fa-times" style="cursor:pointer;" aria-label="팝업 닫기"></i>
					</div>
					<div class="nbang-modal-body">
						<div id="accountSignup" class="Account">
							<h1 class="Account-title" style="margin-top: 20px">회원가입</h1>
							<div class="Account-body">
								<div class="UserSignup">
									<form class="Account-form" onsubmit="return false;">
										<div class="Account-form__row">
											<div class="Account-form__cell">
												<label for="name" class="Account-form__label">이름</label>
											</div>
											<div class="Account-form__cell">
												<input type="text" id="name" class="Account-form__input" autocomplete="off">
											</div>
										</div>
										<div class="Account-form__row Account-form__row--email">
											<div class="Account-form__cell">
												<label for="email_user" class="Account-form__label">이메일</label>
											</div>
											<div class="Account-form__cell">
												<input type="text" id="email_user" autocomplete="off" maxlength="50" class="Account-form__input" style="width:120px;">
												<span> @ </span>
												<input type="text" id="email_host" class="Account-form__input" autocomplete="off" value="" style="width:120px;">
												<span> </span>
												<select id="email_host_select" class="Account-form__select" style="float:right;width:110px;">
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
										<div class="Account-form__row">
											<div class="Account-form__cell">
												<label for="password" class="Account-form__label">비밀번호</label>
											</div>
											<div class="Account-form__cell">
												<input type="password" id="password" class="Account-form__input" autocomplete="off">
											</div>
										</div>
										<div class="Account-form__row">
											<div class="Account-form__cell">
												<label for="password_confirm" class="Account-form__label">비밀번호 확인</label>
											</div>
											<div class="Account-form__cell">
												<input type="password" id="password_confirm" class="Account-form__input" autocomplete="off">
											</div>
										</div>
										<div class="Account-form__row" style="height:82px;">
											<div>
												<div class="Account-form__row">
													<div class="Account-form__cell">
														<label for="phone_1" class="Account-form__label">핸드폰 번호</label>
													</div>
													<div class="Account-form__cell Account-form__abled">
														<div>
															<select class="Account-form__select" id="phone_1">
																<option value="010">010</option>
																<option value="011">011</option>
																<option value="016">016</option>
																<option value="017">017</option>
																<option value="018">018</option>
																<option value="019">019</option>
															</select>
															<span style="display:inline-block;width:15px;text-align:center;"> - </span>
															<input type="text" id="phone_2" maxlength="4" value="" autocomplete="off" class="Account-form__input">
															<span style="display:inline-block;width:16px;text-align:center;"> - </span>
															<input type="text" id="phone_3" maxlength="4" value="" autocomplete="off" class="Account-form__input">
														</div>
													</div>
													<button class="btn btn-white-blue" type="button" id="authNumber">인증번호 요청</button>
												</div>
												<div class="Account-form__row">
													<div class="Account-form__cell">
														<label class="Account-form__label" style="display:none;">이메일 인증 확인</label>
													</div>
													<div class="Account-form__cell">
														<input type="text" autocomplete="off" value="" class="Account-form__input" style="width:275px;" id="authNumber_confirm">
														<button class="btn btn-white-blue" type="button" id="authCheck">인증번호 확인</button>
													</div>
												</div>
											</div>
										</div>
										<div class="Account-form__row">
											<div class="Account-form__cell">
												<label for="join_path_select" class="Account-form__label">가입 경로</label>
											</div>
											<div class="Account-form__cell">
												<select id="join_path_select" class="Account-form__select">
													<option value="">가입 경로 선택</option>																									
												</select>
											</div>
										</div>
										<button class="Account-form__submit btn btn-pink btn-lg" style="display:block;width:236px;margin-right:auto;margin-left:auto;">일반 회원가입</button>
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
