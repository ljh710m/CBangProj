<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">    	
        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="main.admin"><img src="<c:url value='/images/logo1.png'/>" alt="Logo"></a>
            <a class="navbar-brand hidden" href="./"><img src="<c:url value='/images/favicon.ico'/>" alt="Logo"></a>
        </div>

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="main.admin"> <i class="menu-icon fa fa-dashboard"></i>Dashboard</a>
                </li>
                
                <h3 class="menu-title">매물 관리</h3><!-- /.menu-title -->
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>매물관리</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-puzzle-piece"></i><a href="<c:url value='/backend/manage/RoomManage.jsp' />">매물목록</a></li>                        
                        <li><i class="fa fa-bars"></i><a href="ui-tabs.html">신고매물관리</a></li>                        
                    </ul>
                </li>
                <li>
                    <a href="option.admin"> <i class="menu-icon fa fa-gavel"></i>옵션관리 </a>
                </li>               

                <h3 class="menu-title">고객관리</h3><!-- /.menu-title -->
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-users"></i>회원관리</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-user"></i><a href="font-fontawesome.html">회원정보 조회</a></li>
                        <li><i class="menu-icon fa fa-home"></i><a href="membership.admin">공인중개사 관리</a></li>
                        <li><i class="menu-icon fa fa-reply"></i><a href="joinPath.admin">가입 경로 설정</a></li>
                    </ul>
                </li>
                <li>
                    <a href="widgets.html"> <i class="menu-icon ti-email"></i>대량메일발송 </a>
                </li>
                
                <h3 class="menu-title">게시판 관리</h3><!-- /.menu-title -->
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>공지사항</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">게시물 관리</a></li>
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">댓글 관리</a></li>            
                    </ul>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>이벤트</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">게시물 관리</a></li>
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">댓글 관리</a></li>       
                    </ul>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>기사</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">게시물 관리</a></li>
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">댓글 관리</a></li>      
                    </ul>
                </li>
                
                <h3 class="menu-title">통계</h3><!-- /.menu-title -->
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-line-chart"></i><a href="charts-chartjs.html">Chart JS</a></li>
                        <li><i class="menu-icon fa fa-area-chart"></i><a href="charts-flot.html">Flot Chart</a></li>
                        <li><i class="menu-icon fa fa-pie-chart"></i><a href="charts-peity.html">Peity Chart</a></li>
                    </ul>
                </li>
                      
                <h3 class="menu-title">Extras</h3><!-- /.menu-title -->
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-key"></i>관리자 관리</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-list-ul"></i><a href="listAdmin.admin">관리자 목록</a></li>
                        <li><i class="menu-icon fa fa-pencil-square-o"></i><a href="page-register.html">관리자 등록</a></li>
                        <li><i class="menu-icon fa fa-lock"></i><a href="adminPrivilege.admin">관리자 권한</a></li>                        
                    </ul>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>약관 관리</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">이용약관</a></li>
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">개인정보취급방식</a></li>
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">위치기반약관</a></li>
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">매물관리규정</a></li>
                        <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">자동저장서비스</a></li>                        
                    </ul>
                </li>
                <li>
                    <a href="widgets.html"> <i class="menu-icon ti-email"></i>로그아웃</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside><!-- /#left-panel -->