<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal" id="modelContact">
	<div class="nbang-modal" style="display:block;">
		<div class="nbang-modal-bg"></div>
	<c:if test="${roomDetail.trade_type == '직거래'}" var="contactFlag">
		<div class="nbang-modal-dialog" style="width: 354px; height: 456px; padding-right: 0px; padding-left: 0px;">
			<div class="nbang-modal-frame">
				<div class="nbang-modal-content">
					<div class="nbang-modal-header">
						<i class="nbang-icon-remove icon-size-2xl fas fa-times" style="cursor:pointer;" aria-label="팝업 닫기"></i>
					</div>
					<div class="nbang-modal-body">
						<div class="Enquiry">					
							<h2 class="screen-reader-only">문의하기</h2>
							<div class="Enquiry-profile">
								<div class="Enquiry-title">
									<p>
										<span class="text">개인이 직접 등록한 직거래 매물입니다.</span>
									</p>
								</div>
								<div class="Profile Profile--default">
									<div class="Profile-img"></div>
									<div class="Profile-img"></div><!-- style="background-image:url();" -->
								</div>
								<div class="agent-profile-wrap clearfix">
									<div class="profile-name">
										<div class="agent-name-wrap">
											<span class="name">${roomDetail.name}</span><br>
											<span class="number">
												<span>연락처 : </span>
												<span>${roomDetail.phone}</span>
											</span>
										</div>
										<div class="seq-wrap">
											<span>[ 매물 번호 </span>
											<span class="seq">${roomDetail.room_no}</span>
											<span> ]</span>
										</div>
									</div>
								</div>
								<div class="line"></div>
								<div class="Enquiry-contact">
									<h2 class="EnquiryContact-title">
										<span class="dot">·</span>
										<span> 직거래 시 주의사항</span>
									</h2>
									<div class="EnquiryContact-description">
										<span>- 수수료가 발생하지 않습니다.</span><br>
										<span>- 계약금은 주인 명의의 통장으로 계좌이체해주세요.</span><br>
										<span>- 대법원 인터넷등기소에서 등기부등본을 열람해 보세요.</span><br>
										<span style="letter-spacing:-1px;">- 해당 동사무소에 가셔서 전입신고 및 확정일자를 받으세요.</span><br>
										<span>- 보증금, 계약조건 등을 잘 확인 해 주세요.</span><br>
										<span class="additional-description" style="font-size:12px;">
											<i class="icon fas fa-exclamation-circle"></i>
											<span> </span>
											<span>개인과의 직거래 시 언제나 안전에 유의해주세요.</span>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${not contactFlag}">
		<div class="nbang-modal-dialog" style="width: 354px; height: 610px; padding-right: 0px; padding-left: 0px;">
			<div class="nbang-modal-frame">
				<div class="nbang-modal-content">
					<div class="nbang-modal-header">
						<i class="nbang-icon-remove icon-size-2xl fas fa-times" style="cursor:pointer;" aria-label="팝업 닫기"></i>
					</div>
					<div class="nbang-modal-body">
						<div class="Enquiry">					
							<h2 class="screen-reader-only">문의하기</h2>
							<div class="Enquiry-profile">
								<div class="Enquiry-title">
									<p>
										<span class="text">
											<span>연락 시</span>
											<span> </span>
											<span style="color:#3b8de0;">[N방]</span>
											<span>에서 보고 연락한다고</span>
											<span> </span>
										</span><br>
										<span>말씀하시면 더욱 빠르게 상담 받을 수 있습니다.</span>
									</p>
								</div>
								<div class="Profile Profile--default">
									<div class="Profile-img"></div>
									<div class="Profile-img"></div>
								</div>
								<div class="agent-profile-wrap clearfix">
									<div class="profile-name">
										<div class="agent-name-wrap">
											<div class="Enquiry-name">
												<span class="name">
													<span>담당 : </span>
													<span>${roomDetail.name}</span>
													<span> </span>
													<span>${roomDetail.job}</span>
												</span><br>												
											</div>
											<span class="number">
												<span>연락처 : </span>
												<span>${roomDetail.phone}</span>
											</span>
										</div>
										<div class="seq-wrap">
											<span>[ 매물 번호 </span>
											<span class="seq" id="room_no">${roomDetail.room_no}</span>
											<span> ]</span>
										</div>
									</div>
								</div>
								<div class="agent-info-wrap">
									<table class="agent-info">
										<tbody>
											<tr>
												<th>중개사명</th>
												<td>${officeInfo.office_name}</td>
											</tr>
											<tr>
												<th>대표명</th>
												<td>${officeInfo.represent}</td>
											</tr>
											<tr>
												<th>대표번호</th>
												<td>${officeInfo.office_phone}</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="line"></div>
								<div class="Enquiry-contact">
									<h2 class="EnquiryContact-title">
										<span class="dot">·</span>
										<span> 연락요청하기</span>
									</h2>
									<form onsubmit="return false;">
										<div class="EnquiryContact-form clearfix">
											<input class="form-control" placeholder="연락처를 남겨주시면, 매물정보 확인 후 연락드립니다." type="tel" style="font-size: 13px;" id="contact_info">
											<p class="additional-description">
												<i class="icon fas fa-exclamation-circle"></i>
												<span>중개사와의 거래 시 수수료가 발생하니 참고하세요.</span>
											</p>
											<button class="btn btn-blue" id="contactBtn">연락받기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</c:if>
	</div>
	<div id="member_no" hidden="">${requestScope.member_no}</div>
</div>
