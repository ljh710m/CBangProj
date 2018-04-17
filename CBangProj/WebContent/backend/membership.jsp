<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="<c:url value='/css/util/pagination.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/membership.css'/>" rel="stylesheet">
    
</head>
<body>
	<!-- Modal -->
	  <div class="modal modal-center fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-lg modal-center">
	    
	      <!-- Modal content-->
			<div class="modal-content modal-lg">
				<div class="modal-header">
					<h4 class="modal-title">상세보기</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
				<div class="firstWrap">
					<div class="modal-profile_photo">
						
					</div>
					<div class="memberInfoFirst"> 
						회원명 : <label class="modal-name"></label><br />
						<hr />
						휴대폰번호 : <label class="modal-phone"></label><br />
						<hr />
						이메일 : <label class="modal-email"></label><br />
						<hr />
					</div>
				</div>
					<div class="memberInfoSecond">
						중개 등록번호 : <label class="modal-office_no"></label><br />
						<hr />
						사업자 등록번호 : <label class="modal-permit_no"></label><br />
						<hr />
						중개사무소 주소 : <label class="modal-address"></label><br />
						<hr />
						중개사무소 대표자명 : <label class="modal-represent"></label><br />
						<hr />
						대표번호 : <label class="modal-office_phone"></label><br />
						<hr />
						직책 : <label class="modal-job"></label><br />
						<hr />
						가입일 : <label class="modal-join_date"></label><br />
						<hr />
						가입 경로코드 : <label class="modal-path_code"></label><br />
						<hr />
						가입 경로 : <label class="modal-path_type"></label>
						<hr />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	  </div>
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
                        <h1>중개사 회원 관리</h1>
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
        	<div class="col-sm-12">
        		<div>
        			<table class="table">
        				<thead>
        				<tr>
        				<th>#</th>
        					<th>중개사 등록번호</th>
        					<th>회원 Email</th>
        					<th>회원명</th>
        					<th>휴대폰 번호</th>
        					<th>중개사 대표번호</th>
        					<th>상세보기(관리)</th>
        				</tr>
        				</thead>
        				<c:if test="${not empty list}" var="result">
        				<c:forEach items="${list }" var="list" varStatus="loop">
	        				<tbody>
	        					<tr>
		        					<th scope="row" style="width: 1%">${loop.index+1 }</th>
		        					<td style="width: 8%">${list.office_no }</td>
		        					<td style="width: 20%">${list.email }</td>
		        					
		        					<td id="match-name" style="width: 8%">${list.name }<span class="rockName"></span></td>
		        					<td style="width: 10%">${list.phone }</td>
		        					<td style="width: 10%">${list.office_phone }</td>
		        					<td hidden>${list.path_type }</td>
		        					<td hidden>${list.path_code }</td>
		        					<td hidden>${list.join_date }</td>
		        					<td hidden>${list.job }</td>
		        					<td hidden>${list.permit_no }</td>
		        					<td hidden>${list.represent }</td>
		        					<td hidden>${list.address }</td>
		        					<td hidden>${list.profile_photo }</td>
		        					<td class="tdtd" style="width: 10%;text-align: center">
		        					<a href="#" data-toggle="modal" data-target="#myModal" class="viewModal">보기</a> 
		        					</td>
		        				</tr>
	        				</tbody>
        				</c:forEach>
        				</c:if>
        				<c:if test="${not result }">
        					<tbody>
        						<tr>
        							<td colspan="7" style="text-align: center">등록된 중개회원이 없습니다.</td>
        						</tr>
        					</tbody>
        				</c:if>
        			</table>
        		</div>
        		<div id="paging">
        			${paging }
				</div>
			</div>	       	
        </div> <!-- .content -->
    </div><!-- /#right-panel -->
    <!-- Right Panel -->
	
	<!-- /.modal -->
	<!-- Basic script -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>    
    <script src="<c:url value='/vendor/sufee/js/plugins.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/main.js'/>"></script>
    <!-- Additional Script -->  
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/admin/membership.js'/>"></script>
</body>
</html>