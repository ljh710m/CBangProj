<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 이용약관 동의 -->
<div id="agree" class="modal fade" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true">
	<div class="agree-modal" style="display: block;">
		<div class="CBang-modal-bg"></div>
		<div class="agree-modal-dialog"
			style="width: 530px; padding-right: 20px; padding-left: 20px; height: 660px;">
			<div class="agree-modal-frame">
				<div class="agree-modal-content">
					<div class="agree-modal-header"></div>
					<div class="agree-modal-body">
						<div id="account" class="Account">
							<h1 class="Account-title">약관동의</h1>
							<div class="Account-body">
								<div class="Agreement">
									<div class="Agreement-terms">
										<h2 class="Agreement-terms__title" style="display: inline">
											<span>다방 서비스 이용약관 동의</span> <em>(필수)</em>
										</h2>
										<label class="Checkbox Checkbox--chk" style="float: right;">
											<i class="fas fa-check" style="color: rgb(209, 209, 209);"></i>
											<input type="checkbox" value="agree1" class="Checkbox-input agreecheck" shape="chk"
											label="동의" style="float: right;"></input> <span
											class="Checkbox-label">동의</span>
										</label>
										<iframe
											src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A7%E1%86%AB3_170515_%E1%84%83%E1%85%A1%E1%84%87%E1%85%A1%E1%86%BC_%E1%84%89%E1%85%A5%E1%84%87%E1%85%B5%E1%84%89%E1%85%B3%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%8B%E1%85%A3%E1%86%A8%E1%84%80%E1%85%AA%E1%86%AB.html"
											scrolling="yes" width="100%" height="88px" frameborder="0"
											allowtransparency="true" class="Agreement-terms__desc">
										</iframe>
									</div>
									<div class="Agreement-terms">
										<h2 class="Agreement-terms__title">
											<span>개인정보 수집 및 이용에 대한 동의</span> <em>(필수)</em>
										</h2>
										<label class="Checkbox Checkbox--chk agreetwo" style="float: right;">
											<i class="fas fa-check" style="color: rgb(209, 209, 209);">
										</i> <input type="checkbox" value="agree2" class="Checkbox-input agreecheck" shape="chk"
											label="동의" style="float: right;"> <span
											class="Checkbox-label">동의</span>
										</label>
										<iframe
											src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A7%E1%86%AB3_170320_%E1%84%83%E1%85%A1%E1%84%87%E1%85%A1%E1%86%BC_%E1%84%80%E1%85%A2%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%87%E1%85%A9+%E1%84%89%E1%85%AE%E1%84%8C%E1%85%B5%E1%86%B8+%E1%84%86%E1%85%B5%E1%86%BE+%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%AD%E1%86%BC+%E1%84%8B%E1%85%A3%E1%86%A8%E1%84%80%E1%85%AA%E1%86%AB(%E1%84%83%E1%85%A1%E1%84%87%E1%85%A1%E1%86%BC).html"
											scrolling="yes" width="100%" height="88px" frameborder="0"
											allowtransparency="true" class="Agreement-terms__desc">
										</iframe>
									</div>
									<div class="Agreement-terms">
										<h2 class="Agreement-terms__title">
											<span>위치기반서비스 이용 동의</span> <em>(필수)</em>
										</h2>
										<label class="Checkbox Checkbox--chk agreethree" style="float: right;">
											<i class="fas fa-check" style="color: rgb(209, 209, 209);">
										</i> <input type="checkbox" value="agree3" class="Checkbox-input agreecheck" shape="chk"
											label="동의" style="float: right;"><span
											class="Checkbox-label">동의</span>
										</label>
										<iframe
											src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A7%E1%86%AB3_170320_%E1%84%83%E1%85%A1%E1%84%87%E1%85%A1%E1%86%BC_%E1%84%8B%E1%85%B1%E1%84%8E%E1%85%B5%E1%84%80%E1%85%B5%E1%84%87%E1%85%A1%E1%86%AB%E1%84%89%E1%85%A5%E1%84%87%E1%85%B5%E1%84%89%E1%85%B3_%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%8B%E1%85%A3%E1%86%A8%E1%84%80%E1%85%AA%E1%86%AB.html"
											scrolling="yes" width="100%" height="88px" frameborder="0"
											allowtransparency="true" class="Agreement-terms__desc">
										</iframe>
									</div>
									<div class="Agreement-terms"
										style="margin-top: 17px; text-align: right;">
										<label class="Checkbox Checkbox--chk"> <i
											class="fas fa-check" style="color: rgb(209, 209, 209);">
										</i> <input type="checkbox" value="allcheck" class="Checkbox-input agreecheck" shape="chk"
											label="모두 동의합니다."> <span class="Checkbox-label">모두
												동의합니다.</span>
										</label>
									</div>
									<div class="Agreement-nav">
										<button style="font-size: 15px;"
											class="Agreement-nav__btn btn-login btn-white-gray btn-lg border-radius-large"
											data-dismiss="modal">취소</button>
										<button disabled="disabled"
											class="Agreement-nav__btn btn-login btn-login-next btn-lg border-radius-large"
											data-toggle="modal" data-target="#accountJoin">다음단계</button>
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