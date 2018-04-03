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
      		<a class="navbar-brand" href="<c:url value='/index.jsp'/>" style="padding-top: 10px; padding-left: 60px;">
        		<img alt="Brand" src="<c:url value='/images/logo.png'/>">        		      		
      		</a>
    	</div>
    	<div id="navbar" class="navbar-collapse collapse">      		
			<ul class="nav navbar-nav navbar-right">        		
        		<li><a href="<c:url value='/frontend/search/map.jsp'/>">방 검색 </a></li>
        		<li><a href="<c:url value='/frontend/favorite/Recently.jsp'/>">관심목록</a></li>
        	<c:if test="${!empty sessionScope.member_no}" var="flag1">
        		<li><a href="<c:url value='/Form/RegisterRoom.do'/>">방 등록</a></li>
        	</c:if>
        	<c:if test="${not flag1}">
        		<li><a href="javascript:loginmodal()">방 등록</a></li>        		
        	</c:if>
        		
        	<c:if test="${!empty sessionScope.member_no}">
        		<li><a href="#">관리</a></li>
        	</c:if>
        		<li><a href="<c:url value='/frontend/account/PLoginTerms.jsp'/>" style="font-size: 12px;">공인중개사 회원가입</a></li>        		        		
        	<c:if test="${!empty sessionScope.member_no}" var="flag2">        		
        		<li>
        			<div class="Header-profile">
        				<div class="HeaderProfile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        					<div class="Profile Profile--default">
					          <div class="Profile-img"></div>
					          <div class="Profile-img"></div>
					        </div>
					        <span class="HeaderProfile-name">${sessionScope.name}</span>님
					        <span class="caret nbang-icon-sort-desc"></span>
        				</div>
	        			<ul class="dropdown-menu" role="menu" style="min-width: 140px; text-align: ceter;">
					    	<li><a href="<c:url value="/frontend/accountlogin/MyAccount.jsp"/>">내 계정</a></li>
					    	<li class="divider"></li>
					    	<li><a href="<c:url value='/Account/Logout.do'/>">로그아웃</a></li>
					  	</ul>
				  	</div>
        		</li>
        	</c:if>
        	<c:if test="${not flag2}">
        		<li><a href="javascript:loginmodal()">회원가입 및 로그인</a></li>
        	</c:if>        		
      		</ul>      		      		
		</div><!--/.nav-collapse -->		
	</div>
</nav>
<jsp:include page="/frontend/accountlogin/login.jsp"/>
<jsp:include page="/frontend/accountlogin/findpwd.jsp"/>
<jsp:include page="/frontend/accountlogin/agree.jsp"/>	
<jsp:include page="/frontend/accountlogin/member.jsp"/>