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
	<title>매물 목록</title>

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
        	<div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">건물 옵션</strong>
                        </div>
                        <div class="card-body">
                        	<div class="row"> 
	                        	<div class="col-lg-6">                      	
		                            <table class="table table-hover">
		                            	<thead>
		                                	<tr>
		                                  		<th scope="col">#</th>
		                                  		<th scope="col">옵션코드</th>
		                                  		<th scope="col">옵션이름</th>
		                                  		<th scope="col">Handle</th>
		                              		</tr>
			                          	</thead>
			                          	<tbody>
			                            	<tr>
			                              		<th scope="row">1</th>
			                              		<td>Mark</td>
			                              		<td>Otto</td>
			                              		<td>@mdo</td>
			                          		</tr>
			                          		<tr>
			                              		<th scope="row">2</th>
			                              		<td>Jacob</td>
			                              		<td>Thornton</td>
			                              		<td>@fat</td>
			                          		</tr>
			                          		<tr>
			                              		<th scope="row">3</th>
			                              		<td>Larry</td>
			                              		<td>the Bird</td>
			                              		<td>@twitter</td>
			                          		</tr>
			                      		</tbody>
			                  		</table>
		                  		</div>
		                  		<div class="col-lg-6">
			                  		<table class="table table-hover">
		                            	<thead>
		                                	<tr>
		                                  		<th scope="col">#</th>
		                                  		<th scope="col">First</th>
		                                  		<th scope="col">Last</th>
		                                  		<th scope="col">Handle</th>
		                              		</tr>
			                          	</thead>
			                          	<tbody>
			                            	<tr>
			                              		<th scope="row">1</th>
			                              		<td>Mark</td>
			                              		<td>Otto</td>
			                              		<td>@mdo</td>
			                          		</tr>
			                          		<tr>
			                              		<th scope="row">2</th>
			                              		<td>Jacob</td>
			                              		<td>Thornton</td>
			                              		<td>@fat</td>
			                          		</tr>
			                          		<tr>
			                              		<th scope="row">3</th>
			                              		<td>Larry</td>
			                              		<td>the Bird</td>
			                              		<td>@twitter</td>
			                          		</tr>
			                      		</tbody>
			                  		</table>
		                  		</div>
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
    <!-- Additional Script -->
    <script src="<c:url value='/js/util/alert.js'/>"></script>
       
</body>
</html>