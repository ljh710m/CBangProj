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
    <link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">          	
    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/favorite/favorite.css'/>" rel="stylesheet">             

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
	
	<div class="wrap">
    	<div id="search-component">
			<div class="container-fluid" style="padding: 0;">
				<div class="second-filter">
					<div class="favorite-menu clearfix" style="left:10px;">
						<ul>
							<li><button class="btn-no-border btn-no-bg active" style="cursor:pointer;">최근 본 방</button></li>
							<li><button class="btn-no-border btn-no-bg" style="cursor:pointer;">찜한 방</button></li>
							<li><button class="btn-no-border btn-no-bg" style="cursor:pointer;">연락한 방</button></li>
						</ul>
					</div>
					<div class="sub-nab clearfix">
						<ul>
							<li class="map">
								<a href="#" class="active">
									<i class="nbang-icon icon-size-lg fas fa-map" style="vertical-align: 0"></i>
									<span>지도</span>
								</a>
							</li>
							<li class="list">
								<a href="#" class="">
									<i class="nbang-icon icon-size-lg fab fa-microsoft" style="vertical-align: 0"></i>
									<span>리스트</span>
								</a>
							</li>
						</ul>
					</div>
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
									<div class="Room-title new-list-rooms-title">최근 본 방</div>
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
						<div class="ListZero visited search hidden"></div>
						<div class="ListZero favorited search hidden"></div>
						<div class="ListZero contacted search hidden"></div>
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
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>
    <script src="<c:url value='/js/favorite/favorite.js'/>"></script>
    <script src="<c:url value='/vendor/googlemaps/markerclusterer.js'/>"></script>
    <script 
    src="//maps.googleapis.com/maps/api/js?key=AIzaSyAL2Mw8oEwGSz9kBH5Qws5Zg7Y25uZefrY&callback=initMap"></script>
</body>
</html>