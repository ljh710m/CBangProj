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
    <!-- Bootstrap theme -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    
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
	
	
	<div class="detail-page">
		<div class="container-fluid">
			<div id="detail-component">
				<div class="detail-wrap">
					<div class="photos">
						<div class="photos-header">
							<div class="seq">
								<span>
									<span>매물번호: </span>
									<span>${roomDetail.room_no}</span>
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
										<c:if test="${roomDetail.trade_type=='직거래'}">
											<li class="tag" style="cursor:default;"><span>#직거래</span></li>
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
												<button class="btn btn-xs border-radius-xsmall btn-default">
													<i class="nbang-icon icon-size-xl fas fa-heart"></i>
													<span class="icon-text">찜</span>
												</button>
											</h2>
										</div>
										<div class="room-report">
											<div class="report">
												<h2>
													<button class="btn btn-xs btn-default border-radius-xsmall">
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
													<td class="padding">${roomDetail.deposit1}</td>
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
													<td class="padding">${roomDetail.floor}층 / ${roomDetail.total_floor}층</td>
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

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>     
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/room/detail.js'/>"></script>    
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7682697ada046b18ac56822b1fa1c14&libraries=services"></script>
    	
</body>
</html>