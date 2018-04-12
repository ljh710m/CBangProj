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
	        	<div class="col-lg-3">
	                <div class="card">
	                    <div class="card-body">
	                        <div class="stat-widget-one">
	                            <div class="stat-icon dib"><i class="ti-user text-primary border-primary"></i></div>
	                            <div class="stat-content dib">
	                                <div class="stat-text">NBang Members</div>
	                                <div class="stat-digit">${totalMembercount}</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div><!--/.col-->
	            <input type="hidden" value="${totalMembercount}" id="totalMembercount">
	        	<input type="hidden" value="${totalGeneralMemberCount}" id="totalGeneralMemberCount">
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<iframe class="chartjs-hidden-iframe" tabindex="-1"
								style="display: block; overflow: hidden; border: 0px; margin: 0px; top: 0px; left: 0px; bottom: 0px; right: 0px; height: 100%; width: 100%; position: absolute; pointer-events: none; z-index: -1;"></iframe>
							<h4 class="mb-3">회원 비율</h4>
							<canvas id="doughutChart" height="200" width="672"
								style="display: block; width: 672px; height: 336px;"></canvas>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
				<c:forEach items="${joinPathCount}" var="item">
					<input type="hidden" value="${item.count}" id="${item.path_code}">					
				</c:forEach>					
										
                    <div class="card">
                        <div class="card-body">
                            <h4 class="mb-3">회원 가입 경로</h4>
                            <div class="flot-container">
								<div id="flot-pie" class="flot-pie-container"
									style="padding: 0px; position: relative;">
									<!-- width:665 -->
									<canvas class="flot-base" width="400" height="275"
										style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 665px; height: 275px;"></canvas>
									<canvas class="flot-overlay" width="665" height="275"
										style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 665px; height: 275px;"></canvas>
									<div class="legend">
										<div
											style="position: absolute; width: 65px; height: 76px; top: 5px; right: 5px; background-color: rgb(255, 255, 255); opacity: 0.85;">
										</div>
										<table
											style="position: absolute; top: 5px; right: 5px;; font-size: smaller; color: #545454">
											<tbody>
												<tr>
													<td class="legendColorBox"><div
															style="border: 1px solid #ccc; padding: 1px">
															<div
																style="width: 4px; height: 0; border: 5px solid #8fc9fb; overflow: hidden"></div>
														</div></td>
													<td class="legendLabel">인터넷 광고</td>
												</tr>
												<tr>
													<td class="legendColorBox"><div
															style="border: 1px solid #ccc; padding: 1px">
															<div
																style="width: 4px; height: 0; border: 5px solid #007BFF; overflow: hidden"></div>
														</div></td>
													<td class="legendLabel">TV 광고</td>
												</tr>
												<tr>
													<td class="legendColorBox"><div
															style="border: 1px solid #ccc; padding: 1px">
															<div
																style="width: 4px; height: 0; border: 5px solid #19A9D5; overflow: hidden"></div>
														</div></td>
													<td class="legendLabel">영업 대행</td>
												</tr>
												<tr>
													<td class="legendColorBox"><div
															style="border: 1px solid #ccc; padding: 1px">
															<div
																style="width: 4px; height: 0; border: 5px solid #DC3545; overflow: hidden"></div>
														</div></td>
													<td class="legendLabel">지인 및 추천</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
                        </div>
                    </div><!-- /# card -->
                </div>            
	        </div>	        
            <div class="row">
            	<div class="col-xl-3 col-lg-6">
	                <div class="card">
	                    <div class="card-body">
	                        <div class="stat-widget-one">
	                            <div class="stat-icon dib"><i class="ti-home text-success border-success"></i></div>
	                            <div class="stat-content dib">
	                                <div class="stat-text">Active Rooms</div>
	                                <div class="stat-digit">${totalRoomCount}</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div><!--/.col-->
	            <div class="col-lg-3 col-md-6">
                	<div class="card">
                     	<div class="card-body">
                         	<div class="stat-widget-one">
                                <div class="stat-icon dib"><i class="ti-link text-danger border-danger"></i></div>
                             	<div class="stat-content dib">
                                    <div class="stat-text">Reported Room</div>
                                	<div class="stat-digit">${totalReportedRoomCount}</div>                                	
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
    <script src="<c:url value='/vendor/sufee/js/lib/chart-js/Chart.bundle.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/chart-js/chartjs-init.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/flot-chart/excanvas.min.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/flot-chart/jquery.flot.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/flot-chart/jquery.flot.pie.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/flot-chart/flot-chart-init.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/lib/flot-chart/flot-tooltip/jquery.flot.tooltip.min.js'/>"></script>
       
</body>
</html>