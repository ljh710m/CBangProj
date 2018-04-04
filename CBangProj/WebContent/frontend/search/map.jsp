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
        
    <!-- Font Awesome font -->
    <link href="<c:url value='/vendor/fontawesome/css/fa-regular.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">          	
    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/search/map.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">

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
	
	<div class="contatiner-fluid">
		<div id="search-component">
			<div class="contatiner-fluid">
				<div class="filter clearfix">
					<div class="filter-dash"></div>
					<div class="filter-dropdown">
						<div class="title" title="매물종류">
							<h2 class="name">매물종류</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:146px;">
							<div class="filter-item deal-type detail-content">
								<div class="popup-title">
									<span>매물종류</span>
								</div>
								<div>
									<label class="checkbox-wrap clearfix">
										<input class="checkbox" type="checkbox" checked="" value="월세 + 전세" name="check1">
										<span class="name">월세 + 전세</span>
									</label>
									<label class="checkbox-wrap clearfix">
										<input class="checkbox" type="checkbox" value="월세" name="check1">
										<span class="name">월세</span>
									</label>
									<label class="checkbox-wrap clearfix">
										<input class="checkbox" type="checkbox" value="전세" name="check1">
										<span class="name">전세</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="filter-dash"></div>
					<div class="filter-dropdown">
						<div class="title" title="거래종류">
							<h2 class="name">거래종류</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:146px;"><!--  -->
							<div class="filter-item deal-type detail-content">
								<div class="popup-title">
									<span>거래종류</span>
								</div>					
								<div>
									<label class="checkbox-wrap clearfix">
										<input class="checkbox" type="checkbox" checked="" value="전체" name="check2">
										<span class="name">전체</span>
									</label>
									<label class="checkbox-wrap clearfix">
										<input class="checkbox" type="checkbox" value="중개" name="check2">
										<span class="name">중개</span>
									</label>
									<label class="checkbox-wrap clearfix">
										<input class="checkbox" type="checkbox" value="직거래" name="check2">
										<span class="name">직거래</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="filter-dash"></div>
					<div class="filter-dropdown">
						<div class="title" title="방 종류">
							<h2 class="name">
								<span>
									<span>방 종류</span>
									<span class="hidden"></span><!--  -->
								</span>
							</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:146px;"><!--  -->
							<div class="filter-item filter-small-view">
								<div class="popup-title">
									<span>방 종류</span>
								</div>
								<div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="전체" name="check3" checked>
											<span class="name">전체</span>
										</label>
									</div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="원룸" name="check3">
											<span class="name">원룸</span>
										</label>
									</div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="1.5룸" name="check3">
											<span class="name">1.5룸</span>
										</label>
									</div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="투룸" name="check3">
											<span class="name" >투룸</span>
										</label>
									</div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="쓰리룸" name="check3">
											<span class="name">쓰리룸</span>
										</label>
									</div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="오피스텔" name="check3">
											<span class="name">오피스텔</span>
										</label>
									</div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="아파트" name="check3">
											<span class="name">아파트</span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="filter-dash"></div>
					<div class="filter-dropdown">
						<div class="title" title="보증금">
							<h2 class="name">
								<span>
									<span><i class="filter-icon deposit"></i></span>
									<span id="deposit__from">0 만원</span>
									<span class="swing" style="display:inline;margin:0 5px;">~</span>
									<span id="deposit__to">무제한</span>
								</span>
							</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:241px;">
							<div class="filter-item filter-small-view price-filter">
								<div class="popup-title"><span>보증금 가격</span></div>
								<p class="placeholder">보증금 (ex. 10,000만원 = 1억원)</p>
								<input class="input1" type="number" value="0">
								<div class="swing">~</div>
								<input class="input2" type="number" value="999999">
								<div class="price-line"></div>
								<div class="clearfix">
									<div class="price-select-list from">
										<ul class="price-list" id="deposit_from">
											<li class="price-item active"><span>0 만원</span></li>											
											<li class="price-item"><span>100 만원</span></li>
											<li class="price-item"><span>500 만원</span></li>
											<c:forEach var="i" begin="1" end="10">
												<li class="price-item"><span>${i},000 만원</span></li>	
											</c:forEach>
											<li class="price-item"><span>무제한</span></li>
										</ul>
									</div>
									<div class="price-select-list to">									
										<ul class="price-list" id="deposit_to">
											<li class="price-item"><span>0 만원</span></li>
											<li class="price-item"><span>100 만원</span></li>
											<li class="price-item"><span>500 만원</span></li>
											<c:forEach var="i" begin="1" end="10">
												<li class="price-item"><span>${i},000 만원</span></li>	
											</c:forEach>												
											<li class="price-item active"><span>무제한</span></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="filter-dash"></div>
					<div class="filter-dropdown">
						<div class="title" title="월세">
							<h2 class="name">
								<span>
									<span><i class="filter-icon price"></i></span>
									<span id="month__from">0 만원</span>
									<span class="swing" style="display:inline;margin:0 5px;">~</span>
									<span id="month__to">무제한</span>
								</span>
							</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:241px;">
							<div class="filter-item filter-small-view price-filter">
								<div class="popup-title"><span>월세 가격</span></div>								
								<input class="input1" type="number" value="0">
								<div class="swing">~</div>
								<input class="input2" type="number" value="999999">
								<div class="price-line"></div>
								<div class="clearfix">
									<div class="price-select-list from">
										<ul class="price-list" id="month_from">
											<li class="price-item active"><span>0 만원</span></li>
											<c:forEach var="i" begin="1" end="10">
												<li class="price-item"><span>${i}0 만원</span></li>	
											</c:forEach>
											<li class="price-item"><span>무제한</span></li>
										</ul>
									</div>
									<div class="price-select-list to">								
										<ul class="price-list" id="month_to">
											<li class="price-item"><span>0 만원</span></li>											
											<c:forEach var="i" begin="1" end="10">
												<li class="price-item"><span>${i}0 만원</span></li>	
											</c:forEach>									
											<li class="price-item active"><span>무제한</span></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="filter-dash"></div>
					<div class="filter-dropdown">
						<div class="title" title="추가옵션">
							<h2 class="name">
								<span>
									<span>추가옵션</span><span class="hidden"></span><!--  -->
								</span>
							</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:157px;">
							<div class="filter-item deal-type detail-content">
								<div class="popup-title">
									<span>추가옵션</span>
								</div>
								<div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="주차가능" name="option1">
											<span class="name">주차가능</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="반려동물" name="option1">
											<span class="name">반려동물</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="단기임대" name="option1">
											<span class="name">단기임대</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="360도매물" name="option1">
											<span class="name">360도매물</span>
										</label>
									</div>
									<div class="line"></div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="5평 이하" name="option2">
											<span class="name">5평 이하</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="5평 ~ 10평 이하" name="option2">
											<span class="name">5평 ~ 10평 이하</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="10평 이상" name="option2">
											<span class="name">10평 이상</span>
										</label>
									</div>
									<div class="line"></div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="반지층" name="option3">
											<span class="name">반지층</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="저층 1층~3층" name="option3">
											<span class="name">저층 1층~3층</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="중층 4층~6층" name="option3">
											<span class="name">중층 4층~6층</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="고층 7층이상" name="option3">
											<span class="name">고층 7층이상</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="옥탑" name="option3">
											<span class="name">옥탑</span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="SearchForm-wrap search-form-wrap">
					<div class="SearchForm search-form">
						<form>
							<div class="SearchForm-field search-input clearfix">
								<fieldset>
									<legend>방 검색</legend>
									<input type="text" class="SearchForm-input form-control" placeholder="관심지역 또는 매물번호를 검색해보세요" autocomplete="off" style="border-top-right-radius: 0; border-bottom-right-radius: 0">
									<button class="SearchForm-btn btn btn-color btn-search" style="border-top-left-radius: 0; border-bottom-left-radius: 0">
										<i class="dabang-icon icon-size-xl fas fa-search"></i>
										<span class="SearchForm-btn__text">방 검색</span>
									</button>
									<ul class="hidden" tabindex="-1"></ul>							
								</fieldset>
							</div>
						</form>
					</div>
				</div>
				<div class="sub-nab clearfix">
					<ul>
						<li class="map">
							<a href="#" class="active">
								<i class="dabang-icon icon-size-lg fas fa-map"></i>
								<span>지도</span>
							</a>
						</li>
						<li class="list">
							<a href="#" class="">
								<i class="dabang-icon icon-size-lg fab fa-microsoft"></i>
								<span>리스트</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div>
			<div class="contents">
				<div class="map-component">									
					<div class="Map" id="map" style="overflow: hidden;">
						
					</div>
				</div>
				<div class="List list-component map-page">					
					<div class="ListOutWrap">
						<div class="ListInfo room-info clearfix">
							<i class="dabang-icon icon-size-lg fas fa-chevron-right"></i>
							<span class="icon-text">
								<span> </span><span>풍동</span><span> 검색결과 </span><strong>${searchList.size()}</strong><span>개</span>
							</span>
							<i class="dabang-icon dabang-icon-remove icon-size-lg right" style="cursor:pointer;"></i>
						</div>
						<div class="ListWrap list-wrap" style="opacity: 1;">
							<noscript></noscript>
							<div class="AreaRoom new-rooms clearfix">
								<div class="Room-header new-rooms-title">
									<div class="Room-title new-list-rooms-title" >이 지역 주변 방</div>
								</div>
								<ul class="Room-list items">
									<li class="Room-item">
										<a href="<c:url value='/frontend/room/detail.jsp'/>">
											<div class="RoomItem-preview">
												<div class="RoomItem-preview__mask">
													<div class="RoomItem-preview__image"></div>	
													<div class="RoomItem-preview__image" style="background-image:url(https://d1774jszgerdmk.cloudfront.net/512/4e63d31c-41a1-4ef3-974e-2ac88985482f);"></div>
													<div class="RoomItem-preview__cover"></div>
												</div>
											</div>
											<div class="RoomItem-detail">
												<div class="RoomItem-info">
													<div class="RoomItem-header">
														<div class="RoomItem-price">
															<p>
																<span class="RoomItem-price__type">월세</span>
																<span class="RoomsItem-price__title is-0">1억1000/95</span>
															</p>
														</div>
														<span class="room-visited"><i class="dabang-icon"></i></span>
														<div class="RoomItem-icons">
															<span class="room-favorite">
																<i class="dabang-icon icon-size-2xl far fa-heart"></i>
															</span>
														</div>
													</div>
													<span class="RoomItem-summary">
														<span>아파트 </span>
														<span> 18층 </span>
														<span> 144.02m² </span>
														<span> 관리비 32만원</span>
													</span>
													<div class="RoomItem-types types">
														<span class="#직거래 tag">#직거래</span>
														<span class="#주차 tag">#주차</span>
														<span class="#반려동물 tag">#반려동물</span>
													</div>
													<span class="RoomItem-title">큰평형 귀한반전세 월세 네고가능</span>
													<span class="RoomItem-date">2달전</span>
												</div>
												<div class="RoomItem-options">
													<span class="option-list clearfix">
														<span class="title">옵션</span>
														<span class="ellipsis">에어컨, 옷장, 냉장고, 인덕션, 전자도어락</span>
													</span>
												</div>
											</div>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="ListPagination pagination-wrap">
							<ul class="Pagination">
								<li><a class="Pagination-item Pagination-item--prev disable">&lt; PREV</a></li>
								<li><a class="Pagination-item active">1</a></li>
								<li><a class="Pagination-item Pagination-item--next disable">NEXT &gt;</a></li>
							</ul>
						</div>
						<div class="ListLoading" style="opacity: 0; z-index: -1;">
							<div class="ListLoading-bg"></div>
							<div class="ListLoading-icon"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>     
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/search/map.js'/>"></script>     
    <script src="<c:url value='/js/search/googlemaps.js'/>"></script>
    <script src="<c:url value='/vendor/googlemaps/markerclusterer.js'/>"></script>    
    <script 
    src="//maps.googleapis.com/maps/api/js?key=AIzaSyBHqUjETYyMHerCmQT_1u-zEGIT2-7a5_c&callback=initMap"></script>
        

</body>
</html>