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
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
    <title>N방으로 찜하자!</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- JQuery CSS -->
    <link href="<c:url value='/vendor/jquery/css/jquery-ui.css'/>" rel="stylesheet">  
    
    <!-- Font Awesome font -->
    <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-regular.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">
          	
    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">    
    <link href="<c:url value='/css/footer.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">   
    <link href="<c:url value='/css/newroom.css'/>" rel="stylesheet">         

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
	
	<div class="container">
		<div class="room-upload-wrap">
			<div class="title">
				<h2>방 수정하기</h2>				
			</div>
			
			<div class="content">
			<form action="<c:url value='/Manage/RegisterRoom.do'/>" method="get" id="registerRoom" onsubmit="return false;">
				<div class="LocationAddress">
					<h3><i class="fas fa-map-marker-alt"></i>위치정보</h3>					
					<table class="table">			
						<colgroup>
							<col style="width:150px;"><!-- 131px -->
							<col style="width:465px;"><!-- 425px -->
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>주소</th>
								<td style="padding-right:5px;">
									<p class="location-discription" style="margin-bottom:10px;">
										<i class="fas fa-exclamation-circle" style="color: #999"></i>
										<span>도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</span>
									</p>
									<!-- form -->
									<div class="Address form-inline">
										<p class="Address-row Address-row--typing">									
											<input type="text" class="form-control" id="searchAddress" placeholder="예) 번동 10-1, 강북구 번동">											
											<button class="Address-submit" type="button" onclick="execDaumPostcode()">주소검색</button>
										</p>
										<p class="Address-row Address-row--addr">
											<textarea class="form-control" readonly="readonly" style="width: 100%" id="addr" name="addr1">${roomDetail.roadAddress}&#10;${roomDetail.jibunAddress}</textarea>
										</p>
										<p class="Address-row Address-row--detail">
											<input class="form-control" type="text" placeholder="상세 주소를 입력하세요. (동, 호수)" style="width: 100%" id="addr2" name="addr2">
										</p>
									<!-- form -->
									</div>
									<p class="location-discription clearfix" style="margin-top:10px;color:#ef4351;">
										<i class="fas fa-exclamation-circle"></i>
										<button style="text-decoration:underline;cursor:pointer;" class="btn-no-border btn-no-bg">
											주소가 검색되지 않으세요?
										</button>
									</p>
								</td>
								<td style="padding-left:25px;">
									<div class="DaumMap-mask">
										<div class="DaumMap" id="map"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="basic-wrap">
					<h3><i class="far fa-file-alt"></i>기본정보</h3>
					<table class="table">						
						<colgroup>
							<col style="width:150px;"><!-- 131px -->
							<col>
							<col style="width:150px;">
							<col>					
						</colgroup>
						<tbody>
							<tr>
								<th>방 종류</th>
								<td colspan="3" style="position: relative;">
									<select class="form-control" style="display: inline;" id="rm_type_code" name="rm_type_code">
										<option value="">방 종류 선택</option>																	
							<c:if test="${!empty roomTypesList}">
								<c:forEach var="item" items="${roomTypesList}">
									<c:if test="${roomDetail.room_type == item.room_type}" var="roomTypeFlag">
										<option value="${item.rm_type_code}" selected>${item.room_type}</option>									
									</c:if>
									<c:if test="${not roomTypeFlag}">
										<option value="${item.rm_type_code}">${item.room_type}</option>
									</c:if>								
								</c:forEach>
							</c:if>															
									</select>
									<div style="display: inline-block; width: 750px; position: absolute; top: 9px; padding-left: 15px;">
										<p>
											<i class="fas fa-exclamation-circle" style="color: #999"></i>
											<span>오피스텔, 아파트는 N방앱에서 등록 가능 합니다.</span>											
										</p>
										<p>
											<i class="fas fa-exclamation-circle" style="color: #999"></i>
											<span>N방에서는 고시원(텔)등의 고시원업 매물 등록을 제한합니다(차단조치)</span>											
										</p>										
									</div>
								</td>																
							</tr>
							<tr>
								<th>거래 종류</th>
								<td colspan="3" class="transaction-type" id="addition">
									<div class="transaction-item">
									<c:if test="${roomDetail.deposit1 != null}" var="deposit1Flag">
										<button class="btn btn-default" id="addCharter" disabled>전세 추가</button>
									</c:if>
									<c:if test="${not deposit1Flag}">
										<button class="btn btn-default" id="addCharter">전세 추가</button>
									</c:if>
										<button class="btn btn-default" id="addMonth">월세 추가</button>										
										<label>
										<c:if test="${roomDetail.short_term}" var="shortTermFlag">
											<input type="checkbox" style="width: 20px;" id="short_term" name="short_term" checked>
										</c:if>
										<c:if test="${not shortTermFlag}">
											<input type="checkbox" style="width: 20px;" id="short_term" name="short_term">
										</c:if>
											<span style="position: relative; top: 1px;">단기가능</span>											
										</label>
									</div>
									<div class="transaction-item" style="padding: 5px 10px;line-height: 18px;color: #ef4351">
										<span>거래 종류를 추가해 주세요. 다중 선택이 가능하며, 첫번째 선택한 거래종류가 우선 노출됩니다.</span>
										<br>
										<span>(예치금이 있는 경우 보증금 입력란에 필히 예치금을 입력 하세요.-미 입력시 허위 매물로 적발됩니다.)</span>																				
									</div>
								<c:if test="${deposit1Flag}">
									<div>
										<div class="transaction-item">
											<span class="tag">전세</span>
											<input class="form-control"	type="number" min="0" placeholder="전세" id="deposit1" value="${roomDetail.deposit1}">
											<span>만원</span>
											<span class="discription">(예 전세 2,000 만원)</span>
											<i class="fas fa-window-close icon-delete" style="color: black" id="delCharter"></i>
										</div>
									</div>									
								</c:if>
								<c:if test="${roomDetail.deposit2 != null}">
									<div>
										<div class="transaction-item">
											<span class="tag">월세</span>
											<input class="form-control" type="number" placeholder="보증금" min="0" id="deposit21" value="${roomDetail.deposit2}">
											<span class="slush">/</span>
											<input class="form-control" type="number" placeholder="월세" min="0" id="month_price1" value="${roomDetail.month_price}">
											<span>만원</span>
											<span class="discription">(예 월세 1000만원 / 50만원)</span>
											<i class="fas fa-window-close icon-delete" style="color: black"></i>
										</div>
									</div>
								</c:if>
						<c:if test="${roomTradeType.size() !=0}">							
							<c:forEach items="${roomTradeType}" var="item" varStatus="index">								
								<c:if test="${item.deposit1 != null}">
									<div>
										<div class="transaction-item">
											<span class="tag">전세</span>
											<input class="form-control"	type="number" min="0" placeholder="전세" id="deposit1" value="${item.deposit1}">
											<span>만원</span>
											<span class="discription">(예 전세 2,000 만원)</span>
											<i class="fas fa-window-close icon-delete" style="color: black" id="delCharter"></i>
										</div>
									</div>	
								</c:if>
								<c:if test="${item.deposit2 != null}">
									<div>
										<div class="transaction-item">
											<span class="tag">월세</span>
											<input class="form-control" type="number" placeholder="보증금" min="0" id="deposit2${index.count}" value="${item.deposit2}">
											<span class="slush">/</span>
											<input class="form-control" type="number" placeholder="월세" min="0" id="month_price${index.count}" value="${item.month_price}">
											<span>만원</span>
											<span class="discription">(예 월세 1000만원 / 50만원)</span>
											<i class="fas fa-window-close icon-delete" style="color: black"></i>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
								</td>															
							</tr>
							<tr>
								<th>건물 층수</th>
								<td class="transaction-type">
									<div class="transaction-item">
										<span style="margin-right: 10px">건물 층수</span>
										<select class="form-control" name="total_floor" id="total_floor">
											<option value="">건물 층수 선택</option>
										<c:forEach var="i" begin="1" end="50">
											<c:if test="${roomDetail.total_floor == i}" var="totalFloorFlag">
												<option value="${i}" selected>${i}층</option>
											</c:if>
											<c:if test="${not totalFloorFlag}">
												<option value="${i}">${i}층</option>
											</c:if>									
										</c:forEach>																			
										</select>										
									</div>
									<div class="transaction-item">
										<span style="margin-right: 10px">해당 층수</span>
										<select class="form-control" name="floor" id="floor">
											<option value="">해당 층수 선택</option>
											<option value="-1">반지층</option>
											<option value="0">옥탑</option>
										<c:forEach var="i" begin="1" end="50">
										<c:if test="${roomDetail.floor == i}" var="floorFlag">
											<option value="${i}" selected>${i}층</option>
										</c:if>
										<c:if test="${not floorFlag}">
											<option value="${i}">${i}층</option>
										</c:if>									
										</c:forEach>																						
										</select>										
									</div>									
								</td>
								<th>
									<span>건물크기</span><br>
									<span>(1P = 3.3058㎡)</span>																		
								</th>
								<td class="transaction-type building-size-wrap">
									<div class="transaction-item">
										<span class="title">공급 면적</span>										
										<input type="number" class="form-control" name="total_area" id="total_area" min="0" value="${roomDetail.total_area}"/>
										<span>평</span>
										<span>
											<span>(</span>
											<span id="stotal_area"></span>
										</span>
										<span>
											<span>m</span>
											<sup>2</sup>
											<span>)</span>
										</span>
									</div>
									<div class="transaction-item">
										<span class="title">전용 면적</span>
										<input type="number" class="form-control" style="display: inline;" name="area" id="area" min="0" value="${roomDetail.area}"/>
										<span>평</span>
										<span>
											<span>(</span>
											<span id="sarea"></span>
										</span>
										<span>
											<span>m</span>
											<sup>2</sup>
											<span>)</span>
										</span>
									</div>									
								</td>
							</tr>
						</tbody>						
					</table>
				</div>
				
				<div class="additional-wrap">
					<h3><i class="fas fa-plus-circle"></i>추가 정보</h3>
					<table class="table">
						<colgroup>
							<col style="width:150px;">
							<col>
							<col style="width:150px;">
							<col>							
						</colgroup>
						<tbody>						
							<tr>
								<th>관리비</th>
								<td colspan="3" class="transaction-type">
									<div class="transaction-item">										
										<label>
										<c:if test="${roomDetail.common_charge != null}" var="commonChargeFlag">
											<input type="checkbox" name="common_charge_ch" id="common_charge_ch" checked>
										</c:if>
										<c:if test="${not commonChargeFlag}">
											<input type="checkbox" name="common_charge_ch" id="common_charge_ch">
										</c:if>
											<span>있음</span>																		
										</label>										
									<c:if test="${commonChargeFlag}">
										<input type="text" class="form-control" name="common_charge" id="common_charge" value="${roomDetail.common_charge}">
									</c:if>
									<c:if test="${not commonChargeFlag}">
										<input type="text" class="form-control" name="common_charge" id="common_charge" readonly="readonly">
									</c:if>																	
										<span style="margin-right: 23px;">만원</span>
										<label>
										<c:if test="${commonChargeFlag}">
											<input type="checkbox" name="common_charge_ch">
										</c:if>
										<c:if test="${not commonChargeFlag}">
											<input type="checkbox" name="common_charge_ch" checked>
										</c:if>										
											<span>없음</span>																				
										</label>	
									</div>
									<div class="transaction-item">
										<span style="margin-right: 5px">관리비포함 항목 선택:</span>
										<label>
										<c:if test="${fn:indexOf(roomDetail.charge_list,'인터넷') != -1}" var="commonList1">
											<input type="checkbox" name="chkList1" value="인터넷" checked>
										</c:if>
										<c:if test="${not commonList1}">
											<input type="checkbox" name="chkList1" value="인터넷">
										</c:if>
											<span>인터넷</span>																				
										</label>
										<label>
										<c:if test="${fn:indexOf(roomDetail.charge_list,'유선TV') != -1}" var="commonList2">
											<input type="checkbox" name="chkList1" value="유선TV" checked>
										</c:if>
										<c:if test="${not commonList2}">
											<input type="checkbox" name="chkList1" value="유선TV">
										</c:if>
											<span>유선TV</span>																				
										</label>
										<label>
										<c:if test="${fn:indexOf(roomDetail.charge_list,'청소비') != -1}" var="commonList3">
											<input type="checkbox" name="chkList1" value="청소비" checked>
										</c:if>
										<c:if test="${not commonList3}">
											<input type="checkbox" name="chkList1" value="청소비">
										</c:if>											
											<span>청소비</span>																				
										</label>
										<label>
										<c:if test="${fn:indexOf(roomDetail.charge_list,'수도세') != -1}" var="commonList4">
											<input type="checkbox" name="chkList1" value="수도세" checked>
										</c:if>
										<c:if test="${not commonList4}">
											<input type="checkbox" name="chkList1" value="수도세">
										</c:if>	
											<span>수도세</span>																				
										</label>
										<label>
										<c:if test="${fn:indexOf(roomDetail.charge_list,'도시가스') != -1}" var="commonList5">
											<input type="checkbox" name="chkList1" value="도시가스" checked>
										</c:if>
										<c:if test="${not commonList5}">
											<input type="checkbox" name="chkList1" value="도시가스">
										</c:if>											
											<span>도시가스</span>																				
										</label>
										<label>
										<c:if test="${fn:indexOf(roomDetail.charge_list,'전기세') != -1}" var="commonList6">
											<input type="checkbox" name="chkList1" value="전기세" checked>
										</c:if>
										<c:if test="${not commonList6}">
											<input type="checkbox" name="chkList1" value="전기세">
										</c:if>							
											<span>전기세</span>																				
										</label>										
									</div>																
								</td>
							</tr>
							<tr>
								<th>주차 여부</th>
								<td>
									<label>
									<c:if test="${roomDetail.parking}" var="parkingFlag">
										<input type="checkbox" name="parking" value="1" checked>
									</c:if>
									<c:if test="${not parkingFlag}">
										<input type="checkbox" name="parking" value="1">
									</c:if>
										<span>가능</span>								
									</label>
								<c:if test="${parkingFlag}">
									<input type="text" class="form-control" name="parking_charge">
								</c:if>
								<c:if test="${not parkingFlag}">
									<input type="text" class="form-control" name="parking_charge" readonly="readonly">
								</c:if>
									<span style="margin-right: 23px;">만원</span>
									<label>
									<c:if test="${parkingFlag}">
										<input type="checkbox" name="parking" value="">
									</c:if>
									<c:if test="${not parkingFlag}">
										<input type="checkbox" name="parking" value="" checked>
									</c:if>
										<span>불가능</span>																				
									</label>
								</td>
								<th>난방종류</th>
								<td>
									<select class="form-control" id="heating">
										<option value="">난방종류 선택</option>
									<c:if test="${roomDetail.heating == '중앙 난방'}" var="heatingFlag1">
										<option value="중앙 난방" selected>중앙 난방</option>
									</c:if>
									<c:if test="${not heatingFlag1}">
										<option value="중앙 난방">중앙 난방</option>
									</c:if>
									<c:if test="${roomDetail.heating == '개별 난방'}" var="heatingFlag2">
										<option value="개별 난방" selected>개별 난방</option>
									</c:if>
									<c:if test="${not heatingFlag2}">
										<option value="개별 난방">개별 난방</option>
									</c:if>
									<c:if test="${roomDetail.heating == '지역 난방'}" var="heatingFlag3">
										<option value="지역 난방" selected>지역 난방</option>
									</c:if>
									<c:if test="${not heatingFlag3}">
										<option value="지역 난방">지역 난방</option>
									</c:if>
									</select>
								</td>		
							</tr>
							<tr>
								<th>엘리베이터</th>
								<td>
									<label>
									<c:if test="${roomDetail.elevator == '있음' }" var="elevatorFlag">
										<input type="checkbox" name="elevator" value="있음" checked>									
									</c:if>
									<c:if test="${not elevatorFlag}">
										<input type="checkbox" name="elevator" value="있음">
									</c:if>
										<span>있음</span>																				
									</label>
									<label>
									<c:if test="${not elevatorFlag}">
										<input type="checkbox" name="elevator" value="없음" checked="checked">
									</c:if>
									<c:if test="${elevatorFlag}">
										<input type="checkbox" name="elevator" value="없음">
									</c:if>
										<span>없음</span>																				
									</label>
								</td>
								<th>반려 동물</th>
								<td>
									<label>
									<c:if test="${roomDetail.pat}" var="patFlag">
										<input type="checkbox" name="pat" value="2" checked>
									</c:if>
									<c:if test="${not patFlag}">
										<input type="checkbox" name="pat" value="2">
									</c:if>
										<span>가능</span>																				
									</label>
									<label>
									<c:if test="${not patFlag}">									
										<input type="checkbox" name="pat" value="" checked="checked">
									</c:if>
									<c:if test="${patFlag}">
										<input type="checkbox" name="pat" value="">
									</c:if>
										<span>불가능</span>																				
									</label>
								</td>										
							</tr>
							<tr>
								<th>입주 가능일</th>
								<td colspan="3">
									<input type="text" class="form-control" name="move_date" style="text-align: center;" id="move_date" value="${roomDetail.move_date}" readonly>
									<button class="calendar btn-no-border btn-no-bg" id="calendar"></button>
									<label>
										<input type="checkbox" name="move_date_ch">
										<span>즉시 입주</span>														
									</label>
									<label>
										<input type="checkbox" name="move_date_ch">
										<span>날짜 협의</span>																		
									</label>
								</td>
							</tr>
							<tr>
								<th>옵션항목</th>
								<td colspan="3" style="line-height: 2.2">
									<div>
								<c:if test="${!empty roomOption}">										
									<c:forEach var="item" items="${roomOption}">
										<label>
										<c:if test="${item.check}" var="roomOptionFlag">
											<input type="checkbox" name="chkList2" value="${item.option_code}" checked>
										</c:if>
										<c:if test="${not roomOptionFlag}">
											<input type="checkbox" name="chkList2" value="${item.option_code}">
										</c:if>
											<span>${item.name}</span>
										</label>																		
									</c:forEach>
								</c:if>																													
									</div>									
								</td>							
							</tr>
						</tbody>
																								
					</table>					
				</div>
				
				<div class="detail-wrap">
					<h3><i class="far fa-list-alt"></i>상세 설명</h3>
					<table class="table">
						<colgroup>
							<col style="width:150px;">
							<col>													
						</colgroup>
						<tbody>
							<tr>
								<th>방 제목</th>
								<td class="td-tit">
									<input type="text" class="form-control" maxlength="20" placeholder="예) 신논현역 도보 5분거리, 혼자 살기 좋은 방 입니다." name="title" value="${roomDetail.room_title}">
									<span class="tit-count">
										<span>0</span>
										<span>/ 20</span>
									</span>
								</td>															
							</tr>
							<tr>
								<th>상세 설명</th>
								<td class="td-desc">
									<textarea class="form-control" maxlength="500" style="height: 250px;" placeholder="방에 대한 추가 설명을 적어주세요.&#13;&#10;&#13;&#10;홈페이지,블로그, SNS, 메신져ID, 전화번호, 이메일 등. 방정보에 관련된 내용 이외에는 넣을 수 없습니다.&#13;&#10;중개수수료 업금을 할 수 없습니다.(중개수수료,공짜,무료,반값 등)" name="content">${roomDetail.room_desc}</textarea>
									<span class="tit-count">
										<span>0</span>
										<span>/ 500</span>
									</span>									
								</td>
							</tr>
							<tr>
								<th>비공개 메모</th>
								<td>								
									<textarea class="form-control" rows="5" placeholder="외부에 공개되지 않으며, 등록자에게 보이는 메모입니다." name="memo">${roomDetail.memo}</textarea>								
								</td>
							</tr>
						</tbody>
					</table>					
				</div>
				
				<div class="photo-wrap">
					<div class="header cliearfix">
						<h3><i class="fas fa-camera"></i>사진 업로드</h3>
						<ul class="gnb clearfix">
							<li class="general"><button class="active">일반 사진 올리기</button></li>
							<li class="pano"><button>360˚ 사진 올리기</button></li>
						</ul>
						<div class="line"></div>
					</div>
					<div class="photo-guide-wrap">
						<div class="photo-guide">
							<p>
								<span>- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800픽셀)</span><br>
								<span>- 사진 용량은 사진 1장당 10MB까지 등록이 가능합니다.</span><br>
								<span>- 사진은 최소 3장 이상 등록해야하며, 최대 15장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.</span>
							</p>
						</div>
						
						<div id="files" class="photo-zone">
							<div class="upload-btn-wrap" id="sortable">
								<p class="hidden">
									<img src="<c:url value='/images/manage/photo-discription.png'/>" alt="실사진 최소 3장 이상 등록 하셔야 하며, 가로 사진을 권장합니다.">
								</p>
							<c:forEach items="${roomPhotoList}" var="item" varStatus="status">
								<div class="photo-elem" id="${status.index}">
								<c:if test="${status.index ==0}" var="indexFlag">
									<div class="photo-title">대표사진</div>
								</c:if>								
									<div class="close"></div>
									<div class="progress" style="display: none; width: 154px;"></div>
									<div class="rotate">
										<i class="fas fa-redo-alt cbang-icon"></i>
									</div>
									<div class="photo" style="background-image: url(<c:url value='/Upload/${item.stored_file_name}'/>)"></div>
								</div>
							</c:forEach>
								<div id="fileupload-btn" class="btn-upload" aria-label="일반 사진 등록" style="position: relative; z-index: 1; padding: 0">
								일반 사진 등록
								</div>
								<div id="photo_container" class="moxie-shim moxie-shim-html5 hidden" style="position: absolute; top: 215px; left: 409px; width: 142px; height: 44px; overflow: hidden; z-index: 0;">
									<input id="photo" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" multiple accept="image/jpeg,image/png,.webp" name="photo">
								</div>
							</div>
						</div>
					</div>
		
					<div class="pano-wrap hidden">
						<div>
							<div class="photo-guide">
								<p>
									<span>- 리코 세타 카메라 또는 VR 카메라를 이용하여 촬영해주세요.</span><br>
									<span>- 360°로 사진을 돌려 볼 수 있는 기능이며, 사진 업로드 시 약 30초 정도 소요됩니다.</span><br>
									<em>
										<span>- 사진 업로드시 가로 X 세로 비율을 반드시 2:1 줄여야지만 업로드가 가능합니다.</span><br>
										<span>&nbsp;&nbsp;: (예) 촬영한 사진이 1896 X 783일 경우 948 X 783 비율로 사진 크기를 줄여주세요.</span><br>
										<span>&nbsp;&nbsp;: 사진 비율 확인 방법은 사진 &gt; 우 클릭 &gt; 속성 &gt; 자세히 &gt; 사진 크기 확인.</span>
									</em>
								</p>
							</div>
							<div class="discription">
								<p>
									<img src="<c:url value='/images/manage/pano-discription.png'/>" alt="360°로 사진을 돌려 볼수 있는 기능이며, 사진 업로드는 약 30초 정도 소요됩니다.">
								</p>
								<button id="panoupload-btn" class="btn btn-blue btn-md" style="position: relative; z-index: 1; padding: 0">
									360˚ 사진 올리기
								</button>
								<div id="photo360_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 142px; left: 152px; width: 144px; height: 44px; overflow: hidden; z-index: 0;">
									<input id="photo360" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" accept="image/jpeg">
								</div>
							</div>
						</div>
						<div id="pano" class="pano" style="position: relative; background-color: rgb(229, 227, 223); overflow: hidden;">
						</div>
					</div>
				</div>
								
				<div class="alert">
					<i class="fas fa-exclamation-circle" style="font-size:20px; color: white"></i>
					<p>허위매물을 등록할 경우 N방에서 임의적으로 계정 및 매물 전체 삭제 처리되며, 결제된 금액은 환불되지 않습니다.</p>
				</div>
				<div class="submit-wrap">					
					<a class="btn btn-gray btn-xl" href="<c:url value='/index.jsp'/>" style="margin-right:16px; padding-top: 20px;" role="button">취소</a>
					<button class="btn btn-blue btn-xl" type="button" id="submit">방 수정하기</button>
				</div>
				</form>
									
			</div>			
		</div>	
	</div>

	<input type="hidden" id="roadAddress" value="${roomDetail.roadAddress}">
	<input type="hidden" id="jibunAddress" value="${roomDetail.jibunAddress}">
	<input type="hidden" id="sido" value="${roomDetail.sido}">
	<input type="hidden" id="sigungu" value="${roomDetail.sigungu}">
	<input type="hidden" id="bname" value="${roomDetail.bname}">
	<input type="hidden" id="bname1">
	<input type="hidden" id="lat" value="${roomDetail.lat}">
	<input type="hidden" id="lng" value="${roomDetail.lng}">
	
	<!-- Footer -->
	<jsp:include page="/frontend/template/Footer.jsp"/>
	
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/vendor/jquery/jquery-ui.min.js'/>"></script>
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/manage/edit.js'/>"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>    
    <script src="<c:url value='/js/manage/postcode2.js'/>"></script>    
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7682697ada046b18ac56822b1fa1c14&libraries=services"></script>    
    
</body>
</html>