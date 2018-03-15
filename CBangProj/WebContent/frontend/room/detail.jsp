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
    <title>C방으로 찜하자!</title>

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
									<span>3555164</span>
								</span>
							</div>
							<div class="index">1 / 15</div>
						</div>
						<div style="overflow: hidden; visibility: visible; position: relative; width: 100%;">
							<div style="overflow: hidden; position: relative; width: 9600px;">
								<div style="float: left; width: 640px; position: relative; left: 0px; transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);" class="photo" data-index="0">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/63b51253-e435-4435-ad49-5b0b9128da0f);"></div>
									<div class="watermark" data-reactid=".0.0.1.0.$=1$63b51253-e435-4435-ad49-5b0b9128da0f:0.1"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -640px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="1">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/5b0cd045-933a-4c6b-991f-5ed4641c97f6);"></div>
									<div class="watermark" data-reactid=".0.0.1.0.$=1$5b0cd045-933a-4c6b-991f-5ed4641c97f6:0.1"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -1280px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="2">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/56424f2c-bfbb-4f11-8a99-f5440e2047fb);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -1920px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="3">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/6761f3c7-8ce7-48df-91f4-e84941eabdd9);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -2560px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="4">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/64372154-0d73-4c4a-8faa-8cac08d51158);"></div>
									<div class="watermark" data-reactid=".0.0.1.0.$=1$64372154-0d73-4c4a-8faa-8cac08d51158:0.1"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -3200px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="5">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/397ca8e6-94bb-49bc-b21e-8190c56551d1);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -3840px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="6">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/138d1efb-cbb0-40df-87f5-d43323469113);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -4480px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="7">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/f4f66f5e-63b5-453c-bb29-0f3c42db5ce6);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -5120px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="8">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/219326cc-735c-45a9-91f7-a10a78fcad4b);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -5760px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="9">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/72c501e0-c0fc-4ce1-9230-99caa52b3bf0);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -6400px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="10">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/165bd632-f2e5-48f0-8536-396dba9df7d3);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -7040px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="11">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/ec5c2c96-9830-465d-8ea6-91ae6e03e44f);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -7680px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="12">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/0bdac4fe-fe27-443b-8d5e-6ac79868b5ec);"></div>
									<div class="watermark" data-reactid=".0.0.1.0.$=1$0bdac4fe-fe27-443b-8d5e-6ac79868b5ec:0.1"></div>
								</div>
									<div style="float: left; width: 640px; position: relative; left: -8320px; transition-duration: 0ms; transform: translate(640px, 0px) translateZ(0px);" class="photo" data-index="13">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/dfdda72d-9e38-45fb-83a4-290304a19d09);"></div>
									<div class="watermark"></div>
								</div>
								<div style="float: left; width: 640px; position: relative; left: -8960px; transition-duration: 0ms; transform: translate(-640px, 0px) translateZ(0px);" class="photo" data-index="14">
									<div class="photo-bg" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/1024/918b4a06-9e5b-4c73-b627-15c97c57a32e);"></div>
									<div class="watermark"></div>
								</div>
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
													<span class="room-types">쓰리룸 전세</span>
													<span class="room-price is-1">
														<span class="price">
															<span>3억1000</span>
															<span class="won" style="margin-left:3px;">만원</span>
														</span>
													</span>
												</span>
											</h2>
										</div>
										<div class="room-description-wrap">
											<div class="title"><p>식송마을 신축 방4개 복층구조 별내IC 인근</p></div>
											<div class="address"><p>경기도 남양주시 별내동</p></div>
										</div>
									</div>
									<div class="room-tag-list-wrap">
										<ul>
											<li class="tag" style="cursor:default;"><span>#주차</span></li>
										</ul>
									</div>
									<div class="room-info-button-wrap clearfix">
										<div class="room-favorite">
											<h2>
												<button class="btn btn-xs border-radius-xsmall btn-default">
													<i class="dabang-icon icon-size-xl fas fa-heart"></i>
													<span class="icon-text">찜</span>
												</button>
											</h2>
										</div>
										<div class="room-report">
											<div class="report">
												<h2>
													<button class="btn btn-xs btn-default border-radius-xsmall">
														<i class="dabang-icon icon-size-2xl fas fa-thumbs-down"></i>
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
									<div class="info">
										<div class="name-wrap">
											<h2>
												<div class="name-agent font-13">대건부동산공인중개사사무소</div>
												<div class="name-agent representative font-13">
													<span>대표: </span><span>송영수</span>
												</div>
												<div class="name">
													<div class="responsibility">[담당자]</div>
													<span>
														<span class="name-staff"><span>송영수</span><span> </span><span>대표</span><span>(</span><span>대표공인중개사</span><span>)</span></span>
													</span>
												</div>
											</h2>
										</div>
										<div class="address-wrap"><span>경기도 남양주시 별내3로 326, 불암타워 104호</span></div>
										<div class="number"><span><span>중개등록번호 </span><span>41360-2018-70004</span></span></div>
									</div>
								</div>
								<p class="agent-notice">
									<i class="icon dabang-icon-exclamation-circle"></i>
									<span>중개사와의 거래 시 수수료가 발생하니 참고하세요.</span>
								</p>
								<div class="contact-view-button-wrap">
									<h2>
										<button class="btn btn-blue btn-md border-radius-xsmall">
											<i class="dabang-icon icon-size-xl fas fa-user"></i>
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
												<col style="width:150px;">
												<col style="width:170px;">
												<col style="width:113px;">
												<col style="width:207px;">
											</colgroup>
											<tbody>
												<tr>
													<th>보증금 / 월세</th>
													<td class="padding">3억1000</td>
													<th>방 종류</th>
													<td>쓰리룸</td>
												</tr>
												<tr>
													<th>해당 층 / 건물 층</th>
													<td class="padding">3층 / 3층</td>
													<th>
														<span>전용 / </span><span>공급</span><span>면적</span>
													</th>
													<td>
														<span>
															<span>153.7</span><span>m</span><sup>2</sup>
														</span>
														<span> / </span>
														<span>
															<span>174.8</span><span>m</span><sup>2</sup>
														</span>
														<p class="pyeong-wrap"><button class="dabang-icon icon-size-4xl btn-pyeong btn-no-border btn-no-bg fas fa-sync-alt"></button></p>
													</td>
												</tr>
												<tr>
													<th>관리비</th>
													<td class="padding">-</td>
													<th>관리비포함항목</th>
													<td>-</td>
												</tr>
												<tr>
													<th>난방종류</th>
													<td class="padding">개별난방</td>
													<th>입주가능일</th>
													<td>즉시 입주</td>
												</tr>
												<tr>
													<th>주차</th>
													<td class="padding">
														<span>가능</span>
														<span> </span>
														<span></span>
													</td>				
													<th>반려동물</th>
													<td>불가능</td>
												</tr>
												<tr>
													<th>엘리베이터</th>
													<td class="padding">있음</td>
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
											<li class="option-item-wrap">
												<span class="option-item option-item-0"></span>
												<span class="name">에어컨</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-1"></span>
												<span class="name">세탁기</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-2"></span>
												<span class="name">침대</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-3"></span>
												<span class="name">책상</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-4"></span>
												<span class="name">옷장</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-5"></span>
												<span class="name">TV</span>
											</li>
											<li class="option-item-wrap">
												<span class="active option-item option-item-6"></span>
												<span class="name active">신발장</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-7"></span>
												<span class="name">냉장고</span>
											</li>
											<li class="option-item-wrap">
												<span class="active option-item option-item-8"></span>
												<span class="name active">가스레인지</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-9"></span>
												<span class="name">인덕션</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-10"></span>
												<span class="name">전자레인지</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-11"></span>
												<span class="name">전자도어락</span>
											</li>
											<li class="option-item-wrap">
												<span class="option-item option-item-12"></span>											
												<span class="name">비데</span>
											</li>
										</ul>
									</div>
								</div>
								<p></p></div>
								<div class="details-description">
									<div class="title-wrap clearfix">
										<div class="title"><h2>상세설명</h2></div>
									</div>
<pre style="font-family:Nanum Gothic,sans-serif;margin-bottom:0;">
신축답게 깔끔하고, 채광도 잘되어 분위기가 화사합니다.
현관은 번호 키이며 입구부터 CCTV 녹화중이라 안전하게 출입할수 있습니다.
1층: 방3개, 거실, 화장실2개, 부엌 등등...
2층: 방1개, 거실, 화장실1개
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
	
	<!-- Footer -->
	<jsp:include page="/frontend/template/Footer.jsp"/>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>     
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>
    <script src="<c:url value='/js/room/detail.js'/>"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7682697ada046b18ac56822b1fa1c14&libraries=services"></script>
    	
</body>
</html>