<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
    <title>N방으로 찜하자!</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- JQuery CSS -->
    <link href="<c:url value='/vendor/jquery/css/jquery-ui.css'/>" rel="stylesheet">  
    <%-- <!-- Bootstrap theme -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet"> --%>
    
    <!-- Font Awesome font -->
    <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">          	
    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/footer.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/manage/modify.css'/>" rel="stylesheet">         
	
<style>
	body, html {
    	width: 100%;
    	height: 100%;
	}
</style>
</head>

<body>
	<!-- Navbar -->
	<jsp:include page="/frontend/template/Navbar.jsp"/>
	
	<div class="contatiner-fluid">
		<div id="manage-component">
			<div class="manage">
				<div class="manage-navi">
					<div class="lnb-wrap">
						<ul class="lnb">
							<li><a href="<c:url value='/Manager/ManagerRoom.do'/>">매물관리</a></li>
						<c:if test="${sessionScope.trade_type=='중개'}">
							<li><a href="<c:url value='/Manager/RoomContact.do'/>" class="active">연락요청</a></li>
						</c:if>
						</ul>
					</div>
				</div>
				<div class="content">
					<div class="room-admin">
						<div class="manage-header">
							<div class="clearfix">
								<h2>
									연락 요청된 매물
								</h2>
							</div>
							<div class="manage-body">
								<div class="tab-description">								
									<ul style="margin-top: 1em;">
										<li>- 거래중: 내가 등록한 매물이	공개중인 상태</li>
										<li>- 거래완료: 등록한 매물이 거래완료된 상태</li>
										<li>- 검수반려: 운영원칙 위배 또는 신고로 비공개된 상태</li>
									</ul>
								</div>
								<table class="vertical">
									<colgroup>
										<col style="width: 93px;">
										<col style="width: 120px;">
										<col style="width: 250px;">
										<col style="width: 320px;">
										<col style="width: 215px;">
									</colgroup>
									<tbody>
									<c:forEach items="${list}" var="item">
										<tr>
											<td>
												<div class="seq">${item.room_no}</div>
												<p>
													<span>[</span><span>${item.state}</span><span>]</span>
												</p>
											</td>
											<td class="room-image-wrap">
												<div class="room-image">
													<a href='<c:url value="/Room/Detail.do?roomNo=${item.room_no}"/>' target="_blank">
														<div class="preview"></div>
														<div class="preview manage-preview"	style="background-image: url(../Upload/${item.stored_file_name});"></div>
													</a>
												</div>
											</td>
											<td>
												<div class="room-info">
													<a href="<c:url value="/Room/Detail.do?roomNo=${item.room_no}"/>" target="_blank">
													<c:if test="${item.rent_type=='월세'}" var="rentFlag">
														<div class="room-title ellipsis">${item.room_type} ${item.rent_type} ${item.deposit2}/${item.month_price}</div>													
													</c:if>
													<c:if test="${not rentFlag}">
														<div class="room-title ellipsis">${item.room_type} ${item.rent_type} ${item.deposit1}</div>
													</c:if>
														<div class="address ellipsis">${item.jibunAddress}</div>
														<div class="title ellipsis">${item.room_title}</div>
													</a>
												</div>
											</td>
											<td class="memo-wrap" style="border-left: none;">
												<div class="clearfix" style="text-align: left;">
													<textarea class="form-control" style="resize: none; border-radius:0;" placeholder="[연락처]" id="${item.room_no}">${item.contact_info}</textarea>
												</div>
											</td>
											<td class="setting-wrap" style="border-left: none;">												
												<div class="setting">
													<span class="saved_time">${item.start_date}</span>
													<span class="input-dash">|</span>													
													<span class="favorite-count">
														<span>찜 </span>
														<span>${item.favoriteCount}</span>
													</span>
												</div>												
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="pagination-wrap" style="/* display: none; */ margin-top: 20px;">
							<ul class="Pagination">${pagingString}</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<jsp:include page="/frontend/template/Footer.jsp"/>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/vendor/jquery/jquery-ui.min.js'/>"></script> 
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>
    <script src="<c:url value='/js/manage/modify.js'/>"></script>
    	
</body>
</html>