<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
  <title>C방으로 찜하자!</title>
  <!-- Bootstrap core CSS -->
  <link href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
  <!-- Bootstrap theme -->
  <link href="<c:url value='/vendor/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
  <link href="<c:url value='/css/favorite/favorite.css'/>" rel="stylesheet">
  <link href="<c:url value='/css/interestbar.css'/>" rel="stylesheet">
  
 	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Clustering</title>
    <style>
        html, body {
          height: 93%;
          margin: 0;
          padding: 0;
        }

	</style>
</head>
<body>

  <jsp:include page="/frontend/template/Navbar.jsp"/>
  <jsp:include page="/frontend/template/Interestbar.jsp"/>
	<div id="map"></div>
    <div class="list" >
    	
    	<div id="listbar-header" > 
	    	<span class='glyphicon glyphicon-menu-right'></span><span style="position: relative;top:-2px;"> 검색 결과 0건</span>
    	</div>
    	
    	<div id="listbar-body" style="background-color: #F7F7F7; height:94%;">
    		<img alt="hyeri" src="<c:url value='/images/favorite/hyeri2.png'/>" >
    	</div>
    	
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>    
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
   	<script src="<c:url value='/js/favorite/zzimmap.js'/>"></script>
    <script src="<c:url value='/vendor/googlemaps/markerclusterer.js'/>"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqi5egGww2fmqDOlJh6wlRrqysZ29mvf4&callback=initMap">
    </script>       
	
</body>
</html>