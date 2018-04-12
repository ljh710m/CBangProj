<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
    <title>N방으로 찜하자!</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <%-- <!-- Bootstrap theme -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet"> --%>
    
    <!-- Font Awesome font -->
    <link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">          	
    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">    
    <link href="<c:url value='/css/footer.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/room/detail.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">     
    <link href="<c:url value='/css/room/contact.css'/>" rel="stylesheet">

<style>
	body, html {
    	width: 100%;
    	height: 100%;
	}
</style>
</head>

<body>
	<!-- Navbar -->
	<jsp:include page="/frontend/template/Navbar.jsp"/>

	<div class="modal modal-center fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg modal-center">
			<!-- Modal content-->
			<div class="modal-content modal-lg">
				<div style="width: 630px; height: 5px;">
					<i class="fas fa-times-circle fa-2x close" data-dismiss="modal"></i>
				</div>
				<div class="modal-header"></div>
				<div class="modal-body">
					<div class="firstWrap">
						<div class="modal-terms">
							<strong class="title">매물에 대한 잘못된 정보를 신고해주세요!</strong> <br /> <span>확인
								후 허위매물일 경우 해당 매물은 삭제되거나 이용이 제재됩니다.</span> <br /> <span>허위신고일 시
								신고자는 법적인 책임을 질 수 있습니다.</span> <br /> <span>다방은 자체 검열을 통해 허위매물
								근절에 노력하고 있습니다.</span>
						</div>
					</div>
					<div class="secondWrap">
						<div class="modal-list">
							<h3>
								<span>허위매물 신고 항목</span><strong> (*필수)</strong>
							</h3>
							<ul class="report-list">
								<li class="row-space-2"><span><label
										class="label-checkbox"><input name="check-input" type="checkbox"><span>거래가 완료 된 매물</span></label></span></li>
								<li class="row-space-2"><span><label
										class="label-checkbox"><input name="check-input" type="checkbox"><span>정보가 다른 매물 (가격 / 사진 / 위치 / 옵션
												등)</span></label></span></li>
							</ul>
							<div class="report-msg">
								<textarea class="form-control"
									placeholder="선택 한 항목에 대한 추가 설명을 입력해 주세요."
									style="margin-top: 14px;"></textarea>
							</div>
						</div>
						<div class="report-certification user-report-certification">
							<h3>
								<span>휴대폰 인증</span><strong> (*필수)</strong>
							</h3>
							<em class="em"><span>휴대폰 인증은 허위매물에 대한 확인 절차용으로만 활용
									됩니다.</span><br> <span>신고해 주신 매물이 허위매물로 확인될 경우 베스킨라빈스 기프티콘을
									선물로 발송해 드립니다.</span></em>
							<div class="number-check-wrap">
								<div class="number-wrap">
									<div class="input-wrap">
										<select class="form-control"><option>010</option>
											<option>011</option>
											<option>016</option>
											<option>017</option>
											<option>018</option>
											<option>019</option></select><span class="slush">-</span> <input
											type="number" class="input1 form-control" value=""> <span
											class="slush">-</span> <input type="number"
											class="input1 form-control" value="">
									</div>
									<button id="add-phone" class="btn btn-white-blue">입 력</button>
								</div>
								<div class="confirm-wrap" style="text-align: left;">
									<input id="confirm-phone" class="form-control" type="text">
									<button class="btn btn-white-blue btn-ok">입력번호 확인</button>
								</div>
							</div>
							<div class="clearfix" style="margin-top: 35px;">
								<h3
									style="float: left; display: inline-block; margin: 0px; font-weight: normal;">
									<span>개인정보 수집 및 이용에 대한 동의</span><strong> (*필수)</strong>
								</h3>
								<div id="check-div" style="float: right;">
									<label class="Checkbox Checkbox--chk" value="미동의"><i
										class="fas fa-angle-down fa-2x"
										style="color: #d1d1d1; margin-top: -5px;"></i> <input
										type="checkbox" class="Checkbox-input" shape="chk" label="동의">
										<span class="Checkbox-label">동의</span></label>
								</div>
							</div>
							<div class="report-terms-wrap">
								<p>개인정보의 수집 및 이용에 대한 안내</p>
								<p style="margin-top: 5px;">(주)스테이션3는 다방 서비스 제공을 위해서 아래와 같이
									개인정보를 수집합니다. 정보주체는 본 개인정보의 수집 및 이용에 관한 동의를 거부하실권리가 있으나, 서비스제공에
									필요한 최소한의 개인 정보 이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다.</p>
								<ul style="margin-top: 5px;">
									<li>• 수집하려는 개인 정보 항목: 핸드폰번호</li>
									<li>• 개인정보의 수집 목적: 기프티콘 발송</li>
									<li>• 개인정보의 보유기간: 사용 후 바로삭제</li>
								</ul>
							</div>
							<div class="report-button-wrap">
								<h3 style="margin-bottom: 0;">
									<button class="btn btn-blue btn-xl border-radius-large"
										disabled="true">
										<span class="icon-text">허위매물 신고하기</span>
									</button>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="detail-page">
		<div class="container-fluid">
			<div id="detail-component">
				<div class="detail-wrap">
					<div class="photos">
						<div class="photos-header">
							<div class="seq">
								<span>
									<span>매물번호: </span>
									<span id="room_no">${roomDetail.room_no}</span>
								</span>
							</div>
							<div class="index"><span id="currentIndex">1</span> / <span id="totalIndex">${roomPhotoList.size()}</span></div>
						</div>
						<div style="overflow: hidden; visibility: visible; position: relative; width: 100%;">
							<div style="overflow: hidden; position: relative; width: ${roomPhotoList.size()*640}px;">
						<c:forEach items="${roomPhotoList}" var="item" varStatus="status">
							<c:if test="${status.first}" var="firstFlag">
								<div style="float: left; width: 640px; position: relative; left: ${status.index*(-640)}px; transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);" class="photo" data-index="${status.count}">
									<div class="photo-bg" style="background-image:url(<c:url value='/Upload/${item.stored_file_name}'/>);"></div>
									<div class="watermark"></div>
								</div>					
							</c:if>
							<c:if test="${status.last}" var="lastFlag">
								<div style="float: left; width: 640px; position: relative; left: ${status.index*(-640)}px; transition-duration: 0ms; transform: translate(-640px, 0px) translateZ(0px);" class="photo" data-index="${status.count}">
									<div class="photo-bg" style="background-image:url(<c:url value='/Upload/${item.stored_file_name}'/>);"></div>
									<div class="watermark"></div>
								</div>					
							</c:if>
							<c:if test="${not firstFlag and not lastFlag}">
								<div style="float: left; width: 640px; position: relative; left: ${status.index*(-640)}px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="${status.count}">
									<div class="photo-bg" style="background-image:url(<c:url value='/Upload/${item.stored_file_name}'/>);"></div>
									<div class="watermark"></div>
								</div>
							</c:if>								
						</c:forEach>								
							</div>
						</div>
						<div class="prev"><button class="arrow btn-no-border btn-no-bg"></button></div>
						<div class="next"><button class="arrow btn-no-border btn-no-bg"></button></div>
					</div>
					<div class="infos">
						<div>
							<div class="room-info-wrap clearfix">
								<div class="room-info-inner">
									<div class="room-info">
										<div class="room-type-wrap">
											<h2>
												<span class="room-title">												
													<span class="room-types">${roomDetail.room_type} ${roomDetail.rent_type}</span>
												<c:if test="${roomDetail.rent_type == '전세'}" var="rentTypeFlag1">
													<span class="room-price is-1">
														<span class="price">										
															<span>${roomDetail.deposit1}</span>
														</span>
														<span class="won" style="margin-left:3px;">만원</span>
													</span>
												</c:if>
												<c:if test="${not rentTypeFlag1}">
													<span class="room-price is-0">
														<span class="price">														
															<span>${roomDetail.deposit2}/${roomDetail.month_price}</span>
														</span>
														<span class="won" style="margin-left:3px;">만원</span>
													</span>										
												</c:if>
												</span>
											</h2>
										</div>
										<div class="room-description-wrap">
											<div class="title"><p>${roomDetail.room_title}</p></div>
											<div class="address"><p>${roomDetail.sido} ${roomDetail.sigungu} ${roomDetail.bname}</p></div>
										</div>
									</div>
									<div class="room-tag-list-wrap">
										<ul>
										<c:if test="${roomDetail.trade_type=='직거래'}" var="tradeTag">
											<li class="tag" style="cursor:default;"><span>#직거래</span></li>
										</c:if>
										<c:if test="${not tradeTag}">
											<li class="tag" style="cursor:default;"><span>#중개</span></li>
										</c:if>
										<c:if test="${roomDetail.short_term}">
											<li class="tag" style="cursor:default;"><span>#단기가능</span></li>
										</c:if>
										<c:if test="${roomDetail.parking}">
											<li class="tag" style="cursor:default;"><span>#주차</span></li>
										</c:if>
										<c:if test="${roomDetail.pat}">
											<li class="tag" style="cursor:default;"><span>#반려동물</span></li>
										</c:if>											
										</ul>
									</div>
									<div class="room-info-button-wrap clearfix">
										<div class="room-favorite">
											<h2>
											<c:if test="${roomDetail.favorite}" var="favoriteFlag">
												<button class="btn btn-xs border-radius-xsmall btn-default active" id="favorite">
											</c:if>
											<c:if test="${not favoriteFlag}">
												<button class="btn btn-xs border-radius-xsmall btn-default" id="favorite">
											</c:if>													
													<i class="nbang-icon icon-size-xl fas fa-heart"></i>
													<span class="icon-text">찜</span>
												</button>
											</h2>
										</div>
										<div class="room-report">
											<div class="report">
												<h2>
													<button class="btn btn-xs btn-default border-radius-xsmall" id="declaration" data-toggle="modal" data-target="#myModal">
														<i class="nbang-icon icon-size-2xl fas fa-thumbs-down"></i>
														<span class="icon-text">신고</span>
													</button>
												</h2>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="agent-info">
								<div class="user-info-wrap">
									<div class="info" style="margin-bottom: 10px;">
									<c:if test="${roomDetail.trade_type == '직거래'}" var="agentFlag">
										<div class="name-wrap">
											<h2>
												<span class="name-agent">${roomDetail.name}</span>
											</h2>
										</div>
									</c:if>
									<c:if test="${not agentFlag}">
										<div class="name-wrap">
											<h2>
												<div class="name-agent font-13">${officeInfo.office_name}</div>
												<div class="name-agent representative font-13">
													<span>대표: </span><span>${officeInfo.represent}</span>
												</div>
												<div class="name">
													<div class="responsibility">[담당자]</div>
													<span>
														<span class="name-staff">
															<span>${roomDetail.name}</span>
															<span> </span>
															<span>${roomDetail.job}</span>
														</span>
													</span>
												</div>
											</h2>
										</div>
										<div class="address-wrap"><span>${officeInfo.address}</span></div>
										<div class="number"><span><span>중개등록번호 </span><span>${officeInfo.office_no}</span></span></div>										
									</c:if>
									</div>
								</div>
								<p class="agent-notice" >
									<i class="icon fas fa-exclamation-circle"></i>
								<c:if test="${agentFlag}">
									<span>개인과의 직거래 시 언제나 안전에 유의해주세요.</span>
								</c:if>
								<c:if test="${not agentFlag}">
									<span style="font-size: 10px;">중개사와의 거래 시 수수료가 발생하니 참고하세요.</span>	
								</c:if>									
								</p>
								<div class="contact-view-button-wrap">
									<h2>
										<button class="btn btn-blue btn-md border-radius-xsmall" id="contactButton">
											<i class="nbang-icon icon-size-xl fas fa-user"></i>
											<span class="icon-text">연락처 보기</span>
										</button>
									</h2>
								</div>
							</div>							
						</div>
					</div>
					<div class="details clearfix">
						<div class="details-inner clearfix">
							<div class="detail-content-left">
								<div class="details-room-info">
									<div class="title-wrap clearfix">
										<div class="title"><h2>매물정보</h2></div>
									</div>
									<div class="detail-content">
										<div></div>
										<table>
											<caption class="caption">매물 정보</caption>
											<colgroup>
												<col style="width:155px;">
												<col style="width:170px;">
												<col style="width:113px;">
												<col style="width:207px;">
											</colgroup>
											<tbody>
												<tr>
												<c:if test="${roomTradeType.size() != 0}" var="tradeTypeFlag">
													<th>보증금 / 월세 (조절가능)</th>
												</c:if>
												<c:if test="${not tradeTypeFlag}">
													<th>보증금 / 월세</th>
												</c:if>
											<c:if test="${roomDetail.rent_type == '전세'}" var="rentTypeFlag2">
												<c:if test="${roomDetail.deposit2 != ''}">
													<td class="padding">
													<c:if test="${tradeTypeFlag}">
														<div class="price-info">
															<span class="one-price">${roomDetail.deposit1}</span>
															<ul class="list-wrap" hidden="">
																<li class="item">${roomDetail.deposit1}</li>															
														<c:forEach items="${roomTradeType}" var="item">
															<c:if test="${item.deposit1==null}" var="depositFlag">
																<li class="item">${item.deposit2}/${item.month_price}</li>
															</c:if>
															<c:if test="${not depositFlag}">
																<li class="item">${item.deposit1}</li>
															</c:if>							
														</c:forEach>
															</ul>
															<p class="nbang-icon fas fa-plus-square" id="price_info"></p>
														</div>
													</c:if>
													<c:if test="${not tradeTypeFlag}">
														${roomDetail.deposit1}														
													</c:if>
													</td>		
												</c:if>
													<%-- <td class="padding">${roomDetail.deposit1}</td> --%>
											</c:if>
												<c:if test="${not rentTypeFlag2}">
													<td class="padding">
													<c:if test="${tradeTypeFlag}">
														<div class="price-info">
															<span class="one-price">${roomDetail.deposit2}/${roomDetail.month_price}</span>
															<ul class="list-wrap" hidden="">
																<li class="item">${roomDetail.deposit2}/${roomDetail.month_price}</li>															
														<c:forEach items="${roomTradeType}" var="item">
															<c:if test="${item.deposit1==null}" var="depositFlag">
																<li class="item">${item.deposit2}/${item.month_price}</li>
															</c:if>
															<c:if test="${not depositFlag}">
																<li class="item">${item.deposit1}</li>
															</c:if>							
														</c:forEach>
															</ul>
															<p class="nbang-icon fas fa-plus-square" id="price_info"></p>
														</div>
													</c:if>
													<c:if test="${not tradeTypeFlag}">
														${roomDetail.deposit2}/${roomDetail.month_price}														
													</c:if>
													</td>													
												</c:if>																					
													<th>방 종류</th>
													<td>${roomDetail.room_type}</td>
												</tr>
												<tr>
													<th>해당 층 / 건물 층</th>
												<c:if test="${roomDetail.floor==0}" var="floorFlag">
													<td class="padding">옥탑 / ${roomDetail.total_floor}층</td>
												</c:if>
												<c:if test="${not floorFlag and roomDetail.floor==-1}" var="floorFlag">
													<td class="padding">반지층 / ${roomDetail.total_floor}층</td>
												</c:if>
												<c:if test="${not floorFlag}">
													<td class="padding">${roomDetail.floor}층 / ${roomDetail.total_floor}층</td>
												</c:if>
													<th>
														<span>전용 / </span><span>공급</span><span>면적</span>
													</th>
													<td>
														<span>
															<span id="area">${roomDetail.area}</span><span>P</span>
														</span>
														<span> / </span>
														<span>
															<span id="total_area">${roomDetail.total_area}</span><span>P</span>
														</span>
														<p class="pyeong-wrap"><button class="nbang-icon btn-pyeong btn-no-border btn-no-bg fas fa-sync-alt"></button></p>
													</td>
												</tr>
												<tr>
													<th>관리비</th>
												<c:if test="${roomDetail.common_charge==null}" var="chargeFlag1">												
													<td class="padding">-</td>
												</c:if>
												<c:if test="${not chargeFlag1}">
													<td class="padding">${roomDetail.common_charge} 만원</td>
												</c:if>																										
													<th>관리비포함항목</th>
												<c:if test="${roomDetail.charge_list==null}" var="chargeFlag2">												
													<td>-</td>
												</c:if>
												<c:if test="${not chargeFlag2}">
													<td>${roomDetail.charge_list}</td>
												</c:if>
												</tr>
												<tr>
													<th>난방종류</th>
													<td class="padding">${roomDetail.heating}</td>
													<th>입주가능일</th>
													<td>${roomDetail.move_date}</td>
												</tr>
												<tr>
													<th>주차</th>
													<td class="padding">
													<c:if test="${roomDetail.parking}" var="parkingFlag">
														<span>가능</span>
													</c:if>
													<c:if test="${not parkingFlag}">
														<span>불가능</span>
													</c:if>
														<span></span>
														<span></span>
													</td>				
													<th>반려동물</th>
													<c:if test="${roomDetail.pat}" var="patFlag">
														<td>가능</td>
													</c:if>
													<c:if test="${not patFlag}">
														<td>불가능</td>
													</c:if>
												</tr>
												<tr>
													<th>엘리베이터</th>
													<td class="padding">${roomDetail.elevator}</td>
													<th></th>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="details-option">
								<div class="title-wrap clearfix">
								<div class="title"><h2>옵션</h2></div>
								</div>
								<p></p>
								<div>
									<div class="contents">
										<ul>
									<c:forEach items="${roomOption}" var="item" varStatus="status">
										<c:if test="${item.check}" var="roomOptionFlag">
											<li class="option-item-wrap">
												<span class="active option-item option-item-${status.index}"></span>
												<span class="name active">${item.name}</span>
											</li>
										</c:if>
										<c:if test="${not roomOptionFlag}">
											<li class="option-item-wrap">
												<span class="option-item option-item-${status.index}"></span>
												<span class="name">${item.name}</span>
											</li>
										</c:if>	
									</c:forEach>											
										</ul>
									</div>
								</div>
								<p></p></div>
								<div class="details-description">
									<div class="title-wrap clearfix">
										<div class="title"><h2>상세설명</h2></div>
									</div>
<pre style="font-family:Nanum Gothic,sans-serif;margin-bottom:0;">
${roomDetail.room_desc}
</pre>
								</div>
							</div>
						</div>
					</div>
					<div class="neighborhood">
						<div class="neighborhood-inner">
							<div class="title-wrap clearfix">
								<div class="title">
									<h2>위치 및 주변 편의시설</h2>
								</div>
							</div>
							<div class="map-container">
								<div id="map-canvas">
									<div class="map-content" style="position:relative;margin-top:1px;">
										<div id="marker-alert"></div>
										
										<div></div>
										<div id="map"></div>
										<div class="map-footer">									
											<div class="menus">
												<ul>
													<li>
														<div class="menu menu--0 active">
															<span class="menu-text">지하철</span>
														</div>
													</li>
													<li>
														<div class="menu menu--1 active">
															<span class="menu-text">편의점</span>
														</div>
													</li>
													<li>
														<div class="menu menu--2 active">
															<span class="menu-text">카페</span>
														</div>
													</li>
													<li>
														<div class="menu menu--3 active">
															<span class="menu-text">은행</span>
														</div>
													</li>
													<li>
														<div class="menu menu--4 active">
															<span class="menu-text">관공서</span>
														</div>
													</li>
												</ul>
												<div>
													<i class="icon-black-arrow "></i>
													<div class="message">클릭하시면 주변 편의시설을 확인할 수 있어요!</div>
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
		</div>
    </div>
	<jsp:include page="/frontend/room/contact.jsp"/>
	<!-- Footer -->
	<jsp:include page="/frontend/template/Footer.jsp"/>
	
	<input type="hidden" id="lat" value="${roomDetail.lat}">
	<input type="hidden" id="lng" value="${roomDetail.lng}">
	<input type="hidden" id="froom_no" value="${roomDetail.room_no}">	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>     
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/room/detail.js'/>"></script>
    <script src="<c:url value='/js/room/detail_modal.js'/>"></script>    
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7682697ada046b18ac56822b1fa1c14&libraries=services"></script>
    	
</body>
</html>