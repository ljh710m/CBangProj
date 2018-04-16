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
    <link href="<c:url value='/css/util/pagination.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/declaration.css'/>" rel="stylesheet">
</head>
<body>
    <!-- Left Panel -->
    <jsp:include page="/backend/template/LeftPanel.jsp"/>

    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <jsp:include page="/backend/template/Header.jsp"/>
        
        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- content -->
        <div class="content mt-3">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th style="width:5%">#</th>
						<th style="width:8%">대표 사진</th>
						<th style="width:9%">허위 매물번호</th>
						<th style="width:25%">신고 항목</th>
						<th>추가 설명</th>
						<th style="width:10%">핸드폰 번호</th>
						<th style="width:7%">매물 번호</th>
						<th style="width:11%">관리</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${not empty members }" var="result">
				<c:forEach items="${members }" var="members" varStatus="loop">
					<tr style="text-align: center;line-height: 70px;font-size: 15px;cursor: pointer">
						<th scope="row">${loop.count }</th>
						<td><img src="<c:url value='/Upload/${members.photo}' />"
						class="room-image"/></td>
						<td>${members.fault_no }</td>
						<td>${members.type }</td>
						<td style="font-size: 13px;text-align: left;line-height: 25px;">${members.add_info }</td>
						<td>${members.phone }</td>
						<td id="room_no">${members.room_no }</td>
						<input type="hidden" value="${members.location_code}" />
						<td style="width: 10%">
						<button class="btn btn-outline-success btn-sm">
						<i class="fa fa-edit"></i>보기</button>
						<button class="btn btn-outline-danger btn-sm">
						<i class="fa fa-times"></i>삭제</button>
						</td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${not result }">
					<tr>
						<th scope="row" style="width: 1%"></th>
						<td colspan="7" style="text-align: center;">신고등록된 허위매물이 없습니다.</td>
					</tr>
				</c:if>
				</tbody>
			</table>
			<div id="paging">
				${paging }
			</div>

		</div> <!-- .content -->
    </div><!-- /#right-panel -->
    <!-- Right Panel -->

	<!-- Basic script -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>    
    <script src="<c:url value='/vendor/sufee/js/plugins.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/main.js'/>"></script>
    <!-- Additional Script -->
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/admin/declaration.js'/>">
    </script>
</body>
</html>