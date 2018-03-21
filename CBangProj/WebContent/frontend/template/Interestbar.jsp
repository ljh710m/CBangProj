<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<div >
	 <ul class="nav nav-pills" style="float: right;"  >
	  <li role="presentation" >
	  	<a href="#">
	  		<i id="favorite_map" class="fas fa-map" style="color:#c91f3b;">
	  			<span data-reactid=".0.2.1.0.1">지도</span>
	  		</i>
	  	</a>
	  </li>
	  <li role="presentation">
	  	<a href="#">
	  		<i id="favorite_list" class="fab fa-microsoft" style="color:#c91f3b; opacity: 0.5;">
	  			<span data-reactid=".0.2.1.0.1">리스트</span>
	  		</i>
	  	</a>
	  </li>
	</ul>
	
	<ul id="menu" class="nav nav-pills">
		  <li id="recently" role="presentation" class="active"><a href="<c:url value='/frontend/favorite/Recently.jsp'/>">최근 본 방</a></li>
		  <li role="presentation"><a href="<c:url value='/frontend/favorite/Zzim.jsp'/>">찜한 방</a></li>
		  <li role="presentation"><a href="<c:url value='/frontend/favorite/Call.jsp'/>">연락한 방</a></li>
	</ul>
</div>
	
	