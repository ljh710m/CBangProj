<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
      		</button>
      		<a class="navbar-brand" href="#" style="padding-top: 10px; padding-left: 60px;">
        		<img alt="Brand" src="<c:url value='/images/logo.png'/>">        		      		
      		</a>
    	</div>
    	<div id="navbar" class="navbar-collapse collapse">      		
			<ul class="nav navbar-nav navbar-right">        		
        		<li><a href="<c:url value='/frontend/search/map.jsp'/>">방 검색 </a></li>
        		<li><a href="<c:url value='/frontend/favorite/Recently.jsp'/>">관심목록</a></li>
        		<li><a href="<c:url value='/frontend/manage/NewRoom.jsp'/>">방 등록</a></li>
        		<li><a href="<c:url value='/frontend/account/PLoginTerms.jsp'/>" style="font-size: 12px;">공인중개사 회원가입</a></li>
        		<li><a href="javascript:loginmodal()">회원가입 및 로그인</a></li>
      		</ul>
		</div><!--/.nav-collapse -->
	</div>
</nav>
<jsp:include page="/frontend/accountlogin/login.jsp"/>
<jsp:include page="/frontend/accountlogin/findpwd.jsp"/>
<jsp:include page="/frontend/accountlogin/agree.jsp"/>	
<jsp:include page="/frontend/accountlogin/member.jsp"/>