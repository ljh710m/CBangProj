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
	<title>NBang Admin</title>

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
    
    <!-- JQuery script -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    
</head>
<body class="login">
	<div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">        	
            <div class="login-content">       	
                <div class="login-logo">
                    <img class="align-content" src="<c:url value='/images/backend/logo_admin.png'/>" alt="">              
                </div>
                <div class="login-form">
                    <form action="login.admin" method="post">
                        <div class="form-group">
                            <label>아이디</label>
                            <c:if test="${errors.id}"><p>&nbsp;아이디를 입력하세요.</p></c:if>
                            <input type="text" name="id" class="form-control" value="${param.id}" placeholder="아이디">
                        </div>
                        <div class="form-group">
                            <label>비밀번호</label>
                            <c:if test="${errors.password}"><p>&nbsp;비밀번호를 입력하세요.</p></c:if>
                            <input type="password" name="password" class="form-control" value="${param.password}" placeholder="비밀번호">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember Me
                            </label>
						</div>
                        <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">로그인</button>
                        <div class="social-login-content">
                            <div class="social-button">
                            	<a class="btn social facebook btn-flat btn-addon mb-3" href="<c:url value='/backend/admin/register.jsp'/>" role="button">계정 신청</a>                                
                                <button type="button" class="btn social twitter btn-flat btn-addon mt-2">비밀번호 찾기</button>
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
    <script>
	    $(function() {
		    if(${errors.idOrPwNotMatch}){
	        	customAlert("error", "아이디 또는 비밀번호가 틀렸습니다.");
	    	}	    		    	
	    });
    </script>
                        
</body>
</html>