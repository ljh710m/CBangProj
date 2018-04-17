<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
    <title>KOSMO</title>
	
    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    
    <!-- Google fonts -->
    
    <!-- Font Awesome font -->    
	<link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">      
	<!-- Flexslider -->
	<link href="<c:url value='/vendor/flexslider/css/flexslider.css'/>" rel="stylesheet">
	<!-- WOW -->
	<link href="<c:url value='/vendor/wow/css/animate.css'/>" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/company/style.css'/>" rel="stylesheet">
    
    <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyBHqUjETYyMHerCmQT_1u-zEGIT2-7a5_c&sensor=false"></script>
</head>

<body data-spy="scroll" data-target=".navbar-fixed-top" onload="initialize()">
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<li class="page-scroll"><h1><a href="#home-slider" class="navbar-brand">KOSMO</a></h1></li>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav pull-right">
					<li class="page-scroll"><a href="#home-slider">Home</a></li>
					<li class="page-scroll"><a href="#about">About</a></li>
					<li class="page-scroll"><a href="#services">Service</a></li>
					<li class="page-scroll"><a href="#contact-page">Contact</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	
	<!-- INTRO - HOMEPAGE -->
	<section id="home-slider" class="flexslider fullbg home-slider" style="background-image:url(../../images/company/section1-img.jpg);">
		<ul class="slides">
			<li class="home-slide">
				<div class="flex-caption transparent light-font center">
					<p class="home-slide-content bounceInLeft animate" data-wow-delay="0.5s" data-wow-duration="4s">
						 WELCOME TO <span class="highlight">KOSMO</span>
					</p>
					<p class="home-slide-content bounceIn animated" data-wow-delay="2s" data-wow-duration="4s">
						 <span class="highlight">STARTERS</span> OF CBANG APP
					</p>
				</div>
			</li>
			<li class="home-slide">
				<div class="flex-caption transparent light-font center">
					<p class="home-slide-content swing animated" data-wow-delay="2s" data-wow-duration="4s">
						 MADE <span class="highlight">SIMPLE & SMART</span>
					</p>
					<p class="home-slide-content fadeInUp animated home-slide-content" data-wow-delay="2s" data-wow-duration="4s">
						WITH <span class="highlight">SUGAR</span> ON TOP
					</p>
				</div>
			</li>
			<li class="home-slide">
				<div class="flex-caption transparent light-font center">
					<p class="home-slide-content flipInY animated">
						MADE WITH <span class="highlight">SOUL</span>
					</p>
					<p class="home-slide-content slideInLeft animated">
						 IN <span class="highlight">SEOUL</span>, KOREA
					</p>
				</div>
			</li>
		</ul>
	</section>
	
	<!-- ABOUT -->
	<section id="about" style="border-top:0px;" class="about">
		<div class="container-fluid">
			<div class="starter-template">
				<h2>ABOUT US</h2>
				<div class="smallsep">
				</div>
				<p class="lead about-main-title">
					KOSMO, Inc.
				</p>
				<p class="lead about-sub-title">
					최고의 제품과 최고의 서비스가 좋은 회사를 만든다고 믿습니다.
				</p>
			</div>
			<p class="max80 wow bounceIn animated about-description" data-wow-delay="0.1s">
				신뢰할 수 있는 동료, 스스로 자랑스러워 할 수 있는 제품,
				그리고 고객을 이해하는 서비스를 제공하는  회사를 만들고 싶습니다.
				언제나 최고를 지향하는 철학으로, 윤리적이고 합리적인 운영 속에서 모두의 삶을, 세상을
				더 윤택하게 만들 수 있는 회사로 성장해 나가도록 하겠습니다.
			</p>
		</div>
	</section>
	
	<!-- SERVICES -->
	<section id="services" class="services graybg">
		<div class="container">
			<div class="starter-template" style="padding-bottom:0px;">
				<h2>SERVICE</h2>
				<div class="smallsep">
				</div>
				<p class="lead">
					 <span style="font-weight:bold;">기존 부동산 서비스와 다른 새로운 방식</span><br />
					 <span style="color:#159ae3">N방 무료계정</span> 으로 귀하의 비지니스를 성장 시키세요!
				</p>
			</div>
			<div class="col-md-12">
				<div class="boxservice wow flipInY animated" data-wow-delay="0.1s">
					<div class="service-1"></div>
					<h3>컴퓨터, 태블릿, 모바일</h3>
					<p>
					 하나의 계정으로 데이터 관리 및<br />
					 매물의 홍보가 가능합니다
					</p>
				</div>
				<div class="boxservice wow flipInY animated" data-wow-delay="0.2s">
					<div class="service-2"></div>
					<h3>모바일 부동산의 시대</h3>
					<p>
						PC를 벗어나, 모바일을 이용한<br />
						스마트한 서비스를 제공합니다.
					</p>
				</div>
				<div class="boxservice wow flipInY animated" data-wow-delay="0.3s">
					<div class="service-3"></div>
					<h3>실적관리, 홍보 효과 측정</h3>
					<p>
						효율적인 매물 관리와 결과 측정을<br />
						통해 비지니스를 성장 시키세요
					</p>
				</div>
			</div>
			<br/><img src="<c:url value='/images/company/cbang.png'/>" alt="다방 이미지" class="img-responsive pxauto wow bounceIn animatedUp" data-wow-delay="0.2s">
			<div class="row cbang-link-wrap">
				<div class="col-md-3 link-website">
					<a href="index.jsp" target="_blank"><img src="<c:url value='/images/company/web-site.png'/>" alt="N방 웹사이트 바로가기"></a>
				</div>
				<div class="col-md-3 link-android">
					<a href="https://play.google.com/store/apps/details?id=kr.co.station3.dabang" target="_blank"><img src="<c:url value='/images/company/android.png'/>" alt="구글 플레이 스토어로 N방 앱 설치하러 가기"></a>
				</div>
				<div class="col-md-3 link-iphone">
					<a href="https://itunes.apple.com/kr/app/dabang-wonlum-opiseutel-guhalttae/id814840066?mt=8" target="_blank"><img src="<c:url value='/images/company/iphone.png'/>" alt="애플 앱스토어로 N방 앱 설치하러 가기"></a>
				</div>
				<div class="col-md-3 link-social">
					<div class="row">
						<div class="col-md-3">
						</div>
						<div class="col-md-3 link-facebook">
							<a href="https://www.facebook.com/dabangapp" target="_blank"><img src="<c:url value='/images/company/facebook.png'/>" alt="N방 페이스북 바로가기"></a>
						</div>
						<div class="col-md-3 link-twitter">
							<a href="https://twitter.com/dabangapp" target="_blank"><img src="<c:url value='/images/company/twitter.png'/>" alt="N방 트위터 바로가기"></a>
						</div>
						<div class="col-md-3 link-blog">
							<a href="http://blog.naver.com/station3inc" target="_blank"><img src="<c:url value='/images/company/blog.png'/>" alt="N방 블로그 바로가기"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- CONTACT -->
	<section id="contact-page" class="contact">
		<div class="container">
			<div class="starter-template">
				<h2>Contact</h2>
				<div class="smallsep">
				</div>
				<div class="row">
					<div class="col-md-12 map-col-md-12">
						<div id="map_canvas" class="map_canvas"></div>
					</div>
					<div class="col-md-12">
						<p class="lead">
						 주소: 서울시 금천구 가산동 426-5 월드메르디앙 2차 410호<br />
						 전화: 02-2025-8523<br />
						 팩스: 02-2025-4113<br />
						 이메일: <a style="color: #333;" href="mailto:ikosmo@naver.com">ikosmo@naver.com</a><br />
						 프로모션/사업 제휴문의 : <a class="mailto" href="mailto:ikosmo@naver.comr">ikosmo@naver.com</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 계열사 -->
	<section class="group">
		<div class="container">
			<div>
				<h2 class="blind">계열사</h2>
				<div class="col-md-12">
					<div class="boxservice wow flipInY animated family1" data-wow-delay="0.1s">
						<h3 class="blind">벼룩시장</h3>
						<a href="http://www.findall.co.kr" target="_blank"><img src="<c:url value='/images/company/family1.gif'/>"></a>
					</div>
					<div class="boxservice wow flipInY animated family2" data-wow-delay="0.2s">
						<h3 class="blind">벼룩시장 구인구직</h3>
						<a href="http://www.findall.co.kr/job/" target="_blank"><img src="<c:url value='/images/company/family2.gif'/>"></a>
					</div>
					<div class="boxservice rightb wow flipInY animated family3" data-wow-delay="0.3s">
						<h3 class="blind">부동산써브</h3>
						<a href="http://www.serve.co.kr" target="_blank"><img src="<c:url value='/images/company/family3.gif'/>"></a>
					</div>
					<div class="boxservice wow flipInY animated family4" data-wow-delay="0.1s">
						<h3 class="blind">알바천국</h3>
						<a href="http://www.alba.co.kr" target="_blank"><img src="<c:url value='/images/company/family4.gif'/>"></a>
					</div>
					<div class="boxservice wow flipInY animated family5" data-wow-delay="0.2s">
						<h3 class="blind">모스버거 코리아</h3>
						<a href="http://www.moskorea.kr" target="_blank"><img src="<c:url value='/images/company/family5.gif'/>"></a>
					</div>
					<div class="boxservice wow flipInY animated family6" data-wow-delay="0.2s">
						<h3 class="blind">포포투</h3>
						<a href="http://www.fourfourtwo.co.kr" target="_blank"><img src="<c:url value='/images/company/family6.gif'/>"></a>
					</div>
					<div class="boxservice rightb wow flipInY animated family-site" data-wow-delay="0.3s">
						<div class="select">
							<div class="select-text">
								<input id="test" type="text" value="Family Site" readonly="readonly">
								<button class="btn-select"></button>
							</div>
							<div class="list">
								<ul>
									<li><a href="http://www.findall.co.kr" target="_blank">벼룩시장</a></li>
									<li><a href="http://www.findall.co.kr/job/" target="_blank">벼룩시장 구인구직</a></li>
									<li><a href="http://www.serve.co.kr" target="_blank">부동산써브</a></li>
									<li><a href="http://www.alba.co.kr" target="_blank">알바천국</a></li>
									<li><a href="http://www.findjob.co.kr" target="_blank">파인드잡</a></li>
									<li><a href="http://www.injain.co.kr" target="_blank">인자인케어 컴퍼니</a></li>
									<li><a href="http://www.jobcracker.co.kr/main.jh" target="_blank">잡크래커</a></li>
									<li><a href="http://www.peachvalley.co.kr" target="_blank">피치밸리</a></li>
									<li><a href="http://www.fourfourtwo.co.kr" target="_blank">FOURFOURTWO</a></li>
									<li><a href="http://www.tennis.co.kr" target="_blank">테니스코리아</a></li>
									<li><a href="http://book.mediawill.com" target="_blank">도서출판 미디어윌</a></li>
									<li><a href="http://www.dintaifung.co.kr" target="_blank">딘타이펑 코리아</a></li>
									<li><a href="http://www.ipd.co.kr/main/index.php" target="_blank">아이피디</a></li>
									<li><a href="http://www.moskorea.kr" target="_blank">모스버거 코리아</a></li>
									<li><a href="http://www.gonzagaconvention.co.kr" target="_blank">캠퍼스컴</a></li>
									<li><a href="http://www.dabangapp.com" target="_blank">다방</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- FOOTER -->
	<section id="footer" class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="social-icons">
						<li class="wow bounceIn animated" data-wow-delay="0.1s"><a href="https://www.facebook.com/www.ikosmo.co.kr" target="_blank"><i class="fab fa-facebook-f"></i><span class="blind">다방 페이스북으로 이동</span></a></li>
						<li class="wow bounceIn animated" data-wow-delay="0.2s"><a href="https://twitter.com/dabangapp" target="_blank"><i class="fab fa-twitter"></i><span class="blind">다방 트위터로 이동</span></a></li>
						<li class="wow bounceIn animated" data-wow-delay="0.3s"><a href="http://blog.naver.com/station3inc" target="_blank"><i class="fas fa-bold"></i><span class="blind">다방 블로그로 이동</span></a></li>
					</ul>
					<p class="copyright">
						 Copyright © 2010 KOSMO, Inc. All rights reserved.
					</p>
				</div>
			</div>
		</div>
	</section>	

	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>     
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	 
	<script src="<c:url value='/vendor/jquery/jquery.nicescroll.min.js'/>"></script>
	
	<script src="<c:url value='/vendor/jquery/jquery.easing.min.js'/>"></script>
    <script src="<c:url value='/vendor/flexslider/js/jquery.flexslider-min.js'/>"></script>
    <script src="<c:url value='/vendor/wow/js/wow.min.js'/>"></script>
    <script src="<c:url value='/js/company/company.js'/>"></script>
  	
  	<script>
  	//옵션 : https://github.com/inuyaksa/jquery.nicescroll 참고
  	jQuery(document).ready(function ($) {
  		$("body").niceScroll({
  			cursorcolor: "#c91f3b",
  			cursorborder: "none",
  			cursorwidth: "10px"  			 			
  		});
  	});
  	</script>
</body>
</html>