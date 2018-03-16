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
    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <!-- Font Awesome font -->
    <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">        
	
    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/main.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/footer.css'/>" rel="stylesheet">         
	<link href="<c:url value='/css/account/accountlogin.css'/>" rel="stylesheet">     
    <link href="<c:url value='/css/account/agree.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/account/member.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/account/findpwd.css'/>" rel="stylesheet">
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
	
	<!-- MainSearch -->
	<header class="MainSearch">		
		<div class="MainSearch-bottom">
			<div class="button_box2">
				<form class="form-wrapper-2 cf">
					<input type="text" placeholder="관심 지역 또는 매물번호를 검색해보세요">
					<button type="submit">방 검색</button>
				</form>
			</div>
		</div>
    </header>
    
	<!-- ThemeSearch -->
	<div class="ThemeSearch">
		<div class="ThemeSearch-header">
			<h2 class="ThemeSearch-title">테마 검색</h2>
			<p class="ThemeSearch-subtitle">C방의 다양한 검색 조건으로 방을 찾아보세요</p>
		</div>
		<div class="ThemeSearch-contents">
			<div class="ThemeSearch-contents__wrap">
				<button class="ThemeSearch-item btn-no-border btn-no-bg" style="padding:0px;">
					<div class="ThemeSearch-item__image is-pet"></div>
					<div class="ThemeSearch-item__mask"></div>
					<div class="ThemeSearch-item__typo">
						<h3 class="ThemeSearch-item__title">반려동물</h3>
						<div class="ThemeSearch-item__line"></div>
						<p class="ThemeSearch-item__desc">
							<span>반려동물과 함께 살 수 있는 방</span><br/>
							<span>찾아보기</span>
						</p>
					</div>
				</button>
				<button class="ThemeSearch-item btn-no-border btn-no-bg" style="padding:0px;">
					<div class="ThemeSearch-item__image is-guarantee"></div>
					<div class="ThemeSearch-item__mask"></div>
					<div class="ThemeSearch-item__typo">
						<h3 class="ThemeSearch-item__title">저보증금</h3>
						<div class="ThemeSearch-item__line"></div>
						<p class="ThemeSearch-item__desc">
							<span>보증금 300만원 이하인 방</span><br/>
							<span>찾아보기</span>
						</p>
					</div>
				</button>
				<button class="ThemeSearch-item btn-no-border btn-no-bg" style="padding:0px;">
					<div class="ThemeSearch-item__image is-pano"></div>
					<div class="ThemeSearch-item__mask"></div>
					<div class="ThemeSearch-item__typo">
						<h3 class="ThemeSearch-item__title">360도 매물</h3>
						<div class="ThemeSearch-item__line"></div>
						<p class="ThemeSearch-item__desc">
							<span>3D 이미지로 더 자세히 볼 수 있는 방</span><br/>
							<span>찾아보기</span>
						</p>
					</div>
				</button>
				<button class="ThemeSearch-item btn-no-border btn-no-bg" style="padding:0px;">
					<div class="ThemeSearch-item__image is-parking"></div>
					<div class="ThemeSearch-item__mask"></div>
					<div class="ThemeSearch-item__typo">
						<h3 class="ThemeSearch-item__title">주차가능</h3>
						<div class="ThemeSearch-item__line"></div>
						<p class="ThemeSearch-item__desc">
							<span>주차공간이 확보된 방</span><br/>
							<span>찾아보기</span>
						</p>
					</div>
				</button>
				<button class="ThemeSearch-item btn-no-border btn-no-bg" style="padding:0px;">
					<div class="ThemeSearch-item__image is-direct"></div>
					<div class="ThemeSearch-item__mask"></div>
					<div class="ThemeSearch-item__typo">
						<h3 class="ThemeSearch-item__title">직거래매물</h3>
						<div class="ThemeSearch-item__line"></div>
						<p class="ThemeSearch-item__desc">
							<span>중개수수료 없는 직거래 매물</span><br/>
							<span>찾아보기</span>
						</p>
					</div>
				</button>
				<button class="ThemeSearch-item btn-no-border btn-no-bg" style="padding:0px;">
					<div class="ThemeSearch-item__image is-officetel"></div>
					<div class="ThemeSearch-item__mask"></div>
					<div class="ThemeSearch-item__typo">
						<h3 class="ThemeSearch-item__title">오피스텔</h3>
						<div class="ThemeSearch-item__line"></div>
						<p class="ThemeSearch-item__desc">
							<span>깨끗하고 편리한 주거용 오피스텔</span><br/>
							<span>찾아보기</span>
						</p>
					</div>
				</button>
			</div>
		</div>			
	</div>
	
	<!-- Sitemap -->
	<div class="container Sitemap">
		<div class="row">
			<div class="col-md-2 col-md-offset-1">
				<h3 class="SitemapMenu-title">형태별 검색</h3>
				<ul class="SitemapMenu-list">
					<li><button class="btn-no-border btn-no-bg">원룸</button></li>
					<li><button class="btn-no-border btn-no-bg">투룸</button></li>
					<li><button class="btn-no-border btn-no-bg">쓰리룸</button></li>
					<li><button class="btn-no-border btn-no-bg">오피스텔</button></li>
					<li><button class="btn-no-border btn-no-bg">아파트</button></li>
				</ul>
			</div>
			<div class="col-md-2">
				<h3 class="SitemapMenu-title">테마별 검색</h3>
				<ul class="SitemapMenu-list">
					<li><button class="btn-no-border btn-no-bg">저보증금</button></li>
					<li><button class="btn-no-border btn-no-bg">오피스텔</button></li>
					<li><button class="btn-no-border btn-no-bg">직거래 매물</button></li>
					<li><button class="btn-no-border btn-no-bg">주차 가능</button></li>
					<li><button class="btn-no-border btn-no-bg">반려동물 가능</button></li>
					<li><button class="btn-no-border btn-no-bg">360도 매물</button></li>
				</ul>
			</div>
			<div class="col-md-2">
				<div class="row">
					<div class="col-md-12">
						<h3 class="SitemapMenu-title">공인중개사 회원가입</h3>
						<ul class="SitemapMenu-list">
							<li><a href="#">다방 이용 설명서</a></li>
							<li><a href="#">가입신청</a></li>							
						</ul>
					</div>
					<div class="col-md-12">
						<h3 class="SitemapMenu-title">상품소개</h3>
						<ul class="SitemapMenu-list">
							<li><a href="#">동 상품</a></li>
							<li><a href="#">지하철 상품</a></li>
							<li><a href="#">캠퍼스 상품</a></li>
							<li><a href="#">일반 상품</a></li>							
						</ul>
					</div>
				</div>				
			</div>
			<div class="col-md-2">
				<div class="row">
					<div class="col-md-12">
						<h3 class="SitemapMenu-title">다방 뉴스</h3>
						<ul class="SitemapMenu-list">
							<li><a href="#">공지사항</a></li>
							<li><a href="#">이벤트</a></li>
							<li><a href="#">기사보기</a></li>														
						</ul>
					</div>
					<div class="col-md-12">
						<h3 class="SitemapMenu-title">고객지원</h3>
						<ul class="SitemapMenu-list">
							<li><a href="#">자주 묻는 질문</a></li>
							<li><a href="#">Android/IOS</a></li>
							<li><a href="#">웰페이퍼</a></li>
							<li><a href="#">다방 공식 포스트</a></li>														
						</ul>
					</div>
				</div>	
			</div>
			<div class="col-md-2">
				<h3 class="SitemapMenu-title">About C방</h3>
				<ul class="SitemapMenu-list">
					<li><a href="#">회사소개</a></li>
					<li><a href="#">오시는 길</a></li>
					<li><a href="#">제휴 문의</a></li>														
				</ul>
			</div>						
		</div>		
	</div>
	
	<!-- Terms -->
	<div class="Terms" style="border-top:1px solid #d1d1d1;">
		<div class="container">
			<ul class="nav nav-justified Terms-list">
				<li><a class="Terms-item" href="<c:url value='/frontend/company/Company.jsp'/>">회사소개</a></li>
	           	<li><a class="Terms-item" href="#">공인중개사 회원가입</a></li>
	           	<li><a class="Terms-item" href="#">이용약관</a></li>
	           	<li><a class="Terms-item Terms-item--policy" href="#">개인정보취급방식</a></li>
	           	<li><a class="Terms-item" href="#">위치기반약관</a></li>
	           	<li><a class="Terms-item" href="#">매물관리규정</a></li>
	           	<li><a class="Terms-item" href="#">자동저장 서비스</a></li>
	       	</ul>
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
    	
</body>
</html>