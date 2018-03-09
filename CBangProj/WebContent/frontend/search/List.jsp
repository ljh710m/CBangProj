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
        
    <!-- Font Awesome font -->
    <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">          	
    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/search/map.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/search/List.css'/>" rel="stylesheet">

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
					<a href="#/map?id=&amp;type=search&amp;filters=%7B%22deposit-range%22%3A%5B0%2C999999%5D%2C%22price-range%22%3A%5B0%2C999999%5D%2C%22room-type%22%3A%5B0%2C1%2C2%2C3%2C4%2C5%5D%2C%22deal-type%22%3A%5B0%2C1%5D%2C%22location%22%3A%5B%5B126.7035621459961%2C37.36753838979581%5D%2C%5B126.7035621459961%2C37.78222119770488%5D%5D%7D&amp;position=%7B%22center%22%3A%5B126.7035621459961%2C37.57516844797525%5D%2C%22zoom%22%3A11%7D&amp;cluster=%7B%7D" class="active">
						<i class="dabang-icon icon-size-lg fas fa-map"></i>
						<span>지도</span>
					</a>
				</li>
				<li class="list">
					<a href="#/list?id=&amp;type=search&amp;filters=%7B%22deposit-range%22%3A%5B0%2C999999%5D%2C%22price-range%22%3A%5B0%2C999999%5D%2C%22room-type%22%3A%5B0%2C1%2C2%2C3%2C4%2C5%5D%2C%22deal-type%22%3A%5B0%2C1%5D%2C%22location%22%3A%5B%5B126.7035621459961%2C37.36753838979581%5D%2C%5B126.7035621459961%2C37.78222119770488%5D%5D%7D&amp;position=%7B%22center%22%3A%5B126.7035621459961%2C37.57516844797525%5D%2C%22zoom%22%3A11%7D&amp;cluster=%7B%7D" class="">
						<i class="dabang-icon icon-size-lg fab fa-microsoft" data-reactid=".0.2.1.0.0"></i>
						<span data-reactid=".0.2.1.0.1">리스트</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="contents">
		<div class="component">
			<div class="listOutWrap">
				<div class="list-top">
					<div class="top-clearfix">
						<i class="glyphicon glyphicon-menu-right top-icon"></i> <span
							class="icon-text"> 검색결과 </span> <strong>500+</strong> <span>개</span>
					</div>
				</div>
				<div class="list-wrap">
					<div class="list-agent-area">
						<div class="room-section">
							<div class="room-header">
								<div class="room-headLine">
									<span>이 지역 추천 공인 중개업소 매물</span>
									<div class="add-area">
										<button class="btn-no-border btn-no-bg add-view">
											<span class="add-txt">광고</span>
											<span> </span>
											<i class="icon-question"></i>
										</button>
									</div>
								</div>
							</div>
							<ul class="room-tree">
								<li class="room-branch">
									<ul class="room-list items">
										<li class="room-item">
											<a href="#" target="_blank">
												<div class="roomItem-preview">
													<div class="roomItem-preview_mask">
														<div class="roomItem-preview_image"></div>
														<div class="roomItem-preview_image"
														style="background-image: url(https://d1774jszgerdmk.cloudfront.net/512/ae6334c3-5716-4ad8-b586-e9003408a122);"></div>
														<div class="roomItem-preview_cover"></div>
													</div>
												</div>
												<div class="roomItem-detail">
													<div class="roomItem-info">
														<div class="roomItem-header">
															<div class="roomItem-price">
																<p>
																	<span class="roomItem-price_type">월세</span>
																	<span class="roomItem-price_title">1000/95</span>
																</p>
															</div>
															<span class="room-visited">
																<i class="icon"></i>
															</span>
															<div class="roomItem-icons">
																<span class="room-favorite">
																	<i class="icon icon-heart"></i>
																</span>
															</div>
														</div>
													</div>
												</div>
											</a>
										</li>
									</ul>
								</li>
							</ul>
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
    <script src="<c:url value='/js/search/map.js'/>"></script>
    	
</body>
</html>