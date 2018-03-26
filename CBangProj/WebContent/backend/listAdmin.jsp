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
    <!-- For Table CSS -->
    <link href="<c:url value='/vendor/sufee/css/lib/dataTables.bootstrap.min.css'/>" rel="stylesheet">
	<!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <!-- Custom styles -->
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">
    
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
                        <h1>관리자 관리</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">                            
                            <li><a href="listAdmin.admin">관리자 목록</a></li>
                            <li>관리자 등록</li>
                            <li>관리자 권한</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- content -->
        <div class="content mt-3">
        	<div class="animated fadeIn">
                <div class="row">
	                <div class="col-md-12">
	                    <div class="card">
	                        <div class="card-header">
	                            <strong class="card-title">관리자 목록</strong>
	                        </div>
		                	<div class="card-body">
								<table id="bootstrap-data-table" class="table table-striped table-bordered">
		                    		<thead>
		                      			<tr>
		                        			<th>아이디</th>
		                        			<th>이름</th>
		                        			<th>이메일</th>
		                        			<th>권한</th>
		                      			</tr>
		                    		</thead>
		                    		<tbody>
	                    	<c:if test="${adminPage.hasAdmin()}">
	                    		<c:forEach var="admin" items="${adminPage.content}">
	                    			<tr>
	                    				<td>${admin.id}</td>
	                    				<td>${admin.name}</td>
	                    				<td>${admin.email}</td>
	                    				<td>${admin.privilege_info}</td>
	                    			</tr>	                    		
	                    		</c:forEach>
	                    	</c:if>		                    		
		                    		</tbody>
		                   		</table>
		                   </div>
	                   </div>
					</div>
				</div>
			</div>        		       	
        </div> <!-- .content -->
    </div><!-- /#right-panel -->
    <!-- Right Panel -->

	<!-- Basic script -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>    
    <script src="<c:url value='/vendor/sufee/js/plugins.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/main.js'/>"></script>
    <!-- For Table script -->
    <script src="<c:url value='/vendor/sufee/js/lib/data-table/datatables.min.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/data-table/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/data-table/dataTables.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/data-table/datatables-init.js'/>"></script>
    <!-- Additional Script -->
    <script src="<c:url value='/js/util/alert.js'/>"></script>
       
</body>
</html>