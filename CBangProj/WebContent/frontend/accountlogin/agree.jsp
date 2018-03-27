<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 이용약관 동의 -->
<div class="modal" id="agree">
	<div class="nbang-modal" style="display:block;">
		<div class="nbang-modal-bg"></div>
		<div class="nbang-modal-dialog" style="width: 520px; height: 613px; padding-right: 20px; padding-left: 20px;">
			<div class="nbang-modal-frame">
				<div class="nbang-modal-content">
					<div class="nbang-modal-header"></div>
					<div class="nbang-modal-body">
						<div id="accountAgree" class="Account">
							<h1 class="Account-title" style="margin-top: 20px">약관동의</h1>
							<div class="Account-body">
								<div class="Agreement">
									<div class="Agreement-terms">
										<h2 class="Agreement-terms__title">
											<span>N방 서비스 이용약관 동의</span><em> (필수)</em>
										</h2>
										<label class="Checkbox Checkbox--chk" style="float:right;">
											<i class="nbang-icon fas fa-check" style="color:#d1d1d1;"></i>
											<input type="checkbox" class="Checkbox-input" style="float:right;">
											<span class="Checkbox-label">동의</span>
										</label>
										<iframe src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A7%E1%86%AB3_170515_%E1%84%83%E1%85%A1%E1%84%87%E1%85%A1%E1%86%BC_%E1%84%89%E1%85%A5%E1%84%87%E1%85%B5%E1%84%89%E1%85%B3%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%8B%E1%85%A3%E1%86%A8%E1%84%80%E1%85%AA%E1%86%AB.html" scrolling="yes" width="100%" height="88px" frameborder="0" allowtransparency="true" class="Agreement-terms__desc"></iframe>
									</div>
									<div class="Agreement-terms">
										<h2 class="Agreement-terms__title">
											<span>개인정보 수집 및 이용에 대한 동의</span><em> (필수)</em>
										</h2>
										<label class="Checkbox Checkbox--chk" style="float:right;">
											<i class="nbang-icon fas fa-check" style="color:#d1d1d1;"></i>
											<input type="checkbox" class="Checkbox-input" style="float:right;">
											<span class="Checkbox-label">동의</span>
										</label>
										<iframe src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A7%E1%86%AB3_170320_%E1%84%83%E1%85%A1%E1%84%87%E1%85%A1%E1%86%BC_%E1%84%80%E1%85%A2%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%87%E1%85%A9+%E1%84%89%E1%85%AE%E1%84%8C%E1%85%B5%E1%86%B8+%E1%84%86%E1%85%B5%E1%86%BE+%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%AD%E1%86%BC+%E1%84%8B%E1%85%A3%E1%86%A8%E1%84%80%E1%85%AA%E1%86%AB(%E1%84%83%E1%85%A1%E1%84%87%E1%85%A1%E1%86%BC).html" scrolling="yes" width="100%" height="88px" frameborder="0" allowtransparency="true" class="Agreement-terms__desc"></iframe>
									</div>
									<div class="Agreement-terms">
										<h2 class="Agreement-terms__title">
											<span>위치기반서비스 이용 동의</span><em> (필수)</em>
										</h2>
										<label class="Checkbox Checkbox--chk" style="float:right;">
											<i class="nbang-icon fas fa-check" style="color:#d1d1d1;"></i>
											<input type="checkbox" class="Checkbox-input" style="float:right;">
											<span class="Checkbox-label">동의</span>
										</label>
										<iframe src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A7%E1%86%AB3_170320_%E1%84%83%E1%85%A1%E1%84%87%E1%85%A1%E1%86%BC_%E1%84%8B%E1%85%B1%E1%84%8E%E1%85%B5%E1%84%80%E1%85%B5%E1%84%87%E1%85%A1%E1%86%AB%E1%84%89%E1%85%A5%E1%84%87%E1%85%B5%E1%84%89%E1%85%B3_%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%8B%E1%85%A3%E1%86%A8%E1%84%80%E1%85%AA%E1%86%AB.html" scrolling="yes" width="100%" height="88px" frameborder="0" allowtransparency="true" class="Agreement-terms__desc"></iframe>
									</div>
									<div class="Agreement-terms" style="margin-top:17px;text-align:right;">
										<label class="Checkbox Checkbox--chk">
											<i class="nbang-icon fas fa-check" style="color:#d1d1d1;"></i>
											<input type="checkbox" class="Checkbox-input">
											<span class="Checkbox-label">모두 동의합니다.</span>
										</label>
									</div>
									<div class="Agreement-nav">
										<button class="Agreement-nav__btn btn btn-white-gray btn-lg" data-dismiss="modal" id="cancleBtn">취소</button>
										<button class="Agreement-nav__btn btn btn-default btn-lg" disabled="disabled" id="nextBtn">다음단계</button>
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