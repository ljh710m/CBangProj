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
    <!-- JQuery CSS -->
    <link href="<c:url value='/vendor/jquery/css/jquery-ui.css'/>" rel="stylesheet">    
	<!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <!-- Custom styles -->
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/util/pagination.css'/>" rel="stylesheet">
    
    <!-- Basic script -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
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
                        <h1>옵션관리</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">건물옵션 | 방종류 | 매물옵션</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- content -->
        <div class="content mt-3">
        	<div class="row">
        		<!-- 건물 옵션 -->     		       
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
		                                  		<th scope="col"></th>
		                              		</tr>
			                          	</thead>
			                          	<tbody id="Boption">
			                        <c:if test="${empty requestScope.buildingOptionList }" var="flag">
							 				<tr>
							 					<td colspan="4" style="text-align: center;">등록된 옵션이 없습니다</td>
							 				</tr>
									</c:if>
									<c:if test="${not flag }">
										<c:forEach var="item" items="${requestScope.buildingOptionList}" varStatus="loop">
							  				<tr>
							  					<th>${buildingMap.totalRecordCount - (((buildingMap.nowPage - 1) * buildingMap.pageSize) + loop.index)}</th>							  					
							  					<td>${item.option_code}</td>
							  					<td>${item.name}</td>
							  					<td>
			                              			<button type="button" class="btn btn-outline-success btn-sm" name="edit"><i class="fa fa-edit"></i>&nbsp;Edit</button>
			                              			<button type="button" class="btn btn-outline-danger btn-sm" name="delete"><i class="fa fa-times"></i>&nbsp;Delete</button>
			                              		</td>			   					
							  				</tr>
					 				</c:forEach>
									</c:if>
			                      		</tbody>
			                  		</table>
			                  		<!-- pagination start-->
				                    <div id="paging">
				                    	${buildingPaging}		                	
					                </div>
					                <!-- pagination end-->
		                  		</div>
		                  		<div class="offset-lg-1 col-lg-5">
		                  			<div class="card">
				                        <div class="card-header">
				                            <strong class="card-title">건물 옵션 등록</strong>
				                        </div>
                        				<div class="card-body">
					                  		<table class="table table-bordered">
					                  			<colgroup>
													<col style="width:30%">
													<col>									
												</colgroup>		                            	
					                          	<tbody>
					                            	<tr>
					                              		<th style="background-color: #EBF5FF">옵션코드</th>
					                              		<td>자동생성</td>			                              		
					                          		</tr>
					                          		<tr>
					                          			<th style="background-color: #EBF5FF;">옵션이름</th>
					                              		<td>
					                              			<div class="row form-group">
		                            							<div class="col"><input type="text" placeholder="옵션이름" class="form-control" id="option_name"></div>
		                          							</div>
		                          						</td>
					                          		</tr>
					                          		<tr>
					                          			<td colspan="2" style="text-align: center;">
					                          				<button type="button" class="btn btn-outline-primary btn-sm" name="register"><i class="fa fa-pencil"></i>&nbsp;등록</button>
					                          			</td>
					                          		</tr>                  		
					                      		</tbody>
					                  		</table>
			                  			</div>
			                  		</div>
		                  		</div>
	                  		</div>	                  		
                        </div>
                    </div>
                </div><!-- 건물 옵션 -->
                <!-- 방종류 -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">방 종류</strong>
                        </div>
                        <div class="card-body">
                        	<div class="row">
	                        	<div class="col-lg-6">                      	
		                            <table class="table table-hover">
		                            	<thead>
		                                	<tr>
		                                  		<th scope="col">#</th>
		                                  		<th scope="col">방 종류 코드</th>
		                                  		<th scope="col">방 종류 이름</th>
		                                  		<th scope="col"></th>
		                              		</tr>
			                          	</thead>
			                          	<tbody id="roomType">
		                          	<c:if test="${empty requestScope.roomTypesList }" var="flag">
							 				<tr>
							 					<td colspan="4" style="text-align: center;">등록된 방 종류가 없습니다</td>
							 				</tr>
									</c:if>
									<c:if test="${not flag }">
										<c:forEach var="item" items="${requestScope.roomTypesList}" varStatus="loop">
							  				<tr>
							  					<th>${roomMap.totalRecordCount - (((roomMap.nowPage - 1) * roomMap.pageSize) + loop.index)}</th>							  					
							  					<td>${item.rm_type_code}</td>
							  					<td>${item.room_type}</td>
							  					<td>
			                              			<button type="button" class="btn btn-outline-success btn-sm" name="editR"><i class="fa fa-edit"></i>&nbsp;Edit</button>
			                              			<button type="button" class="btn btn-outline-danger btn-sm" name="deleteR"><i class="fa fa-times"></i>&nbsp;Delete</button>
			                              		</td>	   					
							  				</tr>
					 					</c:forEach>
									</c:if>			                            	
			                      		</tbody>
			                  		</table>
			                  		<!-- pagination start-->
				                    <div id="pagingR">
				                    	${roomPaging}		                	
					                </div>
					                <!-- pagination end-->
		                  		</div>
		                  		<div class="offset-lg-1 col-lg-5">
		                  			<div class="card">
				                        <div class="card-header">
				                            <strong class="card-title">방 종류 등록</strong>
				                        </div>
                        				<div class="card-body">
					                  		<table class="table table-bordered">
					                  			<colgroup>
													<col style="width:30%">
													<col>									
												</colgroup>		                            	
					                          	<tbody>
					                            	<tr>
					                              		<th style="background-color: #EBF5FF">방 종류 코드</th>
					                              		<td>자동생성</td>			                              		
					                          		</tr>
					                          		<tr>
					                          			<th style="background-color: #EBF5FF;">방 종류</th>
					                              		<td>
					                              			<div class="row form-group">
		                            							<div class="col"><input type="text" placeholder="방 종류 이름" class="form-control" id="room_type_name"></div>
		                          							</div>
		                          						</td>
					                          		</tr>
					                          		<tr>
					                          			<td colspan="2" style="text-align: center;">
					                          				<button type="button" class="btn btn-outline-primary btn-sm" name="registerR"><i class="fa fa-pencil"></i>&nbsp;등록</button>
					                          			</td>
					                          		</tr>                  		
					                      		</tbody>
					                  		</table>
			                  			</div>
			                  		</div>
		                  		</div>
	                  		</div> 
                        </div>
                    </div>
                </div><!-- 방종류 -->

                
			</div>                      	
        		       	
        </div> <!-- .content -->
    </div><!-- /#right-panel -->
    <!-- Right Panel -->

	<!-- Basic script -->	
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>    
    <script src="<c:url value='/vendor/jquery/jquery-ui.min.js'/>"></script>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>    
    <script src="<c:url value='/vendor/sufee/js/plugins.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/main.js'/>"></script>
    <!-- Additional Script -->
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/manage/optionmanage.js'/>"></script>            
       
</body>
</html>