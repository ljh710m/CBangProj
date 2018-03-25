<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
	<title>CBang Admin</title>

	<!-- Basic CSS -->
	<link href="<c:url value='/vendor/sufee/css/normalize.css'/>" rel="stylesheet">	
	<link href="<c:url value='/vendor/sufee/css/bootstrap.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/scss/style.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/css/font-awesome.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/css/themify-icons.css'/>" rel="stylesheet">     
    <link href="<c:url value='/vendor/sufee/css/flag-icon.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/sufee/css/cs-skin-elastic.css'/>" rel="stylesheet">   
	<!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <!-- Custom styles -->
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">
    
</head>
<body class="login">
	<div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <img class="align-content" src="<c:url value='/images/backend/logo_admin.png'/>" alt="">              
                </div>
                <div class="login-form">
                    <form action="register.admin" method="post">
                        <div class="form-group">
                            <label>아이디</label>
                            <c:if test="${errors.id}"><p>&nbsp;아이디를 입력하세요.</p></c:if>
                            <c:if test="${errors.duplicateId}"><p>&nbsp;이미 사용중인 아이디입니다.</p></c:if>
                            <input type="text" name="id" class="form-control" value="${param.id}" placeholder="아이디">
                        </div>
                        <div class="form-group">
                            <label>비밀번호</label>
                            <c:if test="${errors.password}"><p>&nbsp;비밀번호를 입력하세요.</p></c:if>
                            <input type="password" name="password1" class="form-control" value="${param.password1}" placeholder="비밀번호">
                        </div>
                        <div class="form-group">
                            <label>비밀번호 재확인</label>
                            <c:if test="${errors.confirmPassword}"><p>&nbsp;비밀번호가 일치하지 않습니다.</p></c:if>
                            <input type="password" name="password2" class="form-control" value="${param.password2}" placeholder="비밀번호 재확인">
                        </div>
                        <div class="form-group">
                            <label>이름</label>
                            <c:if test="${errors.name}"><p>&nbsp;이름을 입력하세요.</p></c:if>
                            <input type="text" name="name" class="form-control" value="${param.name}" placeholder="이름">
                        </div>
                        <div class="form-group">
                            <label>이메일</label>
                            <c:if test="${errors.email}"><p>&nbsp;이메일을 입력하세요.</p></c:if>
                            <input type="email" name="email" class="form-control" value="${param.email}" placeholder="이메일">
                        </div>
                        <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">등록하기</button>
                        <div style="border-top: 1px solid #e7e7e7; margin: 10px -30px;">                       
	                    	<div class="register-link m-t-15 text-center">
	                        	<p>이미 계정이 있으신가요 ? <a href="<c:url value='/backend/login.jsp'/>">로그인</a></p>
	                    	</div>
                    	</div>                                                
                    </form>                    
                </div>
            </div>
        </div>
    </div>    

	<!-- Basic script -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>    
    <script src="<c:url value='/vendor/sufee/js/plugins.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/main.js'/>"></script>    
    <!-- Additional Script -->
    <script src="<c:url value='/js/util/alert.js'/>"></script>
                         
</body>
</html>