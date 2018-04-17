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
							<h2 class="name" id="rentTypeTitle">매물종류</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:146px;">
							<div class="filter-item deal-type detail-content">
								<div class="popup-title">
									<span>매물종류</span>
								</div>
								<div>
									<label class="checkbox-wrap clearfix">
									<c:if test="${param['searchOption']!='row'}" var="rowFLag">
										<input class="checkbox" type="checkbox" checked="" value="All" name="check1">
									</c:if>
									<c:if test="${not rowFLag}">
										<input class="checkbox" type="checkbox" value="All" name="check1">
									</c:if>
										<span class="name">월세 + 전세</span>
									</label>
									<label class="checkbox-wrap clearfix">
									<c:if test="${not rowFLag}">									
										<input class="checkbox" type="checkbox" value="월세" name="check1" checked>
									</c:if>
									<c:if test="${rowFLag}">
										<input class="checkbox" type="checkbox" value="월세" name="check1">
									</c:if>
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
							<h2 class="name" id="tradeTypeTitle">거래종류</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:146px;"><!--  -->
							<div class="filter-item deal-type detail-content">
								<div class="popup-title">
									<span>거래종류</span>
								</div>					
								<div>
									<label class="checkbox-wrap clearfix">
									<c:if test="${param['searchOption']=='직거래'}" var="tradeTypeFlag">
										<input class="checkbox" type="checkbox" value="All" name="check2">
									</c:if>
									<c:if test="${not tradeTypeFlag}">
										<input class="checkbox" type="checkbox" checked="" value="All" name="check2">
									</c:if>
										<span class="name">전체</span>
									</label>
									<label class="checkbox-wrap clearfix">
										<input class="checkbox" type="checkbox" value="중개" name="check2">
										<span class="name">중개</span>
									</label>
									<label class="checkbox-wrap clearfix">
									<c:if test="${tradeTypeFlag}">
										<input class="checkbox" type="checkbox" value="직거래" name="check2" checked>
									</c:if>
									<c:if test="${not tradeTypeFlag}">
										<input class="checkbox" type="checkbox" value="직거래" name="check2">
									</c:if>
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
										<c:if test="${param['roomType']!='' and param['searchOption']==''}" var="roomTypeAll">
											<input class="checkbox" type="checkbox" value="All" name="check3">
										</c:if>
										<c:if test="${not roomTypeAll}">
											<input class="checkbox" type="checkbox" value="All" name="check3" checked>
										</c:if>							
											<span class="name">전체</span>
										</label>
									</div>
							<c:if test="${not empty lists.roomTypes}">
								<c:forEach items="${lists.roomTypes}" var="item">
									<div>
										<label class="checkbox-wrap clearfix">
										<c:if test="${param['roomType']==item.room_type}" var="roomTypeFlag">
											<input class="checkbox" type="checkbox" value="${item.rm_type_code}" name="check3" checked>
										</c:if>
										<c:if test="${not roomTypeFlag}">
											<input class="checkbox" type="checkbox" value="${item.rm_type_code}" name="check3">
										</c:if>
											<span class="name">${item.room_type}</span>
										</label>
									</div>									
								</c:forEach>
							</c:if>									
								</div>
							</div>
						</div>
					</div>
					<div class="filter-dash"></div>
					<div class="filter-dropdown">
						<div class="title" title="보증금">
							<h2 class="name">
								<span>
									<span><i class="filter-icon deposit" id="iconType"></i></span>
									<span id="deposit__from">0 만원</span>
									<span class="swing" style="display:inline;margin:0 5px;">~</span>
								<c:if test="${not rowFLag}" >	
									<span id="deposit__to">300</span>
								</c:if>
								<c:if test="${rowFLag}">
									<span id="deposit__to">무제한</span>
								</c:if>
								</span>
							</h2>
							<i class="cbang-icon fas fa-caret-down"></i>
						</div>
						<div class="content hidden" style="width:241px;">
							<div class="filter-item filter-small-view price-filter">
								<div class="popup-title"><span>보증금 가격</span></div>
								<p class="placeholder">보증금 (ex. 10,000만원 = 1억원)</p>
								<input class="input1" type="number" value="0" id="deposit1s">
								<div class="swing">~</div>
							<c:if test="${not rowFLag}">
								<input class="input2" type="number" value="300" id="deposit1e">
							</c:if>
							<c:if test="${rowFLag}">
								<input class="input2" type="number" value="999999" id="deposit1e">
							</c:if>
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
								<input class="input1" type="number" value="0" id="month1">
								<div class="swing">~</div>
								<input class="input2" type="number" value="999999" id="month2">
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
								<c:if test="${not empty lists.buildingOptions}">
									<c:forEach items="${lists.buildingOptions}" var="item">
										<label class="checkbox-wrap clearfix">
										<c:if test="${param['searchOption']==item.option_code}" var="searchOptionFlag">
											<input class="checkbox" type="checkbox" value="${item.option_code}" name="option1" checked>
										</c:if>
										<c:if test="${not searchOptionFlag}">
											<input class="checkbox" type="checkbox" value="${item.option_code}" name="option1">
										</c:if>
											<span class="name">${item.name}</span>	
										</label>
									</c:forEach>
								</c:if>
									</div>									
									<div class="line"></div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="5" name="option2">
											<span class="name">5평 이하</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="10" name="option2">
											<span class="name">5평 ~ 10평 이하</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="1000" name="option2">
											<span class="name">10평 이상</span>
										</label>
									</div>
									<div class="line"></div>
									<div>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="-1" name="option3">
											<span class="name">반지층</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="3" name="option3">
											<span class="name">저층 1층~3층</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="6" name="option3">
											<span class="name">중층 4층~6층</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="7" name="option3">
											<span class="name">고층 7층이상</span>
										</label>
										<label class="checkbox-wrap clearfix">
											<input class="checkbox" type="checkbox" value="0" name="option3">
											<span class="name">옥탑</span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="SearchForm-wrap search-form-wrap">
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
				</div> -->
				<div class="sub-nab clearfix">
					<ul>
						<li class="map">
							<a href="#" class="active">
								<i class="dabang-icon icon-size-lg fas fa-map" style="vertical-align: 0"></i>
								<span>지도</span>
							</a>
						</li>
						<li class="list">
							<a href="#" class="">
								<i class="dabang-icon icon-size-lg fab fa-microsoft" style="vertical-align: 0"></i>
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
							<i class="dabang-icon icon-size-lg fas fa-chevron-right" style="vertical-align: 0"></i>
							<span class="icon-text">
								<span> </span><span> 검색결과 </span><strong></strong><span>개</span>
							</span>
							<i class="dabang-icon dabang-icon-remove icon-size-lg right" style="cursor:pointer;"></i>
						</div>
						<div class="ListWrap list-wrap" style="opacity: 1;">
							
							<div class="AreaRoom new-rooms clearfix">
								<div class="Room-header new-rooms-title">
									<div class="Room-title new-list-rooms-title" >이 지역 주변 방</div>
								</div>
								<ul class="Room-list items">
									
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
						<div class="ListZero search hidden"></div>
						<div class="ListLoading" style="visibility:hidden;">
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
    src="//maps.googleapis.com/maps/api/js?key=AIzaSyAL2Mw8oEwGSz9kBH5Qws5Zg7Y25uZefrY&callback=initMap"></script>
</body>
</html>